<?php

namespace App\Http\Requests;

use Anik\Form\FormRequest;

class PPDBStudentRequest extends FormRequest
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
            "achievements" => "required",
            "address" => "required",
            "birth" => "required",
            "extracurricular" => "required",
            "father_birth" => "required",
            "father_education" => "required",
            "father_income" => "required",
            "father_job" => "required",
            "father_name" => "required",
            "father_nik" => "required",
            "foto_kartu_keluarga" => "required",
            "foto_nisn" => "required",
            "gender" => "required",
            "height" => "required",
            "kip" => "required",
            "kks" => "required",
            "kps" => "required",
            "mother_birth" => "required",
            "mother_education" => "required",
            "mother_income" => "required",
            "mother_job" => "required",
            "mother_name" => "required",
            "mother_nik" => "required",
            "nik" => "required",
            "nisn" => "required​",
            "no_certificate_registration" => "required",
            "no_examinee" => "required",
            "no_serial_diploma" => "required",
            "no_serial_skhus" => "required",
            "religion" => "required",
            "scholarships" => "required",
            "special_needs" => "required",
            "type_registration" => "required",
            "uniform" => "required",
            "weight" => "required",
        ];
    }
}
