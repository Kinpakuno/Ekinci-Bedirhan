<?php
header("Content-Type: application/json");
require_once('constante.inc.php');

try {
    $pdo = new PDO(DSN, UTILISATEUR, MDP);
} catch(PDOException $e) {
    echo '["problème de connexion"]';
    exit(1);
}

$numero_chambre = $_GET["chambre"];
$date_louer = $_GET["date"];

try {
    $requetePreparee = $pdo->prepare("SELECT * FROM reservation where numero_chambre=? and date_louer=?");
    $requetePreparee->bindParam(1, $numero_chambre, PDO::PARAM_STR);
    $requetePreparee->bindParam(2, $date_louer, PDO::PARAM_STR);
    $resultat = $requetePreparee->execute();
    if ($resultat) {

        $lignes = $requetePreparee->fetchAll();
        if (count($lignes) == 0) {
            echo '[]';
        } else {
            echo "[\"" . $lignes[0][1] . "\"]";
        }
    } else {
        echo '["échec"]';
    }
} catch(PDOException $e) {
    echo '["problème avec la requête de sélection"]';
    exit(1);
}

$pdo = NULL;

