<?php

class RecetasController extends \BaseController
{
    /**
     * Despliega todos los recetas.
     *
     * @return Respuesta
     */
    public function index()
    {
        return Receta::all();
    }

    /**
     * Almacena un nuevo receta en la base de datos.
     *
     * @return Respuesta
     */
    public function store()
    {
        $validator = Validator::make($data = Input::all(), Receta::$rules);

        if ($validator->fails()) {
            return Response::json(array(
                'error' => 'error de validacion',
                'mensajes' => $validator->messages()->all(),
            ), 400);
        }

        $receta = Receta::create($data);

        return Response::json($receta->toArray(), 201);
    }

    /**
     * Despliega el receta especificado.
     *
     * @param  int       $id
     * @return Respuesta
     */
    public function show($id)
    {
        return Receta::findOrFail($id);
    }

    /**
     * Actualiza el receta especificado en la base de datos.
     *
     * @param  int       $id
     * @return Respuesta
     */
    public function update($id)
    {
        $receta = Receta::findOrFail($id);

        $validator = Validator::make($data = Input::all(), Receta::$rules);

        if ($validator->fails()) {
            return Response::json(array(
                'error' => 'error de validacion',
                'mensajes' => $validator->messages()->all(),
            ), 400);
        }

        $receta->update($data);

        return Response::json($receta->toArray());
    }

    /**
     * Elimina el receta especificado de la base de datos.
     *
     * @param  int       $id
     * @return Respuesta
     */
    public function destroy($id)
    {
        Receta::destroy($id);

        return Response::make(null, 204);
    }
}
