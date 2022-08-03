<?php

use App\Models\Term;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateGeneralExamsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('general_exams', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->foreignIdFor(Term::class)->default(1);
            $table->text("name")->nullable();
            $table->text("details")->nullable();
            $table->bigInteger("max_marks")->nullable();
            $table->tinyInteger("published")->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('general_exams');
    }
}
