<?php
include ("../../../../../configuration_w/mabd.php");

$logger=$_GET['logger'];

 
//$result = pg_query("SELECT * FROM public.pos_tab_index_tms WHERE \"CRE\"='".$userinfo."' AND \"DXT\"='".$datechck."' AND \"DPT\"='".$departement."' ");

$query = "SELECT  \"CIV\",\"BQE\",\"RIB\" FROM public.pos_tab_index_prs  WHERE \"LOG\"='".$logger."' ";
    
    $contests = pg_query($query) or die('Query failed: ' . pg_last_error());

    $myarray = array() ;

    while ($row = pg_fetch_row($contests)) {
        $myarray[] = $row;
    }

    echo json_encode($myarray);

      