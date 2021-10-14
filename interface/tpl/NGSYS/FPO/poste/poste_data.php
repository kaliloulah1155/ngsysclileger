<?php
       
    include ('../../../../../configuration_w/mabd.php');


    $poste=$_GET['poste'];
    $data = array() ;
     $query_="
	            SELECT
	                 \"COD\"
	           FROM 
	               public.pos_tab_index_pos
	           WHERE \"IPO\"='".$poste."'
	           ";

	 $contests_= pg_query($query_) or die('Query failed: ' . pg_last_error());
     while ($row = pg_fetch_row($contests_)) {
    
         $data[] = $row;
     }
     echo json_encode($data); 


 

?>