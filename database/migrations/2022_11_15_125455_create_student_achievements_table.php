<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateStudentAchievementsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('student_achievements', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id');
            $table->string('achievement_name', 50)->nullable();
            $table->enum('type', ['Sains', 'Seni', 'Olahraga', 'Lain-lain'])->nullable();
            $table->enum('level', ['Sekolah', 'Kabupaten', 'Nasional', 'Internasional', 'Kecamatan', 'Provinsi'])->nullable();
            $table->string('year', 4)->nullable();
            $table->string('organizer_by')->nullable();
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
        Schema::dropIfExists('biodata_student_achievements');
    }
}
