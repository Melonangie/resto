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
     * Reglas de validacion.
     *
     * @var array
     */
    public static $rules = [
        'departamento' => 'required|alpha|between:3,50|unique',
        'descripcion' => 'required|min:6'
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
     * Relacion Departamento - Empleado.
     *
     * @return Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function empleado()
    {
        return $this->hasMany('Empleado');
    }
}
