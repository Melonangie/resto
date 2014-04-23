<?php

// ------------------------------------------------------------
// Event Listeners
// ------------------------------------------------------------

User::creating(function ($user) {
    $user->api_key = User::createApiKey();
});

Item::created(function ($item) {
    $item->codigo = Item::generateItemCode();
    $item->save();
});
