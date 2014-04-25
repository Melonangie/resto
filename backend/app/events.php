<?php

// ------------------------------------------------------------
// Event Listeners
// ------------------------------------------------------------

User::creating(function ($user) {
    $user->api_key = User::createApiKey();
});

Articulo::created(function ($articulo) {
    $articulo->codigo = Articulo::generateCodigo(json_decode($articulo, true));
    $articulo->save();
});

Receta::created(function ($receta) {
    $receta->codigo = Receta::generateCodigo(json_decode($receta, true));
    $receta->save();
});
