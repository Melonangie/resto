<?php

class Articulo extends Eloquent
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'articulos';

    /**
     * Add your validation rules here.
     *
     * @var array
     */
    public static $rules = [
        'nombre' => 'required|alpha_num|between:6,60',
        'type_id' => 'required|integer',
        'category_id' => 'required|integer',
        'unit_id' => 'required|integer',
        'cantidad_por_unidad' => 'required|integer',
        'precio_compra' => 'regex:/[\d]{1,4},[\d]{1,2}/',
        'precio_venta' => 'regex:/[\d]{1,4},[\d]{1,2}/',
        'foto' => 'url',
        'descripcion' => 'alpha_num',
    ];

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['nombre', 'type_id', 'category_id', 'unit_id', 'cantidad_por_unidad', 'precio_compra', 'precio_venta', 'foto', 'descripcion'];

    /**
     * Lists relationship.
     *
     * @return Illuminate\Database\Eloquent\Relations\HasOne
     */
    public function unidad()
    {
        return $this->hasOne('Unidad');
    }
}
