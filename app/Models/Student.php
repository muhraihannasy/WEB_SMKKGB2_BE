<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Student extends Model
{
    protected $fillable = [
        'user_id',
        'student_father_id',
        'student_mother_id',
        'student_guardian_id',
        'student_scholarship_id',
        'student_achievement_id',
        'gender',
        'nisn',
        'nik',
        'birth',
        'no_certificate_registration',
        'religion',
        'transport',
        'special_needs',
        'address',
        'residence',
        'no_kks',
        'order_family',
        'kps',
        'kip',
        'height',
        'weight',
        'amount_siblings',
        'residence_distance',
        'time_to_school',
        'status',
    ];
}
