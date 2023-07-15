<?php
header("Content-Type: application/json");

require_once('constante.inc.php');

try {
    $pdo = new PDO(DSN, UTILISATEUR, MDP); // tentative de connexion
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION); // utile pour le débogage
} catch(PDOException $e) {
    echo "problème de connexion\n";
    echo $e->getMessage();
    exit(1); // on arrête le script en renvoyant un code d'erreur choisi par nous
}

$numero_chambre = $_GET["chambre"];
$date_louer = $_GET["date"];

try {
    $requetePreparee = $pdo->prepare('DELETE FROM reservation WHERE numero_chambre=? and date_louer=?');
    // les points d'interrogation sont des marqueurs de paramètres
    $requetePreparee->bindParam(1, $numero_chambre, PDO::PARAM_STR);
    $requetePreparee->bindParam(2, $date_louer, PDO::PARAM_STR);
    $resultat = $requetePreparee->execute(); // tentative de suppression
    if ($resultat) {
        // la suppression a réussi
        echo "la suppression a réussi\n";
    }
    else {
        // la mise à jour a échoué
        echo "échec de la suppression\n";
        echo $requetePreparee->errorInfo()[2], "\n";
    }
}
catch(PDOException $e) {
    echo "problème avec la requête de suppression\n";
    echo $e->getMessage();
    exit(1); // on arrête le script
}

$pdo = NULL; //fermeture de la connexion

echo '{"reponse": "ok"}';
