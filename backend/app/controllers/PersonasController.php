<?php

class PersonasController extends \BaseController
{
    /**
     * Despliega todos los personas.
     *
     * @return Respuesta
     */
    public function index()
    {
        return Persona::all();
    }

    /**
     * Almacena un nuevo persona en la base de datos.
     *
     * @return Respuesta
     */
    public function store()
    {
        $validator = Validator::make($data = Input::all(), Persona::$rules);

        if ($validator->fails()) {
            return Response::json(array(
                'error' => 'error de validacion',
                'mensajes' => $validator->messages()->all(),
            ), 400);
        }

        $persona = Persona::create($data);

        return Response::json($persona->toArray(), 201);
    }

    /**
     * Despliega el persona especificado.
     *
     * @param  int       $id
     * @return Respuesta
     */
    public function show($id)
    {
        return Persona::findOrFail($id);
    }

    /**
     * Actualiza el persona especificado en la base de datos.
     *
     * @param  int       $id
     * @return Respuesta
     */
    public function update($id)
    {
        $persona = Persona::findOrFail($id);

        $validator = Validator::make($data = Input::all(), Persona::$rules);

        if ($validator->fails()) {
            return Response::json(array(
                'error' => 'error de validacion',
                'mensajes' => $validator->messages()->all(),
            ), 400);
        }

        $persona->update($data);

        return Response::json($persona->toArray());
    }

    /**
     * Elimina el persona especificado de la base de datos.
     *
     * @param  int       $id
     * @return Respuesta
     */
    public function destroy($id)
    {
        Persona::destroy($id);

        return Response::make(null, 204);
    }
}
