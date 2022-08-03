<?php

use Encore\Admin\Auth\Database\Administrator;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateContractsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('contracts', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->foreignIdFor(Administrator::class);
            $table->text('title')->nullable();
            $table->text('fuel_type')->nullable();
            $table->text('total_quantity')->nullable();
            $table->text('attachment')->nullable();
            $table->text('contract_period')->nullable();
            $table->bigInteger('price')->nullable();
            $table->text('details')->nullable();
        });
    }

    /**
     * Reverse the migrations. 
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('contracts');
    }
}
