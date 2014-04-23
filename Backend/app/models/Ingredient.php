<?php

class Ingredient extends Eloquent
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'ingredients';

    /**
     * Add your validation rules here.
     *
     * @var array
     */
    public static $rules = [
        'recipe_id' => 'integer',
        'item_id' => 'integer',
        'cantidad' => 'regex:/[\d]{1,4},[\d]{1,2}/',
    ];

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['recipe_id', 'item_id', 'cantidad'];

    /**
     * User relationship.
     *
     * @return Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function recipe()
    {
        return $this->belongsTo('Recipe');
    }

    /**
     * Tasks relationship.
     *
     * @return Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function items()
    {
        return $this->hasMany('Item');
    }
}
