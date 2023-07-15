<?php
require_once('connexion.inc.php');
// Code pour récupérer les données avec curl

$url = 'https://velib-metropole-opendata.smoove.pro/opendata/Velib_Metropole/station_information.json';
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $url);
curl_setopt($ch, CURLOPT_PROXY, '192.168.3.2:3128');
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true); // n'affiche pas à l'écran
$donnees = curl_exec($ch); // exécute la commande curl et récupère son résultat dans $donnees
curl_close($ch);

$url2 = 'https://velib-metropole-opendata.smoove.pro/opendata/Velib_Metropole/station_status.json';
$ch2 = curl_init();
curl_setopt($ch2, CURLOPT_URL, $url2);
curl_setopt($ch2, CURLOPT_PROXY, '192.168.3.2:3128');
curl_setopt($ch2, CURLOPT_RETURNTRANSFER, true); // n'affiche pas à l'écran
$donnees2 = curl_exec($ch2); // exécute la commande curl et récupère son résultat dans $donnees
curl_close($ch2);

$response = '{"data": {"stations_information": ' . $donnees . ', "station_status": ' . $donnees2 . '}}';

$data = json_decode($response, true);
$stations = $data['data']['stations_information']['stations'];

//connexion à la base de donnée
try {
    $pdo = new PDO(DSN, UTILISATEUR, MDP); // tentative de connexion
    //$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION); // utile pour le débogage
} catch (PDOException $e) {
    echo "problème de connexion\n";
    echo $e->getMessage();
    exit(1); // on arrête le script en renvoyant un code d'erreur choisi par nous
}
// Boucle pour l'insertion des stations dans la table "station"

foreach ($stations as $station) {
    $station_id = $station['station_id'];
    $nom = $station['name'];
    $latitude = $station['lat'];
    $longitude = $station['lon'];
    try {
        $requetePreparee = $pdo->prepare('INSERT INTO station VALUES (?, ?, ?, ?)');

        $requetePreparee->bindParam(1, $station_id, PDO::PARAM_STR);
        $requetePreparee->bindParam(2, $nom, PDO::PARAM_STR);
        $requetePreparee->bindParam(3, $latitude, PDO::PARAM_STR);
        $requetePreparee->bindParam(4, $longitude, PDO::PARAM_STR);
        $resultat = $requetePreparee->execute();

        if ($resultat) {
            echo "réussie\n";
        } else {
            echo "échec\n";
            //echo $pdo->errorInfo()[2], "\n";
            echo $requetePreparee->errorInfo()[2], "\n";
        }
    } catch (PDOException $e) {
        echo "problème avec la requête d'insertion\n";
        echo $e->getMessage();
        exit(1); // on arrête le script
    }
}

$pdo = NULL;

?>