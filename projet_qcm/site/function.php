<?php

function empreinte($mdp) {
    $blowfish = '$2a$07$AfghTrhgskKjudhehlPkdhskjd$'; // sel choisis avec 22 caractères
    $hash = crypt($mdp, $blowfish);

    $empreinte = substr($hash, -32);
    return ($empreinte);
}
?>
