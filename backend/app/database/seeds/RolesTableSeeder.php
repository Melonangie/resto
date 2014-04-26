<?php

class RolesTableSeeder extends Seeder
{
    public function run()
    {
        DB::table('roles')->delete();

        DB::table('roles')->insert([
            array('nombre' => 'usuario'),
            array('nombre' => 'gerente'),
            array('nombre' => 'administrativo'),
        ]);
    }
}
