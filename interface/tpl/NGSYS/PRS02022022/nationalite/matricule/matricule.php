<?php
include ("../../../../../configuration_w/mabd.php");
     
$queryM = 'SELECT "MAT" FROM public.pos_tab_index_prs WHERE inuminfo=(SELECT max(inuminfo) FROM public.pos_tab_index_prs )';
    
    $contestsM = pg_query($queryM) or die('Query failed: ' . pg_last_error());

   $myarrayM = [] ;
    while ($rowM = pg_fetch_row($contestsM)) {
        $myarrayM[] = utf8_encode($rowM[0]);
    }

     echo json_encode($myarrayM);