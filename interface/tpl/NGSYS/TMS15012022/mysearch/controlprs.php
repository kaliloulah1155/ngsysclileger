<?php 

include ("../../../../../configuration_w/mabd.php");

$query =" SELECT  \"LOG\" FROM public.pos_tab_index_prs WHERE  \"DPT\" ='".$_POST['departement']."'";
    
     $contests = pg_query($query) or die('Query failed: ' . pg_last_error());

    $myarray = array() ;

     while ($row = pg_fetch_row($contests)) {
         $myarray[] = $row;
     }
 echo json_encode($myarray);