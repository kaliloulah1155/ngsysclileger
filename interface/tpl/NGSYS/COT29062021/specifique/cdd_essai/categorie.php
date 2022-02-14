<?php 

    include ('../../../../../../configuration_w/mabd.php');

     $init_categorie=trim($_GET['init_categorie']);

     $query = "SELECT  \"CAE\"  FROM public.pos_tab_index_cat ORDER BY \"CAE\" ASC";
    $contests = pg_query($query) or die('Query failed: ' . pg_last_error());

    while ($row = pg_fetch_row($contests)) {
    
    	  echo '<option value="'.$row[0].'"  '.($row[0]==$init_categorie ? 'selected': '').'  >'.$row[0].'</option>';
    }


?>