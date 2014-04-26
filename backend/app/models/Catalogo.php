<?php

class Catalogo extends Eloquent
{
    /**
     * La tabla de la base de datos usada por el modelo.
     *
     * @var string
     */
    protected $table = 'catalogos';

    /**
     * Sin usar tiempo.
     *
     * @var boolean
     */
    public $timestamps = false;

    /**
     * Reglas de validacion.
     *
     * @var array
     */
    public static $rules = [
        'nombre' => 'required|alpha|between:3,50|unique:catalogos,nombre',
        'abreviacion' => 'required|alpha|size:3|unique:catalogos,abreviacion',
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
        'descripcion'
    ];

    /**
     * Relacion Catologo - Articulos.
     *
     * @return Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function articulos()
    {
        return $this->hasMany('Articulo');
    }
}
