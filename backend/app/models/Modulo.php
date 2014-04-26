<?php

class Modulo extends Eloquent
{
    /**
     * La tabla de la base de datos usada por el modelo.
     *
     * @var string
     */
    protected $table = 'modulos';

    /**
     * Add your validation rules here.
     *
     * @var array
     */
    public static $rules = [
        'nombre' => 'required|alpha|between:4,60|unique:modulos,nombre',
        'uri' => 'alpha_dash|unique:modulos,uri',
    ];

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $guarded = array('*');

    /**
     * Relacion Modulo - Roles.
     *
     * @return Illuminate\Database\Eloquent\Relations\BelongsToMany
     */
    public function roles()
    {
        return $this->belongsToMany('Rol');
    }
}
