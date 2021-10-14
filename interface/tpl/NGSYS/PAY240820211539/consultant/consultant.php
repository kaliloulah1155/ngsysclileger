<?php 

include ('../../../../../configuration_w/mabd.php');
   $email=$_POST['st_email'];


    $data = array() ;

    $query_cot="
	            SELECT
	                 \"SAL\",\"ASN\",\"E1\",\"ENT\"
	           FROM 
	               public.pos_tab_index_cot
	           WHERE \"MEL\"='".$email."' ORDER BY \"NUD\" DESC LIMIT 1
	           ";
   
	 $contests_cot= pg_query($query_cot) or die('Query failed: ' . pg_last_error());
     while ($row_cot = pg_fetch_row($contests_cot)) {
    
         $data[] = $row_cot;
     }


     
     //OBTENIR LE MONTANT DE LA RECHARGE   libelle='Recharge'
     $result_mtn_rchge=pg_query("SELECT montant FROM public.cot_prime WHERE email=UPPER('".$email."') AND prime_id=(SELECT id FROM prime WHERE libelle='Recharge' ORDER BY id DESC LIMIT 1) ORDER BY id DESC LIMIT 1"); 

     while ($row_mtn_rchge = pg_fetch_row($result_mtn_rchge)) {
         $data[] = $row_mtn_rchge;
     }

      $query_prt="
	            SELECT
	                 SUM(\"DC1\") as total
	           FROM 
	               public.pos_tab_index_prt
	           WHERE \"CRE\"='".strtoupper($email)."'

	           AND \"ETF\"='DGFINANC_ETA1_PRT'

	           GROUP BY \"NUD\" ORDER BY total;
	         ";
    
     $pret=0;
	 $contests_prt= pg_query($query_prt) or die('Query failed: ' . pg_last_error());
     while ($row_prt = pg_fetch_row($contests_prt)) {

         $pret += (int)$row_prt[0];
     }

     $data[] = $pret;


     echo json_encode($data);