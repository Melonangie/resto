<?php

class TypesTableSeeder extends Seeder
{
    public function run()
    {
        DB::table('types')->delete();

        DB::table('types')->insert([
            array('tipo' => 'verdura'),
            array('tipo' => 'ingrediente'),
            array('tipo' => 'marisco'),
            array('tipo' => 'salsa'),
            ]);
    }
}
