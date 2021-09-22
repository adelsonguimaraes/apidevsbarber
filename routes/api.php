<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers as Controllers;

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

Route::get('/ping', function () {
    return ['pong'=>true];
});

Route::get('/401', [Controllers\AuthController::class, 'unauthorized'])->name('login');

Route::get('/random', [Controllers\BarberController::class, 'createRandom']);

Route::post('/auth/login', [Controllers\AuthController::class, 'login']);
Route::post('/auth/logout', [Controllers\AuthController::class, 'logout']);
Route::post('/auth/refresh', [Controllers\AuthController::class, 'refresh']);
Route::post('/user', [Controllers\AuthController::class, 'create']);

Route::get('/user', [Controllers\UserController::class, 'read']);
Route::put('/user', [Controllers\UserController::class, 'update']);
Route::post('/user/avatar', [Controllers\UserController::class, 'updateAvatar']);
Route::get('/user/favorites', [Controllers\UserController::class, 'getFavorites']);
Route::post('/user/favorite', [Controllers\UserController::class, 'toggleFavorite']);
Route::get('/user/appointments', [Controllers\UserController::class, 'getAppointments']);

Route::get('/barbers', [Controllers\BarberController::class, 'list']);
Route::get('/barber/{id}', [Controllers\BarberController::class, 'one']);
Route::post('/barber/{id}/appointment', [Controllers\BarberController::class, 'setAppointment']);

Route::get('/search', [Controllers\BarberController::class, 'search']);