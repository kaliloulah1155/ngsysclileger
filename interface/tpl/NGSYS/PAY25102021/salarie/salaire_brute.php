<?php 
	include ('../../../../../configuration_w/mabd.php');
   $email=$_POST['st_email'];

     $data = array() ;
   	//date d'embauche pour le calcul des primes
     $prime_anciennete=0;
     $date_embauche='';
     $duree_anc=0;
     $salaire_base=0;
     $prme_rdt=0;
     $sursalaire=0;
     $categorie='';
     $type_contrat='';
     $assurance=0;
     $representation=0;



      $query_cot ="SELECT \"TYE\",\"CAE\",\"ASN\"
   FROM public.pos_tab_index_cot WHERE  \"MEL\" ='".strtolower($email)."' ORDER BY   \"NUD\" DESC LIMIT 1 ";
      $contests_cot = pg_query($query_cot) or die('Query failed: ' . pg_last_error());

    while ($row_cot = pg_fetch_row($contests_cot)) {
        $type_contrat=$row_cot[0];
        $categorie=$row_cot[1];
        $assurance=$row_cot[2];
     }

    
   $query_salbse="SELECT \"BSE\",\"RDT\",\"SRA\",\"IPS\"
   FROM public.pos_tab_index_cat WHERE \"CAE\" ='".$categorie."' ";
   $contests_salbse = pg_query($query_salbse) or die('Query failed: ' . pg_last_error());

   while ($row_salbse = pg_fetch_row($contests_salbse)) {
         $salaire_base=$row_salbse[0];
         $prme_rdt=$row_salbse[1];
         $sursalaire=$row_salbse[2];
         $representation=$row_salbse[3];

        
    } 

   if(strpos($type_contrat,"CD") !== false){
      $query_cot_eb ="SELECT  \"DSG\"
            FROM public.pos_tab_index_cot WHERE  \"MEL\" ='".strtolower($email)."' ORDER BY   \"NUD\" ASC LIMIT 1 ";
      $contests_cot_eb = pg_query($query_cot_eb) or die('Query failed: ' . pg_last_error());

       while ($row_cot_eb = pg_fetch_row($contests_cot_eb)) {
            $date_embauche=strtoupper($row_cot_eb[0]) ;
        }

    } 

    $dtctn = explode("/", $date_contrat);
    $dtcontrat=$dtctn[2].'-'.$dtctn[1].'-'.$dtctn[0] ;

    $dtemb = explode("/", $date_embauche);
      $dtembauche=$dtemb[2].'-'.$dtemb[1].'-'.$dtemb[0] ;
          $date2 = (new DateTime())->format('Y-m-d');
 
         $diff = abs(strtotime($date2) - strtotime($dtembauche));

         $years = floor($diff/(365*60*60*24));

         $prime_anc=$salaire_base*($years+1)/100;

         $duree_anc=($years+1);

         if(($years+1)>=2){ //si l'annee est sup à 2 alors calcul anciennete
            $prime_anciennete= intval($prime_anc); // en montant
          }


     //calcul pret 

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

    



     $data[] = $duree_anc; //duree
     $data[] = intval($salaire_base); //salaire de base
   // $data[] = intval($sursalaire); //sursalaire
     $data[] = $prime_anciennete; //anciennete
     $data[] = intval($prme_rdt);  // rendement
     $data[] = intval($assurance);  // assurance 
     $data[] =intval($representation); //representation
     $data[] = $pret;
     

     echo json_encode($data);
     
         


     