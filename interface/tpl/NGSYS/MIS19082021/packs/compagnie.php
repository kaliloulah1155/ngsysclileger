<?php

    include ('../../../../../configuration_w/mabd.php');

    $init_compagnie=trim($_GET['init_compagnie']);
         
    $query = "SELECT  id,libelle  FROM public.compagnie ORDER BY libelle ASC";
    $contests = pg_query($query) or die('Query failed: ' . pg_last_error());

    while ($row = pg_fetch_row($contests)) {
    
    	  echo '<option value="'.$row[1].'"  '.($row[1]==$init_compagnie ? 'selected': '').'    >'.$row[1].'</option>';
    }



?>      