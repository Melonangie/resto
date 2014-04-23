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
    Route::resource('rols', 'RolsController');
    Route::resource('users', 'UsersController');
    Route::resource('companies', 'CompaniesController');
    Route::resource('positions', 'PositionsController');
    Route::resource('departments', 'DepartmentsController');
    Route::resource('employees', 'EmployeesController');
    Route::resource('people', 'PeopleController');
    Route::resource('units', 'UnitsController');
    Route::resource('categories', 'CategoriesController');
    Route::resource('types', 'TypesController');
    Route::resource('items', 'ItemsController');
    Route::resource('recipes', 'RecipesController');
    Route::resource('ingredients', 'IngredientsController');
});
