<?php

use App\Http\Controllers\TestController;
use App\Http\Controllers\UserController;
use App\Http\Middleware\TokenVerificationMiddleware;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

// Route::get('/', function () {
//     return view('welcome');
// });

Route::get('/', function () {
    return Inertia::render('HomePage');
});

// All user user routes (auth)
Route::post('/user-registration', [UserController::class, 'userRegistration'])->name('user.registration');
Route::post('/user-login', [UserController::class, 'userLogin'])->name('user.login');


Route::middleware(TokenVerificationMiddleware::class)->group(function () {

    Route::get('/test', [TestController::class, 'test']);
});