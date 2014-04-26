<?php

class RecetaTableSeeder extends Seeder
{
    public function run()
    {
        DB::table('recetas')->delete();

        foreach (range(1, 10) as $index) {
            $tipo = DB::table('tipos')->where('id', rand(1, 5))->pluck('nombre');
            Receta::create([
                'nombre' => 'receta'.$index,
                'tipo_nombre' => $tipo,
                'costo' => rand(100, 99999)/100,
            ]);
        }
    }
}
