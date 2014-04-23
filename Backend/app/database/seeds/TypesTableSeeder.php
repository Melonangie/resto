<?php

class TypesTableSeeder extends Seeder
{
    public function run()
    {
        DB::table('types')->delete();

        DB::table('types')->insert([
            array('tipo' => 'verdura', 'abreviacion'=> 've'),
            array('tipo' => 'ingrediente', 'abreviacion'=> 'in'),
            array('tipo' => 'marisco', 'abreviacion'=> 'ma'),
            array('tipo' => 'salsa', 'abreviacion'=> 'sa'),
            ]);
    }
}
