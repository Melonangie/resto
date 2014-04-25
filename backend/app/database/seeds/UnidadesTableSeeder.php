<?php

class UnidadesTableSeeder extends Seeder
{
    public function run()
    {
        DB::table('unidades')->delete();

        DB::table('unidades')->insert([
            array('unidad' => 'litro', 'medida' => 'lt'),
            array('unidad' => 'kilo', 'medida' => 'kg'),
            array('unidad' => 'gramo', 'medida' => 'gr'),
            array('unidad' => 'onza', 'medida' => 'oz'),
        ]);
    }
}
