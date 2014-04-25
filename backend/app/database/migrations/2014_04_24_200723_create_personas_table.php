<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreatePersonasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('personas', function (Blueprint $table) {
            $table->increments('id');
            $table->enum('tipo', ['contacto', 'cliente', 'otro']);
            $table->integer('empresa_id')->unsigned()->index();
            $table->foreign('empresa_id')->references('id')->on('empresas')->onDelete('cascade')->on_update('cascade');
            $table->string('nombre', 60);
            $table->string('paterno', 60);
            $table->string('materno', 60);
            $table->string('direccion')->nullable();
            $table->string('email', 100)->nullable();
            $table->string('telefono', 20)->nullable();
            $table->string('extension', 6)->nullable();
            $table->string('celular', 20)->nullable();
            $table->string('radio', 20)->nullable();
            $table->string('fax', 20)->nullable();
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
        Schema::drop('personas');
    }
}
