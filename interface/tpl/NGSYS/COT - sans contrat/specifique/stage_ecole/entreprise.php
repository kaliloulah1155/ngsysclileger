<?php

    include ('../../../../../../configuration_w/mabd.php');
     
     $init_entreprise=trim($_GET['init_entreprise']);
     
     $query = "SELECT  libelle  FROM public.cot_entreprise ORDER BY libelle ASC";
    $contests = pg_query($query) or die('Query failed: ' . pg_last_error());

    while ($row = pg_fetch_row($contests)) {
    
    	  echo '<option value="'.$row[0].'" '.($row[0]==$init_entreprise ? 'selected': '').'   >'.$row[0].'</option>';
    }



?>   