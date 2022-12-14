<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Registration extends Model
{
    protected $fillable = [
        'student_id',
        'payment_id',
        'class',
        'class_pick',
        'type_registration',
        'from_school',
        'no_examinee',
        'no_serial_diploma',
        'no_serial_skhus',
        'extracurricular',
        'uniform',
        'is_paid',
        'code_registration',
        'status',
    ];
}
