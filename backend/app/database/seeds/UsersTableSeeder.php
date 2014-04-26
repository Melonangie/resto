<?php

class UsersTableSeeder extends Seeder
{
    public function run()
    {
        DB::table('users')->delete();

        foreach (range(1, 10) as $index) {
            $rol = DB::table('roles')->where('id', rand(1, 3))->pluck('nombre');
            User::create([
                'username' => 'usuario' . $index,
                'password' => 'password' . $index,
                'empleado_id' => rand(1, 10),
                'rol_nombre' =>  $rol,
            ]);
        }
    }
}
