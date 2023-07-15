<?php
session_start(); // démarre une session (doit être placé avant tout affichage)
?>
<!DOCTYPE html>

<html lang="fr"> 
    <head>
        <title>Visualisation</title>
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

table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

thead {
    background-color: #333;
    color: #fff;
}

th, td {
    padding: 10px;
    text-align: left;
}

tr:nth-child(even) {
    background-color: #f2f2f2;
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

echo '<h1> Résultat des QCM </h1>', "\n";

try {
    $pdo = new PDO(DSN, UTILISATEUR, MDP); // tentative de connexion
} catch(PDOException $e) {
    echo "problème de connexion\n";
    echo $e->getMessage();
    exit(1); // on arrête le script
}
try {
    $requetePreparee = $pdo->prepare('SELECT * FROM resultat');
    $resultat = $requetePreparee->execute();
    if ($resultat) {
        $lignes = $requetePreparee->fetchAll(); // on essaie de récupérer toutes les lignes
        echo '<table>', "\n";
            echo '<thead>', "\n";
                echo '<tr>', "\n";
                    echo '<th> Utilisateur </th>', "\n";
                    echo '<th> QCM </th>', "\n";
                    echo '<th> Note </th>', "\n";
                    echo '<th> Date </th>', "\n";
                    echo '<th> Heure </th>', "\n";
                echo '</tr>', "\n";
            echo '</thead>', "\n";
            echo '<tbody>', "\n";
        for($i = 0; $i < count($lignes); $i++) {
            echo '<tr style="color: red" title="profil : ', $lignes[$i]['utilisateur'], '">', "\n";
                echo '<td>', $lignes[$i]['utilisateur'], '</td>', "\n";
                echo '<td>', $lignes[$i]['titre_qcm'], '</td>', "\n";
                echo '<td>', $lignes[$i]['nombres_points'], "/20", '</td>', "\n";
                echo '<td>', $lignes[$i]['date'], '</td>', "\n";
                echo '<td>', $lignes[$i]['heure'], '</td>', "\n";
            echo '</tr>', "\n";
        }
        echo '</tbody>', "\n";
        echo '</table>', "\n";
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
        <form action="indexFormateur.php" method="post">
            <button type="submit"  >Accueil</button>
        </form><br>
        <div>
            <p>Maureen Zanotto  </p>
        </div>
    </footer>
    </body>
</html>
