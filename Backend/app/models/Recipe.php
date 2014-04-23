<?php

class Recipe extends Eloquent
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'recipes';

    /**
     * Add your validation rules here.
     *
     * @var array
     */
    public static $rules = [
        'receta' => 'required|alpha_num|between:6,100',
        'costo' => 'regex:/[\d]{1,4},[\d]{1,2}/'
    ];

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['receta', 'costo'];

    /**
     * Tasks relationship.
     *
     * @return Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function ingredients()
    {
        return $this->hasMany('Ingredient');
    }
}
