<?php

class RolesController extends BaseController
{
    /**
     * Display a listing of roles
     *
     * @return Response
     */
    public function index()
    {
        $roles = Rol::all();

        return View::make('roles.index', compact('roles'));
    }

    /**
     * Show the form for creating a new rol
     *
     * @return Response
     */
    public function create()
    {
        return View::make('roles.create');
    }

    /**
     * Store a newly created company in rol.
     *
     * @return Response
     */
    public function store()
    {
        $validator = Validator::make($data = Input::all(), Rol::$rules);

        if ($validator->fails()) {
            return Redirect::back()->withErrors($validator)->withInput();
        }

        Rol::create($data);

        return Redirect::route('roles.index');
    }

    /**
     * Display the specified rol.
     *
     * @param  int      $id
     * @return Response
     */
    public function show($id)
    {
        $rol = Rol::findOrFail($id);

        return View::make('roles.show', compact('rol'));
    }

    /**
     * Show the form for editing the specified rol.
     *
     * @param  int      $id
     * @return Response
     */
    public function edit($id)
    {
        $rol = Rol::find($id);

        return View::make('roles.edit', compact('rol'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  int      $id
     * @return Response
     */
    public function update($id)
    {
        $rol = Rol::findOrFail($id);

        $validator = Validator::make($data = Input::all(), Rol::$rules);

        if ($validator->fails()) {
            return Redirect::back()->withErrors($validator)->withInput();
        }

        Rol::create($data);

        return Redirect::route('roles.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int      $id
     * @return Response
     */
    public function destroy($id)
    {
        Rol::destroy($id);

        return Redirect::route('roles.index');
    }
}
