<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Mail\ForgotPassword;
use App\Mail\Welcome;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;

class UserController extends Controller
{
    public function index (Request $r) {
        $query = ($r->q) ? $r->q : null;

        $users = User::when($query != null, function ($q) use ($query) {
            $q->where('fullname', 'like', "%$query%")
            ->orWhere('email', 'like', "%$query%");
        })
        ->get();

        return response([
            'users' => $users
        ]);
    }

    public function facebookLogin (Request $r) {
        $validator = Validator::make($r->all(), [
            'email' => 'required',
            'name' => 'required',
            'id' => 'required',
            'first_name' => 'required',
            'last_name' => 'required',
        ]);

        if ($validator->fails()) {
            return response([
                'errors' => $validator->errors()->all()
            ], 403);
        }

        /* NOTE: I should check both email and FB ID on the database to prevent the duplicated account bug on MOP */
        $user = User::where(function ($q) use ($r) {
            $q->where('email', $r->email)->orWhere('facebook_id', $r->id);
        })
        ->first();

        if ($user) {
            // if user exists, check if his/her account is already connected to FB
            if ($user->facebook_id == null) {
                $user->update([
                    'facebook_id' => $r->id,
                    'fb_image' => $r->image
                ]);
            }

            // after connecting to FB, login the user and generate a token
            $token = $user->createToken('MoodTracker API Grant')->accessToken;

            return response([
                'token' => $token,
                'user' => $user,
            ]);
        } else {
            // if the user does not exists, create that user
            $user = User::create([
                'email' => $r->email,
                'facebook_id' => $r->id,
                'first_name' => $r->first_name,
                'last_name' => $r->last_name,
                'password' => 'the-facebook-' . str_random(30),
                'member_id' => str_random(10),
                'type' => 'user',
                'fullname' => $r->first_name . ' ' . $r->last_name
            ]);

            $token = $user->createToken('MoodTracker API Grant')->accessToken;

            return response([
                'token' => $token,
                'user' => $user,
            ]);
        }
    }

    public function forgotPassword (Request $r) {
        $validator = Validator::make($r->all(), [
            'email' => 'required|email',
        ]);

        if ($validator->fails()) {
            return response([
                'errors' => $validator->errors()->all()
            ], 400);
        }

        $user = User::where('email', $r->email)->first();

        if (!$user) {
            return response([
                'errors' => [
                    'A user with this email address is not found'
                ]
            ], 404);
        }

        $token = str_random(12);

        $user->update([
            'reset_password_token' => $token
        ]);

        Mail::to($user->email)->queue(new ForgotPassword($user, $token));

        return response([
            'message' => 'Password reset link sent'
        ]);
    }

    public function login (Request $r) {
		$validator = Validator::make($r->all(), [
            'email' => 'required',
            'password' => 'required',
        ]);

        if ($validator->fails()) {
            return response([
                'errors' => $validator->errors()->all()
            ], 400);
        }

        $user = User::where('email', $r->email)
        ->first();

        if ($user) {
            if (Hash::check($r->password, $user->password)) {
                $token = $user->createToken('MoodTracker API Grant')->accessToken;

                return response([
                    'token' => $token,
                    'email' => $user->email
                ]);
            } else {
                return response([
                    'errors' => [
                        'Wrong password. Please try again.'
                    ]
                ], 403);
            }
        } else {
            return response([
                'errors' => [
                    'User not found. Please try again.'
                ]
            ], 404);
        }
    }

    public function register (Request $r) {
    	$validator = Validator::make($r->all(), [
            'first_name' => 'required',
            'last_name' => 'required',
            'email' => 'required|email|unique:users',
            'password' => 'required|confirmed',
        ]);

        if ($validator->fails()) {
            return response([
                'errors' => $validator->errors()->all()
            ], 400);
        }

        $user = User::create([
            'first_name' => $r->first_name,
            'last_name' => $r->last_name,
            'fullname' => $r->first_name . ' ' . $r->last_name,
            'email' => $r->email,
            'password' => $r->password,
        ]);

        $token = $user->createToken('MoodTracker API Grant')->accessToken;
        
        Mail::to($user->email)->queue(new Welcome($user));

        return response([
        	'token' => $token
        ]);
    }

    public function user (Request $r) {
        $user = $r->user();
        $user->load([
            'answer_groups'
        ]);

        $user->hasAnswerGroups = false;

        if (count($user->answer_groups) > 0) {
            $user->hasAnswerGroups = true;
        }

        unset($user->answer_groups);

        if ($user) {
            return response([
                'user' => $user,
                'email' => $user->email
            ]);
        } else {
            return response([
                'errors' => [
                    'Invalid token. Who are you?'
                ]
            ], 403);
        }
    }

    public function logout (Request $r) {
        if ($r->user()) {
            $token = $r->user()->token();
            $token->revoke();
        }

        return response([
            'message' => 'User logged out'
        ]);
    }

    public function validatePasswordResetToken ($token) {
        $user = User::where('reset_password_token', $token)->first();

        if (!$user) {
            return response([
                'errors' => [
                    'Invalid password reset token'
                ]
            ], 401);
        }

        return response([
            'user' => $user
        ]);
    }

    public function resetPassword (Request $r) {
        $validator = Validator::make($r->all(), [
            'password' => 'required|confirmed',
            'token' => 'required'
        ]);

        if ($validator->fails()) {
            return response([
                'errors' => $validator->errors()->all()
            ], 400);
        }

        $user = User::where('reset_password_token', $r->token)->first();

        if (!$user) {
            return response([
                'errors' => [
                    'Invalid token'
                ]
            ], 401);
        }

        $user->update([
            'password' => $r->password
        ]);

        return response([
            'message' => 'Password has been reset'
        ]);
    }
}
