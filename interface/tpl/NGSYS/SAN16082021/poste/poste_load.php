<?php

 include ("../../../../../configuration_w/mabd.php");

   
    $email=$_POST['email'];
       
   
    $query ="SELECT
    \"IPO\"
FROM 
  public.pos_tab_index_fpo
WHERE \"MEL\"='".strtolower($email)."' ORDER BY \"NUD\" DESC LIMIT 1
";;
    
     $contests = pg_query($query) or die('Query failed: ' . pg_last_error());

    $myarray = array() ;

     while ($row = pg_fetch_row($contests)) {
         $myarray[] = $row;
     }

    echo json_encode($myarray);

    
 
?>