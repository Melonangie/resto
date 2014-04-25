<?php

class DepartamentosTableSeeder extends Seeder
{
    public function run()
    {
        DB::table('departamentos')->delete();

        DB::table('departamentos')->insert([
            array('departamento' => 'cajas'),
            array('departamento' => 'cocina'),
            array('departamento' => 'almacen'),
            array('departamento' => 'administracion'),
        ]);
    }
}
