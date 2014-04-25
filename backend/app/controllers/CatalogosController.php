<?php

class CatalogosController extends BaseController
{
    /**
     * Display a listing of catalogos
     *
     * @return Response
     */
    public function index()
    {
        $catalogos = Catalogo::all();

        return View::make('catalogos.index', compact('catalogos'));
    }

    /**
     * Show the form for creating a new catalogo
     *
     * @return Response
     */
    public function create()
    {
        return View::make('catalogos.create');
    }

    /**
     * Store a newly created company in catalogo.
     *
     * @return Response
     */
    public function store()
    {
        $validator = Validator::make($data = Input::all(), Catalogo::$rules);

        if ($validator->fails()) {
            return Redirect::back()->withErrors($validator)->withInput();
        }

        Catalogo::create($data);

        return Redirect::route('catalogos.index');
    }

    /**
     * Display the specified catalogo.
     *
     * @param  int      $id
     * @return Response
     */
    public function show($id)
    {
        $catalogo = Catalogo::findOrFail($id);

        return View::make('catalogos.show', compact('catalogo'));
    }

    /**
     * Show the form for editing the specified catalogo.
     *
     * @param  int      $id
     * @return Response
     */
    public function edit($id)
    {
        $catalogo = Catalogo::find($id);

        return View::make('catalogos.edit', compact('catalogo'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  int      $id
     * @return Response
     */
    public function update($id)
    {
        $catalogo = Catalogo::findOrFail($id);

        $validator = Validator::make($data = Input::all(), Catalogo::$rules);

        if ($validator->fails()) {
            return Redirect::back()->withErrors($validator)->withInput();
        }

        Catalogo::create($data);

        return Redirect::route('catalogos.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int      $id
     * @return Response
     */
    public function destroy($id)
    {
        Catalogo::destroy($id);

        return Redirect::route('catalogos.index');
    }
}
