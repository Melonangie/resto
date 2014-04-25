<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateArticulosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('articulos', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nombre', 60);
            $table->string('codigo', 20)->unique()->nullable();
            $table->integer('catalogo_id')->unsigned()->index();
            $table->foreign('catalogo_id')->references('id')->on('catalogos')->onDelete('cascade')->on_update('cascade');
            $table->integer('tipo_id')->unsigned()->index();
            $table->foreign('tipo_id')->references('id')->on('tipos')->onDelete('cascade')->on_update('cascade');
            $table->integer('unidad_id')->unsigned()->index();
            $table->foreign('unidad_id')->references('id')->on('unidades')->onDelete('cascade')->on_update('cascade');
            $table->integer('cantidad_por_unidad');
            $table->float('precio_compra', 4, 2)->nullable();
            $table->float('precio_venta', 4, 2)->nullable();
            $table->string('foto')->nullable();
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
        Schema::drop('articulos');
    }
}
