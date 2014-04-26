<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateRecetasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('recetas', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nombre', 50)->unique();
            $table->string('codigo', 20)->unique()->nullable();
            $table->string('tipo_nombre')->unsigned()->index();
            $table->foreign('tipo_nombre')->references('nombre')->on('tipos')->onDelete('cascade')->on_update('cascade');
            $table->float('costo', 4, 2)->nullable();
            $table->string('descripcion')->nullable();
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
        Schema::drop('recetas');
    }
}
