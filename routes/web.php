<?php

use App\Http\Controllers\TestController;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

// Route::get('/', function () {
//     return view('welcome');
// });
Route::get('/',  function () {
    return Inertia::render('HomePage');
});
Route::get('/test',[TestController::class,'test']);
