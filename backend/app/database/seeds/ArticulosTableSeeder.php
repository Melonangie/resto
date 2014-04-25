<?php

class ArticulosTableSeeder extends Seeder
{
    public function run()
    {
        DB::table('articulos')->delete();

        foreach (range(1, 10) as $index) {
            Articulo::create([
                'nombre' => 'material'.$index,
                'tipo_id' => rand(1, 4),
                'catalogo_id' => rand(1, 4),
                'unidad_id' => rand(1, 4),
                'cantidad_por_unidad' => rand(1, 36),
                'precio_compra' => rand(100, 99999)/100,
                'precio_venta' => rand(100, 99999)/100,
            ]);
        }
    }
}
