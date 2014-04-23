<?php

class IngredientsTableSeeder extends Seeder
{
    public function run()
    {
        DB::table('ingredients')->delete();

        foreach (range(1, 30) as $index) {
            Ingredient::create([
                'recipe_id' => rand(1, 10),
                'item_id' => rand(1, 10),
                'cantidad' => rand(100, 9999)/100,
            ]);
        }
    }
}
