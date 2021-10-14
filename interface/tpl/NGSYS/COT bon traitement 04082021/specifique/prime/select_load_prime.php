<?php 

   include ('../../../../../../configuration_w/mabd.php');
          

   $query = "SELECT libelle FROM public.prime";
    
    $contests = pg_query($query) or die('Query failed: ' . pg_last_error());

    $myarray = array() ;

    while ($row = pg_fetch_row($contests)) {
        $myarray[] = $row;
    }
           
    echo json_encode($myarray);


?>