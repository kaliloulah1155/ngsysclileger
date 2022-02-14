<?php
include ('../../../../../configuration_w/mabd.php');

    $query = "SELECT  \"NOM\", \"PRE\" , \"MEL\"  FROM public.pos_tab_index_prs ORDER BY \"NOM\" ASC";
    $contests = pg_query($query) or die('Query failed: ' . pg_last_error());

    $init_personnel=$_GET['init_personnel'];

     
   
    while ($row = pg_fetch_row($contests)) {


        if(!empty($row[2])){
    	  echo '<option value="'.$row[2].'"    '.($row[2]==$init_personnel ? "selected": "").'     >'.$row[0].' '.$row[1].'</option>';
        }
    }
 

?>