<?php

class IngredientesTableSeeder extends Seeder
{
    public function run()
    {
        DB::table('ingredientes')->delete();

        foreach (range(1, 30) as $index) {
            $receta = DB::table('recetas')->where('id', rand(1, 10))->pluck('nombre');
            $articulo = DB::table('articulos')->where('id', rand(1, 10))->pluck('nombre');
            Ingrediente::create([
                'receta_nombre' => $receta,
                'articulo_nombre' => $articulo,
                'cantidad' => rand(100, 9999)/100,
            ]);
        }
    }
}
