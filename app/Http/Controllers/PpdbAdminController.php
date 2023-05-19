<?php

namespace App\Http\Controllers;

use App\Exports\DataPPDBExport;
use PDF;
use App\Http\Requests\PPDBAdminRequest;
use App\Models\Registration;
use App\Models\Student;
use App\Models\StudentAchievement;
use App\Models\StudentScholarship;
use App\Models\User;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class PpdbAdminController extends Controller
{
    // public function __construct()
    // {
    //     $this->middleware("auth");
    // }

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
        $data = User::where("id", $id)
            ->with(["student", "achievement", "scholarship", "registration"])
            ->get()
            ->first();

        return response()->json($data);
    }

    public function store(PPDBAdminRequest $request)
    {
        $yearBatchStart = date("Y");
        $yearBatchFinish = date("Y") + 2;
        $countId = Registration::orderBy("id", "desc")
            ->select("id")
            ->first();

        $registration_id =
            date("Y") .
            str_pad($countId ? $countId->id + 1 : 1, 6, "0", STR_PAD_LEFT);

        try {
            // Create A New User
            $user = User::create([
                "user_type_id" => 1,
                "email" => $request->email,
                "fullname" => $request["fullname"],
                "phone" => $request["phone"],
                "password" => Hash::make($request["password"]),
                "menu_permission" => "ppdb|",
            ]);

            if ($request->has("scholarships")) {
                foreach ($request["scholarships"] as $sch) {
                    $scholarship = StudentScholarship::create([
                        "user_id" => $user->id,
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
                        "user_id" => $user->id,
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

            $student = Student::create([
                "user_id" => $user->id,
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
                "mother_name" => $request["mother_name"],
                "mother_nik" => $request["mother_nik"],
                "mother_birth" => $request["mother_birth"],
                "mother_education" => $request["mother_education"],
                "mother_job" => $request["mother_job"],
                "mother_income" => $request["mother_income"],
                "batch" => $yearBatchStart . "-" . $yearBatchFinish,
            ]);

            Registration::create([
                "user_id" => $user->id,
                "student_id" => $student->id,
                "registration_id" => $registration_id,
                "maker" => Auth::user()->fullname,
                "type_registration" => $request["type_registration"],
                "from_school" => $request["from_school"],
                "class_pick" => $request["class_pick"],
                "no_examinee" => $request["no_examinee"],
                "no_serial_diploma" => $request["no_serial_diploma"],
                "no_serial_skhus" => $request["no_serial_skhus"],
                "extracurricular" => $request["extracurricular"],
                "uniform" => $request["uniform"],
                "is_paid" => true,
                "status" => "Belum Diterima",
            ]);
        } catch (Exception $e) {
            return response()->json($e->getMessage());
        }

        return response()->json(["success" => "Data Berhasil Disimpan"]);
    }

    public function update(Request $request)
    {
        $user = User::where("id", $request->id);
        $student = Student::where("user_id", $request->id);
        $registration = Registration::where("user_id", $request->id);

        try {
            // Create A New User
            if ($request->password !== "") {
                $user->update([
                    "fullname" => $request["fullname"],
                    "phone" => $request["phone"],
                    // "email " => $request["email"],
                    "password" => Hash::make($request["password"]),
                ]);
            }

            $user->update([
                "fullname" => $request["fullname"],
                "phone" => $request["phone"],
                // "email " => $request["email"],
            ]);

            if ($request->has("scholarships")) {
                foreach ($request["scholarships"] as $sch) {
                    StudentScholarship::updateOrCreate(
                        ["id" => $sch["id"]],
                        [
                            "user_id" => $request->id,
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
                            "user_id" => $request->id,
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
                "guardian_name" => $request["guardian_name"],
                "guardian_nik" => $request["guardian_nik"],
                "guardian_birth" => $request["guardian_birth"],
                "guardian_education" => $request["guardian_education"],
                "guardian_job" => $request["guardian_job"],
                "guardian_income" => $request["guardian_income"],
                "guardian_special_needs" => $request["guardian_special_needs"],
            ]);

            $registration->update([
                "type_registration" => $request["type_registration"],
                "from_school" => $request["from_school"],
                "class_pick" => $request["class_pick"],
                "no_examinee" => $request["no_examinee"],
                "no_serial_diploma" => $request["no_serial_diploma"],
                "no_serial_skhus" => $request["no_serial_skhus"],
                "extracurricular" => $request["extracurricular"],
                "uniform" => $request["uniform"],
            ]);
        } catch (Exception $e) {
            return response()->json($e->getMessage());
        }

        return response()->json(["success" => "Data Berhasil Disimpan"]);
    }

    public function explodeStr($str)
    {
        return explode("|", $str);
    }

    public function print($id)
    {
        $data = [];
        $oldData = User::where("id", $id)
            ->with(["student", "achievement", "scholarship", "registration"])
            ->get()
            ->first();

        // Birth Student
        $birth = $this->explodeStr($oldData->student->birth);
        $data["birth_date"] = $birth[0];
        $data["birth_place"] = $birth[1];

        // Birth Father
        $birth = $this->explodeStr($oldData->student->father_birth);
        $data["father_birth_place"] = $birth[0];
        $data["father_birth_date"] = $birth[1];

        // Birth Mother
        $birth = $this->explodeStr($oldData->student->mother_birth);
        $data["mother_birth_place"] = $birth[0];
        $data["mother_birth_date"] = $birth[1];

        // Addres
        $address = $this->explodeStr($oldData->student->address);
        $data["alamat"] = $address[0];
        $data["rt"] = $address[1];
        $data["rw"] = $address[2];
        $data["kelurahan"] = $address[3];
        $data["kecamatan"] = $address[4];
        $data["kodepos"] = $address[5];

        // Extracurriculer
        $extracurricular = $this->explodeStr(
            $oldData->registration->extracurricular
        );
        $data["extra1"] = $extracurricular[0];
        $data["extra2"] = $extracurricular[1];

        // Classpick
        $class_pick = $this->explodeStr($oldData->registration->class_pick);
        $data["class_pick1"] = $class_pick[0];
        $data["class_pick2"] = $class_pick[1];
        $data["class_pick3"] = $class_pick[2];

        // Uniform
        $uniform = $this->explodeStr($oldData->registration->uniform);
        $data["uniform1"] = $uniform[0];
        $data["uniform2"] = $uniform[1];
        $data["uniform3"] = $uniform[2];
        $data["uniform4"] = $uniform[3];

        // KPS
        $kps = $this->explodeStr($oldData->student->kps);
        $data["receiver_kps"] = $kps[0];
        $data["no_kps"] = $kps[1];
        $kps_image = $kps[2] == "" || $kps[2] == "-" ? false : $kps[2];

        // KKS
        $kks = $this->explodeStr($oldData->student->kks);
        $data["no_kks"] = $kks[0];
        $kks_image = $kks[1] == "" || $kks[1] == "-" ? false : $kks[1];

        // KIP
        $kip = $this->explodeStr($oldData->student->kip);
        $data["receiver_kip"] = $kip[0];
        $data["name_kip"] = $kip[1];
        $data["no_kip"] = $kip[2];
        $data["reason_kip"] = $kip[3];
        $kip_image = $kip[4] == "" || $kip[4] == "-" ? false : $kip[4];

        // File
        $nisn_image = explode("/", $oldData->student->nisn_image);
        $kartu_keluarga_image = explode(
            "/",
            $oldData->student->kartu_keluarga_image
        );

        $data["nisn_image"] = $nisn_image[3] . "/" . $nisn_image[4];
        $data["kartu_keluarga_image"] =
            $kartu_keluarga_image[3] . "/" . $kartu_keluarga_image[4];

        
            if($kip_image) {
                $kip_image = explode("/", $kip_image);
                $data["kip_image"] = $kip_image[3] . "/" . $kip_image[4];
            }

            if($kps_image) {
                $kps_image = explode("/", $kps_image);
                $data["kps_image"] = $kps_image[3] . "/" . $kps_image[4];
            }

            if($kks_image) {
                $kks_image = explode("/", $kks_image);
                $data["kks_image"] = $kks_image[3] . "/" . $kks_image[4];
            }

            if(!$kip_image && !$kps_image && !$kks_image) {
                $data["kps_image"] = $kps_image;
                $data["kip_image"] = $kip_image;
                $data["kks_image"] = $kks_image;
            }

        $html = view("print", [
            "old_data" => $oldData,
            "data" => $data,
        ]);

        $html2 = view("Print2", [
            "old_data" => $oldData,
            "data" => $data,
        ]);

        $nisnPrint = view("Nisn", [
            "data" => $data,
        ]);
    
        // set margins
        PDF::SetMargins(10, 10, 30);

        // set auto page breaks
        PDF::SetAutoPageBreak(true, 10);

        // set font
        PDF::SetFont("dejavusans", "", 10);

        PDF::SetTitle("Hello World");
        PDF::AddPage();
        PDF::writeHTML($html, true, false, true, false, "");
        PDF::AddPage();
        PDF::writeHTML($html2, true, false, true, false, "");
        
        // Nisn 
        PDF::AddPage();
        PDF::writeHTML($nisnPrint, true, false, true, false, "");
        $x = 55;
        $y = 55;
        $w = 100;
        PDF::Image(public_path($data['nisn_image']), $x, $y, $w, false, 'JPG', '', '', false, 300, '', false, false, 0, false, false, false);

        // Kartu Keluarga
        PDF::AddPage();
        PDF::writeHTML('<h1>Kartu Keluarga</h1>', true, false, true, false, "");
        $x = 20;
        $y = 55;
        $w = 150;
        PDF::Image(public_path($data['kartu_keluarga_image']), $x, $y, $w, false, 'JPG', '', '', false, 300, '', false, false, 0, false, false, false);

        // KIP

        if($kip_image) {  
            PDF::AddPage();
            PDF::writeHTML('<h1>KIP</h1>', true, false, true, false, "");
            $x = 55;
            $y = 55;
            $w = 100;
            PDF::Image(public_path($data['kip_image']), $x, $y, $w, false, 'JPG', '', '', false, 300, '', false, false, 0, false, false, false);
        }

        // KPS
        
        if($kps_image) {  
            PDF::AddPage();
            PDF::writeHTML('<h1>KPS</h1>', true, false, true, false, "");
            $x = 55;
            $y = 55;
            $w = 100;
            PDF::Image(public_path($data['kps_image']), $x, $y, $w, false, 'JPG', '', '', false, 300, '', false, false, 0, false, false, false);
        }

        // KKS
        if($kks_image) {  
            PDF::AddPage();
            PDF::writeHTML('<h1>KKS</h1>', true, false, true, false, "");
            $x = 55;
            $y = 55;
            $w = 100;
            PDF::Image(public_path($data['kks_image']), $x, $y, $w, false, 'JPG', '', '', false, 300, '', false, false, 0, false, false, false);
        }

        $namefile = 'formulir_pendaftaran' . $id . '.pdf';
          PDF::Output(public_path($namefile));

        return response()->download(public_path($namefile));
    }
}
