<?php
include ('../../../../../configuration_w/mabd.php');

    $email=$_GET['email'];
    $data = array() ;

    if(!empty($email)){
	    $query_="
		            SELECT
		                 \"NOM\",\"PRE\"
		           FROM 
		               public.pos_tab_index_prs
		           WHERE \"MEL\"='".$email."' ORDER BY \"NOM\" ASC
		           ";

		 $contests_= pg_query($query_) or die('Query failed: ' . pg_last_error());
	     while ($row = pg_fetch_row($contests_)) {
	    
	         $data[] = $row;
	     }
	     echo json_encode($data); 
	  }


?>