<?php

class Receta extends Eloquent
{
    /**
     * La tabla de la base de datos usada por el modelo.
     *
     * @var string
     */
    protected $table = 'recetas';

    /**
     * Reglas de validacion.
     *
     * @var array
     */
    public static $rules = [
        'receta' => 'required|alpha_num|between:6,100',
        'costo' => 'regex:/[\d]{1,4},[\d]{1,2}/',
        'descripcion' => 'alpha_num',
    ];

    /**
     * Los atributos que son asignable en masa.
     *
     * @var array
     */
    protected $fillable = [
        'receta',
        'costo',
        'descripcion'
    ];

    /**
     * Relacion Receta - Articulos.
     *
     * @return Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function articulos()
    {
        return $this->belongsToMany('Articulo');
    }
}
