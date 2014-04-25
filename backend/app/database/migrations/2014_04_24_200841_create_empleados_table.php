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
            $table->integer('empresa_id')->unsigned()->index();
            $table->foreign('empresa_id')->references('id')->on('empresas')->onDelete('cascade')->on_update('cascade');
            $table->integer('departamento_id')->unsigned()->index();
            $table->foreign('departamento_id')->references('id')->on('departamentos')->onDelete('cascade')->on_update('cascade');
            $table->integer('puesto_id')->unsigned()->index();
            $table->foreign('puesto_id')->references('id')->on('puestos')->onDelete('cascade')->on_update('cascade');
            $table->string('nombre', 60);
            $table->string('paterno', 60);
            $table->string('materno', 60);
            $table->string('direccion');
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
