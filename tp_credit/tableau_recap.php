<!DOCTYPE html>

<html lang="fr"> 
    <head>
        <title> Tableau récapitulatif </title>
        <meta charset = 'utf-8' />
    </head>
    <body>
    
        <table>
        
            <thead>
                <tr> 
                    <th>Montant</th>
                    <th>Durée</th>
                    <th>Taux</th>
                    <th>Numéro de la mensualité</th>
                    <th>Capital restant dû avant l'échéance</th>
                    <th>Intérêts</th>
                    <th>Amortissement</th>
                    <th>Montant mensualité</th>
                </tr>
            </thead>
            
            <tbody> 
                <tr>
                    <th></th> 
                
                </tr>
            
        </table>
        
<?php 

$valeurs = [$_POST["interet"]];
echo '<img src="diagramme.php?valeurs=' . urlencode(serialize($valeurs)) . '" />', "\n";

?>
        
    </body>
</html>
