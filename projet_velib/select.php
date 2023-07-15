<?php

require_once('connexion.inc.php');

// tentative de connexion à la base
try {
    $pdo = new PDO(DSN, UTILISATEUR, MDP); // tentative de connexion
} catch(PDOException $e) {
    echo "problème de connexion\n";
    echo $e->getMessage();
    exit(1);
}


try {
    // récupération de l'empreinte la plus récente
    $requetePreparee = $pdo->prepare("SELECT * FROM station WHERE station_id=?" );
    $requetePreparee->bindParam(1, $station, PDO::PARAM_STR);
        
    $resultat = $requetePreparee->execute();
    if ($resultat) {
        $lignes = $requetePreparee->fetchAll(); // on essaie de récupérer toutes les lignes
        if (isset($lignes[0]['identifiant'])) {
            $utilisateurAuthentifie = true;
        } else {
            $utilisateurAuthentifie = false;
        }
    } else {
        echo "échec\n";
        echo $requetePreparee->errorInfo()[2], "\n";
    }
} catch(PDOException $e) {
    echo "problème avec la requête de sélection\n";
    echo $e->getMessage();
    exit(1); // on arrête le script
}

?>