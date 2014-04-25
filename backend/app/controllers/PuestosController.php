<?php

class PuestosController extends BaseController
{
    /**
     * Display a listing of puestos
     *
     * @return Response
     */
    public function index()
    {
        $puestos = Puesto::all();

        return View::make('puestos.index', compact('puestos'));
    }

    /**
     * Show the form for creating a new puesto
     *
     * @return Response
     */
    public function create()
    {
        return View::make('puestos.create');
    }

    /**
     * Store a newly created company in puesto.
     *
     * @return Response
     */
    public function store()
    {
        $validator = Validator::make($data = Input::all(), Puesto::$rules);

        if ($validator->fails()) {
            return Redirect::back()->withErrors($validator)->withInput();
        }

        Puesto::create($data);

        return Redirect::route('puestos.index');
    }

    /**
     * Display the specified puesto.
     *
     * @param  int      $id
     * @return Response
     */
    public function show($id)
    {
        $puesto = Puesto::findOrFail($id);

        return View::make('puestos.show', compact('puesto'));
    }

    /**
     * Show the form for editing the specified puesto.
     *
     * @param  int      $id
     * @return Response
     */
    public function edit($id)
    {
        $puesto = Puesto::find($id);

        return View::make('puestos.edit', compact('puesto'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  int      $id
     * @return Response
     */
    public function update($id)
    {
        $puesto = Puesto::findOrFail($id);

        $validator = Validator::make($data = Input::all(), Puesto::$rules);

        if ($validator->fails()) {
            return Redirect::back()->withErrors($validator)->withInput();
        }

        Puesto::create($data);

        return Redirect::route('puestos.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int      $id
     * @return Response
     */
    public function destroy($id)
    {
        Puesto::destroy($id);

        return Redirect::route('puestos.index');
    }
}
