<?php

class Empleado extends Eloquent
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
}
