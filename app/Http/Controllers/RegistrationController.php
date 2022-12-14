<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class RegistrationController extends Controller
{
    public function getByIsPaid(Request $request)
    {
        return $request;
    }

    public function getByIsNotPaid(Request $request)
    {
        return $request;
    }
}
