<?php 

    include ('../../../../../../configuration_w/mabd.php');

     $init_domaine=trim($_GET['init_domaine']);
     
     $query = "SELECT  libelle  FROM public.cot_domaine ORDER BY libelle ASC";
    $contests = pg_query($query) or die('Query failed: ' . pg_last_error());

    while ($row = pg_fetch_row($contests)) {
    
    	  echo '<option value="'.$row[0].'"  '.($row[0]==$init_domaine ? 'selected': '').'  >'.$row[0].'</option>';
    }


?>