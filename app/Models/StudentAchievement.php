<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class StudentAchievement extends Model
{
    protected $fillable = [
        'user_id',
        'achievement_name',
        'type',
        'level',
        'year',
        'organizer_by'
    ];
}
