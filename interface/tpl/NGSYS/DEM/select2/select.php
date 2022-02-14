<?php
include ('../../../../../configuration_w/mabd.php');

    $query = "SELECT  \"NOM\", \"PRE\" , \"MAT\"  FROM public.pos_tab_index_prs ORDER BY \"NOM\" ASC";
    $contests = pg_query($query) or die('Query failed: ' . pg_last_error());

    while ($row = pg_fetch_row($contests)) {
    
    	  echo '<option value="'.$row[0].' '.$row[1].'">'.$row[0].' '.$row[1].'</option>';
    }     

?>