<?php
session_start(); // démarre une session (doit être placé avant tout affichage)
?>
<!DOCTYPE html>

<html lang="fr"> 
    <head>
        <title>Consulter</title>
        <meta charset="UTF-8" />

    </head>
    <body>
        <h1> Consultation du QCM </h1>


<?php

require_once("../connexion.inc.php");

if (isset($_GET['nom'])) {
    $qcm = $_GET['nom'];
}

if (isset($qcm)) {
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
            echo '<p>QCM : ', $qcm, "<br><br>\n";
            for($i = 0; $i < count($lignes); $i++) {
                echo " Question n°: ", $lignes[$i]['numero'], " \n";
                echo "(", $lignes[$i]['nombre_point'], " points(s)) \n";
                echo $lignes[$i]['libellé'], "<br>\n";
                if (isset($lignes[$i]['image'])) {
                   // echo '<img class="image" src="../image/', $lignes[$i]['image'], '" alt="image">', "\n";                                    
                }
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
} else {
    echo '<p> Le QCM:', $qcm, "est vide !! </p><br>\n";
    echo '<form action="action.php" method="post">', "\n";
        echo '<button type="submit"> Retour </button>', "\n";
    echo '</form>', "\n"; 
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
