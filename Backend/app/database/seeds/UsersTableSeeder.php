<?php

class UsersTableSeeder extends Seeder
{
    public function run()
    {
        DB::table('users')->delete();

        foreach (range(1, 10) as $index) {
            User::create([
                'username' => 'usuario' . $index,
                'password' => 'password' . $index,
                'empleado_id' => rand(1, 10),
                'rol_id' => rand(1, 3),
            ]);
        }
    }
}
