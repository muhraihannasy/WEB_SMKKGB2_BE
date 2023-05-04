<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateStudentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('students', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id');
            $table->foreignId('student_father_id');
            $table->foreignId('student_mother_id');
            $table->foreignId('student_guardian_id');
            $table->foreignId('student_achievement_id');
            $table->foreignId('student_scholarship_id');
            $table->string('nisn', 10);
            $table->string('nik', 20);
            $table->string('no_certificate_registration', 35);
            $table->string('no_kks', 50)->nullable();
            $table->text('kps')->nullable();
            $table->text('kip')->nullable();
            $table->text('address');
            $table->enum('residence', ['bersama orang tua', 'wali', 'kos', 'asrama', 'panti asuhan']);
            $table->string("residence_distance", 30);
            $table->enum('transport', ['Jalan Kaki', 'Kendaraan Pribadi', 'Kendaraan Umum/Angkot/Pete-pete', 'Jemputan Sekolah', 'Kereta api', 'Ojek', 'Andong/Bendi/Sado/Dokar/Delma/Beca', 'Perahu Penyebrangan/Rakit/Getek', 'Lainya']);
            $table->string("time_to_school", 30);
            $table->enum('religion', ['Islam', 'kristen/protestan', 'Katholik', 'Hindu', 'Budha', 'khonghucu', 'lainnya']);
            $table->string('birth', 50);
            $table->string("height", 10);
            $table->string("weight", 10);
            $table->string("amount_siblings", 10);
            $table->enum('gender', ['laki-laki', 'perempuan']);
            $table->string('special_needs', 50);
            $table->string('order_family', 3);
            $table->string('status')->default(true);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('students');
    }
}
