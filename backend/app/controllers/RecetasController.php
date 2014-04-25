<?php

class RecetasController extends BaseController
{
    /**
     * Display a listing of recetas
     *
     * @return Response
     */
    public function index()
    {
        $recetas = Receta::all();

        return View::make('recetas.index', compact('recetas'));
    }

    /**
     * Show the form for creating a new receta
     *
     * @return Response
     */
    public function create()
    {
        return View::make('recetas.create');
    }

    /**
     * Store a newly created company in receta.
     *
     * @return Response
     */
    public function store()
    {
        $validator = Validator::make($data = Input::all(), Receta::$rules);

        if ($validator->fails()) {
            return Redirect::back()->withErrors($validator)->withInput();
        }

        Receta::create($data);

        return Redirect::route('recetas.index');
    }

    /**
     * Display the specified receta.
     *
     * @param  int      $id
     * @return Response
     */
    public function show($id)
    {
        $receta = Receta::findOrFail($id);

        return View::make('recetas.show', compact('receta'));
    }

    /**
     * Show the form for editing the specified receta.
     *
     * @param  int      $id
     * @return Response
     */
    public function edit($id)
    {
        $receta = Receta::find($id);

        return View::make('recetas.edit', compact('receta'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  int      $id
     * @return Response
     */
    public function update($id)
    {
        $receta = Receta::findOrFail($id);

        $validator = Validator::make($data = Input::all(), Receta::$rules);

        if ($validator->fails()) {
            return Redirect::back()->withErrors($validator)->withInput();
        }

        Receta::create($data);

        return Redirect::route('recetas.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int      $id
     * @return Response
     */
    public function destroy($id)
    {
        Receta::destroy($id);

        return Redirect::route('recetas.index');
    }
}
