<?php

class Item extends Eloquent
{
    /**
     * Add your validation rules here.
     *
     * @var array
     */
    public static $rules = [
        // 'title' => 'required'
    ];

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [];

    /**
     * Generate a random, unique API key.
     *
     * @return string
     */
    public static function generateItemCode()
    {
        return Str::random(32);
    }
}
