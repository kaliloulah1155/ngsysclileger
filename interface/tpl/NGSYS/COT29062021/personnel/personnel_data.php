<?php
       
    include ('../../../../../configuration_w/mabd.php');


    $email=$_GET['email'];
    $data = array() ;
     $query_="
	            SELECT
	                 \"NOM\",\"PRE\",\"MAT\",\"DEI\" ,\"CIV\"
	           FROM 
	               public.pos_tab_index_prs
	           WHERE \"MEL\"='".$email."'
	           ";

	 $contests_= pg_query($query_) or die('Query failed: ' . pg_last_error());
     while ($row = pg_fetch_row($contests_)) {
    
         $data[] = $row;
     }
     echo json_encode($data); 


 

?>