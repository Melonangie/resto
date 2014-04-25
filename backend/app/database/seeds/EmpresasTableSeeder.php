<?php

use Faker\Factory as Faker;

class EmpresasTableSeeder extends Seeder
{
    public function run()
    {
        $faker = Faker::create('es_ES');

        foreach (range(1, 5) as $index) {
            Empresa::create([
                'tipo' => 'franquicia',
                'nombre' => $faker->bs,
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
                'tipo' => 'proveedor',
                'nombre' => $faker->bs,
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
                'tipo' => 'cliente',
                'nombre' => $faker->bs,
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
