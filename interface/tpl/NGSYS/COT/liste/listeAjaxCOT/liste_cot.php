<?php
   include ('../../../../../../configuration_w/mabd.php');
   

	$user_email=$_POST['user_email'] ;
	$profil_util=$_POST['profil'] ;

	
	$data = array() ;

	$query_cot_data ="";


    // if($profil_util=="MANAGER" OR $profil_util=="ADMIN" ){

	if(
      $profil_util=="RH" OR
     $profil_util=="ADMIN"
     OR
     $profil_util=="DGA"
     OR
     $profil_util=="DG"   
     OR
     $profil_util=="MANAGER_ADM"
     ){

		$query_cot_rh ="
        SELECT
            \"NOM\",\"PRE\",\"TYE\",\"DSG\",\"NUD\",\"MEL\"
        FROM 
            public.pos_tab_index_cot
	           ";
        $query_cot_data=$query_cot_rh;

	}
	else{

     	$query_cot_employe ="
	           SELECT
                    \"NOM\",\"PRE\",\"TYE\",\"DSG\",\"NUD\",\"MEL\"
	           FROM 
	                public.pos_tab_index_cot 
	           WHERE \"MEL\"='".strtolower($user_email)."'
	           ";
        
        $query_cot_data=$query_cot_employe;

     }

	 if(!empty($query_cot_data)){

	 	$contests_cot = pg_query($query_cot_data) or die('Query failed: ' . pg_last_error());

             while ($row_cot = pg_fetch_row($contests_cot)) {
            
                 $data[] = $row_cot;
             }
           echo json_encode($data); 

	 }

/*
    $rq = pg_query($conn,"
    SELECT
        \"NOM\",\"PRE\",\"TYE\",\"DSG\",\"NUD\"
    FROM 
            public.pos_tab_index_cot
    ");

    while ($row = pg_fetch_row($rq)) {
        $data[] =$row; 	 
   }
       
   echo json_encode($data);
   */
           

   