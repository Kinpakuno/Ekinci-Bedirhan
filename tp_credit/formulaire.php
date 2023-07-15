<?php
session_start();

if (isset($_SESSION['montant1'])) {
    $montant1 = $_SESSION['montant1'];
} else {
    $montant1 = '';
}

if (isset($_SESSION['duree2'])) {
    $duree2 = $_SESSION['duree2'];
} else {
    $duree2 = '';
}

if (isset($_SESSION['taux3'])) {
    $taux3 = $_SESSION['taux3'];
} else {
    $taux3 = '';
}

?>
<!DOCTYPE html>

<html lang="fr"> 
    <head>
        <title> Formulaire </title>
        <meta charset = 'utf-8' />
        <link rel="stylesheet" href="style.css">
    </head>
    <style>
    body {
    font-family: Arial, sans-serif;
    background-color: #f2f2f2;
    margin: 0;
    padding: 0;
}

header {
    background-color: #333;
    color: #fff;
    padding: 10px;
    text-align: center;
}

main {
    text-align: center;
    margin-top: 50px;
}

h1 {
    color: #333;
}

form {
    display: flex;
    flex-direction: column;
    align-items: center;
}

label {
    margin-bottom: 10px;
}

input[type="text"] {
    padding: 5px;
    width: 200px;
    border: 1px solid #ccc;
    border-radius: 3px;
}

input[type="radio"] {
    margin: 10px;
}

button {
    padding: 10px 20px;
    background-color: #333;
    color: #fff;
    border: none;
    border-radius: 3px;
    cursor: pointer;
}

a {
    display: inline-block;
    padding: 10px 20px;
    background-color: #333;
    color: #fff;
    text-decoration: none;
    margin-bottom: 10px;
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
        <header>
            tp_credit
        </header>
        
        <main>
            <h1> Formulaire </h1>
            
            <form action="credit.php" method="post">
                
                <label for="montant">Montant : </label>
                <input id="montant" name="montant" type="text" placeholder="montant" required="required" value="<?= $montant1?>"/>
                
                <label for="duree">Durée : </label>
                <input id="duree" name="duree" type="text" placeholder="duree" required="required" value="<?= $duree2?>"/>
                
                <label for="taux">Taux : </label>
                <input id="taux" name="taux" type="text" placeholder="taux" required="required" value="<?= $taux3?>"/>
                
                 <input type="radio" name="proportionnel" value="1">Proportionnel</input> 
                 <input type="radio" name="proportionnel" value="2">Actuariel</input></br> 
                
                <button type="submit">ajouter </button>

            </form>
            
            <br><a href="index.php">Accueil</a></br> 
        </main>
        
        <footer>
            Zanotto Maureen
        </footer>
    </body>
</html>
