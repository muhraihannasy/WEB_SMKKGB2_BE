<?php

namespace App\Http\Controllers;

use App\Models\Registration;
use App\Models\Student;
use App\Models\StudentAchievement;
use App\Models\StudentScholarship;
use App\Models\User;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class PpdbController extends Controller
{
    public function __construct()
    {
        $this->middleware("auth");
    }

    public function show($id)
    {
        $data = User::with([
            "registration",
            "student",
            "scholarship",
            "achievement",
        ])
            ->whereId($id)
            ->get(["id", "fullname", "phone", "email", "password"])
            ->first();

        return response()->json($data);
    }

    public function store(Request $request)
    {
        $userId = Auth::user()->id;
        $student = Student::where("user_id", $userId);
        $registration = Registration::where("user_id", $userId);

        $yearBatchStart = date("Y");
        $yearBatchFinish = date("Y") + 2;

        try {
            if ($request->has("scholarships")) {
                foreach ($request["scholarships"] as $sch) {
                    $scholarship = StudentScholarship::create([
                        "user_id" => $userId,
                        "type" =>
                            $sch["type_scholarship"] == ""
                                ? null
                                : $sch["type_scholarship"],
                        "descriptions" =>
                            $sch["descriptions_scholarship"] == ""
                                ? null
                                : $sch["descriptions_scholarship"],
                        "year_start_at" =>
                            $sch["year_start_at_scholarship"] == ""
                                ? null
                                : $sch["year_start_at_scholarship"],
                        "year_finish_at" =>
                            $sch["year_finish_at_scholarship"] == ""
                                ? null
                                : $sch["year_finish_at_scholarship"],
                    ]);
                }
            }

            if ($request->has("achievements")) {
                foreach ($request["achievements"] as $ach) {
                    $achievement = StudentAchievement::create([
                        "user_id" => $userId,
                        "achievement_name" =>
                            $ach["name_achievement"] == ""
                                ? null
                                : $ach["name_achievement"],
                        "type" =>
                            $ach["type_achievement"] == ""
                                ? null
                                : $ach["type_achievement"],
                        "level" =>
                            $ach["level_achievement"] == ""
                                ? null
                                : $ach["level_achievement"],
                        "year" =>
                            $ach["year_achievement"] == ""
                                ? null
                                : $ach["year_achievement"],
                        "organizer_by" =>
                            $ach["organinizer_achievement"] == ""
                                ? null
                                : $ach["organinizer_achievement"],
                    ]);
                }
            }

            $student->update([
                "student_scholarship_id" => $scholarship->id,
                "student_achievement_id" => $achievement->id,
                "gender" => $request["gender"],
                "nisn" => $request["nisn"],
                "nisn_image" => $request["nisn_image"],
                "nik" => $request["nik"],
                "kartu_keluarga_image" => $request["kartu_keluarga_image"],
                "birth" => $request["birth"],
                "no_certificate_registration" =>
                    $request["no_certificate_registration"],
                "religion" => $request["religion"],
                "transport" => $request["transport"],
                "special_needs" => $request["special_needs"],
                "address" => $request["address"],
                "residence" => $request["residence"],
                "kks" => $request["kks"],
                "order_family" => $request["order_family"],
                "kps" => $request["kps"],
                "kip" => $request["kip"],
                "height" => $request["height"],
                "weight" => $request["weight"],
                "amount_siblings" => $request["amount_siblings"],
                "residence_distance" => $request["residence_distance"],
                "time_to_school" => $request["time_to_school"],
                "father_name" => $request["father_name"],
                "father_nik" => $request["father_nik"],
                "father_birth" => $request["father_birth"],
                "father_education" => $request["father_education"],
                "father_job" => $request["father_job"],
                "father_income" => $request["father_income"],
                "father_special_needs" => $request["father_special_needs"],
                "mother_name" => $request["mother_name"],
                "mother_nik" => $request["mother_nik"],
                "mother_birth" => $request["mother_birth"],
                "mother_education" => $request["mother_education"],
                "mother_job" => $request["mother_job"],
                "mother_income" => $request["mother_income"],
                "mother_special_needs" => $request["mother_special_needs"],
                "guardian_name" => $request["guardian_name"],
                "guardian_nik" => $request["guardian_nik"],
                "guardian_birth" => $request["guardian_birth"],
                "guardian_education" => $request["guardian_education"],
                "guardian_job" => $request["guardian_job"],
                "guardian_income" => $request["guardian_income"],
                "guardian_special_needs" => $request["guardian_special_needs"],
                "batch" => $yearBatchStart . "-" . $yearBatchFinish,
            ]);

            $registration->update([
                "type_registration" => $request["type_registration"],
                "no_examinee" => $request["no_examinee"],
                "no_serial_diploma" => $request["no_serial_diploma"],
                "no_serial_skhus" => $request["no_serial_skhus"],
                "extracurricular" => $request["extracurricular"],
                "uniform" => $request["uniform"],
                "status" => "Belum Diterima",
            ]);
        } catch (Exception $e) {
            return response()->json($e->getMessage());
        }

        return response()->json([
            "success" => true,
            "message" => "Data Berhasil Disimpan",
        ]);
    }

    public function update(Request $request)
    {
        $userId = Auth::user()->id;
        $student = Student::where("user_id", $userId);
        $registration = Registration::where("user_id", $userId);

        try {
            if ($request->has("scholarships")) {
                foreach ($request["scholarships"] as $sch) {
                    StudentScholarship::updateOrCreate(
                        ["id" => $sch["id"]],
                        [
                            "user_id" => $userId,
                            "type" =>
                                $sch["type_scholarship"] == ""
                                    ? null
                                    : $sch["type_scholarship"],
                            "descriptions" =>
                                $sch["descriptions_scholarship"] == ""
                                    ? null
                                    : $sch["descriptions_scholarship"],
                            "year_start_at" =>
                                $sch["year_start_at_scholarship"] == ""
                                    ? null
                                    : $sch["year_start_at_scholarship"],
                            "year_finish_at" =>
                                $sch["year_finish_at_scholarship"] == ""
                                    ? null
                                    : $sch["year_finish_at_scholarship"],
                        ]
                    );
                }
            }

            if ($request->has("achievements")) {
                foreach ($request["achievements"] as $ach) {
                    StudentAchievement::updateOrCreate(
                        ["id" => $ach["id"]],
                        [
                            "user_id" => $userId,
                            "achievement_name" =>
                                $ach["name_achievement"] == ""
                                    ? null
                                    : $ach["name_achievement"],
                            "type" =>
                                $ach["type_achievement"] == ""
                                    ? null
                                    : $ach["type_achievement"],
                            "level" =>
                                $ach["level_achievement"] == ""
                                    ? null
                                    : $ach["level_achievement"],
                            "year" =>
                                $ach["year_achievement"] == ""
                                    ? null
                                    : $ach["year_achievement"],
                            "organizer_by" =>
                                $ach["organinizer_achievement"] == ""
                                    ? null
                                    : $ach["organinizer_achievement"],
                        ]
                    );
                }
            }

            $student->update([
                "gender" => $request["gender"],
                "nisn" => $request["nisn"],
                "nisn_image" => $request["nisn_image"],
                "nik" => $request["nik"],
                "kartu_keluarga_image" => $request["kartu_keluarga_image"],
                "birth" => $request["birth"],
                "no_certificate_registration" =>
                    $request["no_certificate_registration"],
                "religion" => $request["religion"],
                "transport" => $request["transport"],
                "special_needs" => $request["special_needs"],
                "address" => $request["address"],
                "residence" => $request["residence"],
                "kks" => $request["kks"],
                "order_family" => $request["order_family"],
                "kps" => $request["kps"],
                "kip" => $request["kip"],
                "height" => $request["height"],
                "weight" => $request["weight"],
                "amount_siblings" => $request["amount_siblings"],
                "residence_distance" => $request["residence_distance"],
                "time_to_school" => $request["time_to_school"],
                "father_name" => $request["father_name"],
                "father_nik" => $request["father_nik"],
                "father_birth" => $request["father_birth"],
                "father_education" => $request["father_education"],
                "father_job" => $request["father_job"],
                "father_income" => $request["father_income"],
                "father_special_needs" => $request["father_special_needs"],
                "mother_name" => $request["mother_name"],
                "mother_nik" => $request["mother_nik"],
                "mother_birth" => $request["mother_birth"],
                "mother_education" => $request["mother_education"],
                "mother_job" => $request["mother_job"],
                "mother_income" => $request["mother_income"],
                "mother_special_needs" => $request["mother_special_needs"],
            ]);

            $registration->update([
                "type_registration" => $request["type_registration"],
                "no_examinee" => $request["no_examinee"],
                "no_serial_diploma" => $request["no_serial_diploma"],
                "no_serial_skhus" => $request["no_serial_skhus"],
                "extracurricular" => $request["extracurricular"],
                "uniform" => $request["uniform"],
            ]);
        } catch (Exception $e) {
            return response()->json($e->getMessage());
        }

        return response()->json(["success" => "Data Berhasil Diubah"]);
    }
}
