<?php

class EmpleadosController extends BaseController
{
    /**
     * Display a listing of empleados
     *
     * @return Response
     */
    public function index()
    {
        $empleados = Empleado::all();

        return View::make('empleados.index', compact('empleados'));
    }

    /**
     * Show the form for creating a new empleado
     *
     * @return Response
     */
    public function create()
    {
        return View::make('empleados.create');
    }

    /**
     * Store a newly created company in empleado.
     *
     * @return Response
     */
    public function store()
    {
        $validator = Validator::make($data = Input::all(), Empleado::$rules);

        if ($validator->fails()) {
            return Redirect::back()->withErrors($validator)->withInput();
        }

        Empleado::create($data);

        return Redirect::route('empleados.index');
    }

    /**
     * Display the specified empleado.
     *
     * @param  int      $id
     * @return Response
     */
    public function show($id)
    {
        $empleado = Empleado::findOrFail($id);

        return View::make('empleados.show', compact('empleado'));
    }

    /**
     * Show the form for editing the specified empleado.
     *
     * @param  int      $id
     * @return Response
     */
    public function edit($id)
    {
        $empleado = Empleado::find($id);

        return View::make('empleados.edit', compact('empleado'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  int      $id
     * @return Response
     */
    public function update($id)
    {
        $empleado = Empleado::findOrFail($id);

        $validator = Validator::make($data = Input::all(), Empleado::$rules);

        if ($validator->fails()) {
            return Redirect::back()->withErrors($validator)->withInput();
        }

        Empleado::create($data);

        return Redirect::route('empleados.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int      $id
     * @return Response
     */
    public function destroy($id)
    {
        Empleado::destroy($id);

        return Redirect::route('empleados.index');
    }
}
