<?php

class Company extends Eloquent
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'companies';

    /**
     * Add your validation rules here.
     *
     * @var array
     */
    public static $rules = [
        'tipo' => 'required|alpha',
        'giro' => 'alpha_num|between:12,60',
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
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['tipo',
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
        'descripcion'];

    /**
     * Tasks relationship.
     *
     * @return Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function employees()
    {
        return $this->hasMany('Employee');
    }
}
