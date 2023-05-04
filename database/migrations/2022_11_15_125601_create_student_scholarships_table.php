<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateStudentScholarshipsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('student_scholarships', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id');
            $table->enum('type', ['Anak Berprestasi', 'Anak Miskin', 'Pendidikan', 'Unggulan', 'Lain-lain'])->nullable();
            $table->text('descriptions')->nullable();
            $table->string('year_start_at', 4)->nullable();
            $table->string('year_finish_at', 4)->nullable();
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
        Schema::dropIfExists('biodata_student_scholarships');
    }
}
