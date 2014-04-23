<?php

class CategoriesTableSeeder extends Seeder
{
    public function run()
    {
        DB::table('categories')->delete();

        DB::table('categories')->insert([
            array('categoria' => 'plastico', 'abreviacion'=> 'pla'),
            array('categoria' => 'lata', 'abreviacion'=> 'lat'),
            array('categoria' => 'botella', 'abreviacion'=> 'bot'),
            array('categoria' => 'caja', 'abreviacion'=> 'caj'),
            ]);
    }
}
