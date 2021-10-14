<?php

    include ('../../../../../../configuration_w/mabd.php');

      $init_fonction=trim($_GET['init_fonction']);
     
     $query = "SELECT  \"IPO\"  FROM public.pos_tab_index_pos ORDER BY \"IPO\"  ASC";
    $contests = pg_query($query) or die('Query failed: ' . pg_last_error());

    while ($row = pg_fetch_row($contests)) {
    
    	  echo '<option value="'.$row[0].'"  '.($row[0]==$init_fonction ? 'selected': '').'    >'.$row[0].'</option>';
    }



?>      