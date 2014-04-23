<?php

class RolsController extends \BaseController {

	/**
	 * Display a listing of rols
	 *
	 * @return Response
	 */
	public function index()
	{
		$rols = Rol::all();

		return View::make('rols.index', compact('rols'));
	}

	/**
	 * Show the form for creating a new rol
	 *
	 * @return Response
	 */
	public function create()
	{
		return View::make('rols.create');
	}

	/**
	 * Store a newly created rol in storage.
	 *
	 * @return Response
	 */
	public function store()
	{
		$validator = Validator::make($data = Input::all(), Rol::$rules);

		if ($validator->fails())
		{
			return Redirect::back()->withErrors($validator)->withInput();
		}

		Rol::create($data);

		return Redirect::route('rols.index');
	}

	/**
	 * Display the specified rol.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{
		$rol = Rol::findOrFail($id);

		return View::make('rols.show', compact('rol'));
	}

	/**
	 * Show the form for editing the specified rol.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function edit($id)
	{
		$rol = Rol::find($id);

		return View::make('rols.edit', compact('rol'));
	}

	/**
	 * Update the specified resource in storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function update($id)
	{
		$rol = Rol::findOrFail($id);

		$validator = Validator::make($data = Input::all(), Rol::$rules);

		if ($validator->fails())
		{
			return Redirect::back()->withErrors($validator)->withInput();
		}

		$rol->update($data);

		return Redirect::route('rols.index');
	}

	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		Rol::destroy($id);

		return Redirect::route('rols.index');
	}

}