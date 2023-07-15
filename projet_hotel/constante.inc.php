<?php

define('SERVEUR', 'localhost'); // define permet de définir des constantes
define('PORT', '5432');

define('UTILISATEUR', 'uti_bd_hotel');
define('MDP', 'slam'); // mot de passe
define('NOM_BASE', 'bd_hotel');


define('DSN', 'pgsql:host=' . SERVEUR . ' port=' . PORT . ' dbname=' . NOM_BASE); // DSN : Data Source Name

?>
