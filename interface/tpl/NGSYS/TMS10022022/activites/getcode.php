<?php 

    include ('../../../../../configuration_w/mabd.php');


    $fonction=$_POST['fonction'];

    

    $data ='';
     $query_="
	            SELECT
	                 \"COD\"
	           FROM 
	               public.pos_tab_index_pos
	           WHERE \"IPO\"='".$fonction."'
	           ";

	 $contests_= pg_query($query_) or die('Query failed: ' . pg_last_error());
     while ($row = pg_fetch_row($contests_)) {
    
         $data= $row[0];
     }
     echo ($data); 



