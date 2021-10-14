<?php 

    include ('../../../../../configuration_w/mabd.php');

    $loadcode=$_POST['loadcode'];
    $dtdeb=$_POST['dtdeb'];
    $dtfin=$_POST['dtfin'];
    $duree=$_POST['duree'];
    $email=$_POST['email'];
    $nom=$_POST['nom'];
    $prenom=$_POST['prenom'];

      

  
   // echo $loadcode.' '.$dtdeb.' '.$dtfin.' '.$duree.' '.$email;
   
    $ctx=pg_query("SELECT max(inuminfo)+1000 as NEWID FROM public.pos_tab_para_entete;");

    $myNud=0;
   while($row_entete=pg_fetch_row($ctx)){

   	 $myNud=$row_entete[0];
   } 


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
    FROM public.pos_tab_index_cot WHERE \"MEL\"='".strtolower($_POST['email'])."' ORDER BY \"NUD\" DESC LIMIT 1;  ";
    $ctx_dte = pg_query($rq_dte) or die('Query failed: ' . pg_last_error());

    while($row_ctn=pg_fetch_row($ctx_dte)){
        $date_contrat=$row_ctn[0];
    }
   
     $query_cot ="SELECT \"TYE\",\"CAE\"
   FROM public.pos_tab_index_cot WHERE  \"MEL\" ='".strtolower($_POST['email'])."' ORDER BY   \"NUD\" DESC LIMIT 1 ";
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
            FROM public.pos_tab_index_cot WHERE  \"MEL\" ='".strtolower($_POST['email'])."' ORDER BY   \"NUD\" ASC LIMIT 1 ";
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
         
   //echo $dtcontrat.' '.$categorie.' '.$salaire_base.' '.$dtembauche.' '.$prime_anciennete.' '.$prme_rdt;
 
    /////////////// INSERT DATA INSIDE REGISTER OF EMPLOYEE //////////////////////
   //1- Enregistrement dans la table pos_tab_para_entete
  pg_query("INSERT INTO public.pos_tab_para_entete(
	inuminfo, c3_typedoc)
	VALUES ('".$myNud."','REG');");

   //2- Insertion des données dans le Registre employeur
   pg_query("INSERT INTO public.pos_tab_index_reg(
	  inuminfo,
      \"NUD\",
      \"ETF\",
      \"CRE\",
      \"DCR\",
      \"DCO\",
      \"NMJ\",
      \"DRT\",
      \"NOM\",
      \"PRE\",
      \"MEL\",
      \"COD\",
      \"DCL\",
      \"CAE\",
      \"SAB\",
      \"PRA\",
      \"PRR\",
      \"NRR\",
      \"CAU\",
      \"LOG\",
      \"HOR\"
      )
	VALUES (
       '".$myNud."',
       '".$myNud."',
       'EN_COURS',
       '".$email."',
       '".$dtdeb."',
       '".$dtdeb."',
        '".$duree."',
        '".$dtfin."',
        '".$nom."',
        '".$prenom."',
        '".$email."',   
        '".$loadcode."',
        '".$date_contrat."',
        '".$categorie."',
        '".$salaire_base."',
        '".$prime_anciennete."',
        '".$prme_rdt."',
        'NON',
        'NON',
        'NON',
        '40'

    );");
	 
?>