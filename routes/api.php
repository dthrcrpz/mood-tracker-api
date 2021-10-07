<?php

use Illuminate\Support\Facades\Route;

Route::group(['prefix' => 'users'], function () {
    Route::post('register', 'UserController@register');
    Route::post('login', 'UserController@login');
    Route::post('logout', 'UserController@logout');
    Route::get('user', 'UserController@user');
});