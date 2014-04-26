<?php

class DepartamentosController extends \BaseController
{
    /**
     * Despliega todos los departamentos.
     *
     * @return Respuesta
     */
    public function index()
    {
        return Departamento::all();
    }

    /**
     * Almacena un nuevo departamento en la base de datos.
     *
     * @return Respuesta
     */
    public function store()
    {
        $validator = Validator::make($data = Input::all(), Departamento::$rules);

        if ($validator->fails()) {
            return Response::json(array(
                'error' => 'error de validacion',
                'mensajes' => $validator->messages()->all(),
            ), 400);
        }

        $departamento = Departamento::create($data);

        return Response::json($departamento->toArray(), 201);
    }

    /**
     * Despliega el departamento especificado.
     *
     * @param  int       $id
     * @return Respuesta
     */
    public function show($id)
    {
        return Departamento::findOrFail($id);
    }

    /**
     * Actualiza el departamento especificado en la base de datos.
     *
     * @param  int       $id
     * @return Respuesta
     */
    public function update($id)
    {
        $departamento = Departamento::findOrFail($id);

        $validator = Validator::make($data = Input::all(), Departamento::$rules);

        if ($validator->fails()) {
            return Response::json(array(
                'error' => 'error de validacion',
                'mensajes' => $validator->messages()->all(),
            ), 400);
        }

        $departamento->update($data);

        return Response::json($departamento->toArray());
    }

    /**
     * Elimina el departamento especificado de la base de datos.
     *
     * @param  int       $id
     * @return Respuesta
     */
    public function destroy($id)
    {
        Departamento::destroy($id);

        return Response::make(null, 204);
    }

}
