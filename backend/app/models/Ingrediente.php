<?php

class Ingrediente extends Eloquent
{
    /**
     * La tabla de la base de datos usada por el modelo.
     *
     * @var string
     */
    protected $table = 'ingredientes';

    /**
     * Reglas de validacion.
     *
     * @var array
     */
    public static $rules = [
        'receta_nombre' => 'required|exists:recetas,nombre',
        'articulo_nombre' => 'required|exists:articulos,nombre',
        'cantidad' => 'required|regex:/[\d]{1,4}.[\d]{1,2}/',
    ];

    /**
     * Los atributos que son asignable en masa.
     *
     * @var array
     */
    protected $fillable = [
        'receta_nombre',
        'articulo_nombre',
        'cantidad'
    ];
}
