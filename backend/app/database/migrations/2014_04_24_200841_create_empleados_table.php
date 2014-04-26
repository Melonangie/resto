<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateEmpleadosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('empleados', function (Blueprint $table) {
            $table->increments('id');
            $table->string('empresa_nombre')->unsigned()->index();
            $table->foreign('empresa_nombre')->references('nombre')->on('empresas')->onDelete('cascade')->on_update('cascade');
            $table->string('departamento_nombre')->unsigned()->index();
            $table->foreign('departamento_nombre')->references('nombre')->on('departamentos')->onDelete('cascade')->on_update('cascade');
            $table->string('puesto_nombre')->unsigned()->index();
            $table->foreign('puesto_nombre')->references('nombre')->on('puestos')->onDelete('cascade')->on_update('cascade');
            $table->string('nombre', 60);
            $table->string('paterno', 60);
            $table->string('materno', 60);
            $table->string('direccion')->nullable();
            $table->string('email', 100)->nullable();
            $table->string('telefono_casa', 20)->nullable();
            $table->string('telefono_oficina', 20)->nullable();
            $table->string('extension', 6)->nullable();
            $table->string('foto')->nullable();
            $table->string('curp', 60)->unique()->nullable();
            $table->date('nacimiento')->nullable();
            $table->date('alta')->nullable();
            $table->date('baja')->nullable();
            $table->string('notas')->nullable();
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
        Schema::drop('empleados');
    }
}
