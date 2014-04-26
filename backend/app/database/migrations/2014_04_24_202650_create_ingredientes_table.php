<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateIngredientesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('ingredientes', function (Blueprint $table) {
            $table->increments('id');
            $table->string('receta_nombre')->unsigned()->index();
            $table->foreign('receta_nombre')->references('nombre')->on('recetas')->onDelete('cascade');
            $table->string('articulo_nombre')->unsigned()->index();
            $table->foreign('articulo_nombre')->references('nombre')->on('articulos')->onDelete('cascade');
            $table->float('cantidad', 3, 1);
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
        Schema::drop('ingredientes');
    }
}
