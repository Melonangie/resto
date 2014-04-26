<?php

class Departamento extends Eloquent
{
    /**
     * La tabla de la base de datos usada por el modelo.
     *
     * @var string
     */
    protected $table = 'departamentos';

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
        'nombre' => 'required|alpha|between:3,50|unique:departamentos,departamento',
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
     * Relacion Departamento - Empleado.
     *
     * @return Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function empleado()
    {
        return $this->hasMany('Empleado');
    }
}
