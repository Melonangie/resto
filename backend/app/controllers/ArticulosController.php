<?php

class ArticulosController extends BaseController
{
    /**
     * Display a listing of articulos
     *
     * @return Response
     */
    public function index()
    {
        $articulos = Articulo::all();

        return View::make('articulos.index', compact('articulos'));
    }

    /**
     * Show the form for creating a new articulo
     *
     * @return Response
     */
    public function create()
    {
        return View::make('articulos.create');
    }

    /**
     * Store a newly created company in articulo.
     *
     * @return Response
     */
    public function store()
    {
        $validator = Validator::make($data = Input::all(), Articulo::$rules);

        if ($validator->fails()) {
            return Redirect::back()->withErrors($validator)->withInput();
        }

        Articulo::create($data);

        return Redirect::route('articulos.index');
    }

    /**
     * Display the specified articulo.
     *
     * @param  int      $id
     * @return Response
     */
    public function show($id)
    {
        $articulo = Articulo::findOrFail($id);

        return View::make('articulos.show', compact('articulo'));
    }

    /**
     * Show the form for editing the specified articulo.
     *
     * @param  int      $id
     * @return Response
     */
    public function edit($id)
    {
        $articulo = Articulo::find($id);

        return View::make('articulos.edit', compact('articulo'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  int      $id
     * @return Response
     */
    public function update($id)
    {
        $articulo = Articulo::findOrFail($id);

        $validator = Validator::make($data = Input::all(), Articulo::$rules);

        if ($validator->fails()) {
            return Redirect::back()->withErrors($validator)->withInput();
        }

        Articulo::create($data);

        return Redirect::route('articulos.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int      $id
     * @return Response
     */
    public function destroy($id)
    {
        Articulo::destroy($id);

        return Redirect::route('articulos.index');
    }
}
