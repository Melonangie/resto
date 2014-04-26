<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the Closure to execute when that URI is requested.
|
*/

Route::get('/', function () {
    return View::make('hello');
});

Route::group(array('prefix' => 'v1', 'before' => 'api.auth|api.limit'), function () {
    Route::resource('empresas', 'EmpresasController');
    Route::resource('departamentos', 'DepartamentosController');
    Route::resource('puestos', 'PuestosController');
    Route::resource('personas', 'PersonasController');
    Route::resource('empleados', 'EmpleadosController');
    Route::resource('unidades', 'UnidadesController');
    Route::resource('catalogos', 'CatalogosController');
    Route::resource('tipos', 'TiposController');
    Route::resource('articulos', 'ArticulosController');
    Route::resource('recetas', 'RecetasController');
    Route::resource('ingredientes', 'IngredientesController');
    Route::resource('modulos', 'ModulosController');
    Route::resource('roles', 'RolesController');
    Route::resource('users', 'UsersController');
});
