<?php
session_start(); // démarre une session (doit être placé avant tout affichage)
?>
<!DOCTYPE html>

<html lang="fr"> 
    <head>
        <title>Resultat</title>
        <meta charset="UTF-8" />
    </head>
    <body>

<?php
require_once("../connexion.inc.php");

echo '<h1> Résultat des QCM </h1>', "\n";
$nom = $_SESSION['login'];

try {
    $pdo = new PDO(DSN, UTILISATEUR, MDP); // tentative de connexion
} catch(PDOException $e) {
    echo "problème de connexion\n";
    echo $e->getMessage();
    exit(1); // on arrête le script
}
try {
    $requetePreparee = $pdo->prepare('SELECT * FROM resultat WHERE utilisateur=?');
    $requetePreparee->bindParam(1, $nom, PDO::PARAM_STR);
    $resultat = $requetePreparee->execute();
    if ($resultat) {
        $lignes = $requetePreparee->fetchAll(); // on essaie de récupérer toutes les lignes
        echo '<table>', "\n";
            echo '<thead>', "\n";
                echo '<tr>', "\n";
                    echo '<th> QCM </th>', "\n";
                    echo '<th> Note </th>', "\n";
                    echo '<th> Date </th>', "\n";
                echo '</tr>', "\n";
            echo '</thead>', "\n";
            echo '<tbody>', "\n";
        for($i = 0; $i < count($lignes); $i++) {
            echo '<tr title="qcm : ', $lignes[$i]['titre_qcm'], '">', "\n";
                echo '<td>', $lignes[$i]['titre_qcm'], '</td>', "\n";
                echo '<td>', $lignes[$i]['nombres_points'], "/20", '</td>', "\n";
                echo '<td>', $lignes[$i]['date'], '</td>', "\n";
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
        <form action="indexStagiaire.php" method="post">
            <button type="submit">Accueil</button>
        </form><br>
        <div>
             <p>Maureen Zanotto  </p>
        </div>
    </footer>
    </body>
</html>
