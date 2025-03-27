<?php

use App\Http\Controllers\CategoryController;
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

/* ------- Page routes ------ */
Route::get('/', function () {
    return Inertia::render('HomePage');
});

/* ------ All user user routes (auth) ------ */
Route::post('/user-registration', [UserController::class, 'userRegistration'])->name('user.registration');
Route::post('/user-login', [UserController::class, 'userLogin'])->name('user.login');
Route::post('/send-otp', [UserController::class, 'sendOTP'])->name('sendOTP');
Route::post('/verify-otp', [UserController::class, 'verifyOTP'])->name('verifyOTP');

/* ------ Logged in routes ------ */
Route::middleware(TokenVerificationMiddleware::class)->group(function () {
    // Auth routes
    Route::post('/user-logout', [UserController::class, 'userLogout'])->name('user.logout');
    Route::post('/reset-password', [UserController::class, 'resetPassword'])->name('resetPassword');
    //Test routes
    Route::get('/test', [TestController::class, 'test']);
    /* --- Category CRUD routes ---*/
    Route::post('/create-category', [CategoryController::class, 'createCategory'])->name('category.create');//C
    Route::get('/list-category', [CategoryController::class, 'listCategory'])->name('category.list');//R
    Route::post('/category-by-id', [CategoryController::class, 'categoryById'])->name('category.ById');//categoryById
    Route::post('/update-category', [CategoryController::class, 'updateCategory'])->name('category.update');//U
    Route::delete('/delete-category/{id}', [CategoryController::class, 'deleteCategory'])->name('category.delete');//D
});
