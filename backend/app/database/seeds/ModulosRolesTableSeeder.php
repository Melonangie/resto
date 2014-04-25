<?php

class ModulosRolesTableSeeder extends Seeder
{
    public function run()
    {
        DB::table('modulo_rol')->delete();

        DB::table('modulo_rol')->insert([
            array('rol_id' => 1, 'modulo_id' => 1),
            array('rol_id' => 2, 'modulo_id' => 1),
            array('rol_id' => 2, 'modulo_id' => 2),
            array('rol_id' => 2, 'modulo_id' => 3),
            array('rol_id' => 3, 'modulo_id' => 1),
            array('rol_id' => 3, 'modulo_id' => 2),
            array('rol_id' => 3, 'modulo_id' => 3),
            array('rol_id' => 3, 'modulo_id' => 4),
            array('rol_id' => 3, 'modulo_id' => 5),
            array('rol_id' => 3, 'modulo_id' => 6),
        ]);
    }
}
