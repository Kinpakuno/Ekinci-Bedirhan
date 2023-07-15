<?php

require_once("constante.inc.php");
// require_once("function.inc.php");

define('DEBUT', '2022-12-01'); // date de début des rendez-vous
define('FIN', '2022-12-31'); // date de fin des rendez-vous

$fichierNoms = fopen("noms.txt", "r");

$tabNoms = [];

// var_dump($tabPrenoms);

if ($fichierNoms == false) {
    echo "Pas de Noms";
} else {
    $ligneNoms = fgets($fichierNoms);
    while (! feof($fichierNoms)) {
        $tabNoms[] = substr($ligneNoms, 0, -1);
        $ligneNoms = fgets($fichierNoms);
    }
    fclose($fichierNoms);
}


try {
    $pdo = new PDO(DSN, UTILISATEUR, MDP); // tentative de connexion
} catch(PDOException $e) {
    echo "problème de connexion\n";
    echo $e->getMessage();
    exit(1);
}

for ($j = 0; $j < 20; $j++) {

    $rdNo1 = rand(0, (count($tabNoms)-1));
    $rdNAnnée = rand(2022, 2022);
    $rdNMois = rand(1, 4);
    if ($rdNMois == 2) {
        $rdNJours = rand(1, 28);
    } elseif ($rdNMois == 1 || $rdNMois == 3 || $rdNMois == 5 || $rdNMois == 7 || $rdNMois == 8 || $rdNMois == 10 || $rdNMois == 12){
        $rdNJours = rand(1, 31);
    } else {
        $rdNJours = rand(1, 30);
    }
    $nom = $tabNoms[$rdNo1];


    if ($rdNMois < 10 ) {
        $rdNMois = 0 . $rdNMois;
    }
    if ($rdNJours < 10) {
        $rdNJours = 0 . $rdNJours;
    }

    $rdv = $rdNAnnée . "-" . $rdNMois . "-" . $rdNJours;

    $numero_etage = rand(1, 3);
    if ($numero_etage == 1){
        $numero_chambre = rand(1, 13);
    } elseif ($numero_etage == 2){
        $numero_chambre = rand(101, 113);
    } else {
        $numero_chambre = rand(201, 209);
    }


    try {
        $requetePreparee = $pdo->prepare('INSERT INTO reservation (numero_chambre, nom_client, date_louer) VALUES (?, ?, ?)');
        $requetePreparee->errorInfo();
        $requetePreparee->bindParam(1, $numero_chambre, PDO::PARAM_STR);
        $requetePreparee->bindParam(2, $nom, PDO::PARAM_STR);
        $requetePreparee->bindParam(3, $rdv, PDO::PARAM_STR);
        $resultat = $requetePreparee->execute();
        if ($resultat) {
    //         echo "réussie\n";
        } else {
            echo $requetePreparee->errorInfo()[2], "\n";
        }
    }
    catch(PDOException $e) {
        echo "problème avec la requête d'insertion\n";
        echo $e->getMessage();
        exit(1);
    }
}



?>
