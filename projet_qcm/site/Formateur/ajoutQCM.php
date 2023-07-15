<?php
session_start(); // démarre une session (doit être placé avant tout affichage)
?>
<!DOCTYPE html>

<html lang="fr"> 
    <head>
        <title>Nouveau QCM</title>
        <meta charset="UTF-8" />
    </head>
    <body>


<?php

require_once("../connexion.inc.php");

if (isset($_POST['ajout'])) {
    $titre = $_POST['ajout'];
    $_SESSION['titre'] = $titre;
    $ajout = true;
    echo '<p>', $titre, '</p>', "\n";
} else {
    $ajout = false;
    if (isset($_POST['renvoie'])) {
        $premier = false;
        $titre = $_SESSION['titre'];
        echo '<p>', $titre, '</p>', "\n";
    } else {
        $premier = true;
    }
}

if ($ajout == false) {
    if ($premier == true) {
        $créer = false;
        $date = $_POST['date'];
        $titre = $_POST['titre'];
        $_SESSION['titre'] = $titre;
        
        echo '<h1> Création d\'un QCM </h1>', "\n";
        echo '<p>', $titre, '</p>', "\n";
        
        try {
            $pdo = new PDO(DSN, UTILISATEUR, MDP); // tentative de connexion
            } catch(PDOException $e) {
                echo "problème de connexion\n";
                echo $e->getMessage();
                exit(1); // on arrête le script en renvoyant un code d'erreur choisi par nous
            }
            try {
                $requetePreparee = $pdo->prepare('INSERT INTO qcm (titre, créer_le) VALUES (?, ?)');
                $requetePreparee->errorInfo();
                $requetePreparee->bindParam(1, $titre, PDO::PARAM_STR);
                $requetePreparee->bindParam(2, $date, PDO::PARAM_STR);
                $resultat = $requetePreparee->execute();
                if ($resultat) {
                    $créer = true;
                    // echo "réussie\n";
                } else {
                    $créer = false;
                    // echo "échec\n";
                    echo $requetePreparee->errorInfo()[2], "\n";
                }
            }
            catch(PDOException $e) {
                echo "problème avec la requête d'insertion\n";
                echo $e->getMessage();
                exit(1); // on arrête le script
            }
        $pdo = NULL; //fermeture de la connexion
    }

    if ($premier == false) {
        
        $libelle = $_POST['libelle'];
        if (isset($_POST['image'])) { 
            $image = $_POST['image'];
        } else { 
            $image = "False"; 
        }
        $reponse1 = $_POST['réponse1'];
        $reponse2 = $_POST['réponse2'];
        $reponse3 = $_POST['réponse3'];
        $reponse4 = $_POST['réponse4'];
        if (isset($_POST["correcte"])) {
            $reponse = $_POST["correcte"];
            
            switch($reponse) {
                case 1 :
                    $reponseCorrecte = "réponse1";
                    break;
                case 2 :
                    $reponseCorrecte = "réponse2";
                    break;
                case 3 :
                    $reponseCorrecte = "réponse3";
                    break;
                case 4 :
                    $reponseCorrecte = "réponse4";
                    break;        
            }
        }
        $nombre_point = $_POST['point'];

        
        // insertion des questions
        try {
            $pdo = new PDO(DSN, UTILISATEUR, MDP); // tentative de connexion
        } catch(PDOException $e) {
            echo "problème de connexion\n";
            echo $e->getMessage();
            exit(1); 
        }

        try {
            $requetePreparee = $pdo->prepare('INSERT INTO question (numero, libellé, image, réponse1, réponse2, réponse3, réponse4, nombre_point, titre_qcm) VALUES (default, ?, ?, ?, ?, ?, ?, ?, ?)');
            $requetePreparee->errorInfo();
            $requetePreparee->bindParam(1, $libelle, PDO::PARAM_STR);
            $requetePreparee->bindParam(2, $image, PDO::PARAM_STR);
            $requetePreparee->bindParam(3, $reponse1, PDO::PARAM_STR);
            $requetePreparee->bindParam(4, $reponse2, PDO::PARAM_STR);
            $requetePreparee->bindParam(5, $reponse3, PDO::PARAM_STR);
            $requetePreparee->bindParam(6, $reponse4, PDO::PARAM_STR);
            $requetePreparee->bindParam(7, $nombre_point, PDO::PARAM_STR);
            $requetePreparee->bindParam(8, $titre, PDO::PARAM_STR);
            $resultat = $requetePreparee->execute();
            if ($resultat) {
                $verifQuestion = true;
                // echo "réussie\n";
            } else {
                $verifQuestion = false;
                // echo "échec\n";
                echo $requetePreparee->errorInfo()[2], "\n";
            }
        }
        catch(PDOException $e) {
            echo "problème avec la requête d'insertion\n";
            echo $e->getMessage();
            exit(1);
        }
        $pdo = NULL;
        
        
        // insertion des réponses
        $correcte = $_POST['correcte'];
        
        try {
            $pdo = new PDO(DSN, UTILISATEUR, MDP); // tentative de connexion
        } catch(PDOException $e) {
            echo "problème de connexion\n";
            echo $e->getMessage();
            exit(1);
        }

        try {
            $requetePreparee = $pdo->prepare('INSERT INTO reponse (numero, correcte, libellé, titre_qcm) VALUES (default, ?, ?, ?)');
            $requetePreparee->errorInfo();
            $requetePreparee->bindParam(1, $correcte , PDO::PARAM_STR);
            $requetePreparee->bindParam(2, $libelle , PDO::PARAM_STR);
            $requetePreparee->bindParam(3, $titre , PDO::PARAM_STR);
            $resultat = $requetePreparee->execute();
            if ($resultat) {
                $verifReponse = true;
                // echo "réussie\n";
            } else {
                $verifReponse = false;
                // echo "échec\n";
                echo $requetePreparee->errorInfo()[2], "\n";
            }
        }
        catch(PDOException $e) {
            echo "problème avec la requête d'insertion\n";
            echo $e->getMessage();
            exit(1);
        }
        $pdo = NULL;
    }
}
    
if ($premier == false || $ajout == true) {
    try {
        $pdo = new PDO(DSN, UTILISATEUR, MDP); // tentative de connexion
    } catch(PDOException $e) {
        echo "problème de connexion\n";
        echo $e->getMessage();
        exit(1); // on arrête le script
    }
    
    try {
        $enregistrer = $titre;
        //$requetePreparee = $pdo->prepare('SELECT * FROM question WHERE titre_qcm=', "'", $enregistrer, "'");
        $requetePreparee = $pdo->prepare('SELECT * FROM question WHERE titre_qcm=?');
        $requetePreparee->bindParam(1, $enregistrer, PDO::PARAM_STR);
        $resultat = $requetePreparee->execute();
        if ($resultat) {
            $lignes = $requetePreparee->fetchAll(); // on essaie de récupérer toutes les lignes
            for($i = 0; $i < count($lignes); $i++) {
                if (isset($lignes[$i]['numero'])) {
                    echo '<p> Question n° ', $lignes[$i]['numero'], " : (", $lignes[$i]['nombre_point'], " point(s)) \n";
                    echo $lignes[$i]['libellé'], "<br>\n";
                    if (!isset($lignes[$i]['image'])) {
                         echo '<img src="../image/', $lignes[$i]['image'], '" alt="image">', "<br><br>\n";
                    }
//                     echo 'Réponse 1 : ', $lignes[$i]['réponse1'], "<br>\n";
                    echo 'Réponse 2 : ', $lignes[$i]['réponse2'], "<br>\n";
                    echo 'Réponse 3 : ', $lignes[$i]['réponse3'], "<br>\n";
                    echo 'Réponse 4 : ', $lignes[$i]['réponse4'], "</p><br><br>\n";
                }
            }
        } else {
            // echo "échec\n";
            echo $requetePreparee->errorInfo()[2], "\n";
        }
    } catch(PDOException $e) {
        echo "problème avec la requête de sélection\n";
        echo $e->getMessage();
        exit(1); // on arrête le script
    }
    $pdo = NULL; //fermeture de la connexion
}
?>
        <div>
            <form action="ajoutQCM.php" method="post">
        
                <label for="libelle"> libellé : </label>
                <input id="libelle" name="libelle" type="text" placeholder="libelle" required="required"/><br><br>
        
                <label for="point"> Nombre de points : </label>
                <input id="point" name="point" type="number" placeholder="0" required="required"/><br><br>
        
                <label  for="image"> image src : </label>
                <input  id="image" name="image" type="text" placeholder="source de l'image"/><br><br>
                
                <label  for="réponse1"> réponse n° 1 : </label>
                <input  id="réponse1" name="réponse1" type="text" placeholder="réponse1 :" required="required"/><br><br>
        
                <label  for="réponse2"> réponse n° 2 : </label>
                <input  id="réponse2" name="réponse2" type="text" placeholder="réponse2 :" required="required"/><br><br>
        
                <label for="réponse3"> réponse n° 3 : </label>
                <input  id="réponse3" name="réponse3" type="text" placeholder="réponse3 :" required="required"/><br><br>
        
                <label  for="réponse4"> réponse n° 4 : </label>
                <input  id="réponse4" name="réponse4" type="text" placeholder="réponse4 :" required="required"/><br><br>
        
                <p > réponse correcte :</p>
                <input id="correcte" name="correcte" type="radio" value="1">réponse1</input>
                <input  id="correcte" name="correcte" type="radio" value="2">réponse2</input><br><br>
                <input  id="correcte" name="correcte" type="radio" value="3">réponse3</input>
                <input  id="correcte" name="correcte" type="radio" value="4">réponse4</input><br><br>

                <input name="renvoie" type="hidden" value="renvoie"/>

                <button type="submit" >Enregistrer</button>
                
            </form>
        
            <form action="indexFormateur.php" method="post">
                <button type="submit"> Accueil </button>
            </form>
        </div>
    </body>
</html>
