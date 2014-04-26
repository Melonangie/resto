<?php

class ArticulosController extends BaseController
{
    /**
     * Despliega todos los articulos.
     *
     * @return Respuesta
     */
    public function index()
    {
        return Articulo::all();
    }

    /**
     * Almacena un nuevo articulo en la base de datos.
     *
     * @return Respuesta
     */
    public function store()
    {
        $validator = Validator::make($data = Input::all(), Articulo::$rules);

        if ($validator->fails()) {
            return Response::json(array(
                'error' => 'error de validacion',
                'mensajes' => $validator->messages()->all(),
            ), 400);
        }

        $articulo = Articulo::create($data);

        return Response::json($articulo->toArray(), 201);
    }

    /**
     * Despliega el articulo especificado.
     *
     * @param  int       $id
     * @return Respuesta
     */
    public function show($id)
    {
        return Articulo::findOrFail($id);
    }

    /**
     * Actualiza el articulo especificado en la base de datos.
     *
     * @param  int       $id
     * @return Respuesta
     */
    public function update($id)
    {
        $articulo = Articulo::findOrFail($id);

        $validator = Validator::make($data = Input::all(), Articulo::$rules);

        if ($validator->fails()) {
            return Response::json(array(
                'error' => 'error de validacion',
                'mensajes' => $validator->messages()->all(),
            ), 400);
        }

        $articulo->update($data);

        return Response::json($articulo->toArray());
    }

    /**
     * Elimina el articulo especificado de la base de datos.
     *
     * @param  int       $id
     * @return Respuesta
     */
    public function destroy($id)
    {
        Articulo::destroy($id);

        return Response::make(null, 204);
    }
}
