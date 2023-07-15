<?php
session_start(); // démarre une session (doit être placé avant tout affichage)
?>
<!DOCTYPE html>

<html lang="fr"> 
    <head>
        <title>Consultation</title>
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

a {
    text-decoration: none;
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

<?php
require_once("../connexion.inc.php");

echo '<h1> Liste des QCM </h1>', "\n";
echo '<p> Choisir un QCM <br><br>', "\n";

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
            echo $lignes[$i]['titre'], ' <a href="exerciceQCM.php?nom=', $lignes[$i]['titre'], '" request="request"><button type="submit">Lancer</button></a><br>';
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


?>

    <footer>
        <form action="indexStagiaire.php" method="post">
            <button type="submit">Accueil</button>
        </form><br>
        <div>
              <p>Maureen Zanotto </p>
        </div>
    </footer>
    </body>
</html>
