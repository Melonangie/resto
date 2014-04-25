<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateEmpresasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('empresas', function (Blueprint $table) {
            $table->increments('id');
            $table->enum('tipo', ['principal', 'franquicia', 'proveedor', 'cliente']);
            $table->string('giro')->nullable();
            $table->string('nombre');
            $table->string('direccion');
            $table->string('ciudad', 50);
            $table->string('estado', 50);
            $table->string('pais', 50);
            $table->string('cp', 10);
            $table->string('rfc', 50)->unique()->nullable();
            $table->string('url', 60)->nullable();
            $table->string('logo')->nullable();
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
        Schema::drop('empresas');
    }
}
