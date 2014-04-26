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
        'nombre' => 'required|alpha|between:3,50|unique:roles,nombre',
        'descripcion' => 'alpha_dash'
    ];

    /**
     * Los atributos que son asignable en masa.
     *
     * @var array
     */
    protected $fillable = [
        'nombre',
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

    /**
     * Relacion Rol - Modulo.
     *
     * @return Illuminate\Database\Eloquent\Relations\BelongsToMany
     */
    public function modulo()
    {
        return $this->belongsToMany('Modulo');
    }
}
