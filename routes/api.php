<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

//Register
Route::post('/users/registration','API\Users\UsersController@getRegistration');
//User
Route::middleware('auth:api')->group( function () {     
    Route::get('/users/list', 'API\Users\UsersController@getUserList');
    Route::post('/users/update/{id}', 'API\Users\UsersController@getUserUpdate');
    Route::delete('/users/delete/{id}', 'API\Users\UsersController@getUserDelete');
});