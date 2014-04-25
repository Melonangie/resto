<?php

class Rol extends Eloquent
{
    /**
     * La tabla de la base de datos usada por el modelo.
     *
     * @var string
     */
    protected $table = 'roles';

    /**
     * Reglas de validacion.
     *
     * @var array
     */
    public static $rules = [
        'rol' => 'required|alpha|between:3,50|unique',
        'descripcion' => 'alpha_num'
    ];

    /**
     * Los atributos que son asignable en masa.
     *
     * @var array
     */
    protected $fillable = [
        'departamento',
        'descripcion'
    ];

    /**
     * Relacion Rol - Usuario.
     *
     * @return Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function usuario()
    {
        return $this->hasMany('User');
    }
}
