<?php
session_start(); // démarre une session (doit être placé avant tout affichage)
?>
<!DOCTYPE html>

<html lang="fr"> 
    <head>
        <title>Modification QCM</title>
        <meta charset="UTF-8" />

    </head>
    <body>
        <h1> Modification du QCM </h1>

<?php

require_once("../connexion.inc.php");

if (isset($_GET['nom'])) {
    $libelle = $_GET['nom'];
    $qcm = $_GET['titre'];
}

if (isset($libelle)) {
    try {
        $pdo = new PDO(DSN, UTILISATEUR, MDP); // tentative de connexion
    } catch(PDOException $e) {
        echo "problème de connexion\n";
        echo $e->getMessage();
        exit(1); // on arrête le script
    }
    try {
        $requetePreparee = $pdo->prepare('SELECT * FROM question WHERE libellé=?');
        $requetePreparee->bindParam(1, $libelle, PDO::PARAM_STR);
        $resultat = $requetePreparee->execute();
        if ($resultat) {
            $lignes = $requetePreparee->fetchAll(); // on essaie de récupérer toutes les lignes
            echo '<p>QCM : ', $qcm, "<br><br>\n";
            for($i = 0; $i < count($lignes); $i++) {
                echo " Question n°: ", $lignes[$i]['numero'], " \n";
                echo "(", $lignes[$i]['nombre_point'], " point(s)) \n";
                $point = $lignes[$i]['nombre_point'];
                echo $lignes[$i]['libellé'], "<br>\n";
                if ($lignes[$i]['image'] != NULL) {
                    echo '<img src="', $lignes[$i]['image'], 'alt="image">', "<br>\n";
                    $image = $lignes[$i]['image'];
                }
                echo " Réponse 1 : ", $lignes[$i]['réponse1'], "<br>\n";
                $r1 = $lignes[$i]['réponse1'];
                echo " Réponse 2 : ", $lignes[$i]['réponse2'], "<br>\n";
                $r2 = $lignes[$i]['réponse2'];
                echo " Réponse 3 : ", $lignes[$i]['réponse3'], "<br>\n";
                $r3 = $lignes[$i]['réponse3'];
                echo " Réponse 4 : ", $lignes[$i]['réponse4'], "<br>\n";
                $r4 = $lignes[$i]['réponse4'];
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
    
    try {
        $pdo = new PDO(DSN, UTILISATEUR, MDP); // tentative de connexion
    } catch(PDOException $e) {
        echo "problème de connexion\n";
        echo $e->getMessage();
        exit(1); // on arrête le script
    }
    try {
        $requetePreparee = $pdo->prepare('SELECT * FROM reponse WHERE titre_qcm=? AND libellé=?');
        $requetePreparee->bindParam(1, $qcm, PDO::PARAM_STR);
        $requetePreparee->bindParam(2, $libelle, PDO::PARAM_STR);
        $resultat = $requetePreparee->execute();
        if ($resultat) {
            $lignes = $requetePreparee->fetchAll(); // on essaie de récupérer toutes les lignes
            for($j = 0; $i < count($lignes); $j++) {
                echo '<p>', $lignes[$j]['correcte'], '<br></p>', "\n";
                $rCorrecte = $lignes[$j]['correcte'];
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
} else {
    echo '<p> Le QCM:', $qcm, "est vide !! </p><br>\n";
}

?>
        <form action="modifierFORM.php" method="post">
        
            <label for="nvLibelle"> Nouveau libellé : </label>
            <input   id="nvLibelle" name="nvLibelle" type="text" placeholder="<?= $libelle?>" required="required"/><br><br>
            
            <label  for="nvPoint"> Nombre de points : </label>
            <input  id="nvPoint" name="nvPoint" type="number" placeholder="<?= $point?>" required="required"/><br><br>
    
            <label  for="nvImage"> image src : </label>
            <input  id="nvImage" name="nvImage" type="text" placeholder="source de l'image"/><br><br>
            
            <label  for="nvReponse1"> réponse n° 1 : </label>
            <input  id="nvReponse1" name="nvReponse1" type="text" placeholder="<?= $r1?>" required="required"/><br><br>
    
            <label  for="nvReponse2"> réponse n° 2 : </label>
            <input  id="nvReponse2" name="nvReponse2" type="text" placeholder="<?= $r2?>" required="required"/><br><br>
    
            <label  for="nvReponse3"> réponse n° 3 : </label>
            <input  id="nvReponse3" name="nvReponse3" type="text" placeholder="<?= $r3?>" required="required"/><br><br>
    
            <label  for="nvReponse4"> réponse n° 4 : </label>
            <input  id="nvReponse4" name="nvReponse4" type="text" placeholder="<?= $r4?>" required="required"/><br><br>
    
            <p> réponse correcte :</p>
            <input  id="correcte" name="correcte" type="radio" value="1">réponse1</input>
            <input  id="correcte" name="correcte" type="radio" value="2">réponse2</input><br><br>
            <input  id="correcte" name="correcte" type="radio" value="3">réponse3</input>
            <input  id="correcte" name="correcte" type="radio" value="4">réponse4</input><br><br>
            
            <input name="titre" type="hidden" value="<?= $qcm?>"/>
            <input name="ancienLibelle" type="hidden" value="<?= $libelle?>"/>
            <input name="ancienPoint" type="hidden" value="<?= $point?>"/>
            <input name="ancienImage" type="hidden" value="<?= $image?>"/>
            <input name="ancienReponse1" type="hidden" value="<?= $r1?>"/>
            <input name="ancienReponse2" type="hidden" value="<?= $r2?>"/>
            <input name="ancienReponse3" type="hidden" value="<?= $r3?>"/>
            <input name="ancienReponse4" type="hidden" value="<?= $r4?>"/>
            <input name="ancienCorrecte" type="hidden" value="<?= $rCorrecte?>"/>

            <button type="submit">Enregistrer</button>
            
        </form>

        <form action="indexFormateur.php" method="post" >
            <button type="submit"> Accueil </button>
        </form>
    <footer>
        <div>
            <p>Maureen Zanotto  </p>
        </div>
    </footer>
    </body>
</html>
