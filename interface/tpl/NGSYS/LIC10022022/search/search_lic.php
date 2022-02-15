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
				\"NOM\",\"PRE\",\"FON\",\"AVA\",\"DEI\",\"NUD\"
	           FROM 
	                public.pos_tab_index_lic
	           ";

	     $query_lic_data =$query_init;

	   
	    if(!empty($date_deb)  AND !empty($date_fin)  ){

	    $query_lic_date="
				SELECT \"NOM\",\"PRE\",\"FON\",\"AVA\",\"DEI\",\"NUD\"
				FROM pos_tab_index_lic 
				WHERE  \"DEI\" BETWEEN '".$date_deb."' AND '".$date_fin."'
	           ";

	        $query=pg_query($query_lic_date);
	        $find = pg_num_rows($query);

	        if($find!=0){
	        	$query_lic_data =$query_lic_date;
	        }else{
	        	 $query_lic_data =$query_init;
	        }
	    }

	   if(!empty($email)){

	    $query_lic_mail="

		       SELECT \"NOM\",\"PRE\",\"FON\",\"AVA\",\"DEI\",\"NUD\"
				FROM pos_tab_index_lic
				WHERE  \"INT\"='".strtolower($email)."'
	           ";   

	        $query=pg_query($query_lic_mail);
	        $find = pg_num_rows($query);

	        if($find!=0){
	        	$query_lic_data =$query_lic_mail;
	        }else{
	        	 $query_lic_data =$query_init;
	        }
	    }

	    if(!empty($email) AND !empty($date_deb) AND !empty($email)){

	    $query_lic_datemail="
				SELECT \"NOM\",\"PRE\",\"FON\",\"AVA\",\"DEI\",\"NUD\"
				FROM pos_tab_index_lic 
				WHERE  \"DEI\" BETWEEN '".$date_deb."' AND '".$date_fin."' AND  \"INT\"='".strtolower($email)."'
	           ";

	        $query=pg_query($query_lic_datemail);
	        $find = pg_num_rows($query);

	        if($find!=0){
	        	$query_lic_data =$query_lic_datemail;
	        }else{
	        	 $query_lic_data =$query_init;
	        }
	          
	    }

	
	 if(!empty($query_lic_data)){

	 	$contests_lic = pg_query($query_lic_data) or die('Query failed: ' . pg_last_error());
            while ($row_lic = pg_fetch_row($contests_lic)) {
            
                 $data[] = $row_lic;
             }
           echo json_encode($data); 

	 }else{
	    $contests_lic = pg_query($query_lic_data) or die('Query failed: ' . pg_last_error());
             while ($row_lic = pg_fetch_row($contests_lic)) {
            
                 $data[] = $row_lic;
             }
           echo json_encode($data); 

	 }




?>