<?php

namespace App\Models;

use Illuminate\Auth\Authenticatable;
use Illuminate\Contracts\Auth\Access\Authorizable as AuthorizableContract;
use Illuminate\Contracts\Auth\Authenticatable as AuthenticatableContract;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Laravel\Lumen\Auth\Authorizable;
use Tymon\JWTAuth\Contracts\JWTSubject;

class User extends Model implements
    AuthenticatableContract,
    AuthorizableContract,
    JWTSubject
{
    use Authenticatable, Authorizable, HasFactory;

    protected $guarded = [];
    protected $hidden = ["password"];

    public function getJWTIdentifier()
    {
        return $this->getKey();
    }

    public function getJWTCustomClaims()
    {
        return [];
    }

    public function userType()
    {
        return $this->hasOne(UserType::class, "id");
    }

    public function student()
    {
        return $this->hasOne(Student::class, "user_id");
    }

    public function achievement()
    {
        return $this->hasMany(StudentAchievement::class, "user_id");
    }

    public function scholarship()
    {
        return $this->hasMany(StudentScholarship::class, "user_id");
    }

    public function registration()
    {
        return $this->hasOne(Registration::class, "user_id");
    }
}
