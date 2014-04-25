<?php

class Empresa extends Eloquent
{
    /**
     * La tabla de la base de datos usada por el modelo.
     *
     * @var string
     */
    protected $table = 'empresas';

    /**
     * Reglas de validacion.
     *
     * @var array
     */
    public static $rules = [
        'tipo' => 'required|alpha',
        'giro' => 'alpha_num|between:5,60',
        'nombre' => 'required|alpha_num',
        'direccion' => 'required|alpha',
        'ciudad' => 'alpha|between:2,50',
        'estado' => 'alpha|between:2,50',
        'pais' => 'alpha|between:2,50',
        'cp' => 'integer|digits:5',
        'rfc' => 'alpha_num|between:12,60',
        'url' => 'url',
        'logo' => 'alpha_dash',
        'descripcion' => 'alpha_num',
    ];

    /**
     * Los atributos que son asignable en masa.
     *
     * @var array
     */
    protected $fillable = [
        'tipo',
        'giro',
        'nombre',
        'direccion',
        'ciudad',
        'estado',
        'pais',
        'cp',
        'rfc',
        'url',
        'logo',
        'descripcion'
    ];

    /**
     * Relacion Empresa - Empleados.
     *
     * @return Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function empleados()
    {
        return $this->belongsTo('Empleado');
    }
}
