<?php

class IngredientesController extends BaseController
{
    /**
     * Display a listing of ingredientes
     *
     * @return Response
     */
    public function index()
    {
        $ingredientes = Ingrediente::all();

        return View::make('ingredientes.index', compact('ingredientes'));
    }

    /**
     * Show the form for creating a new ingrediente
     *
     * @return Response
     */
    public function create()
    {
        return View::make('ingredientes.create');
    }

    /**
     * Store a newly created company in ingrediente.
     *
     * @return Response
     */
    public function store()
    {
        $validator = Validator::make($data = Input::all(), Ingrediente::$rules);

        if ($validator->fails()) {
            return Redirect::back()->withErrors($validator)->withInput();
        }

        Ingrediente::create($data);

        return Redirect::route('ingredientes.index');
    }

    /**
     * Display the specified ingrediente.
     *
     * @param  int      $id
     * @return Response
     */
    public function show($id)
    {
        $ingrediente = Ingrediente::findOrFail($id);

        return View::make('ingredientes.show', compact('ingrediente'));
    }

    /**
     * Show the form for editing the specified ingrediente.
     *
     * @param  int      $id
     * @return Response
     */
    public function edit($id)
    {
        $ingrediente = Ingrediente::find($id);

        return View::make('ingredientes.edit', compact('ingrediente'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  int      $id
     * @return Response
     */
    public function update($id)
    {
        $ingrediente = Ingrediente::findOrFail($id);

        $validator = Validator::make($data = Input::all(), Ingrediente::$rules);

        if ($validator->fails()) {
            return Redirect::back()->withErrors($validator)->withInput();
        }

        Ingrediente::create($data);

        return Redirect::route('ingredientes.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int      $id
     * @return Response
     */
    public function destroy($id)
    {
        Ingrediente::destroy($id);

        return Redirect::route('ingredientes.index');
    }
}
