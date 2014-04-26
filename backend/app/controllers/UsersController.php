<?php

class UsersController extends \BaseController
{
    /**
     * Despliega todos los users.
     *
     * @return Respuesta
     */
    public function index()
    {
        return User::all();
    }

    /**
     * Almacena un nuevo user en la base de datos.
     *
     * @return Respuesta
     */
    public function store()
    {
        $validator = Validator::make($data = Input::all(), User::$rules);

        if ($validator->fails()) {
            return Response::json(array(
                'error' => 'error de validacion',
                'mensajes' => $validator->messages()->all(),
            ), 400);
        }

        $user = User::create($data);

        return Response::json($user->toArray(), 201);
    }

    /**
     * Despliega el user especificado.
     *
     * @param  int       $id
     * @return Respuesta
     */
    public function show($id)
    {
        return User::findOrFail($id);
    }

    /**
     * Actualiza el user especificado en la base de datos.
     *
     * @param  int       $id
     * @return Respuesta
     */
    public function update($id)
    {
        $user = User::findOrFail($id);

        $validator = Validator::make($data = Input::all(), User::$rules);

        if ($validator->fails()) {
            return Response::json(array(
                'error' => 'error de validacion',
                'mensajes' => $validator->messages()->all(),
            ), 400);
        }

        $user->update($data);

        return Response::json($user->toArray());
    }

    /**
     * Elimina el user especificado de la base de datos.
     *
     * @param  int       $id
     * @return Respuesta
     */
    public function destroy($id)
    {
        User::destroy($id);

        return Response::make(null, 204);
    }
}
