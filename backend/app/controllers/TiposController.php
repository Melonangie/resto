<?php

class TiposController extends \BaseController
{
    /**
     * Despliega todos los tipos.
     *
     * @return Respuesta
     */
    public function index()
    {
        return Tipo::all();
    }

    /**
     * Almacena un nuevo tipo en la base de datos.
     *
     * @return Respuesta
     */
    public function store()
    {
        $validator = Validator::make($data = Input::all(), Tipo::$rules);

        if ($validator->fails()) {
            return Response::json(array(
                'error' => 'error de validacion',
                'mensajes' => $validator->messages()->all(),
            ), 400);
        }

        $tipo = Tipo::create($data);

        return Response::json($tipo->toArray(), 201);
    }

    /**
     * Despliega el tipo especificado.
     *
     * @param  int       $id
     * @return Respuesta
     */
    public function show($id)
    {
        return Tipo::findOrFail($id);
    }

    /**
     * Actualiza el tipo especificado en la base de datos.
     *
     * @param  int       $id
     * @return Respuesta
     */
    public function update($id)
    {
        $tipo = Tipo::findOrFail($id);

        $validator = Validator::make($data = Input::all(), Tipo::$rules);

        if ($validator->fails()) {
            return Response::json(array(
                'error' => 'error de validacion',
                'mensajes' => $validator->messages()->all(),
            ), 400);
        }

        $tipo->update($data);

        return Response::json($tipo->toArray());
    }

    /**
     * Elimina el tipo especificado de la base de datos.
     *
     * @param  int       $id
     * @return Respuesta
     */
    public function destroy($id)
    {
        Tipo::destroy($id);

        return Response::make(null, 204);
    }
}
