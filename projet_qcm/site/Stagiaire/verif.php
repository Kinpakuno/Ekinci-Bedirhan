<?php
session_start(); // démarre une session (doit être placé avant tout affichage)
?>
<!DOCTYPE html>

<html lang="fr"> 
    <head>
        <title>Correction</title>
        <meta charset="UTF-8" />
    </head>
    <body>
        <h1> Correction : QCM </h1>

<?php

require_once("../connexion.inc.php");

$compteur  = 0;
$total = 0;
$qcm = $_SESSION['titre'];

try {
    $pdo = new PDO(DSN, UTILISATEUR, MDP); // tentative de connexion
} catch(PDOException $e) {
    echo "problème de connexion\n";
    echo $e->getMessage();
    exit(1); // on arrête le script
}

try {
    $requetePreparee = $pdo->prepare('SELECT * FROM question WHERE titre_qcm=?');
    $requetePreparee->bindParam(1, $qcm, PDO::PARAM_STR);
    $resultat = $requetePreparee->execute();
    if ($resultat) {
        $lignes = $requetePreparee->fetchAll(); // on essaie de récupérer toutes les lignes
        echo "<div>";
        echo '<p>QCM:', $qcm, "</p>\n";
            for($i = 0; $i < count($lignes); $i++) {
                echo '<p><br> Question n°: ', $lignes[$i]['numero'], " \n";
                $numero = $lignes[$i]['numero'];
                echo "(", $lignes[$i]['nombre_point'], " points(s)) \n";
                echo $lignes[$i]['libellé'], "</p>\n";
                $libelle = $lignes[$i]['libellé'];
                if (isset($lignes[$i]['image'])) {
                  //  echo '<img class="image" src="../image/', $lignes[$i]['image'], '" alt="image">', "\n";                                    
                }
                $reponse1 = $lignes[$i]['réponse1'];
                $reponse2 = $lignes[$i]['réponse2'];
                $reponse3 = $lignes[$i]['réponse3'];
                $reponse4 = $lignes[$i]['réponse4'];
                if (isset($_POST["$numero"])) {
                    $reponse = $_POST["$numero"];

                    
                    switch($reponse) {
                        case 1 :
                            $verif = 1;
                            break 1;
                        case 2 :
                            $verif = 2;
                            break 1;
                        case 3 :
                            $verif = 3;
                            break 1;
                        case 4 :
                            $verif = 4;
                            break 1;        
                    }
                }
                
                $requetePreparee1 = $pdo->prepare('SELECT * FROM reponse WHERE titre_qcm=? AND libellé=?');
                $requetePreparee1->bindParam(1, $qcm, PDO::PARAM_STR);
                $requetePreparee1->bindParam(2, $libelle, PDO::PARAM_STR);
                $resultat1 = $requetePreparee1->execute();
                if ($resultat1) {
                    $lignes1 = $requetePreparee1->fetchAll(); // on essaie de récupérer toutes les lignes
                    for($j = 0; $j < count($lignes1); $j++) {
                        $reponse = $lignes1[$j]['correcte'];
                    }
                } else {
                    echo "échec\n";
                    echo $requetePreparee1->errorInfo()[2], "\n";
                }
                
                if ($verif == 1 && $reponse == "1") {
                    echo '<p> Réponse 1 : ', $reponse1, "</p>\n";
                    $compteur = $compteur + $lignes[$i]['nombre_point'];
                } elseif ($verif == 1 && $reponse != "1") {
                    echo '<p> Réponse 1 : ', $reponse1, "</p>\n";
                } elseif ($verif != 1 && $reponse == "1") {
                    echo '<p> Réponse 1 : ', $reponse1, "</p>\n";
                } else {
                    echo '<p> Réponse 1 : ', $reponse1, "</p>\n";
                }
                
                if ($verif == 2 && $reponse == "2") {
                    echo '<p> Réponse 2 : ', $reponse2, "</p>\n";
                    $compteur = $compteur + $lignes[$i]['nombre_point'];
                } elseif ($verif == 2 && $reponse != "2") {
                    echo '<p> Réponse 2 : ', $reponse2, "</p>\n";
                } elseif ($verif != 2 && $reponse == "2") {
                    echo '<p> Réponse 2 : ', $reponse2, "</p>\n";
                } else {
                    echo '<p> Réponse 2 : ', $reponse2, "</p>\n";
                }
                
                if ($verif == 3 && $reponse == "3") {
                    echo '<p> Réponse 3 : ', $reponse3, "</p>\n";
                    $compteur = $compteur + $lignes[$i]['nombre_point'];
                } elseif ($verif == 3 && $reponse != "3") {
                    echo '<p> Réponse 3 : ', $reponse3, "</p>\n";
                } elseif ($verif != 3 && $reponse == "3") {
                    echo '<p> Réponse 3 : ', $reponse3, "</p>\n";
                } else {
                    echo '<p> Réponse 3 : ', $reponse3, "</p>\n";
                }
                
                if ($verif == 4 && $reponse == "4") {
                    echo '<p> Réponse 4 : ', $reponse4, "</p>\n";
                    $compteur = $compteur + $lignes[$i]['nombre_point'];
                } elseif ($verif == 4 && $reponse != "4") {
                    echo '<p> Réponse 4 : ', $reponse4, "</p>\n";
                } elseif ($verif != 4 && $reponse == "4") {
                    echo '<p> Réponse 4 : ', $reponse4, "</p>\n";
                } else {
                    echo '<p> Réponse 4 : ', $reponse4, "</p>\n";
                }
                $total = $total + $lignes[$i]['nombre_point'];
                settype($total, "int");
                settype($compteur, "int");
        }
        $sur20 = round(20 * $compteur / $total);
        echo '<p><br>', $compteur, '/', $total, ' = ', $sur20, '/20', "\n";
        echo "</div>\n";
    } else {
        echo "échec\n";
        echo $requetePreparee->errorInfo()[2], "\n";
    }
} catch(PDOException $e) {
    echo "problème avec la requête de sélection\n";
    echo $e->getMessage();
    exit(1); // on arrête le script
}

$pdo = NULL; //fermeture de la connexion

$date = date('Y-m-d');
$heure = date('H:i:s');
$nbpoint = $sur20;
$utilisateur = $_SESSION['login'];

try {
    $pdo = new PDO(DSN, UTILISATEUR, MDP);
} catch(PDOException $e) {
    echo "problème de connexion\n";
    echo $e->getMessage();
    exit(1);
}

try {
    $requetePreparee = $pdo->prepare('INSERT INTO resultat (numero, date, heure, titre_qcm, nombres_points, utilisateur) VALUES (default, ?, ?, ?, ?, ?)');
    $requetePreparee->errorInfo();
    $requetePreparee->bindParam(1, $date, PDO::PARAM_STR);
    $requetePreparee->bindParam(2, $heure, PDO::PARAM_STR);
    $requetePreparee->bindParam(3, $qcm, PDO::PARAM_STR);
    $requetePreparee->bindParam(4, $nbpoint, PDO::PARAM_STR);
    $requetePreparee->bindParam(5, $utilisateur, PDO::PARAM_STR);
    $resultat = $requetePreparee->execute();
    if ($resultat) {
        // secho "réussie\n";
    } else {
        // echo "échec\n";
        echo $requetePreparee->errorInfo()[2], "\n";
    }
}
catch(PDOException $e) {
    echo "problème avec la requête d'insertion\n";
    echo $e->getMessage();
    exit(1); // on arrête le script
}
$pdo = NULL; //fermeture de la connexion

?>
        <form action="indexStagiaire.php" method="post">
            <button type="submit"> Accueil </button>
        </form>
    <footer>
        <div>
            <p>Maureen Zanotto </p>
        </div>
    </footer>
    </body>
</html>
