<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

use App\Models\User;
use App\Models\UserAppointment;
use App\Models\UserFavorite;
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

        // paginação
        $offset = $request->input('offset');
        if (!$offset) $offset = 0;

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
            ->offset($offset)
            ->limit(5)
            ->get();

        foreach($barbers as $bkey => $bvalue) {
            $barbers[$bkey]['avatar'] = url('media/avatars/'.$barbers[$bkey]['avatar']);
        }

        $array['data'] = $barbers;
        $array['loc'] = "São Paulo";

        return $array;
    }

    public function one ($id) {
        $array = ['error' => ''];

        $barber = Barber::find($id);
        if (!$barber) {
            $array['error'] = "Barbeiro não existe!";
            return $array;
        }

        $barber['avatar'] = url('media/avatars/'.$barber['avatar']);
        $barber['favorited'] = false;
        $barber['photos'] = [];
        $barber['services'] = [];
        $barber['testimonials'] = [];
        $barber['available'] = [];

        // verificando favorito
        $cFavorite = UserFavorite::where('id_user', $this->loggedUser->id)
        ->where('id_barber', $barber->id)
        ->count();
        if ($cFavorite>0) {
            $barber['favorited'] = true;
        }

        // pegando as fotos do barbeiro
        $barber['photos'] = BarberPhotos::select(['id', 'url'])->where('id_barber', $barber->id)->get();
        foreach ($barber['photos'] as $bpkey => $bpvalu) {
            $barber['photos'][$bpkey]['url'] = url('media/uploads/'.$barber['photos'][$bpkey]['url']);
        }

        // pegando os serviços do barbeiro
        $barber['services'] = BarberServices::select(['id', 'name', 'price'])->where('id_barber', $barber->id)->get();

        // pegando os depoimentos do barbeiro
        $barber['testimonials'] = BarberTestimonial::select(['id','name','rate','body'])->where('id_barber', $barber->id)->get();

        // pegando a disponibilidade do barbeiro
        // 2020-01-01 09:00
        $availability = [];

        // pegando a disponibilidade crua
        $avails = BarberAvailability::where('id_barber', $barber->id)->get();
        $availWeekdays = [];
        foreach ($avails as $item) {
            $availWeekdays[$item['weekday']] = explode(',', $item['hours']);
        }

        // pegar os agendamentos dos proxs 20 dias
        $appointments = [];
        $appQuery = UserAppointment::where('id_barber', $barber->id)
        ->whereBetween('ap_datetime', [
            date('Y-m-d') . ' 00:00:00',
            date('Y-m-d', strtotime('+20 days')).' 23:59:59'
        ])
        ->get();

        foreach($appQuery as $appItem) {
            $appointments[] = $appItem['ap_datetime'];
        }

        // gerar disponiblidade real
        for ($q=0;$q<20;$q++) {
            $timeItem = strtotime('+'.$q.' days');
            $weekday = date('w', $timeItem);

            if (in_array($weekday, array_keys($availWeekdays))) {
                $hours = [];

                $dayItem = date('Y-m-d', $timeItem);

                foreach($availWeekdays[$weekday] as $hourItem) {
                    $dayFormated = $dayItem.' '.$hourItem.':00';
                    if (!in_array($dayFormated, $appointments)) {
                        $hours[] = $hourItem;
                    }
                }

                if (count($hours)>0) {
                    $availability[] = [
                        'date'=> $dayItem,
                        'hours'=> $hours
                    ];
                }
            }
        }

        $barber['availability'] = $availability;

        $array['data'] = $barber;


        return $array;
    }

    public function setAppointment ($id, Request $request) {
        $array = ['error' => ''];

        $service = $request->input('service');
        $year = intval($request->input('year'));
        $month = intval($request->input('month'));
        $day = intval($request->input('day'));
        $hour = intval($request->input('hour'));

        $month = ($month < 10) ? '0'.$month : $month;
        $day = ($day < 10) ? '0'.$day : $day;
        $hour = ($hour < 10) ? '0'.$hour : $hour;

        // 1 verificar se o serviço do barbeiro existe
        $barberservice = BarberServices::select()
        ->where('id', $service)
        ->where('id_barber', $id)
        ->first();

        if (!$barberservice) {
            $array['error'] = "Serviço inexistente!";
            return $array;
        }

        // 2 verificar se a data é real
        $appDate = $year.'-'.$month.'-'.$day.' '.$hour.':00:00';
        if (strtotime($appDate)<=0) {
            $array['error'] = "Data inválida!";
            return $array;
        }

        // 3 verificar se o barbeiro já possui agendamento neste dia/hora
        $apps = UserAppointment::select()
        ->where('id_barber', $id)
        ->where('ap_datetime', $appDate)
        ->count();
        if ($apps > 0) {
            $array['error'] = "Barbeiro já possui agendamento neste dia!";
            return $array;
        }

        // 4.1 verificar se o barbeiro atende nesta data/hora
        $weekday = date('w', strtotime($appDate));
        $avail = BarberAvailability::select()
        ->where('id_barber', $id)
        ->where('weekday', $weekday)
        ->first();
        if (!$avail) {
            $array['error'] = "Barbeiro não atende neste dia!";
            return $array;
        }

        // 4.2 verificar se o barbeiro atende nesta hora
        $hours = explode(',', $avail['hours']);
        if(!in_array($hour.':00', $hours)) {
            $array['error'] = '';
            return $array;
        }

        // 5 fazer o agendamento
        $ua = new UserAppointment();
        $ua->id_user = $this->loggedUser->id;
        $ua->id_barber = $id;
        $ua->id_service = $service;
        $ua->ap_datetime = $appDate;
        $ua->save();

        return $array;
    }
}
