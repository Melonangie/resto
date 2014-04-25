<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateModuloRolTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('modulo_rol', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('modulo_id')->unsigned()->index();
            $table->foreign('modulo_id')->references('id')->on('modulos')->onDelete('cascade');
            $table->integer('rol_id')->unsigned()->index();
            $table->foreign('rol_id')->references('id')->on('roles')->onDelete('cascade');
        });

    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('modulo_rol');
    }
}
