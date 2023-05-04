<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class RegistrationIndexResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            "id" => $this->id,
            "fullname" => $this->fullname,
            "photo" => $this->photo,
            "student_id" => $this->student->id,
            "type_registration" => $this->registration->type_registration,
            "from_school" => $this->registration->from_school,
            "is_paid" => $this->registration->is_paid,
            "code_registration" => $this->registration->code_registration,
            "status" => $this->registration->status,
        ];
    }
}
