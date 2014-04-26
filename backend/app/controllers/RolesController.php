<?php

class RolesController extends \BaseController
{
    /**
     * Despliega todos los rols.
     *
     * @return Respuesta
     */
    public function index()
    {
        return Rol::all();
    }

    /**
     * Almacena un nuevo rol en la base de datos.
     *
     * @return Respuesta
     */
    public function store()
    {
        $validator = Validator::make($data = Input::all(), Rol::$rules);

        if ($validator->fails()) {
            return Response::json(array(
                'error' => 'error de validacion',
                'mensajes' => $validator->messages()->all(),
            ), 400);
        }

        $rol = Rol::create($data);

        return Response::json($rol->toArray(), 201);
    }

    /**
     * Despliega el rol especificado.
     *
     * @param  int       $id
     * @return Respuesta
     */
    public function show($id)
    {
        return Rol::findOrFail($id);
    }

    /**
     * Actualiza el rol especificado en la base de datos.
     *
     * @param  int       $id
     * @return Respuesta
     */
    public function update($id)
    {
        $rol = Rol::findOrFail($id);

        $validator = Validator::make($data = Input::all(), Rol::$rules);

        if ($validator->fails()) {
            return Response::json(array(
                'error' => 'error de validacion',
                'mensajes' => $validator->messages()->all(),
            ), 400);
        }

        $rol->update($data);

        return Response::json($rol->toArray());
    }

    /**
     * Elimina el rol especificado de la base de datos.
     *
     * @param  int       $id
     * @return Respuesta
     */
    public function destroy($id)
    {
        Rol::destroy($id);

        return Response::make(null, 204);
    }
}
