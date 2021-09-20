<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

use App\Models\User;
use App\Models\Barber;
use App\Models\BarberPhotos;
use App\Models\BarberServices;
use App\Models\BarberTestimonial;
use App\Models\BarberAvailability;

class BarberController extends Controller
{
    public function __construct(){
        $this->middleware('auth:api');
        $this->loggedUser = auth()->user();
    }

    public function createRandom() {
        $array = ['error' => ''];

        for ($q=0;$q<15;$q++) {
            $names = ['Bonieky', 'Paulo', 'Amanada', 'Leticia', 'Gabriel', 'Ronaldo'];
            $lastnames = ['Silva', 'Lacerda', 'Diniz', 'Alvaro', 'Sousa', 'Gomes'];

            $servicos = ['Corte', 'Pintura', 'Aparação', 'Efeite'];
            $servicos2 = ['Cabelo', 'Unha', 'Pernas', 'Sobrancelhas'];

            $depos = [
                'As experiências acumuladas demonstram que a revolução dos costumes maximiza as possibilidades por conta do impacto na agilidade decisória.',
                'Gostaria de enfatizar que a estrutura atual da organização possibilita uma melhor visão global dos paradigmas corporativos.',
                'Assim mesmo, o desenvolvimento contínuo de distintas formas de atuação talvez venha a ressaltar a relatividade dos conhecimentos estratégicos para atingir a excelência.',
                'Podemos já vislumbrar o modo pelo qual a estrutura atual da organização faz parte de um processo de gerenciamento do fluxo de informações.',
                'Todas estas questões, devidamente ponderadas, levantam dúvidas sobre se o desafiador cenário globalizado obstaculiza a apreciação da importância das condições inegavelmente apropriadas.'
            ];
            
            $b = new Barber();
            $b->name = $names[rand(0, count($names)-1)].' '.$lastnames[rand(0, count($lastnames)-1)];
            $b->avatar = rand(1, 4) . '.png';
            $b->stars = rand(2, 4).'.'.rand(0,9);
            $b->latitude = '-23.5'.rand(0,9).'30907';
            $b->longitude = '-46.6'.rand(0,9).'82795';
            $b->save();

            $ns = rand(3,6);

            for($w=0;$w<4;$w++) {
                $bp = new BarberPhotos();
                $bp->id_barber = $b->id;
                $bp->url = rand(1,5).'.png';
                $bp->save();
            }

            for($w=0;$w<$ns;$w++) {
                $bs = new BarberServices();
                $bs->id_barber = $b->id;
                $bs->name = $servicos[rand(0, count($servicos)-1)].' de '.$servicos2[rand(0, count($servicos2)-1)];
                $bs->price = rand(1,99).'.'.rand(0,100);
                $bs->save();
            }

            for($w=0;$w<3;$w++) {
                $bt = new BarberTestimonial();
                $bt->id_barber = $b->id;
                $bt->name = $names[rand(0, count($names)-1)].' '.$lastnames[rand(0, count($lastnames)-1)];
                $bt->rate = rand(2,4).'.'.rand(0,9);
                $bt->body = $depos[rand(0, count($depos)-1)];
                $bt->save();
            }

            for($e=0;$e<4;$e++) {
                $rAdd = rand(7,10);
                $hours = [];
                for ($r=0;$r<8;$r++) {
                    $time = $r + $rAdd;
                    if ($time < 10) {
                        $time = '0'.$time;
                    }
                    $hours[] = $time.':00';
                }

                $ba = new BarberAvailability();
                $ba->id_barber = $b->id;
                $ba->weekday = $e;
                $ba->hours = implode(',', $hours);
                $ba->save();
            }
        }
    }

    public function searchGeo ($address) {
        $key = env('MAPS_KEY', null);

        $url = 'https://maps.googleapis.com/maps/api/geocode/json?address='.$adress.'$key='.$key;
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        $res = curl_exec($ch);
        curl_close($ch);

        return json_decode($res, true);
    }

    public function list(Request $request) {
        $array = ['error' => ''];

        $lat = $request->input('lat');
        $lng = $request->input('lng');
        $city = $request->input('city');

        if (!empty($city)) {
            $res = $this->searchGeo($city);
            
            if (count($res['results'])>0) {
                $lat = $res['results'][0]['geometry']['location']['lat'];
                $lng = $res['results'][0]['geometry']['location']['lng'];
            }
        }elseif (!empty($lat) && !$empty($lng)) {
            $res = $this->searchGeo($lat.','.$lng);
            
            if (count($res['results'])>0) {
                $city = $res['results'][0]['formatted_address'];
            }
        }else{
            $lat = '-23.5630907';
            $lng = '-46.6682795';
            $city = 'São Paulo';
        }

        $barbers = Barber::select(Barber::raw('*,
            SQRT(
                POW(69.1 * (latitude - '.$lat.'), 2) +
                POW(69.1 * ('.$lng.' - longitude) * COS(latitude / 57.3), 2)
            ) AS distance'))
            ->havingRaw('distance < ?', [10])
            ->orderBy('distance', 'ASC')
            ->get();

        foreach($barbers as $bkey => $bvalue) {
            $barbers[$bkey]['avatar'] = url('media/avatars/'.$barbers[$bkey]['avatar']);
        }

        $array['data'] = $barbers;
        $array['loc'] = "São Paulo";

        return $array;
    }
}
