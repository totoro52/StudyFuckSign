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

Route::get('/','Index\IndexController@index');
Route::post('/login','Index\IndexController@login');
Route::get('/getQrCode','Index\IndexController@getQrCode');
Route::post('/sign','Index\IndexController@sign');