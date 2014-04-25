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
        'unidad' => 'required|alpha_num|between:1,50|unique',
        'medida' => 'required|alpha|max:5|unique',
        'descripcion' => 'alpha_num',
    ];

    /**
     * Los atributos que son asignable en masa.
     *
     * @var array
     */
    protected $fillable = [
        'unidad',
        'medida',
        'equivalencia',
        'descripcion'
    ];

    /**
     * Relacion Unidad - Articulo.
     *
     * @return Illuminate\Database\Eloquent\Relations\HasOne
     */
    public function articulo()
    {
        return $this->hasOne('Articulo');
    }
}
