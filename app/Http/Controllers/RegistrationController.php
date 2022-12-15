<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Registration;


class RegistrationController extends Controller
{

    public function show($id)
    {
         $registration = DB::table('registrations as rgs')
                            ->where('rgs.student_id', $id)
                            ->join('students as std', 'rgs.student_id', 'std.id')
                            ->join('users as usr', 'std.user_id', 'usr.id')
                            ->select(

                                // Data Registration
                                'rgs.id',   
                                'rgs.student_id',
                                'rgs.type_registration',
                                'rgs.from_school',
                                'rgs.is_paid',
                                'rgs.code_registration',
                                'rgs.status',

                                // Data Users Student
                                'usr.fullname',
                                'usr.photo',
                            )
                            ->get()
                            ->first();
        
        return response()->json($registration);
    }

    public function updateStatusRegistration($id, Request $request)
    {
        $registration = Registration::where('id', $id);
        try {
            $registration->update(['status' => $request['status_registration']]);
        } catch(Exception $e) {
            return response()->json($e->getMessage());
        }

        return response()->json($registration->select('status')->get()->first());
    }

    public function checkCodeRegistration(Request $request)
    {

        $data = Registration::where('student_id', $request->id);
        $code_registration = $data->get()->first()->code_registration;

        if($code_registration === $request->code_registration) {
            $update_isPaid = $data->update([
                'is_paid' => true,
                'status' => 'Belum Mengisi Formulir'
            ]);

            return response([
                'status' => 200,            
                'success' => "Pembayaran Berhasil"
            ], 200);
        }

        return response()->json([
            'status' => 200,
            'error' => "kode Pembayaran Salah",
        ], 400);
    }

}
