<?php
include ("../../../../../configuration_w/mabd.php");

$query =" SELECT  \"LIB\" FROM public.pos_tab_index_src WHERE  \"DPT\" ='".$_POST['departement']."'";
    
     $contests = pg_query($query) or die('Query failed: ' . pg_last_error());
    
    $myarray = array() ;

     while ($row = pg_fetch_row($contests)) {
         $myarray[] = $row;
     }

    echo json_encode($myarray);