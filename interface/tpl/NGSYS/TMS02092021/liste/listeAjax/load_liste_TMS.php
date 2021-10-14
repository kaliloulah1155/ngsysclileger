<?php 


	include ('../../../../../../configuration_w/mabd.php');

	$user_email='';

	$user_email= $_GET['user_email'] ;

	$profil_util= $_GET['profil_util'] ;

	$departement= $_GET['departement'] ;
    
	
      // echo $profil_util;
	
	$data = array() ;

	$query_tms_data ="";


    // if($profil_util=="MANAGER" OR $profil_util=="ADMIN" ){

	if($profil_util=="RH" OR $profil_util=="ADMIN"){

		$query_tms_rh ="
	           SELECT
	                UPPER(prs.\"NOM\"),UPPER(prs.\"PRE\"),tms.\"SXM\",tms.\"DT4\",tms.\"NUD\",UPPER(prs.\"MEL\")
	           FROM 
	                public.pos_tab_index_tms tms
	           INNER JOIN  public.pos_tab_index_prs prs
	           ON  tms.\"CRE\"= UPPER(prs.\"MEL\")
	           ";
        
        $query_tms_data=$query_tms_rh;

	}
	else if($profil_util=="MANAGER"){

     	$query_tms_manager ="
	           SELECT
	                UPPER(prs.\"NOM\"),UPPER(prs.\"PRE\"),tms.\"SXM\",tms.\"DT4\",tms.\"NUD\",UPPER(prs.\"MEL\")
	           FROM 
	                public.pos_tab_index_tms tms
	           INNER JOIN  public.pos_tab_index_prs prs
	           ON  tms.\"CRE\"= UPPER(prs.\"MEL\")

	           WHERE tms.\"DPT\"='".strtoupper($departement)."'
	           ";
        
        $query_tms_data=$query_tms_manager;

     }else{

     	$query_tms_employe ="
	            SELECT
	                UPPER(prs.\"NOM\"),UPPER(prs.\"PRE\"),tms.\"SXM\",tms.\"DT4\",tms.\"NUD\",UPPER(prs.\"MEL\")
	           FROM 
	                public.pos_tab_index_tms tms
	           INNER JOIN  public.pos_tab_index_prs prs
	           ON  tms.\"CRE\"= UPPER(prs.\"MEL\")

	           WHERE tms.\"CRE\"='".strtoupper($user_email)."'
	           " ;

     	$query_tms_data=$query_tms_employe;

     }


	



	 if(!empty($query_tms_data)){


	 	$contests_tms = pg_query($query_tms_data) or die('Query failed: ' . pg_last_error());

             while ($row_tms = pg_fetch_row($contests_tms)) {
            
                 $data[] = $row_tms;
             }
           echo json_encode($data); 

	 }
         


          


?>