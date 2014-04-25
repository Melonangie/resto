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
     * Add your validation rules here.
     *
     * @var array
     */
    public static $rules = [
        'tipo' => 'required|alpha|between:3,50',
        'abreviacion|unique' => 'required|alpha|size:2',
        'descripcion' => 'alpha_num',
    ];

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'tipo',
        'abreviacion',
        'descripcion'
    ];

    /**
     * Relacion Tipo - Articulo.
     *
     * @return Illuminate\Database\Eloquent\Relations\HasOne
     */
    public function articulo()
    {
        return $this->hasOne('Articulo');
    }
}
