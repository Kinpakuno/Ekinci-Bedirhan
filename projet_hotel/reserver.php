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
$nom_client = $_GET["nom"];
$date_louer = $_GET["date"];

try {
    $requetePreparee = $pdo->prepare('INSERT INTO reservation (numero_chambre, nom_client, date_louer) VALUES (?, ?, ?)');
    $requetePreparee->errorInfo();
    $requetePreparee->bindParam(1, $numero_chambre, PDO::PARAM_STR);
    $requetePreparee->bindParam(2, $nom_client, PDO::PARAM_STR);
    $requetePreparee->bindParam(3, $date_louer, PDO::PARAM_STR);
    $resultat = $requetePreparee->execute();
    if ($resultat) {
        echo "[\"". $nom_client ."\"]";
    } else {
//         echo "échec\n";
    //echo $pdo->errorInfo()[2], "\n";
        echo $requetePreparee->errorInfo()[2], "\n";
    }
} catch(PDOException $e) {
    //echo "problème avec la requête d'insertion\n";
    //echo $e->getMessage();
    echo '{"reponse": "pb", "message": ', $e->getMessage(), "num:", $numero_chambre, '}';
    exit(1); // on arrête le script
}
    $pdo = NULL; //fermeture de la connexion-->


// echo '{"reponse": "ok"}';
