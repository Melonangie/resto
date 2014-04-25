<?php

class PersonasController extends BaseController
{
    /**
     * Display a listing of personas
     *
     * @return Response
     */
    public function index()
    {
        $personas = Persona::all();

        return View::make('personas.index', compact('personas'));
    }

    /**
     * Show the form for creating a new persona
     *
     * @return Response
     */
    public function create()
    {
        return View::make('personas.create');
    }

    /**
     * Store a newly created company in persona.
     *
     * @return Response
     */
    public function store()
    {
        $validator = Validator::make($data = Input::all(), Persona::$rules);

        if ($validator->fails()) {
            return Redirect::back()->withErrors($validator)->withInput();
        }

        Persona::create($data);

        return Redirect::route('personas.index');
    }

    /**
     * Display the specified persona.
     *
     * @param  int      $id
     * @return Response
     */
    public function show($id)
    {
        $persona = Persona::findOrFail($id);

        return View::make('personas.show', compact('persona'));
    }

    /**
     * Show the form for editing the specified persona.
     *
     * @param  int      $id
     * @return Response
     */
    public function edit($id)
    {
        $persona = Persona::find($id);

        return View::make('personas.edit', compact('persona'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  int      $id
     * @return Response
     */
    public function update($id)
    {
        $persona = Persona::findOrFail($id);

        $validator = Validator::make($data = Input::all(), Persona::$rules);

        if ($validator->fails()) {
            return Redirect::back()->withErrors($validator)->withInput();
        }

        Persona::create($data);

        return Redirect::route('personas.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int      $id
     * @return Response
     */
    public function destroy($id)
    {
        Persona::destroy($id);

        return Redirect::route('personas.index');
    }
}
