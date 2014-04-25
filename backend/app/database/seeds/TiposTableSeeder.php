<?php

class TiposTableSeeder extends Seeder
{
    public function run()
    {
        DB::table('tipos')->delete();

        DB::table('tipos')->insert([
            array('tipo' => 'platillo', 'abreviacion'=> 'pla'),
            array('tipo' => 'verdura', 'abreviacion'=> 'ver'),
            array('tipo' => 'ingrediente', 'abreviacion'=> 'ing'),
            array('tipo' => 'marisco', 'abreviacion'=> 'mar'),
            array('tipo' => 'salsa', 'abreviacion'=> 'sal'),
        ]);
    }
}
