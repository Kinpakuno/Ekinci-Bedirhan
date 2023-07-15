<?php
session_start(); // démarre une session (doit être placé avant tout affichage)
?>
<!DOCTYPE html>

<html lang="fr"> 
    <head>
        <title>Stagiaire</title>
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

div {
    text-align: center;
    margin-top: 50px;
}

a {
    display: block;
    margin-bottom: 20px;
    text-decoration: none;
    color: #333;
    font-weight: bold;
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
<?php

require_once("../connexion.inc.php");

?>    
    <body>
        <h1>QCM</h1>
        
        <div>
            <div>
                
                <a href="acces.php">Accèder aux QCM :</a>
                
            </div>
            <div>
            
                <a href="resultatSta.php">Visualiser les résultats :</a>
                
            </div>
        </div>

    <footer>
        <form action="../index.php" method="post">
        <br>
            <button type="submit">Déconnexion</button>
        </form><br>
        <div>
             <p>Maureen Zanotto  </p>
        </div>
    </footer>
    </body>
</html>
