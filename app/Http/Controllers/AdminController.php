<?php

namespace App\Http\Controllers;

use App\Models\Admin;
use App\Models\User;
use Illuminate\Http\Request;

class AdminController extends Controller
{
      public function index()
    {
        return response()->json(User::where('user_type_id', 2)->get());
    }
}
