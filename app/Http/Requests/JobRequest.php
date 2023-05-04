<?php

namespace App\Http\Requests;

use Anik\Form\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Contracts\Validation\Validator;

class JobRequest extends FormRequest
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
            "job_category_id.required" => "Kategori dibutuhkan",
            "name.required" => "Nama dibutuhkan",
            "company_name.required" => "Nama Perusahaan dibutuhkan",
            "description.required" => "Deskripsi dibutuhkan",
            "qualification.required" => "Kualifikasi dibutuhkan",
            "location.required" => "Lokasi dibutuhkan",
        ];
    }

    protected function rules(): array
    {
        return [
            "job_category_id" => "required",
            "name" => "required",
            "company_name" => "required",
            "description" => "required",
            "qualification" => "required",
            "location" => "required",
        ];
    }
}
