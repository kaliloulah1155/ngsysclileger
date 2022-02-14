<?php

    include ('../../../../../configuration_w/mabd.php');

    $init_pays=trim($_GET['init_pays']);

    $init_pays='';

  //  echo $init_pays;
         
     $query = "SELECT alpha3,nom_fr_fr FROM pays ORDER BY  nom_fr_fr ASC;";
    $contests = pg_query($query) or die('Query failed: ' . pg_last_error());

    while ($row = pg_fetch_row($contests)) {
    
    	  echo '<option value="'.$row[0].'"  '.($row[0]==$init_pays ? 'selected': '').'    >'.$row[1].'</option>';
    }

?>      