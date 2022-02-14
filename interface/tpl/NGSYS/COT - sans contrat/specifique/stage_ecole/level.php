<?php

    include ('../../../../../../configuration_w/mabd.php');

    $init_level=trim($_GET['init_level']);
     
     $query = "SELECT  libelle  FROM public.cot_level ORDER BY libelle ASC";
    $contests = pg_query($query) or die('Query failed: ' . pg_last_error());

    while ($row = pg_fetch_row($contests)) {
    
    	  echo '<option value="'.$row[0].'"  '.($row[0]==$init_level ? 'selected': '').'  >'.$row[0].'</option>';
    }



?>   