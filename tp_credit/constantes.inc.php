<?php

define('SERVEUR', 'localhost'); // define permet de définir des constantes
define('PORT', '5432');

define('UTILISATEUR', 'uti_annuaire');
define('MDP', 'pz9,jC'); // mot de passe
define('NOM_BASE', 'bd_annuaire');


define('DSN', 'pgsql:host=' . SERVEUR . ' port=' . PORT . ' dbname=' . NOM_BASE); // DSN : Data Source Name

?>
