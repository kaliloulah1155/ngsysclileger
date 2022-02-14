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

       //Get fonction of user

        $query_fposte="
                SELECT
                     \"IPO\"
               FROM    
                   public.pos_tab_index_fpo
               WHERE \"MEL\"='".strtolower($email)."'
               ORDER BY \"NUD\" DESC LIMIT 1
               ";
         $contests_fposte = pg_query($query_fposte) or die('Query failed: ' . pg_last_error());
          $fpo_fonction='';
         while($rowfpos=pg_fetch_row($contests_fposte)){

            $data[]=$rowfpos[0];
            
         }





     echo json_encode($data); 


 

?>