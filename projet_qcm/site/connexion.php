<?php
session_start(); // démarre une session (doit être placé avant tout affichage)
?>
<!DOCTYPE html>

<html lang="fr"> 
    <head>
        <title>Authentification</title>
        <meta charset="UTF-8" />
    </head>
    <body>
        <h1>QCM</h1>
 
<?php

require_once("connexion.inc.php");
require_once("function.php");

$identifiant = $_POST['id'];
$pwd = $_POST['passwd'];
$empreinte = empreinte($pwd);
$verification = false;

try {
    $pdo = new PDO(DSN, UTILISATEUR, MDP); // tentative de connexion
} catch(PDOException $e) {
    echo "problème de connexion\n";
    echo $e->getMessage();
    exit(1); // on arrête le script
}

try {
    $requetePreparee = $pdo->prepare('SELECT * FROM utilisateur');
    $resultat = $requetePreparee->execute();
    if ($resultat) {
        $lignes = $requetePreparee->fetchAll(); // on essaie de récupérer toutes les lignes;
        for($i = 0; $i < count($lignes); $i++) {
            if ($identifiant == $lignes[$i]['identifiant']) {
                if ($empreinte == $lignes[$i]['mot_de_passe']) {
                    if ($lignes[$i]['profil'] == 'Formateur' || $lignes[$i]['profil'] == 'formateur') {
                        $profil = "formateur";
                        $verification = true;
                    } elseif ($lignes[$i]['profil'] == 'Stagiaire' || $lignes[$i]['profil'] == 'stagiaire') {
                        $profil = "stagiaire";
                        $verification = true;
                    }
                }
            }
            
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
?>
<?php
if ($verification == true && $profil == "formateur") {
    $_SESSION['login'] = $identifiant;
    $_SESSION['profil'] = $profil;
    echo '<a href="Formateur/indexFormateur.php"><button type= "submit"> Formateur </button></a>';

    
} elseif ($verification == true && $profil =="stagiaire") {
    $_SESSION['login'] = $identifiant;
    $_SESSION['profil'] = $profil;
    echo '<a href="Stagiaire/indexStagiaire.php"><button type= "submit"> Stagiaire </button></a>';


} else {

?>
        <p> Les informations fournies sont incorrectes. <p>
        <form action="connexion.php" method="post">
            <label for="id">Identifiant</label></br>
            <input id="id" name="id" type="text" placeholder="Identifiant" required="required"/></br></br>
            
            <label for="passwd">Mot de passe</label></br>
            <input id="passwd" name="passwd" type="password" placeholder="Mot de passe" required="required"/></br></br>
            
            <button type="submit">Se connecter</button>
        </form>
    <footer>
        <div>
            <p>Maureen Zanotto  </p>
        </div>
    </footer>
    </body>
<?php
}
?>
</html>
