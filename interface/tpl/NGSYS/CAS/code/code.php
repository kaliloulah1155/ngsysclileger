<?php
include ("../../../../../configuration_w/mabd.php");
     
$queryC = 'SELECT "COD" FROM public.pos_tab_index_cas WHERE inuminfo=(SELECT max(inuminfo) FROM public.pos_tab_index_cas )';
    
    $contestsC = pg_query($queryC) or die('Query failed: ' . pg_last_error());

   $myarrayC = [] ;
    while ($rowC = pg_fetch_row($contestsC)) {
        $myarrayC[] = utf8_encode($rowC[0]);
    }

     echo json_encode($myarrayC);