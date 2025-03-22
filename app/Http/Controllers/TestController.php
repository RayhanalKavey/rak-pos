<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Inertia\Inertia;

class TestController extends Controller
{
    public function test(Request $request)
    {
        $user = $request->header('email');
        // return Inertia::render('TestPage');
        return response()->json([
            'status' => true,
            'message' => "user login success",
            'user' => $user
        ], 200);
    }
}
