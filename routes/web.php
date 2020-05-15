<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Route::get('/', function () {
//     return view('welcome');
// });
//Auth::routes();
Route::get('/', "VideoRoomsController@index");
//Route::prefix('room')->middleware('auth')->group(function() {
Route::prefix('room')->group(function() {
    Route::get('join/{roomName}/{user_id}/{room_sid}', 'VideoRoomsController@joinRoom');
    Route::post('create', 'VideoRoomsController@createRoom');
    Route::get('disconnect/{room_sid}', 'VideoRoomsController@disconnectRoom');
});
