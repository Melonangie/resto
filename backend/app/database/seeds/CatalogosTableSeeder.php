<?php

class CatalogosTableSeeder extends Seeder
{
    public function run()
    {
        DB::table('catalogos')->delete();

        DB::table('catalogos')->insert([
            array('catologo' => 'plastico', 'abreviacion'=> 'pla'),
            array('catologo' => 'lata', 'abreviacion'=> 'lat'),
            array('catologo' => 'botella', 'abreviacion'=> 'bot'),
            array('catologo' => 'caja', 'abreviacion'=> 'caj'),
        ]);
    }
}
