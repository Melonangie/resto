<?php

use Illuminate\Auth\UserInterface;
use Illuminate\Auth\Reminders\RemindableInterface;

class User extends Eloquent implements UserInterface, RemindableInterface
{
    /**
     * La tabla de la base de datos usada por el modelo.
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
        'username' => 'required|alpha_dash|between:6,50|unique:users,username',
        'password' => 'required|min:6',
        'empleado_id' => 'required|exists:empresas,id',
        'rol_nombre' => 'required|exists:roles,nombre',
    ];

    /**
     * Los atributos que no son visibles en el JSON del modelo.
     *
     * @var array
     */
    protected $hidden = [
        'password',
        'api_key'
    ];

    /**
     * Los atributos que son asignable en masa.
     *
     * @var array
     */
    protected $fillable = [
        'username',
        'password',
        'empleado_id',
        'rol_nombre'
    ];

    /**
     * Identificador unico del usuario.
     *
     * @return mixed
     */
    public function getAuthIdentifier()
    {
        return $this->getKey();
    }

    /**
     * Clave del usuario.
     *
     * @return string
     */
    public function getAuthPassword()
    {
        return $this->password;
    }

    /**
     * Get the token value for the "remember me" session.
     *
     * @return string
     */
    public function getRememberToken()
    {
        return $this->remember_token;
    }

    /**
     * Set the token value for the "remember me" session.
     *
     * @param  string $value
     * @return void
     */
    public function setRememberToken($value)
    {
        $this->remember_token = $value;
    }

    /**
     * Get the column name for the "remember me" token.
     *
     * @return string
     */
    public function getRememberTokenName()
    {
        return 'remember_token';
    }

    /**
     * Get the e-mail address where password reminders are sent.
     *
     * @return string
     */
    public function getReminderEmail()
    {
        return $this->email;
    }

    /**
     * Password mutator.
     *
     * @param  string $password
     * @return void
     */
    public function setPasswordAttribute($password)
    {
        $this->attributes['password'] = Hash::make($password);
    }

    /**
     * Genera una llave API unica.
     *
     * @return string
     */
    public static function createApiKey()
    {
        return Str::random(32);
    }

    /**
     * Relacion Usuario - Empleado.
     *
     * @return Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function empleado()
    {
        return $this->belongsTo('Empleado');
    }

    /**
     * Relacion Usuario - Rol.
     *
     * @return Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function rol()
    {
        return $this->belongsTo('Rol');
    }
}
