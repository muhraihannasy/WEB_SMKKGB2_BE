<?php

namespace App\Http\Controllers;

use App\Models\Registration;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
    public function index()
    {
        $data = Registration::class;
        $amount_registration = $data::count();
        $student_isAccepted = $data::where('status', 'Sudah Diterima')->count();
        $student_isNotAccepted = $data::where('status', 'Belum Diterima')->count();

        return response()->json([
            "amount_registration" => $amount_registration,
            "student_isAccepted" => $student_isAccepted,
            "student_isNotAccepted" => $student_isNotAccepted
        ]);
    }
}
