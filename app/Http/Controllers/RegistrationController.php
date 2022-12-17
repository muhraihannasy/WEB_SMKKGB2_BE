<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Registration;
use Exception;

class RegistrationController extends Controller
{

    public function index(Request $request)
    {
    $limit = $request->limit;
        $offset = ($request->page - 1) * $limit;
      
        $registration = DB::table('registrations as rgs')
                        ->join('students as std', 'rgs.student_id', 'std.id')
                        ->join('users as usr', 'std.user_id', 'usr.id')
                        ->select(
                            // Data Registration
                            'rgs.id',   
                            'rgs.type_registration',
                            'rgs.student_id',
                            'rgs.from_school',
                            'rgs.is_paid',
                            'rgs.code_registration',
                            'rgs.status',
                            
                            // Data Users Student
                            'usr.fullname',
                            'usr.photo',
                            );
                      

        // get all data
        $count = $registration->get()->count();
        $data = $registration->limit($limit)->offset($offset);

        // filter data
        if (request()->has('filter')  ) {
            $filter = request()->filter;
            $data->where('usr.fullname', 'like', "%$filter%");
            $data->orWhere('rgs.status', 'like', "%$filter%");
            $data->orderBy('rgs.id', 'desc');
        }
        

        return response()->json(['data' => $data->get(), "total_page" => ceil($count / $limit)]);
    }

    public function getByIsPaid($ispaid)
    {
        $limit = request('limit',10);
        $offset = (request('page',1) - 1) * $limit;

        $registration = DB::table('registrations as rgs')
                        ->where('rgs.is_paid', $ispaid)
                        ->join('students as std', 'rgs.student_id', 'std.id')
                        ->join('users as usr', 'std.user_id', 'usr.id')
                        ->select(
                            // Data Registration
                            'rgs.id',   
                            'rgs.type_registration',
                            'rgs.student_id',
                            'rgs.from_school',
                            'rgs.is_paid',
                            'rgs.code_registration',
                            'rgs.status',
                            // Data Users Student
                            'usr.fullname',
                            'usr.photo',
                        );
                           

            $count = $registration->get()->count();
            $data =  $registration->limit($limit)->offset($offset);;

            if (request()->has('filter')  ) {
                $filter = request()->filter;
                $data = $registration->where('usr.fullname', 'like', "%$filter%");
            }

            return response()->json(['data' => $data->get(),"total_page" => ceil($count / $limit)]);
    }


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

    public function upload(Request $request)
    {
        if(!$request->hasFile('image')) return response()->json(['error' => "erorrs"]);


         $image = $request->file('image');
         $name = time().'.'.$image->getClientOriginalExtension();
         $image->move(public_path('images'), $name);
        
        return response()->json(['path' => url('images/'.$name)]);
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
