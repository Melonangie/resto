<?php

class IngredientesController extends \BaseController
{
    /**
     * Despliega todos los ingredientes.
     *
     * @return Respuesta
     */
    public function index()
    {
        return Ingrediente::all();
    }

    /**
     * Almacena un nuevo ingrediente en la base de datos.
     *
     * @return Respuesta
     */
    public function store()
    {
        $validator = Validator::make($data = Input::all(), Ingrediente::$rules);

        if ($validator->fails()) {
            return Response::json(array(
                'error' => 'error de validacion',
                'mensajes' => $validator->messages()->all(),
            ), 400);
        }

        $ingrediente = Ingrediente::create($data);

        return Response::json($ingrediente->toArray(), 201);
    }

    /**
     * Despliega el ingrediente especificado.
     *
     * @param  int       $id
     * @return Respuesta
     */
    public function show($id)
    {
        return Ingrediente::findOrFail($id);
    }

    /**
     * Actualiza el ingrediente especificado en la base de datos.
     *
     * @param  int       $id
     * @return Respuesta
     */
    public function update($id)
    {
        $ingrediente = Ingrediente::findOrFail($id);

        $validator = Validator::make($data = Input::all(), Ingrediente::$rules);

        if ($validator->fails()) {
            return Response::json(array(
                'error' => 'error de validacion',
                'mensajes' => $validator->messages()->all(),
            ), 400);
        }

        $ingrediente->update($data);

        return Response::json($ingrediente->toArray());
    }

    /**
     * Elimina el ingrediente especificado de la base de datos.
     *
     * @param  int       $id
     * @return Respuesta
     */
    public function destroy($id)
    {
        Ingrediente::destroy($id);

        return Response::make(null, 204);
    }
}
