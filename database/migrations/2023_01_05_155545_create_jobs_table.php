<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateJobsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create("jobs", function (Blueprint $table) {
            $table->id();
            $table
                ->foreignId("user_id")
                ->cascadeOnUpdate()
                ->cascadeOnDelete();
            $table
                ->foreignId("job_category_id")
                ->cascadeOnUpdate()
                ->cascadeOnDelete();
            $table->string("name");
            $table->string("company_name");
            $table->text("description");
            $table->text("qualification");
            $table->string("location");
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists("jobs");
    }
}
