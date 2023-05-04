<?php

namespace App\Http\Requests;

use Anik\Form\FormRequest;

class UserRequest extends FormRequest
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
            "email.unique" => "Email Tidak Boleh sama",
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
