<?php

class ModulosTableSeeder extends Seeder
{
    public function run()
    {
        DB::table('modulos')->delete();

        DB::table('modulos')->insert([
            array('nombre' => 'Mercancias', 'uri' => 'items'),
            array('nombre' => 'Recetas', 'uri' => 'recipes'),
            array('nombre' => 'Permiso', 'uri' => 'rols'),
            array('nombre' => 'Usuarios', 'uri' => 'users'),
            array('nombre' => 'Empresas', 'uri' => 'companies'),
            array('nombre' => 'Empleados', 'uri' => 'employees'),
        ]);
    }
}
