<?php

namespace App\Http\Requests;

use Anik\Form\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Contracts\Validation\Validator;

class BlogRequest extends FormRequest
{
    protected $validator;
    protected function authorize(): bool
    {
        return true;
    }
    protected function statusCode(): int
    {
        return 200;
    }

    protected function messages(): array
    {
        return [
            "blog_category_id.required" => "Kategori dibutuhkan",
            "title.required" => "Title dibutuhkan",
            "body.required" => "Deskripsi dibutuhkan",
            "image.required" => "Gambar dibutuhkan",
        ];
    }

    protected function rules(): array
    {
        return [
            "blog_category_id" => "required",
            "title" => "required",
            "body" => "required",
            "image" => "required",
        ];
    }
}
