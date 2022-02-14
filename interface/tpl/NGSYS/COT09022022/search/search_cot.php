<?php    
	include ("../../../../../configuration_w/mabd.php");

		$date_deb=$_POST['date_deb'];
		$date_fin=$_POST['date_fin'];
		$email=$_POST['email'];
		$contrat=$_POST['contrat'];
		$profil=$_POST['profil'];
		

		 

		//echo $email.' '.$date_deb.' '.$date_fin.' '.$contrat; exit;

		//mathurin ble@ngser.com 2021-08-05 2021-08-07 CDD standard

 		$query='';
		$find=0;
        $data = array() ;

        $query_init="";

		if($profil=="ADMIN" OR $profil=="RH" OR $profil=="MANAGER_ADM" OR $profil=="DGA"  OR $profil=="DG"){
         $query_init="
	            SELECT
			     	\"NOM\",\"PRE\",\"TYE\",\"DSG\",\"NUD\",\"MEL\"
	           FROM 
	                public.pos_tab_index_cot
	           ";
		}	
		
	     $query_cot_data =$query_init;
		

	      //1- Date de debut+ Date de fin
	    if(!empty($date_deb)  AND !empty($date_fin)  ){

	    $query_cot_date="
				SELECT \"NOM\",\"PRE\",\"TYE\",\"DSG\",\"NUD\",\"MEL\"
				FROM pos_tab_index_cot
				WHERE  \"DSG\" BETWEEN '".$date_deb."' AND '".$date_fin."'
	           ";

	        $query=pg_query($query_cot_date);
	        $find = pg_num_rows($query);

	        if($find!=0){
	        	$query_cot_data =$query_cot_date;
	        }else{
	        	 $query_cot_data =$query_init;
	        }
	    }

		 //2- E-mail
	   if(!empty($email)){
	    $query_cot_mail="
		       SELECT \"NOM\",\"PRE\",\"TYE\",\"DSG\",\"NUD\",\"MEL\"
				FROM pos_tab_index_cot 
				WHERE  \"MEL\"='".strtolower($email)."'
	           ";   

	        $query=pg_query($query_cot_mail);
	        $find = pg_num_rows($query);

	        if($find!=0){
	        	$query_cot_data =$query_cot_mail;
	        }else{
	        	 $query_cot_data =$query_init;
	        }
	    }

		//3-Type de contrat
 	    if(!empty($contrat)){
	    $query_cot_contrat="
				SELECT \"NOM\",\"PRE\",\"TYE\",\"DSG\",\"NUD\",\"MEL\"
				FROM pos_tab_index_cot 
				WHERE   \"TYE\"='".$contrat."'
	           ";

	        $query=pg_query($query_cot_contrat);
	        $find = pg_num_rows($query);

	        if($find!=0){
	        	$query_cot_data =$query_cot_contrat;
	        }else{
	        	 $query_cot_data =$query_init;
	        }
	          
	    }
		//4-Date de debut+ Date de fin + Type de contrat
		if(!empty($date_deb) AND !empty($date_fin) AND !empty($contrat)  ){
			$query_cot_datcnt="
					SELECT \"NOM\",\"PRE\",\"TYE\",\"DSG\",\"NUD\",\"MEL\"
					FROM pos_tab_index_cot
					WHERE  \"DSG\" BETWEEN '".$date_deb."' AND '".$date_fin."' AND \"TYE\"='".$contrat."'
				   ";
				$query=pg_query($query_cot_datcnt);
				$find = pg_num_rows($query);
	
				if($find!=0){
					$query_cot_data =$query_cot_datcnt;
				}else{
					 $query_cot_data =$query_init;
				}
			}

		//5- E-mail + Type de contrat
		if(!empty($email) AND !empty($contrat)  ){
			$query_cot_melcnt="
					SELECT \"NOM\",\"PRE\",\"TYE\",\"DSG\",\"NUD\",\"MEL\"
					FROM pos_tab_index_cot
					WHERE  \"MEL\"='".strtolower($email)."' AND \"TYE\"='".$contrat."'
				   ";
				$query=pg_query($query_cot_melcnt);
				$find = pg_num_rows($query);
	
				if($find!=0){
					$query_cot_data =$query_cot_melcnt;
				}else{
					 $query_cot_data =$query_init;
				}
			}

	 if(!empty($query_cot_data)){
	 	$contests_cot = pg_query($query_cot_data) or die('Query failed: ' . pg_last_error());
            while ($row_cot = pg_fetch_row($contests_cot)) {
                 $data[] = $row_cot;
             }
        echo json_encode($data); 
	 }

?>