<?php

class CategoriesTableSeeder extends Seeder
{
    public function run()
    {
        DB::table('categories')->delete();

        DB::table('categories')->insert([
            array('categoria' => 'plastico'),
            array('categoria' => 'lata'),
            array('categoria' => 'botella'),
            array('categoria' => 'caja'),
            ]);
    }
}
