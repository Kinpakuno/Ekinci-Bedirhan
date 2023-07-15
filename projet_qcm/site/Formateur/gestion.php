<?php
session_start(); // démarre une session (doit être placé avant tout affichage)
?>
<!DOCTYPE html>

<html lang="fr"> 
    <head>
        <title>Gestion</title>
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

form {
    display: flex;
    flex-direction: column;
    align-items: center;
    margin-top: 20px;
}

input[type="radio"] {
    margin-bottom: 10px;
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
        <h1> Gestion des QCM </h1>


<?php

require_once("../connexion.inc.php");

?>
        <div>
            <form action="action.php" method="post">
                <input type="radio" name="choix" value="1">Consulter les qcm</input><br>
                <input type="radio" name="choix" value="2">Ajouter les qcm</input><br>
                <input type="radio" name="choix" value="3">Modifier un qcm</input><br>
                <input type="radio" name="choix" value="4">Supprimer un qcm</input><br><br><br>
                <button type="submit">Valider</button>
            </form>
        </div>
        
    <footer>
        <form action="indexFormateur.php" method="post">
            <button type="submit">Retour</button>
        </form><br>
        <div>
            <p>Maureen Zanotto  </p>
        </div>
    </footer>    
    </body>
</html>
