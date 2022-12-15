<?php

namespace App\Http\Controllers;

use App\Models\Admin;
use App\Models\Student;
use App\Models\User;
use App\Models\Registration;
use Exception;
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
            'email' => 'required|unique:users',
        ]);

        $code = \Illuminate\Support\Str::random(10);
        
        try {

            $user = User::create([
                'user_type_id' => $request['user_type_id'],
                'fullname' => $request['fullname'],
                'from_school' => $request['from_school'],
                'phone' => $request['phone'],
                'email' => $request['email'],
                'password' => Hash::make($request['password']),
            ]);

            $student = Student::create([
                'user_id' => $user->id
            ]);

            $registration = Registration::create([
                'student_id' => $student->id,
                'class_pick' => $request['class_pick'],
                'code_registration' => $code,
            ]);


        } catch(Exception    $e) {
            return response()->json(['error' => $e->getMessage()]);
        }
     
        return response()->json(['success' => 'Anda Sudah Terdaftar Silahkan Login']);
    }

    public function logout()
    {
        auth()->logout();

        return response()->json(['success' => 'Berhasil Logout']);
    }   

    public function userIsLogin()
    {

        $data = [];
        $user = Auth::user();
        $student = Student::where('user_id', Auth::user()->id)->get()->first();
        $admin = Admin::where("user_id", Auth::user()->id)->get()->first();

        if($student) {
            $data = [
                'student_id' => $student['id'],
                'user' =>  $user
            ];
            
            return response()->json($data);
        }

        if($admin) {
            $data = [
                'admin_id' => $student['id'],
                'user' =>  $user
            ];
            
            return response()->json($data);
        }

        $data = ['user' => $user];  
        return response()->json($data);
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
