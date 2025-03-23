<?php

use App\Http\Controllers\TestController;
use App\Http\Controllers\UserController;
use App\Http\Middleware\TokenVerificationMiddleware;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

// Route::get('/test-email', function () {
//     Mail::raw('This is a test email', function ($message) {
//         $message->to('rayhankavey@gmail.com')->subject('Test Email');
//     });
//     return 'Email Sent!';
// });
// Route::get('/', function () {
//     return view('welcome');
// });

// Page routes
Route::get('/', function () {
    return Inertia::render('HomePage');
});

// All user user routes (auth)
Route::post('/user-registration', [UserController::class, 'userRegistration'])->name('user.registration');
Route::post('/user-login', [UserController::class, 'userLogin'])->name('user.login');
Route::post('/send-otp', [UserController::class, 'sendOTP'])->name('sendOTP');
Route::post('/verify-otp', [UserController::class, 'verifyOTP'])->name('verifyOTP');

// Logged in routes
Route::middleware(TokenVerificationMiddleware::class)->group(function () {
    Route::post('/user-logout', [UserController::class, 'userLogout'])->name('user.logout');
    Route::post('/reset-password', [UserController::class, 'resetPassword'])->name('resetPassword');
    Route::get('/test', [TestController::class, 'test']);
});
