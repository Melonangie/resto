<?php

class DatabaseSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Eloquent::unguard();

        $this->call('EmpresasTableSeeder');
        $this->call('DepartamentosTableSeeder');
        $this->call('PuestosTableSeeder');
        $this->call('PersonasTableSeeder');
        $this->call('EmpleadosTableSeeder');
        $this->call('UnidadesTableSeeder');
        $this->call('CatalogosTableSeeder');
        $this->call('TiposTableSeeder');
        $this->call('ArticulosTableSeeder');
        $this->call('RecetaTableSeeder');
        $this->call('IngredientesTableSeeder');
        $this->call('ModulosTableSeeder');
        $this->call('RolesTableSeeder');
        $this->call('ModulosRolesTableSeeder');
        $this->call('UsersTableSeeder');
    }
}
