<?php

class EmpresasController extends \BaseController
{
    /**
     * Despliega todos los empresas.
     *
     * @return Respuesta
     */
    public function index()
    {
        return Empresa::all();
    }

    /**
     * Almacena un nuevo empresa en la base de datos.
     *
     * @return Respuesta
     */
    public function store()
    {
        $validator = Validator::make($data = Input::all(), Empresa::$rules);

        if ($validator->fails()) {
            return Response::json(array(
                'error' => 'error de validacion',
                'mensajes' => $validator->messages()->all(),
            ), 400);
        }

        $empresa = Empresa::create($data);

        return Response::json($empresa->toArray(), 201);
    }

    /**
     * Despliega el empresa especificado.
     *
     * @param  int       $id
     * @return Respuesta
     */
    public function show($id)
    {
        return Empresa::findOrFail($id);
    }

    /**
     * Actualiza el empresa especificado en la base de datos.
     *
     * @param  int       $id
     * @return Respuesta
     */
    public function update($id)
    {
        $empresa = Empresa::findOrFail($id);

        $validator = Validator::make($data = Input::all(), Empresa::$rules);

        if ($validator->fails()) {
            return Response::json(array(
                'error' => 'error de validacion',
                'mensajes' => $validator->messages()->all(),
            ), 400);
        }

        $empresa->update($data);

        return Response::json($empresa->toArray());
    }

    /**
     * Elimina el empresa especificado de la base de datos.
     *
     * @param  int       $id
     * @return Respuesta
     */
    public function destroy($id)
    {
        Empresa::destroy($id);

        return Response::make(null, 204);
    }
}
