
<?php

/*
 * ce script montre comment récupérer les données sur le site velib-metropole-opendata.smoove.pro
 *
 * le site a été placé en liste blanche sur le proxy : on peut donc se connecter au site sans login/mot de passe
 * mais bien sûr il faut toujours passé par le proxy
 *
 * par ailleurs, il faut que curl soit installé sur la machine et que le paquet php-curl soit aussi installé
 *
 */

$url = 'https://velib-metropole-opendata.smoove.pro/opendata/Velib_Metropole/station_information.json';
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $url);
curl_setopt($ch, CURLOPT_PROXY, '192.168.3.2:3128');
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true); // n'affiche pas à l'écran
$donnees = curl_exec ($ch); // exécute la commande curl et récupère son résultat dans $donnees
curl_close($ch);

$url2 = 'https://velib-metropole-opendata.smoove.pro/opendata/Velib_Metropole/station_status.json';
$ch2 = curl_init();
curl_setopt($ch2, CURLOPT_URL, $url2);
curl_setopt($ch2, CURLOPT_PROXY, '192.168.3.2:3128');
curl_setopt($ch2, CURLOPT_RETURNTRANSFER, true); // n'affiche pas à l'écran
$donnees2 = curl_exec ($ch2); // exécute la commande curl et récupère son résultat dans $donnees
curl_close($ch2);

//$curl_info = curl_getinfo($ch);
$response = '{"data": {"stations_information": ' . $donnees . ', "station_status": ' . $donnees2 . '}}';

echo $response;
//print_r($curl_info);
?>