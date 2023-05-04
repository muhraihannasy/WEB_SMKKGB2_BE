<?php

namespace App\Http\Controllers;

use App\Models\Registration;
use App\Models\Student;
use App\Models\StudentAchievement;
use App\Models\StudentFather;
use App\Models\StudentGuardian;
use App\Models\StudentMother;
use App\Models\StudentScholarship;
use App\Models\User;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class PpdbController extends Controller
{
    public function __construct()
    {
        $this->middleware("auth");
    }
    // protected $table = Registration::class;

    public function list(Request $request)
    {
        $data = DB::table("registrations as rgs")
            ->join("students as std", "rgs.student_id", "=", "std.id")
            ->join("users", "std.user_id", "users.id")
            ->select(
                // Data Registration
                "rgs.id",
                "rgs.student_id",
                "rgs.type_registration",
                "rgs.from_school",
                "rgs.is_paid",
                "rgs.status",

                // Data Users
                "users.fullname",
                "users.photo"
            );
        // if($request->has('filter')) {
        //     $filter = $request->filter;
        //     return response()->json($data->where('rgs.is_paid', $filter)->get());
        // }

        return response()->json($data->get());
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
                "nisn_image" => $request["foto_nisn"],
                "nik" => $request["nik"],
                "kartu_keluarga_image" => $request["foto_kartu_keluarga"],
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
                "nisn_image" => $request["foto_nisn"],
                "nik" => $request["nik"],
                "kartu_keluarga_image" => $request["foto_kartu_keluarga"],
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

    public function util()
    {
        $data = [
            "list_gender" => ["Laki-Laki", "Perempuan"],

            "list_religion" => [
                "Islam",
                "Kristen/Protestan",
                "Katholik",
                "Hindu",
                "Budha",
                "Khonghucu",
                "Lainyaa",
            ],

            "list_special_needs" => [
                "Netra",
                "Rungu",
                "Grahita Ringan",
                "Grahita Sedang",
                "Dasksa Ringan",
                "Daksa Sedang",
                "Laras",
                "Wicara",
                "Tuna Ganda",
                "Hiper Aktif",
                "Cerdas Istimewa",
                "Bakat Istimewa",
                "Kesulitan Belajar",
                "Narkoba",
                "Indigo",
                "Down Sindrome",
                "Autis",
            ],

            "list_residence" => [
                "Bersama Orang Tua",
                "Wali",
                "Kos",
                "Asrama",
                "Panti Asuhan",
                "Lainnya",
            ],

            "list_transport" => [
                "Jalan Kaki",
                "Kendaraan Pribadi",
                "Kendaraan Umum/Angkot/Pete-pete",
                "Jemputan Sekolah",
                "Kereta api",
                "Ojek",
                "Andong/Bendi/Sado/Dokar/Delma/Beca",
                "Perahu Penyebrangan/Rakit/Getek",
                "Lainya",
            ],

            "list_reason_kip" => [
                "Daerah Konflik",
                "Dampak Bencana Alam",
                "Kelainan Fisik",
                "Penah Drop Out",
                "Keluarga Pidana/Berada di LAPAS",
                "Pemegang PKH/PKS/KKS",
                "Siswa Miskin/Rentan Miskin",
                "Yatim Piatu/Panti Asuhan/Panti Sosial",
            ],

            "list_education" => [
                "Tidak Sekolah",
                "Putus SD",
                "SD Sederajat",
                "SMP Sederajat",
                "SMA Sederajat",
                "D1",
                "D2",
                "D3",
                "D4/S1",
                "S2",
                "S3",
            ],

            "list_profession" => [
                "Tidak Bekerja",
                "Nelayan",
                "Petani",
                "Peternak",
                "PNS/TNI/Porli",
                "Karyawan Swasta",
                "Pedagang Kecil",
                "Pedagang Besar",
                "Wiraswata",
                "Wirausaha",
                "Buruh",
                "Pensiunan",
                "Sudah Meninggal",
            ],

            "list_income" => [
                "Kurang dari Rp. 500,000",
                "Rp. 500,000 - Rp. 999,999",
                "Rp. 1,000,000 - Rp. 1,999,999",
                "Rp. 2,000,000 - Rp. 4,999,999",
                "Rp. 5,000,000 - Rp. 20,000,000",
                "Tidak Berpenghasilan",
            ],

            "list_distance" => [
                "Kurang dari 1 KM",
                "Lebih dari 1 KM",
                "Jarak rumah peserta didik ke sekolah, kurang dari 1 km atau lebih dari 1 km",
            ],

            "list_type_achievements" => [
                "Sains",
                "Seni",
                "Olahraga",
                "Lain-lain",
            ],

            "list_level_achievements" => [
                "Sekolah",
                "Kabupaten",
                "Kecamatan",
                "Provinsi",
                "Nasional",
                "Internasional",
            ],

            "list_scholarship" => [
                "Anak Berprestasi",
                "Anak Miskin",
                "Pendidikan",
                "Unggulan",
                "Lain-lain",
            ],

            "list_type_registration" => [
                "Siswa Baru",
                "Pindahan",
                "Kembali Bersekolah",
            ],

            "list_competency" => [
                "Teknik Komputer Jaringan",
                "Akutansi dan Keuangan Lembaga",
                "Otomasi dan Tata Kelola Perkantoran",
            ],

            "list_uniforms_size" => ["S", "M", "L", "XL", "XXL"],

            "list_extracurriculer" => [
                "OSIS",
                "Pramuka",
                "Paskibra",
                "Futsal",
                "Rohis",
                "PMR",
                "Karate",
                "Taekwondo",
                "Angklung",
                "Marching Band",
                "English Club",
                "Seni Tari",
                "Pencak Silat",
                "Basket Ball",
                "Volly Ball",
            ],
        ];
    }
}
