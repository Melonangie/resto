<?php

class TiposTableSeeder extends Seeder
{
    public function run()
    {
        DB::table('tipos')->delete();

        DB::table('tipos')->insert([
            array('tipo' => 'verdura', 'abreviacion'=> 've'),
            array('tipo' => 'ingrediente', 'abreviacion'=> 'in'),
            array('tipo' => 'marisco', 'abreviacion'=> 'ma'),
            array('tipo' => 'salsa', 'abreviacion'=> 'sa'),
            ]);
    }
}
