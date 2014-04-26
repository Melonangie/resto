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
            $empresa = DB::table('empresas')->where('id', rand(1, 10))->pluck('nombre');
            Persona::create([
                'tipo' => $tipos[array_rand($tipos)],
                'empresa_nombre' => $empresa,
                'nombre' => $faker->Name,
                'direccion' => $faker->address,
                'email' => $faker->email,
                'telefono' => $faker->phoneNumber,
            ]);
        }
    }
}
