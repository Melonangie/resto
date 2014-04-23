<?php

// Composer: "fzaninotto/faker": "v1.3.0"
use Faker\Factory as Faker;

class PositionsTableSeeder extends Seeder
{
    public function run()
    {
        DB::table('positions')->delete();

        DB::table('positions')->insert([
            array('puesto' => 'cajero'),
            array('puesto' => 'auxiliar'),
            array('puesto' => 'mesero'),
            array('puesto' => 'cocinero'),
            array('puesto' => 'gerente'),
            array('puesto' => 'administrativo'),
            ]);
    }

}
