<?php
   include ('../../../../../../configuration_w/mabd.php');

   $data=[];

    $rq = pg_query($conn,"
    SELECT
        \"MAT\",\"NOM\",\"PRE\",\"MEL\",\"TPH\",\"DAE\",\"NUD\"
    FROM 
            public.pos_tab_index_prs
    ");

    while ($row = pg_fetch_row($rq)) {
        $data[] =$row; 	 
   }
 
   echo json_encode($data);
           

        