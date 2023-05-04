<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class StudentScholarship extends Model
{
    protected $fillable = [
        'user_id',
        'type',
        'descriptions',
        'year_start_at',
        'year_finish_at'
    ];
}
