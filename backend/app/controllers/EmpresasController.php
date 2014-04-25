<?php

class EmpresasController extends BaseController
{
    /**
     * Display a listing of empresas
     *
     * @return Response
     */
    public function index()
    {
        $empresas = Empresa::all();

        return View::make('empresas.index', compact('empresas'));
    }

    /**
     * Show the form for creating a new empresa
     *
     * @return Response
     */
    public function create()
    {
        return View::make('empresas.create');
    }

    /**
     * Store a newly created company in empresa.
     *
     * @return Response
     */
    public function store()
    {
        $validator = Validator::make($data = Input::all(), Empresa::$rules);

        if ($validator->fails()) {
            return Redirect::back()->withErrors($validator)->withInput();
        }

        Empresa::create($data);

        return Redirect::route('empresas.index');
    }

    /**
     * Display the specified empresa.
     *
     * @param  int      $id
     * @return Response
     */
    public function show($id)
    {
        $empresa = Empresa::findOrFail($id);

        return View::make('empresas.show', compact('empresa'));
    }

    /**
     * Show the form for editing the specified empresa.
     *
     * @param  int      $id
     * @return Response
     */
    public function edit($id)
    {
        $empresa = Empresa::find($id);

        return View::make('empresas.edit', compact('empresa'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  int      $id
     * @return Response
     */
    public function update($id)
    {
        $empresa = Empresa::findOrFail($id);

        $validator = Validator::make($data = Input::all(), Empresa::$rules);

        if ($validator->fails()) {
            return Redirect::back()->withErrors($validator)->withInput();
        }

        Empresa::create($data);

        return Redirect::route('empresas.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int      $id
     * @return Response
     */
    public function destroy($id)
    {
        Empresa::destroy($id);

        return Redirect::route('empresas.index');
    }
}
