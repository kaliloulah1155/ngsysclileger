<?php
include ("../../../../../configuration_w/mabd.php");
     
$queryN = "SELECT libelle FROM public.nationalite";
    
    $contestsN = pg_query($queryN) or die('Query failed: ' . pg_last_error());

   $myarrayN = [] ;
    while ($rowN = pg_fetch_row($contestsN)) {
        $myarrayN[] = utf8_encode($rowN[0]);
        
      
    }

   /* if(!$contestsN){
    	echo "error";
    }

    $myarrayN=pg_fetch_all($contestsN);
*/
     //print_r( $myarrayN );
     echo json_encode($myarrayN);
      
  



     

