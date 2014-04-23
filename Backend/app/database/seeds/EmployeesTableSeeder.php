<?php

use Faker\Factory as Faker;

class EmployeesTableSeeder extends Seeder
{
    public function run()
    {
        DB::table('employees')->delete();

        $faker = Faker::create('es_ES');

        foreach (range(1, 10) as $index) {
            Employee::create([
                'company_id' => $index,
                'department_id' => rand(1, 4),
                'position_id' => rand(1, 6),
                'nombre' => $faker->firstNameMale,
                'paterno' => $faker->lastName,
                'materno' => $faker->lastName,
                'direccion' => $faker->address,
                'telefono_casa' => $faker->phoneNumber,
                'email' => $faker->email,
                'alta' => $faker->date,
                'nacimiento' => $faker->date,
            ]);
        }
    }
}
