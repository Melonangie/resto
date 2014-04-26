<?php

class UnidadesController extends \BaseController
{
    /**
     * Despliega todos los unidads.
     *
     * @return Respuesta
     */
    public function index()
    {
        return Unidad::all();
    }

    /**
     * Almacena un nuevo unidad en la base de datos.
     *
     * @return Respuesta
     */
    public function store()
    {
        $validator = Validator::make($data = Input::all(), Unidad::$rules);

        if ($validator->fails()) {
            return Response::json(array(
                'error' => 'error de validacion',
                'mensajes' => $validator->messages()->all(),
            ), 400);
        }

        $unidad = Unidad::create($data);

        return Response::json($unidad->toArray(), 201);
    }

    /**
     * Despliega el unidad especificado.
     *
     * @param  int       $id
     * @return Respuesta
     */
    public function show($id)
    {
        return Unidad::findOrFail($id);
    }

    /**
     * Actualiza el unidad especificado en la base de datos.
     *
     * @param  int       $id
     * @return Respuesta
     */
    public function update($id)
    {
        $unidad = Unidad::findOrFail($id);

        $validator = Validator::make($data = Input::all(), Unidad::$rules);

        if ($validator->fails()) {
            return Response::json(array(
                'error' => 'error de validacion',
                'mensajes' => $validator->messages()->all(),
            ), 400);
        }

        $unidad->update($data);

        return Response::json($unidad->toArray());
    }

    /**
     * Elimina el unidad especificado de la base de datos.
     *
     * @param  int       $id
     * @return Respuesta
     */
    public function destroy($id)
    {
        Unidad::destroy($id);

        return Response::make(null, 204);
    }
}
