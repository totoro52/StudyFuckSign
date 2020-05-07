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
Route::get('/getSignItem',function(){
    return 'By:Totoro';
});
Route::post('/getSignItem','Api\ApiController@getSignItem');



/*
Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});
*/