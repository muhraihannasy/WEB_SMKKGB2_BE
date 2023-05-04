<?php

namespace App\Http\Controllers;

use App\Http\Requests\UserRequest;
use App\Models\Admin;
use App\Models\User;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    public function index()
    {
        return response()->json(user::all());
    }

    public function store(UserRequest $request)
    {
        try {
            $user = User::create([
                "user_type_id" => $request->user_type_id,
                "fullname" => $request->fullname,
                "photo" => $request->photo,
                "phone" => $request->phone,
                "email" => $request->email,
                "menu_permission" => $request->menu_permission,
                "password" => Hash::make($request->password),
            ]);

            Admin::create([
                "user_id" => $user->id,
            ]);
        } catch (Exception $e) {
            return response()->json([
                "status" => 400,
                "message" => $e->getMessage(),
            ]);
        }

        return response()->json([
            "status" => 200,
            "message" => "Berhasil Membuat Admin",
        ]);
    }

    public function update(Request $request)
    {
        $user_id = Auth::user()->id;
        $table = User::find($user_id);
        try {
            $data = $table->update($request->all());
        } catch (Exception $e) {
            return response()->json([
                "status" => 400,
                "message" => $e->getMessage(),
            ]);
        }

        return response()->json([
            "status" => 200,
            "message" => "Berhasil Menyimpan Profile",
        ]);
    }

    public function upload(Request $request)
    {
        if (!$request->hasFile("photo")) {
            return response()->json(["error" => "erorrs"]);
        }

        $image = $request->file("photo");
        $name = time() . "." . $image->getClientOriginalExtension();
        $image->move("/home/smkb7435/public_html/api/images", $name);

        return response()->json(["path" => url("images/" . $name)]);
    }

    public function destroy($id)
    {
        try {
            User::where("id", $id)
                ->firstorfail()
                ->delete();
            Admin::where("user_id", $id)
                ->firstorfail()
                ->delete();
        } catch (Exception $e) {
            return response()->json([
                "status" => 400,
                "message" => $e->getMessage(),
            ]);
        }

        return response()->json([
            "status" => 200,
            "message" => "Berhasil Menghapus",
        ]);
    }
}
