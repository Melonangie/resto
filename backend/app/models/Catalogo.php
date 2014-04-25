<?php

class Catalogo extends Eloquent
{
    /**
     * La tabla de la base de datos usada por el modelo.
     *
     * @var string
     */
    protected $table = 'catalogos';

    /**
     * Reglas de validacion.
     *
     * @var array
     */
    public static $rules = [
        'catologo' => 'required|alpha|between:3,50|unique',
        'abreviacion' => 'required|alpha|size:3|unique',
        'descripcion' => 'alpha_num',
    ];

    /**
     * Los atributos que son asignable en masa.
     *
     * @var array
     */
    protected $fillable = [
        'catologo',
        'abreviacion',
        'descripcion'
    ];

    /**
     * Relacion Catologo - Articulos.
     *
     * @return Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function articulos()
    {
        return $this->belongsTo('articulos');
    }
}
