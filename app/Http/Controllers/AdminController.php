<?php

namespace App\Http\Controllers;

use App\Models\Admin;
use App\Models\User;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class AdminController extends Controller
{
    protected $table = User::class;
    public function index()
    {
        return response()->json(User::where("user_type_id", 2)->get());
    }

    public function update(Request $request)
    {
        $data = $this->table::find($request->id);

        try {
            if ($request->password == "") {
                $data->update([
                    "fullname" => $request->fullname,
                    "photo" => $request->photo,
                    "phone" => $request->phone,
                    "menu_permission" => $request->menu_permission,
                ]);

                return response()->json([
                    "message" => "Berhasil Menambahkan",
                    "status" => 200,
                ]);
            }

            $data->update([
                "fullname" => $request->fullname,
                "photo" => $request->photo,
                "phone" => $request->phone,
                "email" => $request->email,
                "menu_permission" => $request->menu_permission,
                "password" => Hash::make($request->password),
            ]);
        } catch (Exception $e) {
            return response()->json($e->getMessage());
        }

        return response()->json([
            "message" => "Berhasil Menambahkan",
            "status" => 200,
        ]);
    }
}
