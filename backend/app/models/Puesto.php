<?php

class Puesto extends Eloquent
{
    /**
     * La tabla de la base de datos usada por el modelo.
     *
     * @var string
     */
    protected $table = 'articulos';

    /**
     * Reglas de validacion.
     *
     * @var array
     */
    public static $rules = [
        'puesto' => 'required|alpha|between:3,50|unique',
        'descripcion' => 'alpha_num',
    ];

    /**
     * Los atributos que son asignable en masa.
     *
     * @var array
     */
    protected $fillable = [
        'puesto',
        'descripcion'
    ];

    /**
     * Relacion Puesto - Empleado.
     *
     * @return Illuminate\Database\Eloquent\Relations\HasOne
     */
    public function empleado()
    {
        return $this->hasOne('Empleado');
    }
}
