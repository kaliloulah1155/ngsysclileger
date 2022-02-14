<?php 

    include ("../../../../../configuration_w/mabd.php");



     $query = "SELECT  libelle  FROM public.ptitre ORDER BY libelle ASC";
    $contests = pg_query($query) or die('Query failed: ' . pg_last_error());

    while ($row = pg_fetch_row($contests)) {
    
    	  echo '<option value="'.$row[0].'"   >'.$row[0].'</option>';
    }




?>