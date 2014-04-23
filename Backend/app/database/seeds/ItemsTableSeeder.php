<?php

class ItemsTableSeeder extends Seeder
{
    public function run()
    {
        DB::table('items')->delete();

        foreach (range(1, 10) as $index) {
            Item::create([
                'nombre' => 'material'.$index,
                'category_id' => rand(1, 4),
                'type_id' => rand(1, 4),
                'unit_id' => rand(1, 4),
                'cantidad_por_unidad' => rand(1, 36),
                'precio_compra' => rand(100, 99999)/100,
                'precio_venta' => rand(100, 99999)/100,
            ]);
        }
    }
}
