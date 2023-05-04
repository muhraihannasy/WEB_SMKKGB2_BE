<?php

namespace App\Http\Requests;

use Anik\Form\FormRequest;

class PPDBAdminRequest extends FormRequest
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
            "email.unique" => "Email Sudah Digunakan",
            // "fullname.required" => "Fullname dibutuhkan",
            // "phone.required" => "Deskripsi dibutuhkan",
            // "password.required" => "Gambar dibutuhkan",
        ];
    }

    protected function rules(): array
    {
        return [
            "email" => "unique:users",
        ];
    }
}
