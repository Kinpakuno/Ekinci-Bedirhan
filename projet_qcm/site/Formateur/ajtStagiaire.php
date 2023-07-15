<?php
session_start(); // démarre une session (doit être placé avant tout affichage)
?>
<!DOCTYPE html>

<html lang="fr"> 
    <head>
        <title>Verification</title>
        <meta charset="UTF-8" />

    </head>
    
    <body>
        <h1> Vérification Compte </h1>
        <br>

<?php

require_once("../connexion.inc.php");
require_once("../function.php");

$profil = "Stagiaire";
$identifiant = $_POST['id'];
$pwd = $_POST['passwd'];
$empreinte = empreinte($pwd);

//echo $identifiant;
//echo $empreinte;

try {
    $pdo = new PDO(DSN, UTILISATEUR, MDP); // tentative de connexion
} catch(PDOException $e) {
    echo "problème de connexion\n";
    echo $e->getMessage();
    exit(1); // on arrête le script en renvoyant un code d'erreur choisi par nous
}


try {
    $requetePreparee = $pdo->prepare('INSERT INTO utilisateur (profil, identifiant, mot_de_passe) VALUES (?, ?, ?)');
    $requetePreparee->errorInfo();
    $requetePreparee->bindParam(1, $profil, PDO::PARAM_STR);
    $requetePreparee->bindParam(2, $identifiant, PDO::PARAM_STR);
    $requetePreparee->bindParam(3, $empreinte, PDO::PARAM_STR);
    $resultat = $requetePreparee->execute();
    if ($resultat) {
        echo '<p> Le compte a bien été créer <p>', "\n";
            echo '<a href="indexFormateur.php"><button type= "submit"> Retour </button></a>';
    } else {
        echo '<p> Une erreur est survenue pendant la création du compte <p>', "\n";
            echo '<a href="creaSta.php"><button type= "submit"> Retour </button></a>';
    }
}
catch(PDOException $e) {
    echo "problème avec la requête d'insertion\n";
    echo $e->getMessage();
    exit(1);
}
$pdo = NULL;

?>
    <footer>
        <div>
            <p>Maureen Zanotto  </p>
        </div>
    </footer>
    </body>
</html>
