<?php

class CatalogosController extends \BaseController
{
    /**
     * Despliega todos los catalogos.
     *
     * @return Respuesta
     */
    public function index()
    {
        return Catalogo::all();
    }

    /**
     * Almacena un nuevo catalogo en la base de datos.
     *
     * @return Respuesta
     */
    public function store()
    {
        $validator = Validator::make($data = Input::all(), Catalogo::$rules);

        if ($validator->fails()) {
            return Response::json(array(
                'error' => 'error de validacion',
                'mensajes' => $validator->messages()->all(),
            ), 400);
        }

        $catalogo = Catalogo::create($data);

        return Response::json($catalogo->toArray(), 201);
    }

    /**
     * Despliega el catalogo especificado.
     *
     * @param  int       $id
     * @return Respuesta
     */
    public function show($id)
    {
        return Catalogo::findOrFail($id);
    }

    /**
     * Actualiza el catalogo especificado en la base de datos.
     *
     * @param  int       $id
     * @return Respuesta
     */
    public function update($id)
    {
        $catalogo = Catalogo::findOrFail($id);

        $validator = Validator::make($data = Input::all(), Catalogo::$rules);

        if ($validator->fails()) {
            return Response::json(array(
                'error' => 'error de validacion',
                'mensajes' => $validator->messages()->all(),
            ), 400);
        }

        $catalogo->update($data);

        return Response::json($catalogo->toArray());
    }

    /**
     * Elimina el catalogo especificado de la base de datos.
     *
     * @param  int       $id
     * @return Respuesta
     */
    public function destroy($id)
    {
        Catalogo::destroy($id);

        return Response::make(null, 204);
    }
}
