<?php

namespace App\Http\Controllers;

use App\Models\Admin;
use App\Models\Student;
use App\Models\User;
use App\Models\Registration;
use App\Models\UserType;
use Exception;
use Haruncpi\LaravelIdGenerator\IdGenerator;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Tymon\JWTAuth\Facades\JWTAuth;

class AuthController extends Controller
{
    public function login()
    {
        $credentials = request(["email", "password"]);
        if (!($token = Auth::attempt($credentials))) {
            return response()->json(["error" => "Unathorized"], 401);
        }

        return $this->respondWithToken($token);
    }

    public function register(Request $request)
    {
        $countId = Registration::orderBy("id", "desc")
            ->select("id")
            ->first();

        $registration_id =
            date("Y") .
            str_pad($countId ? $countId->id + 1 : 1, 6, "0", STR_PAD_LEFT);

        $this->validate($request, [
            "email" => "required|unique:users",
        ]);

        $code = \Illuminate\Support\Str::random(10);

        try {
            $user = User::create([
                "menu_permission" => "ppdb|",
                "user_type_id" => $request["user_type_id"],
                "fullname" => $request["fullname"],
                "phone" => $request["phone"],
                "email" => $request["email"],
                "password" => Hash::make($request["password"]),
            ]);

            $student = Student::create([
                "user_id" => $user->id,
            ]);

            Registration::create([
                "user_id" => $user->id,
                "student_id" => $student->id,
                "registration_id" => $registration_id,
                "from_school" => $request["from_school"],
                "class_pick" => $request["class_pick"],
                "code_registration" => $code,
            ]);
        } catch (Exception $e) {
            return response()->json(["error" => $e->getMessage()]);
        }

        return response()->json([
            "success" => "Anda Sudah Terdaftar Silahkan Login",
        ]);
    }

    public function logout()
    {
        auth()->logout();
        return response()->json(["success" => "Berhasil Logout"]);
    }

    public function userIsLogin()
    {
        $data = [];
        $user = Auth::user();
        $admin = Admin::where("user_id", Auth::user()->id)
            ->get()
            ->first();

        if ($admin) {
            $data = [
                "admin" => $admin->id,
                "user" => $user,
            ];

            return response()->json($data);
        }

        $data = ["user" => $user];
        return response()->json($data);
    }

    public function refresh()
    {
        $token = JWTAuth::fromUser(Auth::user());
        return $this->respondWithToken($token);
    }

    protected function respondWithToken($token)
    {
        $user = Auth::user();
        $type_user = UserType::where("id", $user->user_type_id)
            ->get("type")
            ->first();

        return response()->json([
            "fullname" => $user->fullname,
            "photo" => $user->photo,
            "menu_permission" => $user->menu_permission,
            "user_type" => $type_user->type,
            "access_token" => $token,
            "token_type" => "bearer",
            "expires_in" =>
                auth()
                    ->factory()
                    ->getTTL() * 4600,
        ]);
    }
}
