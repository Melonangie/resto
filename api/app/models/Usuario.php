<?php namespace Ajuste;

class Usuario extends \Eloquent
{
    /**
     * La tabla en la base de datos usada por el modelo.
     *
     * @var string
     */
    protected $table = 'users';

	/**
     * Reglas de validacion.
     *
     * @var array
     */
	public static $rules = [
		// 'title' => 'required'
	];

    /**
     * Los atributos que no son asignable en masa.
     *
     * @var array
     */
    protected $guarded = [];

    /**
     * Los atributos que no son visibles en el JSON del modelo.
     *
     * @var array
     */
    protected $hidden = ['id', 'user_id', 'created_at', 'updated_at'];

}
