<?php

use Ajustes\Usuario;

// ------------------------------------------------------------
// Event Listeners
// ------------------------------------------------------------

Usuario::creating(function($usuario)
{
    $usuario->api_key = Usuario::createApiKey();
});