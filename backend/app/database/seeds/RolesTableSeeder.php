<?php

class RolesTableSeeder extends Seeder
{
    public function run()
    {
        DB::table('roles')->delete();

        DB::table('roles')->insert([
            array('rol' => 'usuario'),
            array('rol' => 'gerente'),
            array('rol' => 'administrativo'),
        ]);
    }
}
