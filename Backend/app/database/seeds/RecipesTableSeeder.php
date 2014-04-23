<?php

class RecipesTableSeeder extends Seeder
{
    public function run()
    {
        DB::table('recipes')->delete();

        foreach (range(1, 10) as $index) {
            Recipe::create([
                'receta' => 'receta'.$index,
                'costo' => rand(100, 99999)/100,
            ]);
        }
    }
}
