<?php

class Person extends Eloquent
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'people';

    /**
     * Add your validation rules here.
     *
     * @var array
     */
    public static $rules = [
        'tipo' => 'required|alpha',
        'company_id' => 'required|integer',
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
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['tipo',
        'company_id',
        'nombre',
        'paterno',
        'materno',
        'email',
        'telefono',
        'extension',
        'celular',
        'radio',
        'fax'];

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
