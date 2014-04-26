<?php

use Faker\Factory as Faker;

class EmpresasTableSeeder extends Seeder
{
    public function run()
    {
        $faker = Faker::create('es_ES');

        foreach (range(1, 5) as $index) {
            Empresa::create([
                'nombre' => $faker->bs,
                'tipo' => 'franquicia',
                'direccion' => $faker->streetAddress,
                'ciudad' => $faker->city,
                'estado' => $faker->state,
                'pais' => $faker->country,
                'cp' => $faker->postcode,
                'url' => $faker->url,
            ]);
        }
        foreach (range(1, 3) as $index) {
            Empresa::create([
                'nombre' => $faker->bs,
                'tipo' => 'proveedor',
                'direccion' => $faker->streetAddress,
                'ciudad' => $faker->city,
                'estado' => $faker->state,
                'pais' => $faker->country,
                'cp' => $faker->postcode,
                'url' => $faker->url,
            ]);
        }
        foreach (range(1, 2) as $index) {
            Empresa::create([
                'nombre' => $faker->bs,
                'tipo' => 'cliente',
                'direccion' => $faker->streetAddress,
                'ciudad' => $faker->city,
                'estado' => $faker->state,
                'pais' => $faker->country,
                'cp' => $faker->postcode,
                'url' => $faker->url,
            ]);
        }
    }
}
