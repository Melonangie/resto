<?php

class Puesto extends Eloquent
{
    /**
     * La tabla de la base de datos usada por el modelo.
     *
     * @var string
     */
    protected $table = 'puestos';

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
        'nombre' => 'required|alpha|between:3,50|unique:puestos,nombre',
        'descripcion' => 'alpha_dash',
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
     * Relacion Puesto - Empleado.
     *
     * @return Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function empleados()
    {
        return $this->hasMany('Empleado');
    }
}
