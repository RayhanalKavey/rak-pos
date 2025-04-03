<?php

use App\Http\Controllers\CategoryController;
use App\Http\Controllers\CustomerController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\InvoiceController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\TestController;
use App\Http\Controllers\UserController;
use App\Http\Middleware\SessionAuthentication;
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

Route::get('/login', [UserController::class, 'LoginPage'])->name('login.page');
Route::get('/registration', [UserController::class, 'RegistrationPage'])->name('registration.page');
Route::get('/send-otp', [UserController::class, 'SendOTPPage'])->name('sendOTP.page');
Route::get('/verify-otp', [UserController::class, 'VerifyOTPPage'])->name('VerifyOTP.page');

/* ------ All user user routes (auth) ------ */
Route::post('/user-registration', [UserController::class, 'userRegistration'])->name('user.registration');
Route::post('/user-login', [UserController::class, 'userLogin'])->name('user.login');
Route::post('/send-otp', [UserController::class, 'sendOTP'])->name('sendOTP');
Route::post('/verify-otp', [UserController::class, 'verifyOTP'])->name('verifyOTP');

//Test routes
Route::get('/test', [TestController::class, 'test']);


/* ------ Logged in routes ------ */
Route::middleware(SessionAuthentication::class)->group(function () {
    /* ------- Page routes ------ */
    Route::get('/dashboard', [DashboardController::class, 'DashboardPage'])->name('dashboard.page');
    Route::get('/reset-password', [UserController::class, 'resetPasswordPage'])->name('resetPassword.page');


    // Auth routes
    Route::post('/user-logout', [UserController::class, 'userLogout'])->name('user.logout');
    Route::post('/reset-password', [UserController::class, 'resetPassword'])->name('resetPassword');

    /* --- Category CRUD routes ---*/
    Route::post('/create-category', [CategoryController::class, 'createCategory'])->name('category.create');//C
    Route::get('/list-category', [CategoryController::class, 'listCategory'])->name('category.list');//R
    Route::post('/category-details', [CategoryController::class, 'categoryById'])->name('category.ById');//categoryById
    Route::post('/update-category', [CategoryController::class, 'updateCategory'])->name('category.update');//U
    Route::delete('/delete-category/{id}', [CategoryController::class, 'deleteCategory'])->name('category.delete');//D

    /* --- Product CRUD routes ---*/
    Route::post('/create-product', [ProductController::class, 'createProduct'])->name('product.create');//C
    Route::get('/list-product', [ProductController::class, 'listProduct'])->name('product.list');//R
    Route::post('/product-details', [ProductController::class, 'productById'])->name('product.ById');//productById
    Route::post('/update-product', [ProductController::class, 'updateProduct'])->name('product.update');//U
    Route::delete('/delete-product/{id}', [ProductController::class, 'deleteProduct'])->name('product.delete');//D

    /* --- Customer CRUD routes ---*/
    Route::post('/create-customer', [CustomerController::class, 'createCustomer'])->name('customer.create');//C
    Route::get('/list-customer', [CustomerController::class, 'listCustomer'])->name('customer.list');//R
    Route::post('/customer-details', [CustomerController::class, 'customerById'])->name('customer.ById');//customerById
    Route::post('/update-customer', [CustomerController::class, 'updateCustomer'])->name('customer.update');//U
    Route::delete('/delete-customer/{id}', [CustomerController::class, 'deleteCustomer'])->name('customer.delete');//D

    /* --- Invoice CRUD routes ---*/
    Route::post('/create-invoice', [InvoiceController::class, 'createInvoice'])->name('invoice.create');//C
    Route::get('/list-invoice', [InvoiceController::class, 'listInvoice'])->name('invoice.list');//R
    Route::post('/invoice-details', [InvoiceController::class, 'invoiceById'])->name('invoice.ById');//invoiceById
    Route::delete('/delete-invoice/{id}', [InvoiceController::class, 'deleteInvoice'])->name('invoice.delete');//D

    /* --- Dashboard summary ---*/
    Route::get('/dashboard-summary', [DashboardController::class, 'dashboardSummary'])->name('dashboard.summary');

});
