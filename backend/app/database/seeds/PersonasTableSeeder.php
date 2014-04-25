<?php

use Faker\Factory as Faker;

class PersonasTableSeeder extends Seeder
{
    public function run()
    {
        DB::table('personas')->delete();

        $faker = Faker::create('es_ES');
        $tipos = ['contacto', 'cliente', 'otro'];

        foreach (range(1, 10) as $index) {
            Persona::create([
                'tipo' => $tipos[array_rand($tipos)],
                'empresa_id' => $index,
                'nombre' => $faker->firstName,
                'paterno' => $faker->lastName,
                'materno' => $faker->lastName,
                'direccion' => $faker->address,
                'email' => $faker->email,
                'telefono' => $faker->phoneNumber,
            ]);
        }
    }
}
