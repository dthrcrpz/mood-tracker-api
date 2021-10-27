<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class UserController extends Controller
{
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
