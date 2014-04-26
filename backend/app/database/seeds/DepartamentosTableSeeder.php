<?php

class DepartamentosTableSeeder extends Seeder
{
    public function run()
    {
        DB::table('departamentos')->delete();

        DB::table('departamentos')->insert([
            array('nombre' => 'cajas'),
            array('nombre' => 'cocina'),
            array('nombre' => 'almacen'),
            array('nombre' => 'administracion'),
        ]);
    }
}
