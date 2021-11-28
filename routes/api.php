<?php

use Illuminate\Support\Facades\Route;

Route::group(['prefix' => 'users'], function () {
    Route::post('register', 'UserController@register');
    Route::post('login', 'UserController@login');
    Route::post('logout', 'UserController@logout');
    Route::get('user', 'UserController@user')->middleware('auth.api');

    Route::post('forgot-password', 'UserController@forgotPassword');

    Route::post('login/facebook', 'UserController@facebookLogin');
});

Route::group(['prefix' => 'questions'], function () {
    Route::get('/', 'QuestionController@index')->middleware('auth.api');
    Route::post('/', 'QuestionController@store')->middleware('auth.admin');
    Route::get('{question}', 'QuestionController@show')->middleware('auth.api');
    Route::patch('{question}', 'QuestionController@update')->middleware('auth.admin');
    Route::delete('{question}', 'QuestionController@destroy')->middleware('auth.admin');
});

Route::group(['prefix' => 'scoring-settings'], function () {
    Route::get('/', 'ScoringSettingController@index')->middleware('auth.api');
    Route::post('/', 'ScoringSettingController@store')->middleware('auth.admin');
    Route::get('{scoringSetting}', 'ScoringSettingController@show')->middleware('auth.api');
    Route::patch('{scoringSetting}', 'ScoringSettingController@update')->middleware('auth.admin');
    Route::delete('{scoringSetting}', 'ScoringSettingController@destroy')->middleware('auth.admin');
});

Route::post('tracker/submit', 'QuestionController@submit')->middleware('auth.api');
Route::get('history', 'QuestionController@history')->middleware('auth.api');

Route::group(['prefix' => 'dummies', 'middleware' => 'auth.admin'], function () {
    Route::get('banner-data', 'DummyController@getBannerData');
    Route::patch('banner-data', 'DummyController@updateBannerData');
    
    Route::get('tags', 'DummyController@tagsIndex');

    Route::group(['prefix' => 'products'], function () {
        Route::get('/', 'DummyController@productIndex');
        Route::post('/', 'DummyController@storeProduct');
        Route::get('{product}', 'DummyController@showProduct');
        Route::patch('{product}', 'DummyController@updateProduct');
        Route::delete('{product}', 'DummyController@destroyProduct');
    });
});

Route::get('mails-test/{view}', function ($view) {
    return view("mails.$view");
});