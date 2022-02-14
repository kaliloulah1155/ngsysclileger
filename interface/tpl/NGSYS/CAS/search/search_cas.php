<?php    
	include ("../../../../../configuration_w/mabd.php");

		$date_deb=$_POST['date_deb'];
		$date_fin=$_POST['date_fin'];
 
		//echo $email.' '.$date_deb.' '.$date_fin;

	 
		$query='';
		$find=0;
        $data = array() ;
        
         $query_init="
	            SELECT
						\"COD\",\"DCR\",\"NUD\"
	           FROM 
	                public.pos_tab_index_cas
	           ";

	     $query_cas_data =$query_init;

	   
	    if(!empty($date_deb)  AND !empty($date_fin)  ){

	    $query_cas_date="
				SELECT \"COD\",\"DCR\",\"NUD\"
				FROM pos_tab_index_cas 
				WHERE  \"DCR\" BETWEEN '".$date_deb."' AND '".$date_fin."'
	           ";

	        $query=pg_query($query_cas_date);
	        $find = pg_num_rows($query);

	        if($find!=0){
	        	$query_cas_data =$query_cas_date;
	        }else{
	        	 $query_cas_data =$query_init;
	        }
	    }

	    
	
	 if(!empty($query_cas_data)){

	 	$contests_cas = pg_query($query_cas_data) or die('Query failed: ' . pg_last_error());
            while ($row_cas = pg_fetch_row($contests_cas)) {
            
                 $data[] = $row_cas;
             }
           echo json_encode($data); 

	 }else{
	    $contests_cas = pg_query($query_cas_data) or die('Query failed: ' . pg_last_error());
             while ($row_cas = pg_fetch_row($contests_cas)) {
            
                 $data[] = $row_cas;
             }
           echo json_encode($data); 

	 }




?>