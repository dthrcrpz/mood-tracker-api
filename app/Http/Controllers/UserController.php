<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class UserController extends Controller
{
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

        return response([
        	'token' => $token
        ]);
    }

    public function user (Request $r) {
        $user = $r->user();

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
}
