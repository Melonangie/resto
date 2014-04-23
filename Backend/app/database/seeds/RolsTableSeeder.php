<?php

class RolsTableSeeder extends Seeder
{
    public function run()
    {
        DB::table('rols')->delete();

        DB::table('rols')->insert([
            array('rol' => 'usuario'),
            array('rol' => 'gerente'),
            array('rol' => 'administrativo'),
            ]);
    }
}
