<?php

class Receta extends Eloquent
{
    /**
     * La tabla de la base de datos usada por el modelo.
     *
     * @var string
     */
    protected $table = 'recetas';

    /**
     * Reglas de validacion.
     *
     * @var array
     */
    public static $rules = [
        'nombre' => 'required|alpha_dash|between:3,50|unique:recetas,nombre',
        'tipo_nombre' => 'required|exists:tipos,nombre',
        'costo' => 'regex:/[\d]{1,4},[\d]{1,2}/',
        'descripcion' => 'alpha_dash',
    ];

    /**
     * Los atributos que son asignable en masa.
     *
     * @var array
     */
    protected $fillable = [
        'nombre',
        'tipo_nombre',
        'costo',
        'descripcion'
    ];

    /**
     * Relacion Receta - Ingredientes.
     *
     * @return Illuminate\Database\Eloquent\Relations\BelongsToMany
     */
    public function ingredientes()
    {
        return $this->hasMany('Ingrediente');
    }

    /**
     * Relacion Receta - Articulos.
     *
     * @return Illuminate\Database\Eloquent\Relations\BelongsToMany
     */
    public function articulos()
    {
        return $this->belongsToMany('Articulo');
    }

    /**
     * Genera un codigo unico para una receta.
     *
     * @return string
     */
    public static function generateCodigo($data)
    {
        $tipo = DB::table('tipos')->where('nombre', $data['tipo_nombre'])->pluck('abreviacion');

        return 'rec-'.$tipo.'-'.sprintf('%04d', $data['id']);
    }
}
