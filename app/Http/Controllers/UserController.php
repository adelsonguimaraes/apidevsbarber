<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Barber;

class UserController extends Controller
{
    private $loggedUser;

    public function __construct () {
        $this->middleware('auth:api');
        $this->loggedUser = auth()->user();
    }

    public function read () {
        $array = ['error' => ''];

        $info = $this->loggedUser;
        $info['avatar'] = url('media/avatars/'.$info['avatar']);
        $array['data'] = $info;

        return $array;
    }

    public function addFavorite(Request $request) {
        $array = ['error'=>''];

        $id_barber = $request->input('barber');

        $barber = Barber::find($id_barber);

        if (!$barber) {
            $array['error'] = "Barbeiro Inexistente!";
            return $array;
        }
        
        $hasFav = UserFavorite::select()
        ->where('id_user', $this->loggedUser->id)
        ->where('id_barber', $id_barber)
        ->count();

        if ($hasFav === 0){
            // adicionar
            $uf = new UserFavorite();
            $uf->id_user = $this->loggedUser->id;
            $uf->id_barber = $id_barber;
            $uf->save();
        }else{
            // remover
            $fav = UserFavorite::select()
            ->where('id_user', $this->loggedUser->id)
            ->where('id_barber', $barber)
            ->first();
            $fav->remove();
        }

        return $array;
    }
}
