<?php

class EmpleadosController extends \BaseController
{
    /**
     * Despliega todos los empleados.
     *
     * @return Respuesta
     */
    public function index()
    {
        return Empleado::all();
    }

    /**
     * Almacena un nuevo empleado en la base de datos.
     *
     * @return Respuesta
     */
    public function store()
    {
        $validator = Validator::make($data = Input::all(), Empleado::$rules);

        if ($validator->fails()) {
            return Response::json(array(
                'error' => 'error de validacion',
                'mensajes' => $validator->messages()->all(),
            ), 400);
        }

        $empleados = Empleado::create($data);

        return Response::json($empleados->toArray(), 201);
    }

    /**
     * Despliega el empleado especificado.
     *
     * @param  int       $id
     * @return Respuesta
     */
    public function show($id)
    {
        return Empleado::findOrFail($id);
    }

    /**
     * Actualiza el empleado especificado en la base de datos.
     *
     * @param  int       $id
     * @return Respuesta
     */
    public function update($id)
    {
        $empleado = Empleado::findOrFail($id);

        $validator = Validator::make($data = Input::all(), Empleado::$rules);

        if ($validator->fails()) {
            return Response::json(array(
                'error' => 'error de validacion',
                'mensajes' => $validator->messages()->all(),
            ), 400);
        }

        $empleado->update($data);

        return Response::json($empleado->toArray());
    }

    /**
     * Elimina el empleado especificado de la base de datos.
     *
     * @param  int       $id
     * @return Respuesta
     */
    public function destroy($id)
    {
        Empleado::destroy($id);

        return Response::make(null, 204);
    }
}
