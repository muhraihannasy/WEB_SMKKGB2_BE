<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateStudentPriodicsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('student_priodics', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id');
            $table->string("height", 10);
            $table->string("weight", 10);
            $table->string("residence_distance", 30);
            $table->string("time_to_school", 30);
            $table->string("amount_siblings", 10);
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
        Schema::dropIfExists('biodata_student_priodics');
    }
}
