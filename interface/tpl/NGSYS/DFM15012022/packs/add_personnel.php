<?php 
 include ("../../../../../configuration_w/mabd.php");

  $query = 'SELECT "MEL","NOM","PRE" FROM public.pos_tab_index_prs';
    
    $contests = pg_query($query) or die('Query failed: ' . pg_last_error());

    $myarray = array() ;

    while ($row = pg_fetch_array($contests)) {
        $myarray[] = $row;
    }
      
    echo json_encode($myarray);