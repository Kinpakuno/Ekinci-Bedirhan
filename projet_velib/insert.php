<?php
require_once('connexion.inc.php');

$url = 'https://velib-metropole-opendata.smoove.pro/opendata/Velib_Metropole/station_information.json';
$ch = curl_init();

curl_setopt($ch, CURLOPT_URL, $url);    // l'URL
curl_setopt($ch, CURLOPT_PROXY, '192.168.3.2:3128'); // le proxy
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true); // n'affiche pas à l'écran

$donnees = curl_exec ($ch); // exécute la commande curl et récupère son résultat dans $donnees
$tab = json_decode($donnees, true); // construit un tableau associatif à partir des données récupérées

try {
    $pdo = new PDO(DSN, UTILISATEUR, MDP);
} catch(PDOException $e) {
    echo "problème de connexion\n";
    echo $e->getMessage();
    exit(1);
}

try {
    // parcout toutes les stations et ajoute l'id_station dans la table "station"
    foreach($tab["data"]["stations"] as $station) {
        $station_id = $station["station_id"];
        $nom = $station["name"];
        $latitude = $station["lat"];
        $longitude = $station["lon"];

        $requetePreparee = $pdo->prepare('INSERT INTO station VALUES (?, ?, ?, ?)');
        $requetePreparee->bindParam(1, $station_id, PDO::PARAM_STR);
        $requetePreparee->bindParam(2, $nom, PDO::PARAM_STR);
        $requetePreparee->bindParam(3, $latitude, PDO::PARAM_STR);
        $requetePreparee->bindParam(4, $longitude, PDO::PARAM_STR);

        $resultat = $requetePreparee->execute();
        if ($resultat) {
            //echo "Les id stations on été ajouté avec succès à la base de donnée !";
        } else {
            echo $requetePreparee->errorInfo()[2], "\n";
        }
    }
} catch(PDOException $e) {
    echo "Il y a un problème avec la requete d'insertion\n";
    echo $e->getMessage();
    exit(1);
}

$pdo = null;
curl_close($ch);
?>
