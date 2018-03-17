<?php

namespace App\Http\Controllers;

use Illuminate\Auth\Access\Response;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class LoginController extends Controller
{
    public function login(Request $request)
    {

        if (Auth::attempt(['email' => $request->email, 'password' => $request->password])) {
            // Authentication passed...
            return response()->responserApi(false, Auth::user(), true);
        } else {
            return response()->responserApi(null, "Contraseña incorrecta", false);
        }
    }

    public function hash(Request $request)
    {
        echo Hash::make($request->text);
    }
}
