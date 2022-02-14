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


      //poste 

     $poste='';
    $query_poste ="SELECT
    \"IPO\"
        FROM 
        public.pos_tab_index_fpo
        WHERE \"MEL\"='".strtolower($email)."' ORDER BY \"NUD\" DESC LIMIT 1
        ";
    
     $contests_poste = pg_query($query_poste) or die('Query failed: ' . pg_last_error());


     while ($row_poste = pg_fetch_row($contests_poste)) {
        $poste = $row_poste[0];
     }
     $data[] = $poste;


     echo json_encode($data); 


 

?>