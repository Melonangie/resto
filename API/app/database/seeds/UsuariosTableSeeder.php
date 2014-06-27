<?php

use Ajustes\Usuario;

class UsuariosTableSeeder extends Seeder {

	public function run()
	{
        foreach (range(1, 10) as $index) {
            Usuario::create([
                'usuario' => 'usuario' . $index,
                'clave' => 'clave' . $index,
            ]);
//            DB::table('usuarios')->insert([
//                array('usuario' => 'usuario' . $index),
//                array('clave' => 'clave' . $index),
//            ]);
		}
	}

}