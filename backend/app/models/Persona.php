<?php

class Persona extends Eloquent
{
    /**
     * La tabla de la base de datos usada por el modelo.
     *
     * @var string
     */
    protected $table = 'personas';

    /**
     * Reglas de validacion.
     *
     * @var array
     */
    public static $rules = [
        'tipo' => 'required|alpha',
        'empresa_id' => 'required|integer',
        'nombre' => 'alpha|between:2,60',
        'paterno' => 'alpha|between:2,60',
        'materno' => 'alpha|between:2,60',
        'email' => 'email',
        'telefono' => 'alpha_num|between:6,20',
        'extension' => 'integer',
        'celular' => 'alpha_num|between:6,20',
        'radio' => 'alpha_num|between:6,20',
        'fax' => 'alpha_num|between:6,20',
    ];

    /**
     * Los atributos que son asignable en masa.
     *
     * @var array
     */
    protected $fillable = [
        'tipo',
        'empresa_id',
        'nombre',
        'paterno',
        'materno',
        'email',
        'telefono',
        'extension',
        'celular',
        'radio',
        'fax'
    ];

    /**
     * Relacion Persona - Empresa.
     *
     * @return Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function empresa()
    {
        return $this->belongsTo('Empresa');
    }
}
