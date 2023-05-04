<?php

namespace App\Http\Resources\blog;

use Illuminate\Http\Resources\Json\JsonResource;

class BlogResourseList extends JsonResource
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
            "category" => $this->category->name ?? "Belum Ada",
            "maker" => $this->user->fullname,
            "title" => $this->title,
            "body" => $this->body,
            "image" => $this->image,
            "created_at" => $this->created_at,
        ];
    }
}
