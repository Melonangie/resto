<?php

class ModulosController extends \BaseController
{
    /**
     * Despliega todos los modulos.
     *
     * @return Respuesta
     */
    public function index()
    {
        return Modulo::all();
    }

    /**
     * Despliega el modulo especificado.
     *
     * @param  int       $id
     * @return Respuesta
     */
    public function show($id)
    {
        return Modulo::findOrFail($id);
    }
}
