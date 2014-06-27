<?php namespace Ajustes;

use Ajustes\Usuario;

class UsuariosController extends \BaseController
{
	/**
	 * Despliega la coleccion de usuarios
	 *
	 * @return Respuesta JSON
	 */
	public function index()
	{
		return Usuario::all();
	}

	/**
	 * Almacena una nueva instacia de usuario.
	 *
	 * @return Respuesta JSON
	 */
	public function store()
	{
		$usuario = new Usuario(Input::all());
		$usuario->validate();

		if (!$usuario->save())
		{
			App::abort(500, 'El usuario no fue creado.');
		}

		return Response::json($usuario->toArray(), 201);
	}

	/**
	 * Despliega la informacion de un(a) usuario.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{
		return Usuario::findOrFail($id);
	}

	/**
	 * Actualiza un(a) usuario en la base de datos.
	 *
	 * @param  int  $id
	 * @return Respuesta JSON
	 */
	public function update($id)
	{
		$usuario = Usuario::findOrFail($id);
		$usuario->fill(Input::all());
		$usuario->validate();

		if (!$usuario->save())
		{
			App::abort(500, 'El usuario no fue actualizado.');
		}

		return Response::json($usuario->toArray());
	}

	/**
	 * Elimina un(a) usuario de la base de datos.
	 *
	 * @param  int  $id
	 * @return Respuesta JSON
	 */
	public function destroy($id)
	{
		$usuario = Usuario::findOrFail($id);
		$usuario->delete();

		return Response::json($usuario->toArray(), 204);
	}
}
