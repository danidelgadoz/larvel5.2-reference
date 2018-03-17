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

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:api');

Route::group(['prefix' => 'session'], function () {
    Route::post('login', 'LoginController@login');
    Route::post('hash', 'LoginController@hash');
});

Route::resource('producto', 'ProductoController');

Route::group(['middleware' => 'auth:api'], function () {
    Route::get('cliente/{cliente}/ventas', 'ClienteController@getVentas');
    Route::resource('cliente', 'ClienteController');
});

Route::get('venta/{venta}/detalle', 'VentaController@getVentaDetalle');
Route::resource('venta', 'VentaController');

Route::resource('venta_detalle', 'VentaDetalleController');

route::resource('cotizacion', 'cotizacionController');