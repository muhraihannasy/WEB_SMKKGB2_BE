<?php

namespace App\Http\Resources\job;

use Illuminate\Http\Resources\Json\JsonResource;

class JobResourceShow extends JsonResource
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
            "maker" => $this->user->fullname,
            "name" => $this->name,
            "job_category_id" => $this->category->id ?? "Belum Ada",
            "company_name" => $this->company_name,
            "description" => $this->description,
            "qualification" => $this->qualification,
            "location" => $this->location,
        ];
    }
}
