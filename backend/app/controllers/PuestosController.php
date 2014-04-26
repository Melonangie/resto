<?php

class PuestosController extends \BaseController
{
    /**
     * Despliega todos los puestos.
     *
     * @return Respuesta
     */
    public function index()
    {
        return Puesto::all();
    }

    /**
     * Almacena un nuevo puesto en la base de datos.
     *
     * @return Respuesta
     */
    public function store()
    {
        $validator = Validator::make($data = Input::all(), Puesto::$rules);

        if ($validator->fails()) {
            return Response::json(array(
                'error' => 'error de validacion',
                'mensajes' => $validator->messages()->all(),
            ), 400);
        }

        $puesto = Puesto::create($data);

        return Response::json($puesto->toArray(), 201);
    }

    /**
     * Despliega el puesto especificado.
     *
     * @param  int       $id
     * @return Respuesta
     */
    public function show($id)
    {
        return Puesto::findOrFail($id);
    }

    /**
     * Actualiza el puesto especificado en la base de datos.
     *
     * @param  int       $id
     * @return Respuesta
     */
    public function update($id)
    {
        $puesto = Puesto::findOrFail($id);

        $validator = Validator::make($data = Input::all(), Puesto::$rules);

        if ($validator->fails()) {
            return Response::json(array(
                'error' => 'error de validacion',
                'mensajes' => $validator->messages()->all(),
            ), 400);
        }

        $puesto->update($data);

        return Response::json($puesto->toArray());
    }

    /**
     * Elimina el puesto especificado de la base de datos.
     *
     * @param  int       $id
     * @return Respuesta
     */
    public function destroy($id)
    {
        Puesto::destroy($id);

        return Response::make(null, 204);
    }
}
