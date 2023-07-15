<?php
session_start(); // démarre une session (doit être placé avant tout affichage)
?>
<!DOCTYPE html>

<html lang="fr"> 
    <head>
        <title>Compte</title>
        <meta charset="UTF-8" />

    </head>

<?php

require_once("../connexion.inc.php");

?>

    <body>
        <h1> Créer un compte </h1> 

        <div>
            <form action="ajtStagiaire.php" method="post">
                <label  for="id">Identifiant</label></br>
                <input  id="id" name="id" type="text" placeholder="Identifiant" required="required"/></br></br>
                
                <label  for="passwd">Mot de passe</label></br>
                <input  id="passwd" name="passwd" type="password" placeholder="Mot de passe" required="required"/></br></br>
                
                <button type="submit">Créer</button>
            </form>
        </div>
        
    <footer>
        <form action="indexFormateur.php" method="post">
            <button type="submit">Accueil</button>
        </form>
        <div>
            <p>Maureen Zanotto  </p>
        </div>
    </footer>
    </body>
</html>
