<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Blog extends Model
{
    protected $fillable = [
        "user_id",
        "blog_category_id",
        "title",
        "body",
        "image",
    ];

    public function category()
    {
        return $this->belongsTo(BlogCategory::class, "blog_category_id");
    }

    public function user()
    {
        return $this->belongsTo(User::class, "user_id");
    }
}
