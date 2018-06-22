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
Route::group(['prefix' => config('api.api_version')], function() {
    Route::post('/users/registration','API\V1\Users\UsersController@getRegistration');
});
//User
//Route::middleware('auth:api')->group( function () {     
Route::group(['prefix' => config('api.api_version'), 'middleware' => 'auth:api'], function() {
    Route::get('/users/list', 'API\V1\Users\UsersController@getUserList');
    Route::post('/users/update/{id}', 'API\V1\Users\UsersController@getUserUpdate');
    Route::delete('/users/delete/{id}', 'API\V1\Users\UsersController@getUserDelete');
});