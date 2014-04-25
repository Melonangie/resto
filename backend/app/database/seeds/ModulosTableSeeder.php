<?php

class ModulosTableSeeder extends Seeder
{
    public function run()
    {
        DB::table('modulos')->delete();

        DB::table('modulos')->insert([
            array('modulo' => 'Mercancias', 'uri' => 'items'),
            array('modulo' => 'Recetas', 'uri' => 'recipes'),
            array('modulo' => 'Permiso', 'uri' => 'rols'),
            array('modulo' => 'Usuarios', 'uri' => 'users'),
            array('modulo' => 'Empresas', 'uri' => 'companies'),
            array('modulo' => 'Empleados', 'uri' => 'employees'),
        ]);
    }
}
