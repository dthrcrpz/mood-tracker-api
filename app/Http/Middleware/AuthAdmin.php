<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AuthAdmin
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
        if (!Auth::check()) {
            return response([
                'error' => [
                    'code' => 403,
                    'message' => 'Invalid credentials'
                ]
            ], 403);
        } else {
            if (Auth::user()->type == 'admin') {
                return $next($request);
            } else {
                return response([
                    'error' => [
                        'code' => 403,
                        'message' => "You don't have permissions to do this"
                    ]
                ], 403);
            }
        }
    }
}
