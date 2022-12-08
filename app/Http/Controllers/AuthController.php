<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Tymon\JWTAuth\Facades\JWTAuth;

class AuthController extends Controller
{
    public function login()
    {
        $credentials = request(['email', 'password']);
        if (!$token = Auth::attempt($credentials)) {
            return response()->json(['error' => "Unathorized"], 401);
        }

        return $this->respondWithToken($token);
    }

    public function register(Request $request)
    {
        $this->validate($request, [
            'username' => 'required|unique:users',
            'email' => 'required|email|unique:users',
        ]);

        $user = new User();
        $user->user_type_id = $request['user_type_id'];
        $user->fullname = $request['fullname'];
        $user->username = $request['username'];
        $user->phone = $request['phone'];
        $user->email = $request['email'];
        $user->password = Hash::make($request['password']);
        $user->save();

        return response()->json(['success' => 'Anda Sudah Terdaftar Silahkan Login']);
    }

    public function logout()
    {
        auth()->logout();

        return response()->json(['success' => 'Berhasil Logout']);
    }

    public function userIsLogin()
    {
        
        return response()->json(Auth::user());
    }

    public function refresh()
    {
        $token = JWTAuth::fromUser(Auth::user());
        return $this->respondWithToken($token);
    }

    protected function respondWithToken($token)
    {
        $userIsLogin = Auth::user()->user_type_id;
        $type_user = DB::table('users')
            ->where('user_type_id', $userIsLogin)
            ->join('user_types', 'users.user_type_id', '=', 'user_types.id')
            ->select('user_types.type')
            ->get()
            ->first();

        return response()->json([
            'user_type' => $type_user->type,
            'access_token' => $token,
            'token_type' => 'bearer',
            'expires_in' => auth()->factory()->getTTL() * 360
        ]);
    }
}
