<?php

namespace App\Http\Controllers;

use App\Http\Resources\RegisterShowResource;
use App\Http\Resources\RegistrationIndexResource;
use App\Http\Resources\RegistrationListResource;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Registration;
use App\Models\User;
use Exception;
use Illuminate\Cache\Repository;
use Illuminate\Support\Facades\Auth;

class RegistrationController extends Controller
{
    protected $table = Registration::class;
    public function index()
    {
        $data = RegistrationIndexResource::collection(
            User::where("id", Auth::user()->id)
                ->with([
                    "student",
                    "achievement",
                    "scholarship",
                    "registration",
                ])
                ->get()
        );
        return response()->json($data);
    }

    public function show()
    {
        $data = User::where("id", Auth::user()->id)
            ->with(["student", "achievement", "scholarship", "registration"])
            ->get()
            ->first();

        return response()->json($data);
    }

    public function upload(Request $request)
    {
        if (!$request->hasFile("image")) {
            return response()->json(["error" => "erorrs"]);
        }

        $image = $request->file("image");
        $name = time() . "." . $image->getClientOriginalExtension();
        $image->move(
            public_path("/home/smkb7435/public_html/api/images"),
            $name
        );

        return response()->json(["path" => url("images/" . $name)]);
    }

    public function updateStatusRegistration($id, Request $request)
    {
        $registration = Registration::where("id", $id);
        try {
            $registration->update([
                "status" => $request["status_registration"],
            ]);
        } catch (Exception $e) {
            return response()->json($e->getMessage());
        }

        return response()->json(
            $registration
                ->select("status")
                ->get()
                ->first()
        );
    }

    public function checkCodeRegistration(Request $request)
    {
        $data = Registration::where("student_id", $request->id);
        $code_registration = $data->get()->first()->code_registration;

        if ($code_registration === $request->code_registration) {
            $data->update([
                "maker" => Auth::user()->fullname,
                "is_paid" => true,
                "status" => "Belum Mengisi Formulir",
            ]);

            return response(
                [
                    "status" => 200,
                    "success" => "Pembayaran Berhasil",
                ],
                200
            );
        }

        return response()->json(
            [
                "status" => 200,
                "error" => "kode Pembayaran Salah",
            ],
            400
        );
    }
}
