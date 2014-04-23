<?php

class UnitsTableSeeder extends Seeder
{
    public function run()
    {
        DB::table('units')->delete();

        Unit::create(['unidad' => 'litro', 'medida' => 'lt']);
        Unit::create(['unidad' => 'kilo', 'medida' => 'kg']);
        Unit::create(['unidad' => 'gramo', 'medida' => 'gr']);
        Unit::create(['unidad' => 'onza', 'medida' => 'oz']);
    }
}
