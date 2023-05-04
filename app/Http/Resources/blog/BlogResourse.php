<?php

namespace App\Http\Resources\blog;

use Illuminate\Http\Resources\Json\JsonResource;

class BlogResourse extends JsonResource
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
            "title" => $this->title,
            "blog_category_id" => $this->category->id ?? "Belum Ada",
            "body" => $this->body,
            "image" => $this->image,
            "created_at" => $this->created_at,
        ];
    }
}
