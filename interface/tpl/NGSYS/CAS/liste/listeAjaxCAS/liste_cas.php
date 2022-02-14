<?php
   include ('../../../../../../configuration_w/mabd.php');

   $data=[];

    $rq = pg_query($conn,"
    SELECT
        \"COD\",\"DCR\",\"NUD\"
    FROM 
            public.pos_tab_index_cas
    ");

    while ($row = pg_fetch_row($rq)) {
        $data[] =$row; 	 
   }
 
   echo json_encode($data);
           

   