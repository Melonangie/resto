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
                'rol_id' => rand(1, 3),
                ]);
        }
    }
}
