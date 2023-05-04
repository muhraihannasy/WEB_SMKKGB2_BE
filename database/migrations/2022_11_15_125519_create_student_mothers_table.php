<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateStudentMothersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('student_mothers', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id');
            $table->string('name', 50);
            $table->string('nik', 30);
            $table->string('birth', 50);
            $table->enum('education', ['Tidak Sekolah', 'Putus SD', 'SD Sederajat', 'SMP Sederajat', 'SMA Sederajat', 'D1', 'D2', 'D3', 'D4/S1', 'S2', 'S3']);
            $table->string('job', 50);
            $table->string('salary', 50);
            $table->string('special_needs', 50);
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
        Schema::dropIfExists('biodata_student_mothers');
    }
}
