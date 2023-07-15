<?php
//define('SEL', '$2a$07$AfghTrhgskKjudhehlPkdhskjd$'); // define permet de définir des constantes
define('SERVEUR', 'localhost');
define('PORT', '5432');

define('UTILISATEUR', 'uti_bd_velib');
define('MDP', 'slam'); // mot de passe
define('NOM_BASE', 'bd_velib');


define('DSN', 'pgsql:host=' . SERVEUR . ' port=' . PORT . ' dbname=' . NOM_BASE); // DSN : Data Source Name

?>
