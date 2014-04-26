<?php

class UnidadesTableSeeder extends Seeder
{
    public function run()
    {
        DB::table('unidades')->delete();

        DB::table('unidades')->insert([
            array('nombre' => 'litro', 'abreviacion' => 'lt'),
            array('nombre' => 'kilo', 'abreviacion' => 'kg'),
            array('nombre' => 'gramo', 'abreviacion' => 'gr'),
            array('nombre' => 'onza', 'abreviacion' => 'oz'),
        ]);
    }
}
