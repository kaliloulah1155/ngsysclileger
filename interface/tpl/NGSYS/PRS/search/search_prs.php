<?php    
	include ("../../../../../configuration_w/mabd.php");

		$date_deb=$_POST['date_deb'];
		$date_fin=$_POST['date_fin'];
		$email=$_POST['email'];

		//echo $email.' '.$date_deb.' '.$date_fin;

	 
		$query='';
		$find=0;
        $data = array() ;

        
         $query_init="
	            SELECT
					\"MAT\",\"NOM\",\"PRE\",\"MEL\",\"TPH\",\"DEI\",\"NUD\"
	           FROM 
	                public.pos_tab_index_prs
	           ";

	     $query_prs_data =$query_init;

	   
	    if(!empty($date_deb)  AND !empty($date_fin)  ){

	    $query_prs_date="
				SELECT \"MAT\",\"NOM\",\"PRE\",\"MEL\",\"TPH\",\"DEI\",\"NUD\"
				FROM pos_tab_index_prs 
				WHERE  \"DEI\" BETWEEN '".$date_deb."' AND '".$date_fin."'
	           ";

	        $query=pg_query($query_prs_date);
	        $find = pg_num_rows($query);

	        if($find!=0){
	        	$query_prs_data =$query_prs_date;
	        }else{
	        	 $query_prs_data =$query_init;
	        }
	    }

	   if(!empty($email)){

	    $query_prs_mail="

		       SELECT \"MAT\",\"NOM\",\"PRE\",\"MEL\",\"TPH\",\"DEI\",\"NUD\"
				FROM pos_tab_index_prs 
				WHERE  \"MEL\"='".strtolower($email)."'
	           ";   

	        $query=pg_query($query_prs_mail);
	        $find = pg_num_rows($query);

	        if($find!=0){
	        	$query_prs_data =$query_prs_mail;
	        }else{
	        	 $query_prs_data =$query_init;
	        }
	    }

	    if(!empty($email) AND !empty($date_deb) AND !empty($email)){

	    $query_tms_datemail="
				SELECT \"MAT\",\"NOM\",\"PRE\",\"MEL\",\"TPH\",\"DEI\",\"NUD\"
				FROM pos_tab_index_prs 
				WHERE  \"DEI\" BETWEEN '".$date_deb."' AND '".$date_fin."' AND  \"MEL\"='".strtolower($email)."'
	           ";

	        $query=pg_query($query_tms_datemail);
	        $find = pg_num_rows($query);

	        if($find!=0){
	        	$query_prs_data =$query_tms_datemail;
	        }else{
	        	 $query_prs_data =$query_init;
	        }
	          
	    }

	
	 if(!empty($query_prs_data)){

	 	$contests_prs = pg_query($query_prs_data) or die('Query failed: ' . pg_last_error());
            while ($row_prs = pg_fetch_row($contests_prs)) {
            
                 $data[] = $row_prs;
             }
           echo json_encode($data); 

	 }else{
	    $contests_prs = pg_query($query_prs_data) or die('Query failed: ' . pg_last_error());
             while ($row_prs = pg_fetch_row($contests_prs)) {
            
                 $data[] = $row_prs;
             }
           echo json_encode($data); 

	 }




?>