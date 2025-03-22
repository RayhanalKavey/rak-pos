<?php

namespace App\Http\Controllers;

use App\Helper\JWTToken;
use App\Models\User;
use Exception;
use Illuminate\Http\Request;

class UserController extends Controller
{
    public function userRegistration(Request $request)
    {
        //   dd($request->all());
        try {
            $request->validate([
                'name' => 'required|string|max:255',
                'mobile' => 'required|string|unique:users,mobile|max:255',
                'email' => 'required|email|unique:users,email',
                'password' => 'required|min:6',
            ]);
            $user = User::create([
                "name" => $request->input('name'),//Alternative $request -> name
                "mobile" => $request->input('mobile'),
                "email" => $request->input('email'),
                "password" => $request->input('password')
            ]);
            return response()->json([
                'status' => true,
                'message' => 'User created successfully!',
                'data' => $user
            ]);
        } catch (Exception $e) {
            return response()->json([
                'status' => false,
                'message' => $e->getMessage()
            ]);
        }
    }
    public function userLogin(Request $request)
    {
        // dd($request->all());

        $count = User::where('email', $request->input('email'))->where('password', $request->input('password'))->select('id')->first();
        // return $count;
        if ($count !== null) {
            $token = JWTToken::createToken($request->input('email'), $count->id);

            return response()->json([
                'status' => true,
                'message' => 'User login successfully!',
                // 'token' => $token
            ], 200)->cookie('token', $token, 60 * 24 * 30);
        } else {
            return response()->json([
                'status' => false,
                'message' => 'unauthorized',
            ], 200);
        }

    }
    public function userLogout(Request $request)
    {
        return response()->json([
            'status' => true,
            'message' => 'User logout successfully!',
        ], 200)->cookie('token', '', -1);
    }

}
