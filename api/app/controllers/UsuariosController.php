<?php namespace Ajuste;

use \Validator as Validator;

class UsuariosController extends \BaseController
{
	/**
	 * Despliega la coleccion de usuarios.
	 *
	 * @return Response
	 */
	public function index()
	{
		return Usuario::all();
	}

	/**
	 * Crea una instacia de usuario y la almacena.
	 *
	 * @return Response
	 */
	public function store()
	{
		$validator = Validator::make($data = Input::all(), Usuario::$rules);

		if ($validator->fails())
		{
			App::abort(500, 'List was not updated');
		}

		$usuario = Usuario::create($data);

		return Response::json($usuario->toArray(), 201);
	}

	/**
	 * Despliega la informacion de un(a) usuario especifico(a).
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{
		return Usuario::findOrFail($id);
	}

	/**
	 * Actualiza la informacion de un(a) usuario especifico(a)
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function update($id)
	{
		$usuario = Usuario::findOrFail($id);

		$validator = Validator::make($data = Input::all(), Usuario::$rules);

		if ($validator->fails())
		{
			App::abort(500, 'List was not updated');
		}

		$usuario->update($data);

		return Response::json($usuario->toArray());
	}

	/**
	 * Elimina un(a) usuario de la base de datos.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		Usuario::destroy($id);

		return Response::make(null, 204);
	}
}
