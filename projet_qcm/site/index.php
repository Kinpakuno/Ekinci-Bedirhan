<?php
session_start(); // si une session est en cours, on la récupère
session_unset(); // on détruit toutes les variables
session_destroy(); // on détruit la session

session_start(); // on recrée une session
?>
<!DOCTYPE html>

<html lang="fr"> 
    <head>
        <title>Authentification</title>
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
    text-align: center;
    margin-top: 50px;
}

label {
    display: block;
    margin-bottom: 10px;
}

input {
    padding: 5px;
    width: 200px;
    border: 1px solid #ccc;
    border-radius: 3px;
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
        <h1>QCM</h1>
 
<?php

require_once("connexion.inc.php");

?>
        </br>
        </br>
        </br>
        </br>
        </br>
        <form action="connexion.php" method="post">
            <label for="id">Identifiant</label></br>
            <input id="id" name="id" type="text" placeholder="Identifiant" required="required"/></br></br>
            
            <label for="passwd">Mot de passe</label></br>
            <input id="passwd" name="passwd" type="password" placeholder="Mot de passe" required="required"/></br></br>
            
            <button type="submit">Se connecter</button>
        </form>
        
    <footer>
        <div>
            <p>Ekinci Bedirhan  </p>
        </div>
    </footer>
    </body>
</html>
