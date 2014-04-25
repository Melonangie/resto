<?php

class PuestosTableSeeder extends Seeder
{
    public function run()
    {
        DB::table('puestos')->delete();

        DB::table('puestos')->insert([
            array('puesto' => 'cajero'),
            array('puesto' => 'auxiliar'),
            array('puesto' => 'mesero'),
            array('puesto' => 'cocinero'),
            array('puesto' => 'gerente'),
            array('puesto' => 'administrativo'),
        ]);
    }
}
