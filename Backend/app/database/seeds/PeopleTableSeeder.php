<?php

use Faker\Factory as Faker;

class PeopleTableSeeder extends Seeder
{
    public function run()
    {
        DB::table('people')->delete();

        $faker = Faker::create();

        foreach (range(1, 10) as $index) {
            Person::create([
                'tipo' => array_rand('contacto', 'cliente', 'otro'),
                'company_id' => $index,
                'nombre' => $faker->firstNameMale,
                'paterno' => $faker->lastName,
                'materno' => $faker->lastName,
                'email' => $faker->email,
            ]);
        }
    }
}
