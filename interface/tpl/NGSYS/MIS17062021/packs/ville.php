<?php

    include ('../../../../../configuration_w/mabd.php');

    $init_ville=trim($_GET['init_ville']);
         
    $query = "SELECT  libelle  FROM public.ville ORDER BY libelle ASC";
    $contests = pg_query($query) or die('Query failed: ' . pg_last_error());

    while ($row = pg_fetch_row($contests)) {
    
    	  echo '<option value="'.$row[0].'"  '.($row[0]==$init_ville ? 'selected': '').'    >'.$row[0].'</option>';
    }



?>      