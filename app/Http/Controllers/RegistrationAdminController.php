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
            $fullname = "%$filter%";

            $data->where("registration_id", "like", "%$filter%");
            $data->orWhereHas('user', function($query) use ($fullname) {
                $query->where('fullname', 'like', $fullname);
            });
        }

        $s = RegistrationListResource::collection($data->get());

        return response()->json([
            "data" => $s,
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

        return response()->json($data);
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
