<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRegistrationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('registrations', function (Blueprint $table) {
            $table->id();
            $table->foreignId('student_id');
            $table->foreignId('payment_id')->nullable();
            $table->enum('class', ['Teknik Komputer dan Jaringan', 'Akutansi dan Keuangan Lembaga', 'Otomasi dan Tata Kelola Perkantoran']);
            $table->enum('type_registration', ['Siswa Baru', 'Pindahan', 'Kembali Bersekolah']);
            $table->string("from_school");
            $table->string('no_examinee', 35);
            $table->string('no_serial_diploma', 20);
            $table->string('no_serial_skhus', 20);
            $table->text("class_pick");
            $table->text('extracurricular');
            $table->text('uniform');
            $table->boolean('active')->default(true);
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
        Schema::dropIfExists('registrations');
    }
}
