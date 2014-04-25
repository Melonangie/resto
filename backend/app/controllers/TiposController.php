<?php

class TiposController extends BaseController
{
    /**
     * Display a listing of tipos
     *
     * @return Response
     */
    public function index()
    {
        $tipos = Tipo::all();

        return View::make('tipos.index', compact('tipos'));
    }

    /**
     * Show the form for creating a new tipo
     *
     * @return Response
     */
    public function create()
    {
        return View::make('tipos.create');
    }

    /**
     * Store a newly created company in tipo.
     *
     * @return Response
     */
    public function store()
    {
        $validator = Validator::make($data = Input::all(), Tipo::$rules);

        if ($validator->fails()) {
            return Redirect::back()->withErrors($validator)->withInput();
        }

        Tipo::create($data);

        return Redirect::route('tipos.index');
    }

    /**
     * Display the specified tipo.
     *
     * @param  int      $id
     * @return Response
     */
    public function show($id)
    {
        $tipo = Tipo::findOrFail($id);

        return View::make('tipos.show', compact('tipo'));
    }

    /**
     * Show the form for editing the specified tipo.
     *
     * @param  int      $id
     * @return Response
     */
    public function edit($id)
    {
        $tipo = Tipo::find($id);

        return View::make('tipos.edit', compact('tipo'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  int      $id
     * @return Response
     */
    public function update($id)
    {
        $tipo = Tipo::findOrFail($id);

        $validator = Validator::make($data = Input::all(), Tipo::$rules);

        if ($validator->fails()) {
            return Redirect::back()->withErrors($validator)->withInput();
        }

        Tipo::create($data);

        return Redirect::route('tipos.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int      $id
     * @return Response
     */
    public function destroy($id)
    {
        Tipo::destroy($id);

        return Redirect::route('tipos.index');
    }
}
