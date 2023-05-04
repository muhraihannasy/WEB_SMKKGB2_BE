<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Job extends Model
{
    protected $fillable = [
        "user_id",
        "job_category_id",
        "name",
        "company_name",
        "description",
        "qualification",
        "location",
    ];

    public function category()
    {
        return $this->belongsTo(JobCategory::class, "job_category_id");
    }

    public function user()
    {
        return $this->belongsTo(User::class, "user_id");
    }
}
