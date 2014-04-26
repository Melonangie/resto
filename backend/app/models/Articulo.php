<?php

class Articulo extends Eloquent
{
    /**
     * La tabla de la base de datos usada por el modelo.
     *
     * @var string
     */
    protected $table = 'articulos';

    /**
     * Reglas de validacion.
     *
     * @var array
     */
    public static $rules = [
        'nombre' => 'required|alpha_dash|between:5,60|unique:articulos,nombre',
        'catalogo_nombre' => 'required|exists:catalogos,nombre',
        'tipo_nombre' => 'required|exists:tipos,nombre',
        'unidad_nombre' => 'required|integer',
        'cantidad_por_unidad' => 'required|integer',
        'precio_compra' => 'regex:/[\d]{1,4},[\d]{1,2}/',
        'precio_venta' => 'regex:/[\d]{1,4},[\d]{1,2}/',
        'foto' => 'url',
        'descripcion' => 'alpha_dash',
    ];

    /**
     * Los atributos que son asignable en masa.
     *
     * @var array
     */
    protected $fillable = [
        'nombre',
        'catalogo_nombre',
        'tipo_nombre',
        'unidad_nombre',
        'cantidad_por_unidad',
        'precio_compra',
        'precio_venta',
        'foto',
        'descripcion'
    ];

    /**
     * Relacion Articulo - Ingredientes.
     *
     * @return Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function ingredientes()
    {
        return $this->hasMany('Ingrediente');
    }

    /**
     * Relacion Articulo - Tipo.
     *
     * @return Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function tipo()
    {
        return $this->belongsTo('Tipo');
    }

    /**
     * Relacion Articulo - Catalogo.
     *
     * @return Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function catalogo()
    {
        return $this->belongsTo('Catalogo');
    }

    /**
     * Relacion Articulo - Recetas.
     *
     * @return Illuminate\Database\Eloquent\Relations\BelongsToMany
     */
    public function receta()
    {
        return $this->belongsToMany('Receta');
    }

    /**
     * Genera un codigo unico para un articulo.
     *
     * @return string
     */
    public static function generateCodigo($data)
    {
        $catalogo = DB::table('catalogos')->where('nombre', $data['catalogo_nombre'])->pluck('abreviacion');
        $tipo = DB::table('tipos')->where('nombre', $data['tipo_nombre'])->pluck('abreviacion');

        return $catalogo.'-'.$tipo.'-'.sprintf('%04d', $data['id']);
    }
}
