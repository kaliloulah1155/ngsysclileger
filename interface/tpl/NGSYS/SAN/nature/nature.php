<?php

    include ('../../../../../configuration_w/mabd.php');

      $init_nature=trim($_GET['init_nature']);
         
     $query = "SELECT  libelle  FROM public.san_nature ORDER BY libelle ASC";
    $contests = pg_query($query) or die('Query failed: ' . pg_last_error());

    while ($row = pg_fetch_row($contests)) {
    
    	  echo '<option value="'.$row[0].'"  '.($row[0]==$init_nature ? 'selected': '').'    >'.$row[0].'</option>';
    }



?>      