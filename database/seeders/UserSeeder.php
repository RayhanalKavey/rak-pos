<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        User::create([
            "name"=>"Rayhan Al Kavey",
            "mobile"=>"01756582470",
            'otp' => '123456',
            "email"=>"rayhan@gmail.com",
            "password"=>"1212z",
        ]);
    }
}
