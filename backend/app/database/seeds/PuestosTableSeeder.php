<?php

class PuestosTableSeeder extends Seeder
{
    public function run()
    {
        DB::table('puestos')->delete();

        DB::table('puestos')->insert([
            array('nombre' => 'cajero'),
            array('nombre' => 'auxiliar'),
            array('nombre' => 'mesero'),
            array('nombre' => 'cocinero'),
            array('nombre' => 'gerente'),
            array('nombre' => 'administrativo'),
        ]);
    }
}
