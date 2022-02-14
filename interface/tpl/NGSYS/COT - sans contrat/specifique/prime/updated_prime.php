<?php 
    include ('../../../../../../configuration_w/mabd.php');


     $lib_prime= $_GET['lib_prime'] ;

	$montant_prime= $_GET['montant_prime'] ;

	$type_contrat= $_GET['type_contrat'] ;

	$status_activ_cot= $_GET['status_activ_cot'] ;

	$personnel= $_GET['personnel'] ;

	$exist_contrat= $_GET['exist_contrat'] ;

	$dateEnreg=$_GET['dateEnreg'];

	$exDate = explode("/", $dateEnreg);
		
    $dateInsert=(new DateTime($exDate[2].'-'.$exDate[1].'-'.$exDate[0]))->format('Y-m-d');



 
     	/// insertion en base des primes avec status_activ_cot = 1
    if($exist_contrat==0){

    				 pg_query(" DELETE FROM public.cot_prime WHERE email='".strtoupper($personnel)."' AND date_enreg='".$dateInsert."'");
     	    	  //echo 'ready';
     	    	  foreach ($lib_prime as $key => $v) {
     	    	  	         $result_prm=pg_query("SELECT id FROM public.prime WHERE libelle='".$v."' "); //return id of prime
     	    	  	      	while ($row = pg_fetch_row($result_prm)) {
							         //print_r($row[0]);
							         //update into cot_prime

     	    	  	      			$query2="INSERT INTO public.cot_prime(
				                    prime_id, type_cot, status_cot_active, montant, email,date_enreg)
				                    VALUES (  
				                           '".$row[0]."',
				                            '".$type_contrat."',
				                            '".$status_activ_cot."',
				                             '".$montant_prime[$key]."',
				                              '".$personnel."',
				                              '".$dateInsert."'
				                              );
				                              "; 
				                    pg_query($query2) or die("Error while insert");
							} 
 
     	    	  }

     	  
   }
    

?>