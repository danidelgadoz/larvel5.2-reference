<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\Response;

class ResponseMacroServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap the application services.
     *
     * @return void
     */
    public function boot()
    {
        Response::macro('responserApi', function ($err, $sucess, $auth) {
            if($err){
                $respuesta = [
                    'auth'  => $auth,
                    'status'=> false,
                    'data'  => $err
                ];
            }
            else{
                $respuesta = [
                    'auth'  => $auth,
                    'status'=> true,
                    'data'  => $sucess
                ];
            }
//            return Response::json($respuesta);
            return Response::json($respuesta)->header('dandel', true);
        });
    }

    /**
     * Register the application services.
     *
     * @return void
     */
    /*public function register()
    {
        //
    }*/
}
