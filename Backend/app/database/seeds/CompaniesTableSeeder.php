<?php

use Faker\Factory as Faker;

class CompaniesTableSeeder extends Seeder
{
    public function run()
    {
        DB::table('companies')->delete();

        $faker = Faker::create('es_ES');

        foreach (range(1, 10) as $index) {
            Company::create([
                'tipo' => array_rand('franquicia', 'proveedor', 'cliente'),
                'tipo' => 'franquicia',
                'nombre' => $faker->bs,
                'direccion' => $faker->streetAddress,
                'ciudad' => $faker->city,
                'estado' => $faker->state,
                'pais' => $faker->country,
                'cp' => $faker->postcode,
                'web' => $faker->url,
            ]);
        }
    }
}
