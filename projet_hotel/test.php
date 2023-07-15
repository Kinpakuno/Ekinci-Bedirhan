<?php
header("Content-Type: application/json");
require_once('constante.inc.php');

try {
    $pdo = new PDO(DSN, UTILISATEUR, MDP); // tentative de connexion
} catch(PDOException $e) {
    echo '["problème de connexion"]';
//     echo $e->getMessage();
    exit(1); // on arrête le script en renvoyant un code d'erreur choisi par nous
}


$date_louer = $_GET["date"];


try {
    $requetePreparee = $pdo->prepare("SELECT * FROM reservation where date_louer=?");
    $requetePreparee->bindParam(1, $date_louer, PDO::PARAM_STR);
    $resultat = $requetePreparee->execute();
    if ($resultat) {

        $lignes = $requetePreparee->fetchAll();
        if (count($lignes) == 0) {
            //$tabcouleur = '[""]';
            echo '[]';
        } else {
            //$tabcouleur = '["occupe"]';
            echo "[\"" . $lignes[0][0]. "\"]";
        }
    } else {
        echo '["échec"]';
//         echo $requetePreparee->errorInfo()[2], "\n";
    }
} catch(PDOException $e) {
    echo '["problème avec la requête de sélection"]';
//     echo $e->getMessage();
    exit(1);
}

$pdo = NULL;

//echo $tabcouleur;
