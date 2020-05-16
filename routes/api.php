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

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

//Route::get('/', "VideoRoomsApiController@index");
//Route::prefix('room')->middleware('auth')->group(function() {
Route::prefix('room')->group(function() {
    //Route::get('join/{roomName}/{user_identity}/{user_type}/{room_sid}', 'VideoRoomsApiController@joinRoom');
    Route::post('join', 'VideoRoomsApiController@joinRoom');
    Route::post('create', 'VideoRoomsApiController@createRoom');
    Route::post('disconnect', 'VideoRoomsApiController@disconnectRoom');
    //Route::get('create', 'VideoRoomsApiController@createRoom');
    //Route::get('disconnect/{room_sid}', 'VideoRoomsApiController@disconnectRoom');
});
