<?php
namespace App\Helper;

use Exception;
use Firebase\JWT\JWT;
use Firebase\JWT\Key;
class JWTToken
{
   public static function createToken($userEmail, $userId)
   {
      $key = env('JWT_KEY');
      $payload = [
         'iss' => 'laravel-token',
         'iat' => time(),
         'exp' => time() + 60 * 24 * 30, //30 days
         'userEmail' => $userEmail,
         'userId' => $userId,
      ];
      return JWT::encode($payload, $key, 'HS256');
   }
   public static function createTokenForSetPassword($userEmail)
   {
      $key = env('JWT_KEY');
      $payload = [
         'iss' => 'laravel-token',
         'iat' => time(),
         'exp' => time() + 60 * 24 * 30, //30 days
         'userEmail' => $userEmail,
         'userId' => '0',
      ];
      return JWT::encode($payload, $key, 'HS256');
   }
   public static function verifyToken($token): string|object
   {
      try {
         if ($token == null) {
            return 'unauthorized';
         } else {
            $key = env('JWT_KEY');
            $decode = JWT::decode($token, new Key($key, 'HS256'));
            return $decode;
         }
      } catch (Exception $e) {
         return 'unauthorized';
      }
   }
}