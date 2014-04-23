<?php

class Employee extends Eloquent
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'employees';

    /**
     * Add your validation rules here.
     *
     * @var array
     */
    public static $rules = [
        'company_id' => 'required|integer',
        'department_id' => 'required|integer',
        'position_id' => 'required|integer',
        'nombre' => 'required|alpha|between:2,60',
        'paterno' => 'required|alpha|between:2,60',
        'materno' => 'required|alpha|between:2,60',
        'direccion' => 'alpha|between:2,50',
        'email' => 'email',
        'telefono_casa' => 'alpha_num|between:6,20',
        'telefono_oficina' => 'alpha_num|between:6,20',
        'extension' => 'integer',
        'foto' => 'alpha_dash',
    ];

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['company_id',
        'department_id',
        'position_id',
        'nombre',
        'paterno',
        'materno',
        'direccion',
        'email',
        'telefono_casa',
        'telefono_oficina',
        'extension',
        'foto'];

    /**
     * User relationship.
     *
     * @return Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function company()
    {
        return $this->belongsTo('Company');
    }
}
