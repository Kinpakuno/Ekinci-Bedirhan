<?php
session_start(); // démarre une session (doit être placé avant tout affichage)
?>
<!DOCTYPE html>

<html lang="fr"> 
    <head>
        <title>QCM</title>
        <meta charset="UTF-8" />

    </head>
    <style>
    body {
    font-family: Arial, sans-serif;
    background-color: #f2f2f2;
    margin: 0;
    padding: 0;
}

h1 {
    text-align: center;
}

p {
    text-align: center;
}

form {
    display: inline-block;
}

button {
    padding: 10px 20px;
    background-color: #333;
    color: #fff;
    border: none;
    border-radius: 3px;
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
        <h1> Exercice : QCM </h1>

<?php

require_once("../connexion.inc.php");

if (isset($_GET['nom'])) {
    $qcm = $_GET['nom'];
    $_SESSION['titre'] = $qcm;
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
            echo '<p>QCM:', $qcm, "<br><br>\n";
            echo '<form action="verif.php" method="post">', "\n";
            for($i = 0; $i < count($lignes); $i++) {
                echo " Question n°: ", $lignes[$i]['numero'], " \n";
                echo "(", $lignes[$i]['nombre_point'], " points(s)) \n";
                echo $lignes[$i]['libellé'], "<br>\n";
                if (isset($lignes[$i]['image'])) {
                 //   echo '<img class="img" src="../image/', $lignes[$i]['image'], '" alt="image">', "<br>\n";
                }
                echo '<input type="radio" name="', $lignes[$i]['numero'], '" value="1"> Réponse 1 : ', $lignes[$i]['réponse1'], '</input>', "<br>\n";
                echo '<input type="radio" name="', $lignes[$i]['numero'], '" value="2"> Réponse 2 : ', $lignes[$i]['réponse2'], '</input>', "<br>\n";
                echo '<input type="radio" name="', $lignes[$i]['numero'], '" value="3"> Réponse 3 : ', $lignes[$i]['réponse3'], '</input>', "<br>\n";
                echo '<input type="radio" name="', $lignes[$i]['numero'], '" value="4"> Réponse 4 : ', $lignes[$i]['réponse4'], '</input>', "<br><br>\n";
            }
            echo '<button type="submit"> Valider </button>', "\n";
            echo '</form>', "\n";
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
        <form action="indexStagiaire.php" method="post">
            <button type="submit"> Accueil </button>
        </form>
    <footer>
        <div>
             <p>Maureen Zanotto  </p>
        </div>
    </footer>
    </body>
</html>
