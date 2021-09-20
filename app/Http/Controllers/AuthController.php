<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use App\Models\User;

class AuthController extends Controller
{
    public function __construct() {
        $this->middleware('auth:api', ['except' => ['create', 'login']]);
    }

    public function create (Request $request) {
        $array = ['error' => ''];

        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'email' => 'required|email',
            'password' => 'required'
        ]);

        if ($validator->fails()) {
            $array['error'] = "Dados Incorretos!";
            return $array;
        }

        $name = $request->input('name');
        $email = $request->input('email');
        $password = $request->input('password');

        $emailExists = User::where('email', $email)->count();

        if ($emailExists>0) {
            $array['error'] = "Email já cadastrado!";
            return $array;
        }

        $hash = password_hash($password, PASSWORD_DEFAULT);

        $u = new User();
        $u->name = $name;
        $u->email = $email;
        $u->password = $hash;
        $u->save();

        $token = auth()->attempt([
            'email'=> $email,
            'password'=> $password
        ]);

        if (!$token) {
            $array['error'] = "Ocorreu um erro!";
            return $array;
        }

        $info = auth()->user();
        $info['avatar'] = url('media/avatars/'.$info['avatar']);
        $array['data'] = $info;
        $array['token'] = $token;

        return $array;
    }
}
