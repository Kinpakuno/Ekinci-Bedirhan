<?php
require_once('connexion.inc.php');

try {
    $pdo = new PDO(DSN, UTILISATEUR, MDP);
} catch(PDOException $e) {
    echo "problème de connexion\n";
    echo $e->getMessage();
    exit(1);
}

if (isset($_GET['station_id']) && isset($_GET['uti'])) {
    $station_id = $_GET['station_id'];
    $uti = $_GET['uti'];
}


$response = "erreur";

try {
    $requetePreparee = $pdo->prepare("Insert INTO station_fav VALUES (DEFAULT, ?, ?)" );
    $requetePreparee->bindParam(1, $station_id, PDO::PARAM_STR);
    $requetePreparee->bindParam(2, $uti, PDO::PARAM_STR);
        
    $resultat = $requetePreparee->execute();
    if ($resultat) {
        $response = "ok";    
        //echo $resultat;    
    } else {
        $response = "echec";
        //echo $requetePreparee->errorInfo()[2], "\n";
    }
} catch(PDOException $e) {
    //echo "problème avec la requête d'insertion";
    //echo $e->getMessage();
    exit(1); // on arrête le script
}

?>