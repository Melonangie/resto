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
            $table->integer('receta_id')->unsigned()->index();
            $table->foreign('receta_id')->references('id')->on('recetas')->onDelete('cascade');
            $table->integer('articulo_id')->unsigned()->index();
            $table->foreign('articulo_id')->references('id')->on('articulos')->onDelete('cascade');
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
