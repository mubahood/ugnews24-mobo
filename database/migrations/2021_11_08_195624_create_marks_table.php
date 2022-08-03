<?php

use App\Models\Exam;
use App\Models\GeneralExam;
use App\Models\Subject;
use App\Models\Term;
use Encore\Admin\Auth\Database\Administrator;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMarksTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('marks', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->foreignIdFor(Term::class)->nullable();
            $table->foreignIdFor(GeneralExam::class)->nullable();
            $table->foreignIdFor(Subject::class)->nullable();
            $table->foreignIdFor(Administrator::class)->nullable();
            $table->integer('mark')->nullable()->default(0);
            $table->text('remarks')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('marks');
    }
}
