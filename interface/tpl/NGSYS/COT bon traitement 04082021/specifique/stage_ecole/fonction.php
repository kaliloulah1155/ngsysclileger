<?php

    include ('../../../../../../configuration_w/mabd.php');

       $init_fonction='';
       $email=$_GET['rq_mail'];

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

            $init_fonction=$rowfpos[0];
            
         }

      //$init_fonction=trim($_GET['init_fonction']);
     
     $query = "SELECT  \"IPO\"  FROM public.pos_tab_index_pos ORDER BY \"IPO\"  ASC";
    $contests = pg_query($query) or die('Query failed: ' . pg_last_error());

    while ($row = pg_fetch_row($contests)) {
    
    	  echo '<option value="'.$row[0].'"  '.($row[0]==$init_fonction ? 'selected': '').'    >'.$row[0].'</option>';
    }

  // echo $init_fonction;

?>      