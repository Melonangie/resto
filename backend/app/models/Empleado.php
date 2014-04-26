<?php

class Empleado extends Eloquent
{
    /**
     * La tabla de la base de datos usada por el modelo.
     *
     * @var string
     */
    protected $table = 'empleados';

    /**
     * Reglas de validacion.
     *
     * @var array
     */
    public static $rules = [
        'empresa_nombre' => 'required|exists:empresas,nombre',
        'departamento_nombre' => 'required|exists:departamentos,nombre',
        'puesto_id' => 'required|exists:puestos,nombre',
        'nombre' => 'required|alpha_dash|between:2,60',
        'paterno' => 'required|alpha_dash|between:2,60',
        'materno' => 'required|alpha_dash|between:2,60',
        'direccion' => 'alpha_dash',
        'email' => 'email',
        'telefono_casa' => 'alpha_num|between:6,20',
        'telefono_oficina' => 'alpha_num|between:6,20',
        'extension' => 'alpha_num|max:6',
        'foto' => 'alpha_dash',
        'curp' => 'alpha_num|between:12,60|unique:empleados,curp',
        'nacimiento' => 'date',
        'alta' => 'date',
        'baja' => 'date',
        'notas' => 'alpha_dash',
    ];

    /**
     * Los atributos que son asignable en masa.
     *
     * @var array
     */
    protected $fillable = [
        'empresa_nombre',
        'departamento_nombre',
        'puesto_nombre',
        'nombre',
        'paterno',
        'materno',
        'direccion',
        'email',
        'telefono_casa',
        'telefono_oficina',
        'extension',
        'foto',
        'curp',
        'nacimiento',
        'alta',
        'baja',
        'notas',
    ];

    /**
     * Relacion Empleado - Departamento.
     *
     * @return Illuminate\Database\Eloquent\Relations\HasOne
     */
    public function usuario()
    {
        return $this->hasOne('User');
    }

    /**
     * Relacion Empleado - Puesto.
     *
     * @return Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function puesto()
    {
        return $this->belongsTo('Puesto');
    }

    /**
     * Relacion Empleado - Departamento.
     *
     * @return Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function departamento()
    {
        return $this->belongsTo('Departamento');
    }

    /**
     * Relacion Empleado - Empresa.
     *
     * @return Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function empresa()
    {
        return $this->belongsTo('Empresa');
    }
}
