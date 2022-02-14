<?php 
	include ('../../../../../../configuration_w/mabd.php');

    $lib_prime= $_GET['lib_prime'] ;

	$montant_prime= $_GET['montant_prime'] ;

	$type_contrat= $_GET['type_contrat'] ;

	$status_activ_cot= $_GET['status_activ_cot'] ;

	$personnel= $_GET['personnel'] ;

	$exist_contrat= $_GET['exist_contrat'] ;



	$result = pg_query("SELECT * FROM public.cot_prime WHERE email='".$personnel."' AND status_cot_active='".$status_activ_cot."' AND  type_cot='".$type_contrat."' ");
	$find = pg_num_rows($result);


	//$date_enreg=(new DateTime())->format('Y-m-d'));


	  //echo $find;   //verifie l'existance d'un status des primes

     if($exist_contrat==0){ // ($exist_contrat) verifie si un contrat n'a jamais ete concu pour l'employé

     	/// insertion en base des primes avec status_activ_cot = 1

     	    if(!empty($lib_prime[0]) AND  !empty($montant_prime[0])  AND !empty($type_contrat[0])  AND !empty($status_activ_cot[0]) AND !empty($personnel[0]) ){

     	    	  //echo 'ready';
     	    	  foreach ($lib_prime as $key => $v) {
     	    	  	         $result_prm=pg_query("SELECT id FROM public.prime WHERE libelle='".$v."' "); //return id of prime
     	    	  	      	while ($row = pg_fetch_row($result_prm)) {
							         //print_r($row[0]);
							         //insert into cot_prime
     	    	  	      			 $query2="INSERT INTO public.cot_prime(
				                    prime_id, type_cot, status_cot_active, montant, email)
				                    VALUES (  
				                           '".$row[0]."',
				                            '".$type_contrat."',
				                            '".$status_activ_cot."',
				                             '".$montant_prime[$key]."',
				                              '".$personnel."'
				                              );";
				                    pg_query($query2) or die("Error while insert");
							} 
 
     	    	  }

     	    }

     }

     if($exist_contrat>=1){ //($exist_contrat) verifie si un contrat a été concu pour l'employé
     	 //update du status de l'ancien  avec status_activ_cot = 0

      $dateInsert ='';

     $result_last=pg_query("SELECT id,date_enreg FROM public.cot_prime WHERE email='".$personnel."'  ORDER BY id DESC LIMIT 1 "); 
     		 while ($rowlast = pg_fetch_row($result_last)) {
     				 
     				 $exDate = explode("/", $rowlast[1] );

    				$dateInsert=(new DateTime($exDate[2].'-'.$exDate[1].'-'.$exDate[0]))->format('Y-m-d');
     		}
          
            pg_query("UPDATE public.cot_prime
				SET status_cot_active='0' 
				WHERE email='".$personnel."' AND date_enreg='".$dateInsert."'  ");



     	 if($find!=0){ 
     	      //verifie l'existance d'un status des primes

     	 }


     	//insertion des primes avec status_activ_cot = 1
     	 if(!empty($lib_prime[0]) AND  !empty($montant_prime[0])  AND !empty($type_contrat[0])    AND !empty($personnel[0]) ){
		     	 foreach ($lib_prime as $key => $v) {
					          $result_prm2=pg_query("SELECT id FROM public.prime WHERE libelle='".$v."' "); //return id of prime
					     	  while ($row2 = pg_fetch_row($result_prm2)) {
					     	  $query2="INSERT INTO public.cot_prime(
					                prime_id, type_cot, status_cot_active, montant, email)
					                VALUES (  
					                       '".$row2[0]."',
					                        '".$type_contrat."',
					                        '1',
					                         '".$montant_prime[$key]."',
					                          '".$personnel."'
					                          );";
					                pg_query($query2) or die("Error while insert");

					        }

		           }
        }





     }

	 


?>