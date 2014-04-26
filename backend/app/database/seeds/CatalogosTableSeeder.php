<?php

class CatalogosTableSeeder extends Seeder
{
    public function run()
    {
        DB::table('catalogos')->delete();

        DB::table('catalogos')->insert([
            array('nombre' => 'receta', 'abreviacion'=> 'rec'),
            array('nombre' => 'plastico', 'abreviacion'=> 'pla'),
            array('nombre' => 'lata', 'abreviacion'=> 'lat'),
            array('nombre' => 'botella', 'abreviacion'=> 'bot'),
            array('nombre' => 'caja', 'abreviacion'=> 'caj'),
        ]);
    }
}
