<?php

       include ('../../../../../configuration_w/mabd.php');


      $personnel=$_POST["email"];
      $numposeidon=$_POST["numposeidon"];


       ini_set('display_errors', 1);

        
       
        ////// TRAITEMENT DES DONNEES /////
 
     $date_contrat='';
     $categorie='';
     $salaire_base='';

     //date d'embauche pour le calcul des primes
     $prime_anciennete=0;
     $date_embauche='';

     $prme_rdt='';

     $retour=[];

   

    $rq_dte="  SELECT \"DSG\"
    FROM public.pos_tab_index_cot WHERE \"MEL\"='".strtolower($personnel)."' ORDER BY \"NUD\" DESC LIMIT 1;  ";
    $ctx_dte = pg_query($rq_dte) or die('Query failed: ' . pg_last_error());

    while($row_ctn=pg_fetch_row($ctx_dte)){
        $date_contrat=$row_ctn[0];
    }
   
     $query_cot ="SELECT \"TYE\",\"CAE\"
   FROM public.pos_tab_index_cot WHERE  \"MEL\" ='".strtolower($personnel)."' ORDER BY   \"NUD\" DESC LIMIT 1 ";
      $contests_cot = pg_query($query_cot) or die('Query failed: ' . pg_last_error());

    while ($row_cot = pg_fetch_row($contests_cot)) {
        $type_contrat=$row_cot[0];
        $categorie=$row_cot[1];
     }

    
   $query_salbse="SELECT \"BSE\",\"RDT\"
   FROM public.pos_tab_index_cat WHERE \"CAE\" ='".$categorie."' ";
   $contests_salbse = pg_query($query_salbse) or die('Query failed: ' . pg_last_error());

   while ($row_salbse = pg_fetch_row($contests_salbse)) {
         $salaire_base=$row_salbse[0];
         $prme_rdt=$row_salbse[1];
   } 

   $date_embauche='';
   if(strpos($type_contrat, "CD") !== false){
      $query_cot_eb ="SELECT  \"DSG\"
            FROM public.pos_tab_index_cot WHERE  \"MEL\" ='".strtolower($personnel)."' ORDER BY   \"NUD\" ASC LIMIT 1 ";
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

         if(($years+1)>=2){ //si l'annee est sup à 2 alors calcul anciennete
            $prime_anciennete= intval($prime_anc);
          }
         
  // echo $dtcontrat.' '.$categorie.' '.$salaire_base.' '.$dtembauche.' '.$prime_anciennete.' '.$prme_rdt;
 
    /////////////// INSERT DATA INSIDE REGISTER OF EMPLOYEE //////////////////////
      
     

        pg_query("UPDATE public.pos_tab_index_reg
                SET 
                    \"DCL\"='$dtcontrat',
                    \"CAE\"='$categorie',
                    \"SAB\"='$salaire_base',
                    \"PRA\"='$prime_anciennete',
                    \"PRR\"='$prme_rdt'
                   
                WHERE 
                      
                      \"NUD\" =".$numposeidon."

                "); 

     
      exit;
     
 
?>