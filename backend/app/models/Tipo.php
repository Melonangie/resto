<?php

class Tipo extends Eloquent
{
    /**
     * La tabla de la base de datos usada por el modelo.
     *
     * @var string
     */
    protected $table = 'tipos';

    /**
     * Sin usar tiempo.
     *
     * @var boolean
     */
    public $timestamps = false;

    /**
     * Add your validation rules here.
     *
     * @var array
     */
    public static $rules = [
        'nombre' => 'required|alpha|between:3,50|unique:tipos,nombre',
        'abreviacion' => 'required|alpha|size:3|unique:tipos,abreviacion',
        'descripcion' => 'alpha_dash',
    ];

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'nombre',
        'abreviacion',
        'descripcion'
    ];

    /**
     * Relacion Tipo - Articulos.
     *
     * @return Illuminate\Database\Eloquent\Relations\HasOne
     */
    public function articulos()
    {
        return $this->hasMany('Articulo');
    }
}
