<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class RegistrationListResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            "id" => $this->id,
            "maker" => $this->maker,
            "registration_id" => $this->registration_id,
            "type_registration" => $this->type_registration,
            "student_id" => $this->student_id,
            "user_id" => $this->user_id,
            "from_school" => $this->from_school,
            "fullname" => $this->user->fullname,
            "photo" => $this->user->photo,
            "is_paid" => $this->is_paid,
            "code_registration" => $this->code_registration,
            "status" => $this->status,
        ];
    }
}
