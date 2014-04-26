<?php

use Faker\Factory as Faker;

class EmpleadosTableSeeder extends Seeder
{
    public function run()
    {
        DB::table('empleados')->delete();

        $faker = Faker::create('es_ES');

        foreach (range(1, 10) as $index) {
            $empresa = DB::table('empresas')->where('id', rand(1, 10))->pluck('nombre');
            $departamento = DB::table('departamentos')->where('id', rand(1, 4))->pluck('nombre');
            $puesto = DB::table('puestos')->where('id', rand(1, 6))->pluck('nombre');
            var_dump($puesto);
            Empleado::create([
                'empresa_nombre' => $empresa,
                'departamento_nombre' => $departamento,
                'puesto_nombre' => $puesto,
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
