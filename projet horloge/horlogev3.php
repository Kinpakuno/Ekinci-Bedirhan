<?php 

//$heures = date("G"); // récupère l'heure système
//$minutes = date("i"); // récupère les minutes système

$heures = 0;
$minutes = 0;
$heures2 = 0;

while ($heures < 24){
    while ($minutes < 60){
        
        echo "$heures $minutes ";
        
        if ($minutes >=33){
            $heures = $heures + 1;
        }
        
        if ($heures == 1 || $heures == 13){
            $heures2 = "une heure";
        } elseif ($heures == 2 || $heures == 14){
            $heures2 = "deux heures";
        } elseif ($heures == 3 || $heures == 15){
            $heures2 = "trois heures";
        } elseif ($heures == 4 || $heures == 16){
            $heures2 = "quatres heures";
        } elseif ($heures == 5 || $heures == 17){
            $heures2 = "cinq heures";
        } elseif ($heures == 6 || $heures == 18){
            $heures2 = "six heures";
        } elseif ($heures == 7 || $heures == 19){
            $heures2 = "sept heures";
        } elseif ($heures == 8 || $heures == 20){
            $heures2 = "huit heures";
        } elseif ($heures == 9|| $heures == 21){
            $heures2 = "neuf heures";
        } elseif ($heures == 10 || $heures == 22){
            $heures2 = "dix heures";
        } elseif ($heures == 11 || $heures == 23){
            $heures2 = "onze heures";
        } elseif ($heures == 12 ){
            $heures2 = "midi";
        } elseif ($heures == 0 || $heures == 24){
            $heures2 = "minuit";
        }
        
        
        if ($minutes == 0){
            echo "$heures2 pile\n";
        }elseif ($minutes > 0 && $minutes < 3 || $minutes >= 58 && $minutes < 0){
            echo "$heures2\n";
        }elseif ($minutes >= 3 && $minutes <8) {
            echo "$heures2 cinq\n";
        }elseif ($minutes >= 8 && $minutes < 13) {
            echo "$heures2 dix\n";
        }elseif ($minutes >= 13 && $minutes < 18) {
            echo "$heures2 et quart\n";
        }elseif ($minutes >= 18 && $minutes < 23){
            echo "$heures2 vingt\n";
        }elseif ($minutes >= 23 && $minutes <28) {
            echo "$heures2 vingt-cinq\n";
        }elseif ($minutes >= 28 && $minutes < 33) {
            echo "$heures2 et demie\n";
        }elseif ($minutes >= 33 && $minutes < 38) {
            echo "$heures2 moins vingt-cinq\n";
        }elseif ($minutes >= 38 && $minutes < 43) {
            echo "$heures2 moins vingt\n";
        }elseif ($minutes >= 43 && $minutes < 48){
            echo "$heures2 moins le quart\n";
        }elseif ($minutes >= 48 && $minutes < 53){
            echo "$heures2 moins dix\n";
        }elseif ($minutes >= 53 && $minutes < 58){
            echo "$heures2 moins cinq\n";
        }
        
        if ($minutes >= 33){
            $heures = $heures - 1;
        }
        
        $minutes = $minutes + 1;
    }
    $heures++;
    $minutes = 0;
}

?>
