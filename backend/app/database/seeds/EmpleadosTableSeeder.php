<?php

use Faker\Factory as Faker;

class EmpleadosTableSeeder extends Seeder
{
    public function run()
    {
        DB::table('empleados')->delete();

        $faker = Faker::create('es_ES');

        foreach (range(1, 10) as $index) {
            Empleado::create([
                'empresa_id' => $index,
                'departamento_id' => rand(1, 4),
                'puesto_id' => rand(1, 6),
                'nombre' => $faker->firstName,
                'paterno' => $faker->lastName,
                'materno' => $faker->lastName,
                'direccion' => $faker->address,
                'email' => $faker->email,
                'telefono_casa' => $faker->phoneNumber,
                'nacimiento' => $faker->date,
                'alta' => $faker->date,
            ]);
        }
    }
}
