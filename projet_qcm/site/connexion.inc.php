<?php

define('SERVEUR', 'localhost'); // define permet de définir des constantes
define('PORT', '5432');

define('UTILISATEUR', 'uti_projet');
define('MDP', 'slam'); // mot de passe
define('NOM_BASE', 'bd_projet');


define('DSN', 'pgsql:host=' . SERVEUR . ' port=' . PORT . ' dbname=' . NOM_BASE); // DSN : Data Source Name

?>
