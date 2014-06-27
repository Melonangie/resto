<?php namespace Ajustes;

use Illuminate\Auth\UserInterface;
use Illuminate\Auth\UserTrait;
use \Hash as Hash;
use \Str as Str;

class Usuario extends \Eloquent implements UserInterface
{
    use UserTrait;

    /**
     * Reglas de validacion.
     *
     * @var array
     */
    public static $rules = [
        'usuario' => 'required|alpha_dash|between:6,25|unique:usuario,usuarios,{{$this->id}}',
        'clave' => 'required|min:6',
    ];

    /* Activa softdelete en el modelo.
    *
    * @var boolean
    */
    protected $softDelete = true;

    /**
     * La tabla en la base de datos usada por el modelo.
     *
     * @var string
     */
    protected $table = 'usuarios';

    /**
     * Los atributos que no son asignable en masa.
     *
     * @var array
     */
    protected $fillable = ['clave','usuario'];

    /**
     * Los atributos que no son visibles en el JSON del modelo.
     *
     * @var array
     */
    protected $hidden = ['id', 'clave', 'created_at', 'updated_at', 'deleted_at'];

    /**
     * Validate the model's attributes
     *
     * @throws ValidationException
     */
    public function validate()
    {
        $validator = Validator::make($this->attributes, $this->rules);

        if ($validator->fails()) {
            throw new ValidationException($validator);
        }
    }

    /**
     * Password mutator.
     *
     * @param  string $password
     * @return void
     */
    public function setClaveAttribute($password)
    {
        $this->attributes['clave'] = Hash::make($password);
    }

    /**
     * Generate a random, unique API key.
     *
     * @return string
     */
    public static function createApiKey()
    {
        return Hash::make(Str::random(32), array('rounds'=>12));
    }

    /**
     * List relationship.
     *
     * @return Illuminate\Database\Eloquent\Relations\BelongsToMany
     */
//    public function permisos()
//    {
//        return $this->belongsToMany('Modulo', 'permisos');
//    }
}