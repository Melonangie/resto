<?php

class RecetaTableSeeder extends Seeder
{
    public function run()
    {
        DB::table('recetas')->delete();

        foreach (range(1, 10) as $index) {
            Receta::create([
                'receta' => 'receta'.$index,
                'costo' => rand(100, 99999)/100,
            ]);
        }
    }
}
