<?php

class PositionsController extends \BaseController {

	/**
	 * Display a listing of positions
	 *
	 * @return Response
	 */
	public function index()
	{
		$positions = Position::all();

		return View::make('positions.index', compact('positions'));
	}

	/**
	 * Show the form for creating a new position
	 *
	 * @return Response
	 */
	public function create()
	{
		return View::make('positions.create');
	}

	/**
	 * Store a newly created position in storage.
	 *
	 * @return Response
	 */
	public function store()
	{
		$validator = Validator::make($data = Input::all(), Position::$rules);

		if ($validator->fails())
		{
			return Redirect::back()->withErrors($validator)->withInput();
		}

		Position::create($data);

		return Redirect::route('positions.index');
	}

	/**
	 * Display the specified position.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{
		$position = Position::findOrFail($id);

		return View::make('positions.show', compact('position'));
	}

	/**
	 * Show the form for editing the specified position.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function edit($id)
	{
		$position = Position::find($id);

		return View::make('positions.edit', compact('position'));
	}

	/**
	 * Update the specified resource in storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function update($id)
	{
		$position = Position::findOrFail($id);

		$validator = Validator::make($data = Input::all(), Position::$rules);

		if ($validator->fails())
		{
			return Redirect::back()->withErrors($validator)->withInput();
		}

		$position->update($data);

		return Redirect::route('positions.index');
	}

	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		Position::destroy($id);

		return Redirect::route('positions.index');
	}

}