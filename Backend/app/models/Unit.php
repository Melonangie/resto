<?php

class Unit extends Eloquent
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'units';

    /**
     * Add your validation rules here.
     *
     * @var array
     */
    public static $rules = [
        'unidad' => 'required|alpha_num|between:1,50|unique',
        'medida' => 'required|max:5|unique',
    ];

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['unidad', 'medida'];

    /**
     * User relationship.
     *
     * @return Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function item()
    {
        return $this->belongsTo('Item');
    }
}
