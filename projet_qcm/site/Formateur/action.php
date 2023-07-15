<?php
session_start(); // démarre une session (doit être placé avant tout affichage)
?>
<!DOCTYPE html>

<html lang="fr"> 
    <head>
        <title>QCM</title>
        <meta charset="UTF-8" />

    </head>
    <body>

<?php

require_once("../connexion.inc.php");

if (isset($_POST["choix"])) {
    $reponse = $_POST["choix"];
    
    switch($reponse) {
        case 1 :
            $texte = 1;
            break;
        case 2 :
            $texte = 2;
            break;
        case 3 :
            $texte = 3;
            break;
        case 4 :
            $texte = 4;
            break;        
    }
} else {
    echo '<h1> Gestion des QCM </h1>', "\n";

    echo '<div>';
        echo "<p>Vous n'avez pas donné de réponse !</p>\n";
        echo '<a href="gestion.php" request="request"><button type="submit">Retour</button></a>';
    echo '</div>';
}

if ($texte == 1) {
    echo '<h1> Liste des QCM </h1>', "\n";
    
    
    try {
        $pdo = new PDO(DSN, UTILISATEUR, MDP); // tentative de connexion
    } catch(PDOException $e) {
        echo "problème de connexion\n";
        echo $e->getMessage();
        exit(1); // on arrête le script
    }
    try {
        $requetePreparee = $pdo->prepare('SELECT titre FROM qcm');
        $resultat = $requetePreparee->execute();
        if ($resultat) {
            $lignes = $requetePreparee->fetchAll(); // on essaie de récupérer toutes les lignes
            for($i = 0; $i < count($lignes); $i++) {
                echo $lignes[$i]['titre'], '<a href="consulter.php?nom=', $lignes[$i]['titre'], '" request="request"><button type="submit" >Consulter</button></a><br>';
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

    $pdo = NULL; //fermeture de la connexion
    echo "</p>\n";

} elseif ($texte == 2) {
    echo '<h1> Ajout de QCM </h1>', "\n";

    echo '<div>', "\n";
        echo '<form action="ajoutQCM.php" method="post">', "\n";
            echo '<label for="titre">Titre QCM</label>', "<br>\n";
            echo '<input id="titre" name="titre" type="text" placeholder="Titre" required="required"/>', "<br><br>\n";
            
            echo '<label for="date">Date</label>', "<br>\n";
            echo '<input id="date" name="date" type="text" placeholder="Date" required="required"/>', "<br><br>\n";
            
            echo '<button type="submit">Créer</button>', "<br>\n";
        echo '</form>', "\n";
    echo '</div>', "\n";

} elseif ($texte == 3) {
    echo '<h1> Liste des QCM </h1>', "\n";

    
    
    try {
        $pdo = new PDO(DSN, UTILISATEUR, MDP); // tentative de connexion
    } catch(PDOException $e) {
        echo "problème de connexion\n";
        echo $e->getMessage();
        exit(1); // on arrête le script
    }
    try {
        $requetePreparee = $pdo->prepare('SELECT titre FROM qcm');
        $resultat = $requetePreparee->execute();
        if ($resultat) {
            $lignes = $requetePreparee->fetchAll(); // on essaie de récupérer toutes les lignes
            for($i = 0; $i < count($lignes); $i++) {
                echo $lignes[$i]['titre'], '<a href="modifier.php?nom=', $lignes[$i]['titre'], '" request="request"><button type="submit">Modifier</button></a><br>';
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

    $pdo = NULL; //fermeture de la connexion
    echo "</p>\n";


} elseif ($texte == 4) {
    echo '<h1> Liste des QCM </h1>', "\n";

    
    
    try {
        $pdo = new PDO(DSN, UTILISATEUR, MDP); // tentative de connexion
    } catch(PDOException $e) {
        echo "problème de connexion\n";
        echo $e->getMessage();
        exit(1); // on arrête le script
    }
    try {
        $requetePreparee = $pdo->prepare('SELECT titre FROM qcm');
        $resultat = $requetePreparee->execute();
        if ($resultat) {
            $lignes = $requetePreparee->fetchAll(); // on essaie de récupérer toutes les lignes
            for($i = 0; $i < count($lignes); $i++) {
                echo $lignes[$i]['titre'], '<a href="supprimer.php?nom=', $lignes[$i]['titre'], '" request="request"><button type="submit">X</button></a><br>';
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

    $pdo = NULL; //fermeture de la connexion
    echo "</p>\n";
}
?>

    <footer>
        <form action="indexFormateur.php" method="post">
            <button type="submit">Accueil</button>
        </form><br>
        <div>
            <p>Maureen Zanotto  </p>
        </div>
    </footer>
    </body>
</html>
