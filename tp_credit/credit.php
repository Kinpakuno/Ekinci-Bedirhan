<?php
session_start();

if (isset($_POST['montant1'])) {
    $_SESSION['montant1'] = $_POST['montant1'];
    $montant1 = $_POST['montant1'];
    $montant1Valide = true;
} else {
    $montant1 = 'pas de valeur saisie';
    $montant1Valide = false;
}

if (isset($_POST['duree2'])) {
    $_SESSION['duree2'] = $_POST['duree2'];
    $duree2 = $_POST['duree2'];
    $duree2Valide = true;
} else {
    $duree2 = 'pas de valeur saisie';
    $duree2Valide = false;
}

if (isset($_POST['taux3'])) {
    $_SESSION['taux3'] = $_POST['taux3'];
    $taux3 = $_POST['taux3'];
    $taux3Valide = true;
} else {
    $taux3 = 'pas de valeur saisie';
    $taux3Valide = false;
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

table {
    width: 100%;
    border-collapse: collapse;
}

th, td {
    padding: 8px;
    border-bottom: 1px solid #ddd;
}

tr.nom {
    background-color: #f2f2f2;
}

tr.pair {
    background-color: #f9f9f9;
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
           
            <br><h1> Tableau D'Amortissement</h1></br>
            <a href="formulaire.php">Retour</a>
            <a href="index.php">Accueil</a></br></br>
            <a href="#bas">Aller en bas de la page </a></br></br>
    
<?php

if (is_numeric ($_POST ["montant"]) && is_numeric ($_POST ["taux"]) && is_numeric ($_POST ["duree"]) && isset($_POST["proportionnel"]) || isset($_POST["actuariel"])){
        
    $capitaleaamortir = $_POST ["montant"];
    
    if ($_POST["proportionnel"] == 1) {
        $tauxmensuel = $_POST ["taux"] / 12 / 100;
    } else {
        $tauxmensuel = (1 + ($_POST ["taux"]/100)) ** (1/12) -1;
    }
    
    $interet = $capitaleaamortir * $tauxmensuel;
    $amortissement1 = $capitaleaamortir * $tauxmensuel / ((1 + $tauxmensuel) ** $_POST ["duree"] - 1);
    $amortissement = $amortissement1;
    $montantmensualite = $amortissement1 + $interet;
    
?>

            <p>
                <table>
                    <thead>
                        <tr class='nom'> 
                            <th>Numéro de la mensualité</th>
                            <th>Capital restant dû avant l'échéance</th>
                            <th>Intérêts</th>
                            <th>Amortissement</th>
                            <th>Montant mensualité</th>
                        </tr>
                    </thead>
                    
                    <tbody> 
                        <tr>
                            <td> <?php echo "1"; ?> </td> 
                            <td> <?php echo $capitaleaamortir, " €"; ?> </td>
                            <td> <?php echo number_format ($interet, 2, ",", " "), " €"; ?> </td>
                            <td> <?php echo number_format ($amortissement1, 2, ",", " "), " €"; ?> </td>
                            <td> <?php echo number_format ($montantmensualite, 2, ",", " "), " €"; ?> </td>
                        </tr>
                
<?php
$tabinteret = [];
    for ($i = 2; $i <= $_POST ["duree"]; $i++) {
        $capitaleaamortir = $capitaleaamortir - $amortissement;
        $interet = $capitaleaamortir * $tauxmensuel;
        $tabinteret[] = $interet;
        $amortissement = $amortissement1 * (1 + $tauxmensuel) ** ($i - 1);
        $montantmensualite = $amortissement + $interet;
        
        if ($i % 2 == 0) { 
            echo "<tr class='pair'><td> $i </td> <td>",  number_format ($capitaleaamortir, 2, ",", " "), " €", " </td> <td> ", number_format ($interet,2, ",", " "), " €", " </td> <td>", number_format ($amortissement,2, ",", " "), " €", " </td> <td>", number_format ($montantmensualite, 2, ",", " "), " €", "</td></tr>", "\n";
        } else {
            echo "<tr><td> $i </td> <td>",  number_format ($capitaleaamortir, 2, ",", " "), " €", " </td> <td> ", number_format ($interet,2, ",", " "), " €", " </td> <td>", number_format ($amortissement,2, ",", " "), " €", " </td> <td>", number_format ($montantmensualite, 2, ",", " "), " €", "</td></tr>", "\n";
        }
    }
    //$_SESSION["tabinteret[]"];
} else {
    echo "Les valeurs saisies ne sont pas bonnes";
}


    
?>

<?php echo "Montant : ", $_POST ["montant"], " €,", "\n";?></br>
<?php echo "Durée : ", $_POST ["duree"], " mois,", "\n";?></br>
<?php echo "Taux : ", $_POST ["taux"], "%,\n";?></br>

                
                    </tbody>

                </table>
            </p>
            <a name="bas" href="#top">Aller en haut de la page </a> </br></br>
        </main>
        
        <footer>
            Zanotto Maureen
        </footer>
        
    </body>
</html>
