<?php

class ArticulosTableSeeder extends Seeder
{
    public function run()
    {
        DB::table('articulos')->delete();

        foreach (range(1, 10) as $index) {
            $catologo = DB::table('catalogos')->where('id', rand(1, 5))->pluck('nombre');
            $tipo = DB::table('tipos')->where('id', rand(1, 5))->pluck('nombre');
            $unidad =  DB::table('unidades')->where('id', rand(1, 4))->pluck('nombre');
            Articulo::create([
                'nombre' => 'material'.$index,
                'catalogo_nombre' => $catologo,
                'tipo_nombre' => $tipo,
                'unidad_nombre' => $unidad,
                'cantidad_por_unidad' => rand(1, 36),
                'precio_compra' => rand(100, 99999)/100,
                'precio_venta' => rand(100, 99999)/100,
            ]);
        }
    }
}
