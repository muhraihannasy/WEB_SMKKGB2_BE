<?php

namespace App\Http\Controllers;

use App\Http\Resources\RegisterShowResource;
use App\Http\Resources\RegistrationListResource;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Registration;
use App\Models\User;
use Exception;
use Illuminate\Cache\Repository;
use Illuminate\Support\Facades\Auth;

class RegistrationAdminController extends Controller
{
    protected $table = Registration::class;
    public function index(Request $request)
    {
        $limit = $request->limit;
        $offset = ($request->page - 1) * $limit;

        $data = $this->table
            ::with("user")
            ->limit($limit)
            ->offset($offset);

        // get all data
        $count = $this->table::all()->count();

        // filter data
        if (request()->has("filter")) {
            $filter = request()->filter;
            $data->where("registration_id", "like", "%$filter%");
            $data->orWhere("status", "like", "%$filter%");
        }

        $s = RegistrationListResource::collection($data->get());

        return response()->json([
            "data" => $s,
            "total_page" => ceil($count / $limit),
        ]);
    }

    public function getByIsPaid($ispaid)
    {
        $limit = request("limit", 10);
        $offset = (request("page", 1) - 1) * $limit;

        $registration = DB::table("registrations as rgs")
            ->where("rgs.is_paid", $ispaid)
            ->join("students as std", "rgs.student_id", "std.id")
            ->join("users as usr", "std.user_id", "usr.id")
            ->select(
                // Data Registration
                "rgs.id",
                "rgs.type_registration",
                "rgs.student_id",
                "rgs.from_school",
                "rgs.is_paid",
                "rgs.code_registration",
                "rgs.status",
                // Data Users Student
                "usr.fullname",
                "usr.photo"
            );

        $count = $registration->get()->count();
        $data = $registration->limit($limit)->offset($offset);

        if (request()->has("filter")) {
            $filter = request()->filter;
            $data = $registration->where("usr.fullname", "like", "%$filter%");
        }

        return response()->json([
            "data" => $data->get(),
            "total_page" => ceil($count / $limit),
        ]);
    }

    public function show()
    {
        $data = RegisterShowResource::collection(
            User::where("id", Auth::user()->id)
                ->with([
                    "student",
                    "achievement",
                    "scholarship",
                    "registration",
                ])
                ->get()
        );
        // Data Registration
        // "rgs.id",
        // "rgs.student_id",
        // "rgs.type_registration",
        // "rgs.from_school",
        // "rgs.is_paid",
        // "rgs.code_registration",
        // "rgs.status",

        // // Data Users Student
        // "usr.fullname",
        // "usr.photo"

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
            $update_isPaid = $data->update([
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
