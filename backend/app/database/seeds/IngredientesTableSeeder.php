<?php

class IngredientesTableSeeder extends Seeder
{
    public function run()
    {
        DB::table('ingredientes')->delete();

        foreach (range(1, 30) as $index) {
            Ingrediente::create([
                'receta_id' => rand(1, 10),
                'articulo_id' => rand(1, 10),
                'cantidad' => rand(100, 9999)/100,
            ]);
        }
    }
}
