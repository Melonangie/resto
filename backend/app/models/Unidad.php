<?php

class Unidad extends Eloquent
{
    /**
     * La tabla de la base de datos usada por el modelo.
     *
     * @var string
     */
    protected $table = 'unidades';

    /**
     * Reglas de validacion.
     *
     * @var array
     */
    public static $rules = [
        'nombre' => 'required|alpha_dash|between:2,30|unique:unidades,nombre',
        'abreviacion' => 'required|alpha|max:5|unique:unidades,medida',
        'descripcion' => 'alpha_dash',
    ];

    /**
     * Los atributos que son asignable en masa.
     *
     * @var array
     */
    protected $fillable = [
        'nombre',
        'abreviacion',
        'equivalencia',
        'descripcion'
    ];

    /**
     * Relacion Unidad - Articulos.
     *
     * @return Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function articulos()
    {
        return $this->hasMany('Articulo');
    }
}
