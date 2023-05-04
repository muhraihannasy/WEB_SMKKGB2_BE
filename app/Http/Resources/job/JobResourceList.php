<?php

namespace App\Http\Resources\job;

use Illuminate\Http\Resources\Json\JsonResource;

class JobResourceList extends JsonResource
{
    public function toArray($request)
    {
        return [
            "id" => $this->id,
            "maker" => $this->user->fullname,
            "name" => $this->name,
            "category" => $this->category->name ?? "Belum Ada",
            "company_name" => $this->company_name,
            "description" => $this->description,
            "qualification" => $this->qualification,
            "location" => $this->location,
        ];
    }
}
