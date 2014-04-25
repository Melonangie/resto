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
        'modulo' => 'required|alpha_num|between:6,60',
        'uri' => 'alpha_dash',
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
