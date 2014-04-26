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
        'nombre' => 'required|alpha_dash|min:5',
        'tipo' => 'required|in:principal,franquicia,proveedor,cliente',
        'giro' => 'alpha|between:5,60',
        'direccion' => 'required|alpha_dash',
        'ciudad' => 'alpha|between:2,50',
        'estado' => 'alpha|between:2,50',
        'pais' => 'alpha|between:2,50',
        'cp' => 'integer|digits:5',
        'rfc' => 'alpha_num|between:12,60|unique:empresas,rfc',
        'url' => 'url',
        'logo' => 'alpha_dash',
        'descripcion' => 'alpha_dash',
    ];

    /**
     * Los atributos que son asignable en masa.
     *
     * @var array
     */
    protected $fillable = [
        'nombre',
        'tipo',
        'giro',
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
     * @return Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function empleados()
    {
        return $this->hasMany('Empleado');
    }

    /**
     * Relacion Empresa - Persona.
     *
     * @return Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function personas()
    {
        return $this->hasMany('Persona');
    }
}
