<?php

class DepartmentsTableSeeder extends Seeder
{
    public function run()
    {
        DB::table('departments')->delete();

        DB::table('departments')->insert([
            array('departamento' => 'cajas'),
            array('departamento' => 'cocina'),
            array('departamento' => 'almacen'),
            array('departamento' => 'administracion'),
            ]);
    }
}
