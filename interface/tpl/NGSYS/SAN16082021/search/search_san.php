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
				\"NOM\",\"PRE\",\"FON\",\"NAT\",\"DAE\",\"NUD\"
	           FROM 
	                public.pos_tab_index_san 
	           ";

	     $query_san_data =$query_init;

	   
	    if(!empty($date_deb)  AND !empty($date_fin)  ){

	    $query_san_date="
				SELECT \"NOM\",\"PRE\",\"FON\",\"NAT\",\"DAE\",\"NUD\"
				FROM pos_tab_index_san 
				WHERE  \"DAE\" BETWEEN '".$date_deb."' AND '".$date_fin."'
	           ";

	        $query=pg_query($query_san_date);
	        $find = pg_num_rows($query);

	        if($find!=0){
	        	$query_san_data =$query_san_date;
	        }else{
	        	 $query_san_data =$query_init;
	        }
	    }

	   if(!empty($email)){  
	    $query_san_mail="

		       SELECT  \"NOM\",\"PRE\",\"FON\",\"NAT\",\"DAE\",\"NUD\"
				FROM pos_tab_index_san 
				WHERE  \"INT\"='".strtolower($email)."'
	           ";   

	        $query=pg_query($query_san_mail);
	        $find = pg_num_rows($query);

	        if($find!=0){
	        	$query_san_data =$query_san_mail;
	        }else{
	        	 $query_san_data =$query_init;
	        }
	    }

	  

	
	 if(!empty($query_san_data)){

	 	$contests_san = pg_query($query_san_data) or die('Query failed: ' . pg_last_error());
            while ($row_san = pg_fetch_row($contests_san)) {
            
                 $data[] = $row_san;
             }
           echo json_encode($data); 

	 }else{
	    $contests_san = pg_query($query_san_data) or die('Query failed: ' . pg_last_error());
             while ($row_san = pg_fetch_row($contests_san)) {
            
                 $data[] = $row_san;
             }
           echo json_encode($data); 

	 }




?>