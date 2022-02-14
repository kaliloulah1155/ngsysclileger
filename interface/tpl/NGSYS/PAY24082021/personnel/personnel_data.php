<?php
       
    include ('../../../../../configuration_w/mabd.php');

    
    $email=$_POST['email'];
    $data = array() ;
    $query_="
	            SELECT
	                 \"NOM\",\"PRE\",\"MAT\"
	           FROM 
	               public.pos_tab_index_prs
	           WHERE \"MEL\"='".$email."'
	           ";
   
	 $contests_= pg_query($query_) or die('Query failed: ' . pg_last_error());
     while ($row = pg_fetch_row($contests_)) {
    
         $data[] = $row;
     }

     $query_cot="
	            SELECT
	                 \"LVL\",\"ENT\",\"ASN\",\"TYE\"
	           FROM 
	               public.pos_tab_index_cot
	           WHERE \"MEL\"='".strtolower($email)."'
	           ";
   
	 $contests_cot= pg_query($query_cot) or die('Query failed: ' . pg_last_error());
     while ($row_cot = pg_fetch_row($contests_cot)) {
    
         $data[] = $row_cot;
     }





     echo json_encode($data); 


 

?>