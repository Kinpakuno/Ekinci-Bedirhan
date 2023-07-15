<?php
require_once('connexion.inc.php');

try {
    $pdo = new PDO(DSN, UTILISATEUR, MDP);
} catch(PDOException $e) {
    echo "problème de connexion\n";
    echo $e->getMessage();
    exit(1);
}

if (isset($_GET['utilisateur'])) {
    $utilisateur = $_GET['utilisateur'];
    //echo $utilisateur;
}

$response = "erreur";
$listeStation = array();

try {
    $requetePreparee = $pdo->prepare("Select id_station from station_fav Where utilisateur=?" );
    $requetePreparee->bindParam(1, $utilisateur, PDO::PARAM_STR);
        
    $resultat = $requetePreparee->execute();
    if ($resultat) {
        $stations = $requetePreparee->fetchAll(PDO::FETCH_ASSOC);
        // avec une boucle foreach
        foreach($stations as $station) {
            $listeStation[] = $station['id_station'];
        }    
         
        $response = json_encode($listeStation); // encodage en JSON    } else {
        echo $response;
        //echo $requetePreparee->errorInfo()[2], "\n";
    }else{
        $response = 'erreur';
    }
} catch(PDOException $e) {
    echo "problème avec la requête d'insertion";
    //echo $e->getMessage();
    exit(1); // on arrête le script
}

?>