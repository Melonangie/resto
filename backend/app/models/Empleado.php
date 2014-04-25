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
        'empresa_id' => 'required|integer',
        'departamento_id' => 'required|integer',
        'puesto_id' => 'required|integer',
        'nombre' => 'required|alpha|between:2,60',
        'paterno' => 'required|alpha|between:2,60',
        'materno' => 'required|alpha|between:2,60',
        'direccion' => 'alpha|between:2,50',
        'email' => 'email',
        'telefono_casa' => 'alpha_num|between:6,20',
        'telefono_oficina' => 'alpha_num|between:6,20',
        'extension' => 'integer',
        'foto' => 'alpha_dash',
        'curp' => 'alpha_num|between:12,60',
        'nacimiento' => 'date',
        'alta' => 'date',
        'baja' => 'date',
        'notas' => 'alpha_num',
    ];

    /**
     * Los atributos que son asignable en masa.
     *
     * @var array
     */
    protected $fillable = [
        'empresa_id',
        'departamento_id',
        'position_id',
        'nombre',
        'paterno',
        'materno',
        'direccion',
        'email',
        'telefono_casa',
        'telefono_oficina',
        'extension',
        'foto'
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
