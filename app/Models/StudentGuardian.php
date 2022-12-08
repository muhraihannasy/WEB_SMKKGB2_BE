<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class StudentGuardian extends Model
{
    protected $fillable = [
        'user_id',
        'name',
        'nik',
        'birth',
        'education',
        'job',
        'salary',
        'special_needs',
    ];
}
