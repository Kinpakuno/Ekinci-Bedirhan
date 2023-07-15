<?php
session_start(); // démarre une session (doit être placé avant tout affichage)
?>
<!DOCTYPE html>

<html lang="fr"> 
    <head>
        <title>Modification QCM</title>
        <meta charset="UTF-8" />
        <link rel="stylesheet" href="../css/fiche.css">
    </head>
    <body>
        <h1> Modification du QCM </h1>

<?php

require_once("../connexion.inc.php");

$titre = $_POST['titre'];
$ancienLibelle = $_POST['ancienLibelle'];
$ancienpoint = $_POST['ancienPoint'];
$ancienImage = $_POST['ancienImage'];
$ancienR1 = $_POST['ancienReponse1'];
$ancienR2 = $_POST['ancienReponse2'];
$ancienR3 = $_POST['ancienReponse3'];
$ancienR4 = $_POST['ancienReponse4'];
$ancienCorrecte = $_POST['ancienCorrecte'];

$nvLibelle = $_POST['nvLibelle'];
$nvPoint = $_POST['nvPoint'];
$nvImage = $_POST['nvImage'];
$nvR1 = $_POST['nvReponse1'];
$nvR2 = $_POST['nvReponse2'];
$nvR3 = $_POST['nvReponse3'];
$nvR4 = $_POST['nvReponse4'];
if (isset($_POST["correcte"])) {
    $reponse = $_POST["correcte"];
    
    switch($reponse) {
        case 1 :
            $reponseCorrecte = 1;
            break;
        case 2 :
            $reponseCorrecte = 2;
            break;
        case 3 :
            $reponseCorrecte = 3;
            break;
        case 4 :
            $reponseCorrecte = 4;
            break;        
    }
}

try {
    $pdo = new PDO(DSN, UTILISATEUR, MDP); // tentative de connexion
} catch(PDOException $e) {
    echo "problème de connexion\n";
    echo $e->getMessage();
    exit(1); // on arrête le script
}
try {
    $requetePreparee = $pdo->prepare('UPDATE question SET libellé=?, image=?, réponse1=?, réponse2=?, réponse3=?, réponse4=?, nombre_point=? WHERE titre_qcm=? AND libellé=?');
    $requetePreparee->bindParam(1, $nvLibelle, PDO::PARAM_STR);
    $requetePreparee->bindParam(2, $nvImage, PDO::PARAM_STR);
    $requetePreparee->bindParam(3, $nvR1, PDO::PARAM_STR);
    $requetePreparee->bindParam(4, $nvR2, PDO::PARAM_STR);
    $requetePreparee->bindParam(5, $nvR3, PDO::PARAM_STR);
    $requetePreparee->bindParam(6, $nvR4, PDO::PARAM_STR);
    $requetePreparee->bindParam(7, $nvPoint, PDO::PARAM_STR);
    $requetePreparee->bindParam(8, $titre, PDO::PARAM_STR);
    $requetePreparee->bindParam(9, $ancienLibelle, PDO::PARAM_STR);
    $resultat = $requetePreparee->execute(); // tentative de mise à jour
    if ($resultat) {
        echo '<p>La mise à jour a réussi<br><br>', "\n";
    } else {
        echo "<p>échec de la mise à jour</p>\n";
        echo $requetePreparee->errorInfo()[2], "\n";
    }
} catch(PDOException $e) {
    echo "problème avec la requête de mise à jour\n";
    echo $e->getMessage();
    exit(1); // on arrête le script
}
$pdo = NULL; //fermeture de la connexion

try {
    $pdo = new PDO(DSN, UTILISATEUR, MDP); // tentative de connexion
} catch(PDOException $e) {
    echo "problème de connexion\n";
    echo $e->getMessage();
    exit(1); // on arrête le script
}
try {
    $requetePreparee = $pdo->prepare('UPDATE reponse SET correcte=?, libellé=? WHERE titre_qcm=? AND libellé=?');
    $requetePreparee->bindParam(1, $reponseCorrecte, PDO::PARAM_STR);
    $requetePreparee->bindParam(2, $nvLibelle, PDO::PARAM_STR);
    $requetePreparee->bindParam(3, $titre, PDO::PARAM_STR);
    $requetePreparee->bindParam(4, $ancienLibelle, PDO::PARAM_STR);
    $resultat = $requetePreparee->execute(); // tentative de mise à jour
    if ($resultat) {
        // echo "la mise à jour a réussi\n";
    } else {
        // echo "échec de la mise à jour\n";
        echo $requetePreparee->errorInfo()[2], "\n";
    }
} catch(PDOException $e) {
    echo "problème avec la requête de mise à jour\n";
    echo $e->getMessage();
    exit(1); // on arrête le script
}
$pdo = NULL; //fermeture de la connexion

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
        echo '<p2>QCM:', $titre, "<br><br>\n";
        for($i = 0; $i < count($lignes); $i++) {
            echo " Question n°: ", $lignes[$i]['numero'], " \n";
            echo "(", $lignes[$i]['nombre_point'], " points(s)) \n";
            echo $lignes[$i]['libellé'], "<br>\n";
            echo " Réponse 1 : ", $lignes[$i]['réponse1'], "<br>\n";
            echo " Réponse 2 : ", $lignes[$i]['réponse2'], "<br>\n";
            echo " Réponse 3 : ", $lignes[$i]['réponse3'], "<br>\n";
            echo " Réponse 4 : ", $lignes[$i]['réponse4'], "<br><br>\n";
        }
        echo "</p2></p>\n";
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


?>
        <form action="indexFormateur.php" method="post">
            <button type="submit"> Accueil </button>
        </form>
    <footer>
        <div>
            <p>Maureen Zanotto </p>
        </div>
    </footer>
    </body>
</html>
