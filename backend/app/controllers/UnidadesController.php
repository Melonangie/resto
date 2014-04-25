<?php

class UnidadesController extends BaseController
{
    /**
     * Display a listing of unidads
     *
     * @return Response
     */
    public function index()
    {
        $unidades = Unidad::all();

        return View::make('unidades.index', compact('unidades'));
    }

    /**
     * Show the form for creating a new unidad
     *
     * @return Response
     */
    public function create()
    {
        return View::make('unidades.create');
    }

    /**
     * Store a newly created company in unidad.
     *
     * @return Response
     */
    public function store()
    {
        $validator = Validator::make($data = Input::all(), Unidad::$rules);

        if ($validator->fails()) {
            return Redirect::back()->withErrors($validator)->withInput();
        }

        Unidad::create($data);

        return Redirect::route('unidades.index');
    }

    /**
     * Display the specified unidad.
     *
     * @param  int      $id
     * @return Response
     */
    public function show($id)
    {
        $unidad = Unidad::findOrFail($id);

        return View::make('unidades.show', compact('unidad'));
    }

    /**
     * Show the form for editing the specified unidad.
     *
     * @param  int      $id
     * @return Response
     */
    public function edit($id)
    {
        $unidad = Unidad::find($id);

        return View::make('unidades.edit', compact('unidad'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  int      $id
     * @return Response
     */
    public function update($id)
    {
        $unidad = Unidad::findOrFail($id);

        $validator = Validator::make($data = Input::all(), Unidad::$rules);

        if ($validator->fails()) {
            return Redirect::back()->withErrors($validator)->withInput();
        }

        Unidad::create($data);

        return Redirect::route('unidades.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int      $id
     * @return Response
     */
    public function destroy($id)
    {
        Unidad::destroy($id);

        return Redirect::route('unidades.index');
    }
}
