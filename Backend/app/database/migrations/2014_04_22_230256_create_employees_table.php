<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateEmployeesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('employees', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('company_id')->unsigned()->index();
            $table->foreign('company_id')->references('id')->on('companies')->onDelete('cascade')->onUpdate('cascade');
            $table->integer('department_id')->unsigned()->index();
            $table->foreign('department_id')->references('id')->on('departments')->onDelete('cascade')->onUpdate('cascade');
            $table->integer('position_id')->unsigned()->index();
            $table->foreign('position_id')->references('id')->on('positions')->onDelete('cascade')->onUpdate('cascade');
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
        Schema::drop('employees');
    }
}
