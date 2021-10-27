<?php

use Illuminate\Support\Facades\Route;

Route::group(['prefix' => 'users'], function () {
    Route::post('register', 'UserController@register');
    Route::post('login', 'UserController@login');
    Route::post('logout', 'UserController@logout');
    Route::get('user', 'UserController@user')->middleware('auth.api');
});

Route::group(['prefix' => 'questions'], function () {
    Route::get('/', 'QuestionController@index')->middleware('auth.api');
    Route::post('/', 'QuestionController@store')->middleware('auth.admin');
    Route::get('{question}', 'QuestionController@show')->middleware('auth.api');
    Route::patch('{question}', 'QuestionController@update')->middleware('auth.admin');
    Route::delete('{question}', 'QuestionController@destroy')->middleware('auth.admin');
});

Route::group(['prefix' => 'dummies', 'middleware' => 'auth.admin'], function () {
    Route::get('banner-data', 'DummyController@getBannerData');
    Route::patch('banner-data', 'DummyController@updateBannerData');
});