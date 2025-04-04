<?php

namespace App\Http\Controllers;

use App\Helper\JWTToken;
use App\Mail\OTPMail;
use App\Models\User;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Inertia\Inertia;

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
            // return response()->json([
            //     'status' => true,
            //     'message' => 'User created successfully!',
            //     'data' => $user
            // ]);
            $data = ['message' => 'Registration successful', 'status' => true, 'error' => ''];
            return redirect('/login')->with($data);

        } catch (Exception $e) {
            // return response()->json([
            //     'status' => false,
            //     'message' => $e->getMessage()
            // ]);
            $data = ['message' => 'Something went wrong', 'status' => false, 'error' => ''];
            return redirect('/registration')->with($data);
        }
    }
    public function userLogin(Request $request)
    {
        // dd($request->all());
        $count = User::where('email', $request->input('email'))->select('id', 'password')->first();
        if ($count !== null && Hash::check($request->input('password'), $count->password)) {
            // $token = JWTToken::createToken($request->input('email'), $count->id);
            // return response()->json([
            //     'status' => true,
            //     'message' => 'User login successfully!',
            // ], 200)->cookie('token', $token, 60 * 24 * 30);

            $email = $request->input('email');
            $user_id = $count->id;
            $request->session()->put('email', $email);
            $request->session()->put('user_id', $user_id);
            $data = ['message' => 'Login successful', 'status' => true, 'error' => ''];
            return redirect('/dashboard')->with($data);
        } else {
            // return response()->json([
            //     'status' => false,
            //     'message' => 'unauthorized',
            // ], 200);
            $data = ['message' => 'Login failed', 'status' => false, 'error' => ''];
            return redirect('/login')->with($data);
        }

    }
    public function userLogout(Request $request)
    {
        // return response()->json([
        //     'status' => true,
        //     'message' => 'User logout successfully!',
        // ], 200)->cookie('token', '', -1);
        $request->session()->forget('email');
        $request->session()->forget('user_id');
        // Completely clear the session
        // $request->session()->flush();

        return redirect('/login')->with([
            'message' => 'User logged out successfully',
            'status' => true,
            'error' => ''
        ]);
    }
    public function sendOTP(Request $request)
    {
        $email = $request->input('email');
        $count = User::where('email', $email)->count();// $user = User::where('email', $email)->first();
        $otp = random_int(100000, 999999);
        $expiration = now()->addMinutes(5);
        if (1 == $count) {

            // Mail::to($email)->queue(new OTPMail($otp, $expiration)); ********
            // Mail::to($email)->send(new OTPMail($otp, $expiration));//alternative
            User::where('email', $email)->update([
                'otp' => hash('sha256', $otp)//bcrypt($otp)// 'otp' => $otp
            ]);
            // return response()->json([
            //     'status' => true,
            //     'message' => "6-digit OTP {$otp} sent successfully!",
            // ], 200);
            $request->session()->put('email', $email);
            // $data = ["message" => "Visit your mail to get the OTP", "status" => true, "error" => ''];
            $data = ["message" => "4 Digit {$otp} OTP send successfully", "status" => true, "error" => ''];
            return redirect('/verify-otp')->with($data);
        } else {
            // return response()->json([
            //     'status' => false,
            //     'message' => 'unauthorized',
            // ], 403);
            $data = ['message' => 'unauthorized', 'status' => false, 'error' => ''];
            return redirect('/registration')->with($data);
        }
    }
    public function verifyOTP(Request $request)
    {
        $email = $request->input('email');
        $otp = $request->input('otp');
        $count = User::where('email', $email)->where('otp', hash('sha256', $otp))->count();
        if (1 == $count) {
            User::where('email', $email)->update([
                'otp' => 0
            ]);
            $token = JWTToken::createTokenForSetPassword($request->input('email'));

            return response()->json([
                'status' => true,
                'message' => "OTP verified successfully!",
            ], 200)->cookie('token', $token, 60 * 24 * 30);
        } else {
            return response()->json([
                'status' => false,
                'message' => "Unauthorized",
            ], 403);
        }
    }
    public function resetPassword(Request $request)
    {
        try {
            $email = $request->header('email');
            $password = $request->input('password');
            User::where('email', $email)->update([
                'password' => Hash::make($password)
            ]);
            return response()->json([
                'status' => true,
                'message' => "Password reset successful",
            ], 200)->cookie('token', '', -1);
        } catch (Exception $e) {
            return response()->json([
                'status' => false,
                'message' => "Something went wrong",
                // 'message' => $e->getMessage(),
            ], 403);
        }
    }

    public function LoginPage(Request $request)
    {
        return Inertia::render('LoginPage');
    }

    public function RegistrationPage(Request $request)
    {
        return Inertia::render('RegistrationPage');
    }

    public function SendOTPPage(Request $request)
    {
        return Inertia::render('SendOTPPage');
    }

    public function VerifyOTPPage(Request $request)
    {
        return Inertia::render('VerifyOTPPage');
    }

    public function ResetPasswordPage(Request $request)
    {
        return Inertia::render('ResetPasswordPage');
    }


}
