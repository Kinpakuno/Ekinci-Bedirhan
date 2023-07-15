<?php
session_start(); // démarre une session (doit être placé avant tout affichage)
?>
<!DOCTYPE html>

<html lang="fr"> 
    <head>
        <title>Suppression</title>
        <meta charset="UTF-8" />

    </head>
    <body>
        <h1> Suppression </h1>


<?php

require_once("../connexion.inc.php");

if (isset($_GET['nom'])) {
    $titre = $_GET['nom'];
    $essaie = 1;
}
if (isset($_GET['supp'])) {
    $essaie = 2;
}
if (isset($_GET['suppTotal'])) {
    $essaie = 3;
}
if (isset($_GET['libelle'])) {
    $libelle = $_GET['libelle'];
}
if (isset($_GET['titre'])) {
    $titre = $_GET['titre'];
}

if ($essaie == 2) {
    // suppression de la question
    try {
        $pdo = new PDO(DSN, UTILISATEUR, MDP); // tentative de connexion
    }
    catch(PDOException $e) {
        echo "problème de connexion\n";
        echo $e->getMessage();
        exit(1); // on arrête le script
    }
    try {
        $requetePreparee = $pdo->prepare('DELETE FROM question WHERE titre_qcm=? AND libellé=?');
        $requetePreparee->bindParam(1, $titre, PDO::PARAM_STR);
        $requetePreparee->bindParam(2, $libelle, PDO::PARAM_STR);
        $resultat = $requetePreparee->execute(); // tentative de suppression
        if ($resultat) {
            // echo "la suppression a réussi\n";
        }
        else {
            // echo "échec de la suppression\n";
            echo $requetePreparee->errorInfo()[2], "\n";
        }
    }
    catch(PDOException $e) {
        echo "problème avec la requête de suppression\n";
        echo $e->getMessage();
        exit(1); // on arrête le script
    }
    $pdo = NULL; //fermeture de la connexion

    // suppression de la répponse
    try {
        $pdo = new PDO(DSN, UTILISATEUR, MDP); // tentative de connexion
    }
    catch(PDOException $e) {
        echo "problème de connexion\n";
        echo $e->getMessage();
        exit(1); // on arrête le script
    }
    try {
        $requetePreparee = $pdo->prepare('DELETE FROM reponse WHERE titre_qcm=? AND libellé=?');
        $requetePreparee->bindParam(1, $titre, PDO::PARAM_STR);
        $requetePreparee->bindParam(2, $libelle, PDO::PARAM_STR);
        $resultat = $requetePreparee->execute(); // tentative de suppression
        if ($resultat) {
            // echo "la suppression a réussi\n";
        }
        else {
            // echo "échec de la suppression\n";
            echo $requetePreparee->errorInfo()[2], "\n";
        }
    }
    catch(PDOException $e) {
        echo "problème avec la requête de suppression\n";
        echo $e->getMessage();
        exit(1); // on arrête le script
    }
    $pdo = NULL; //fermeture de la connexion
}

if ($essaie == 1 || $essaie == 2) {
    try {
        $pdo = new PDO(DSN, UTILISATEUR, MDP); // tentative de connexion
    } catch(PDOException $e) {
        echo "problème de connexion\n";
        echo $e->getMessage();
        exit(1); // on arrête le script
    }

    try {
        $requetePreparee = $pdo->prepare('SELECT * FROM question WHERE titre_qcm=?');
        $requetePreparee->bindParam(1, $titre, PDO::PARAM_STR);
        $resultat = $requetePreparee->execute();
        if ($resultat) {
            $lignes = $requetePreparee->fetchAll(); // on essaie de récupérer toutes les lignes
            echo '<p>QCM : ', $titre, "<br><br>\n";
            for($i = 0; $i < count($lignes); $i++) {
                echo " Question n°: ", $lignes[$i]['numero'], " \n";
                echo "(", $lignes[$i]['nombre_point'], " point(s)) \n";
                echo $lignes[$i]['libellé'], "\n";
                echo '<a href="supprimer.php?libelle=', $lignes[$i]['libellé'], '&titre=', $titre, '&supp=true" request="request"> supprimer </a><br>';
                echo " Réponse 1 : ", $lignes[$i]['réponse1'], "<br>\n";
                echo " Réponse 2 : ", $lignes[$i]['réponse2'], "<br>\n";
                echo " Réponse 3 : ", $lignes[$i]['réponse3'], "<br>\n";
                echo " Réponse 4 : ", $lignes[$i]['réponse4'], "<br><br>\n";
            }
            echo "</p>\n";
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
    
    echo '<a href="supprimer.php?suppTotal=true&titre=', $titre, '" request="request"><button type="submit">Supprimer le QCM </button></a>', "\n";
}

if ($essaie == 3) {
    // suppression du qcm
    try {
        $pdo = new PDO(DSN, UTILISATEUR, MDP); // tentative de connexion
    }
    catch(PDOException $e) {
        echo "problème de connexion\n";
        echo $e->getMessage();
        exit(1); // on arrête le script
    }
    try {
        $requetePreparee = $pdo->prepare('DELETE FROM question WHERE titre_qcm=?');
        $requetePreparee->bindParam(1, $titre, PDO::PARAM_STR);
        $resultat = $requetePreparee->execute(); // tentative de suppression
        if ($resultat) {
            // echo "la suppression a réussi\n";
        }
        else {
            // echo "échec de la suppression\n";
            echo $requetePreparee->errorInfo()[2], "\n";
        }
    }
    catch(PDOException $e) {
        echo "problème avec la requête de suppression\n";
        echo $e->getMessage();
        exit(1); // on arrête le script
    }
    $pdo = NULL; //fermeture de la connexion
    
    try {
        $pdo = new PDO(DSN, UTILISATEUR, MDP); // tentative de connexion
    }
    catch(PDOException $e) {
        echo "problème de connexion\n";
        echo $e->getMessage();
        exit(1); // on arrête le script
    }
    try {
        $requetePreparee = $pdo->prepare('DELETE FROM reponse WHERE titre_qcm=?');
        $requetePreparee->bindParam(1, $titre, PDO::PARAM_STR);
        $resultat = $requetePreparee->execute(); // tentative de suppression
        if ($resultat) {
            // echo "la suppression a réussi\n";
        }
        else {
            // echo "échec de la suppression\n";
            echo $requetePreparee->errorInfo()[2], "\n";
        }
    }
    catch(PDOException $e) {
        echo "problème avec la requête de suppression\n";
        echo $e->getMessage();
        exit(1); // on arrête le script
    }
    $pdo = NULL; //fermeture de la connexion
    
    try {
        $pdo = new PDO(DSN, UTILISATEUR, MDP); // tentative de connexion
    }
    catch(PDOException $e) {
        echo "problème de connexion\n";
        echo $e->getMessage();
        exit(1); // on arrête le script
    }
    try {
        $requetePreparee = $pdo->prepare('DELETE FROM qcm WHERE titre=?');
        $requetePreparee->bindParam(1, $titre, PDO::PARAM_STR);
        $resultat = $requetePreparee->execute(); // tentative de suppression
        if ($resultat) {
            // echo "la suppression a réussi\n";
        }
        else {
            // echo "échec de la suppression\n";
            echo $requetePreparee->errorInfo()[2], "\n";
        }
    }
    catch(PDOException $e) {
        echo "problème avec la requête de suppression\n";
        echo $e->getMessage();
        exit(1); // on arrête le script
    }
    $pdo = NULL; //fermeture de la connexion
}

?>
        <form action="indexFormateur.php" method="post">
            <button type="submit"> Accueil </button>
        </form>
    <footer>
        <div>
            <p>Maureen Zanotto  </p>
        </div>
    </footer>
    </body>
</html>
