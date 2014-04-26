<?php

class TiposTableSeeder extends Seeder
{
    public function run()
    {
        DB::table('tipos')->delete();

        DB::table('tipos')->insert([
            array('nombre' => 'platillo', 'abreviacion'=> 'pla'),
            array('nombre' => 'verdura', 'abreviacion'=> 'ver'),
            array('nombre' => 'ingrediente', 'abreviacion'=> 'ing'),
            array('nombre' => 'marisco', 'abreviacion'=> 'mar'),
            array('nombre' => 'salsa', 'abreviacion'=> 'sal'),
        ]);
    }
}
