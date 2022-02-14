<?php
	include ("../../../../../configuration_w/mabd.php");

		$user_email=$_GET['user_email_s'];
		$date_search=$_GET['date_search'];
		$nom_pre=$_GET['nom_pre'];
		$service=$_GET['service_s'];
		$departement=$_GET['departement_s'];

	 
		$query='';
		$find=0;
        $data = array() ;

        
         $query_init="
	            SELECT
	                UPPER(prs.\"NOM\"),UPPER(prs.\"PRE\"),tms.\"SXM\",tms.\"DT4\",tms.\"NUD\"
	           FROM 
	                public.pos_tab_index_tms tms
	           INNER JOIN  public.pos_tab_index_prs prs
	           ON  tms.\"CRE\"= UPPER(prs.\"MEL\")

	           WHERE tms.\"CRE\"='".strtoupper($user_email)."'
	        
	           ";

	     $query_tms_data =$query_init;



	   if(!empty($user_email) AND !empty($date_search)){

	    $query_tms_employe="
	            SELECT
	                UPPER(prs.\"NOM\"),UPPER(prs.\"PRE\"),tms.\"SXM\",tms.\"DT4\",tms.\"NUD\"
	           FROM 
	                public.pos_tab_index_tms tms
	           INNER JOIN  public.pos_tab_index_prs prs
	           ON  tms.\"CRE\"= UPPER(prs.\"MEL\")

	           WHERE tms.\"CRE\"='".strtoupper($user_email)."'
	            AND tms.\"DT4\"='".$date_search."'

	           ";

	        $query=pg_query($query_tms_employe);
	        $find = pg_num_rows($query);

	        if($find!=0){
	        	$query_tms_data =$query_tms_employe;
	        }else{
	        	 $query_tms_data =$query_init;
	        }

	       

	           //$query_tms_data =$query_tms_employe;
	    }


	    if(!empty($query_tms_data)){

	 	$contests_tms = pg_query($query_tms_data) or die('Query failed: ' . pg_last_error());

             while ($row_tms = pg_fetch_row($contests_tms)) {
            
                 $data[] = $row_tms;
             }
           echo json_encode($data); 

	 }else{

	           $contests_tms = pg_query($query_tms_data) or die('Query failed: ' . pg_last_error());

             while ($row_tms = pg_fetch_row($contests_tms)) {
            
                 $data[] = $row_tms;
             }
           echo json_encode($data); 

	 }


?>