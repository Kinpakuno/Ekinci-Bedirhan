<?php
session_start();
?>

<!DOCTYPE html>

<html lang="fr">

<head>
    <title>Projet Velib</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="UTF-8" />

    <!--<link rel="stylesheet" type="text/css" href="index.css">-->
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.3/dist/leaflet.css"
        integrity="sha256-kLaT2GOSpHechhsozzB+flnD+zUyjE2LlfWPgU04xyI=" crossorigin="" />
    <script src="https://unpkg.com/leaflet@1.9.3/dist/leaflet.js"
        integrity="sha256-WBkoXOwTeyKclOHuWtc+i2uENFpDZ9YPdf5Hf+D7ewM=" crossorigin=""></script>

</head>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f2f2f2;
    margin: 0;
    padding: 0;
}

header {
    background-color: #333;
    color: #fff;
    padding: 20px;
    text-align: center;
}

main {
    padding: 20px;
}

.flex {
    display: flex;
}

#map {
    flex: 1;
    height: 400px;
}

.texte {
    flex: 1;
    padding: 20px;
}

button {
    background-color: #333;
    color: #fff;
    border: none;
    padding: 10px 20px;
    margin-bottom: 10px;
    cursor: pointer;
}

footer {
    background-color: #333;
    color: #fff;
    padding: 10px;
    text-align: center;
    position: fixed;
    bottom: 0;
    left: 0;
    width: 100%;
}

</style>

<body>
    <header>
        <h1>Projet Vélib</h1>
    </header>
    <main>
        <?php

        require_once('connexion.inc.php');

        // tentative de connexion à la base
        try {
            $pdo = new PDO(DSN, UTILISATEUR, MDP); // tentative de connexion
        } catch (PDOException $e) {
            echo "problème de connexion\n";
            echo $e->getMessage();
            exit(1);
        }

        if (isset($_SESSION['login'])) {
            // l'utilisateur est déjà authentifié, pas la peine d'aller vérifier dans la base le couple login/empreinte de mot de passe
            $utilisateurAuthentifie = true;
        } else {
            // récupération des données du formulaire
            if (!isset($_POST['id']) || !isset($_POST['passwd'])) {
                exit(1);
            } else {
                $login = $_POST['id'];
                $mdp = $_POST['passwd'];
                try {
                    // récupération de l'empreinte la plus récente
                    $requetePreparee = $pdo->prepare("SELECT * FROM utilisateur WHERE identifiant=? AND mdp=?");

                    $requetePreparee->bindParam(1, $login, PDO::PARAM_STR);
                    $requetePreparee->bindParam(2, $mdp, PDO::PARAM_STR);

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
                } catch (PDOException $e) {
                    echo "problème avec la requête de sélection\n";
                    echo $e->getMessage();
                    exit(1); // on arrête le script
                }
            }
        }
        if ($utilisateurAuthentifie) {
            echo '<p>Bienvenue ', $login, " !</p>\n\n";
        } else {
            echo "<p>Vous n'êtes pas authentifié !</p>\n";
            echo '<a href="index.html">Connexion</a>', "\n";
        }
        ?>
        <div class="flex">

            <div id="map"><br>
                <script>
                    function ajout_favori(id_station, login) {
                        let xhr = new XMLHttpRequest(); // instanciation d'un objet XMLHttpRequest
                        xhr.onreadystatechange = function () {
                            if (xhr.readyState == 4 && xhr.status == 200) {
                                let donnees2 = JSON.parse(xhr.responseText);
                                // récupération de la réponse du serveur au format JSON contenu dans xhr.responseText
                                if (donnees2 == true) {

                                }
                                //alors change couleur
                            }
                        }
                        xhr.open("GET", "favori_insert.php?station_id=" + id_station + "&uti=" + login, true); // préparation de la requête HTTP (ici la méthode GET, appel d'un script PHP avec un paramètre)
                        xhr.send();
                    }

                    var map = L.map('map').setView([48.856613, 2.352222], 13);

                    L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
                        maxZoom: 19,
                        attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
                    }).addTo(map);
                </script>
            </div>
            <div class="texte">
                <script>
                    function affichageTout() {
                        map.eachLayer(function (layer) {
                            map.removeLayer(layer);
                        });

                        L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
                            maxZoom: 19,
                            attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
                        }).addTo(map);

                        let xhr = new XMLHttpRequest(); // instanciation d'un objet XMLHttpRequest
                        xhr.onreadystatechange = function () {
                            if (xhr.readyState == 4 && xhr.status == 200) {
                                let donnees = JSON.parse(xhr.responseText);
                                for (i = 0; i < donnees.data.stations_information.data.stations.length; i++) {
                                    var station_info = donnees.data.stations_information.data.stations[i];
                                    var station_status = donnees.data.station_status.data.stations[i];

                                    var station_id = station_info.station_id;
                                    var login = '<?php echo json_encode($login); ?>';

                                    var marker = L.marker([station_info.lat, station_info.lon]).addTo(map);
                                    var popupContent = `<br>${station_info.station_id}</br><br>${station_info.name}</br><br> nombre de place disponible : ${station_status.num_docks_available}</br><br> vélo disponible : ${station_status.num_bikes_available}</br><br>vélo mécanique : ${station_status.num_bikes_available_types[0].mechanical}</br><br>vélo électrique : ${station_status.num_bikes_available_types[1].ebike}</br><br><button onclick='ajout_favori(${station_info.station_id},${login})'>Favori</button>`;
                                    marker.bindPopup(popupContent);
                                }
                            }
                        }
                        xhr.open("GET", "curl.php", true); // préparation de la requête HTTP (ici la méthode GET, appel d'un script PHP avec un paramètre)
                        xhr.send(); // envoi de la requête HTTP
                    }

                    function affichageFavori(login) {
                        map.eachLayer(function (layer) {
                            map.removeLayer(layer);
                        });

                        L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
                            maxZoom: 19,
                            attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
                        }).addTo(map);

                        let xhr = new XMLHttpRequest(); // instanciation d'un objet XMLHttpRequest
                        xhr.onreadystatechange = function () {
                            if (xhr.readyState == 4 && xhr.status == 200) {
                                let donnees2 = JSON.parse(xhr.responseText);
                                // récupération de la réponse du serveur au format JSON contenu dans xhr.responseText
                                if (donnees2 == true) {
                                    //recup les données 
                                    //aller dans base de donnée table sttaion avec listefav
                                    let xhr = new XMLHttpRequest(); // instanciation d'un objet XMLHttpRequest
                                    xhr.onreadystatechange = function () {
                                        if (xhr.readyState == 4 && xhr.status == 200) {
                                            let donnees = JSON.parse(xhr.responseText);
                                            for (i = 0; i < donnees.data.stations_information.data.stations.length; i++) {
                                                //recup les données
                                                var station_id = station_info.station_id;
                                                var login = '<?php //echo json_encode($login); ?>';

                                                var marker = L.marker([station_info.lat, station_info.lon]).addTo(map);
                                                var popupContent = `<br>${station_info.station_id}</br><br>${station_info.name}</br><br> nombre de place disponible : ${station_status.num_docks_available}</br><br> vélo disponible : ${station_status.num_bikes_available}</br><br>vélo mécanique : ${station_status.num_bikes_available_types[0].mechanical}</br><br>vélo électrique : ${station_status.num_bikes_available_types[1].ebike}</br><br><button onclick='ajout_favori(${station_info.station_id},${login})'>Favori</button>`;
                                                marker.bindPopup(popupContent);
                                            }
                                        }
                                    }
                                    xhr.open("GET", "recup_info_station_fav.php?listeStationFav=" + donnees2, true); // préparation de la requête HTTP (ici la méthode GET, appel d'un script PHP avec un paramètre)
                                    xhr.send(); // envoi de la requête HTTP                                }
                                    //alors change couleur
                                }
                            }
                            xhr.open("GET", "recup_favori.php?utilisateur=" + login, true); // préparation de la requête HTTP (ici la méthode GET, appel d'un script PHP avec un paramètre)
                            xhr.send();
                        }

                </script>
                <button onclick="affichageTout()">Afficher toutes les stations</button>
                <button onclick="affichageFavori('<?php echo $login ?>')">Afficher les stations favoris</button>
            </div>
        </div>>

    </main>
    <footer style=''>
        <a href="index.html">Déconnexion</a>
    </footer>
</body>

</html>
