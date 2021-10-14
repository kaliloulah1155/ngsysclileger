<?php

 
    include ('../../../../../configuration_w/mabd.php');
 
    // $logger= $_GET['logger'] ;

     $select_fiche= $_GET['select_fiche'] ;

     //matricule

     $matricule= '';

      $matricule= $_GET['matricule'] ;

    // echo $logger .' / '.$select_fiche;


       
       $g_log ='';


    $query =" SELECT  \"LOG\" FROM public.pos_tab_index_prs WHERE  \"MAT\" ='".$matricule."'";
    
    $contests = pg_query($query) or die('Query failed: ' . pg_last_error());

    $g_myarray = array() ;

     while ($row = pg_fetch_row($contests)) {
         $g_log = $row[0];
     }




 
    if ($select_fiche == "ATTESTATION DE CONGE") {

     
        if(!empty($g_log)){

        $query_abs =" SELECT \"AUN\", \"DT4\",\"CRE\",\"NUD\" FROM public.pos_tab_index_abs WHERE  ( \"AUN\" ='CONGE ANNUEL' OR \"AUN\" ='CONGE DE MATERNITE' )   AND \"CRE\" ='".$g_log."'" ;
         $contests_abs = pg_query($query_abs) or die('Query failed: ' . pg_last_error());

            $myarray_abs = array() ;

             while ($row_abs = pg_fetch_row($contests_abs)) {
                 $myarray_abs[] = $row_abs;
             }

           echo json_encode($myarray_abs);  

       }else{
           echo  'Matricule introuvable';
       }

    }

    if ($select_fiche == "ATTESTATION DE TRAVAIL") {
        //echo 'ATT TRAVAIL';

        // echo json_encode($g_myarray);
    }

     
    if ($select_fiche == "ATTESTATION DE STAGE") {
        //echo 'ATT STAGE';
    }
   

    if ($select_fiche == "CERTIFICAT DE TRAVAIL") {
       // echo 'CERT TRAVAIL';
    }
   
 
   

?>