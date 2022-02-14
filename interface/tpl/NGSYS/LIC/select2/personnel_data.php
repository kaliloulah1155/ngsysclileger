<?php
       
    include ('../../../../../configuration_w/mabd.php');
   
    
    $email=$_POST['email'];

   
    $data = array() ;
    $query_="
	            SELECT
	                 \"NOM\",\"PRE\"
	           FROM 
	               public.pos_tab_index_prs
	           WHERE \"MEL\"='".$email."'
	           ";
          
	 $contests_= pg_query($query_) or die('Query failed: ' . pg_last_error());
     while ($row = pg_fetch_row($contests_)) {
         $data[] = $row;
     }
     //poste 
          
     $poste='';
    $query_poste ="SELECT
    \"IPO\"
        FROM 
        public.pos_tab_index_fpo
        WHERE \"MEL\"='".strtolower($email)."' ORDER BY \"NUD\" DESC LIMIT 1
        ";
    
     $contests_poste = pg_query($query_poste) or die('Query failed: ' . pg_last_error());


     while ($row_poste = pg_fetch_row($contests_poste)) {
        $poste = $row_poste[0];
     }
     $data[] = $poste;

     //anciennete
     $type_contrat='';
     $categorie='';
     $query_salbse='';    
     $salaire_base=0;
     $query_cot ="SELECT \"CAE\"
     FROM public.pos_tab_index_cot WHERE  \"MEL\" ='".strtolower($_POST['email'])."' ORDER BY   \"NUD\" DESC LIMIT 1 ";
        $contests_cot = pg_query($query_cot) or die('Query failed: ' . pg_last_error());
  
      while ($row_cot = pg_fetch_row($contests_cot)) {
           $categorie=$row_cot[0];
       }
     $query_salbse="SELECT \"BSE\"
     FROM public.pos_tab_index_cat WHERE \"CAE\" ='".$categorie."' ";
     $contests_salbse = pg_query($query_salbse) or die('Query failed: ' . pg_last_error());
  
     while ($row_salbse = pg_fetch_row($contests_salbse)) {
           $salaire_base=$row_salbse[0];
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

    $prime_anc=0;
    $years=0;
    $prime_anciennete=0;

     $dtemb = explode("/", $date_embauche);
     $dtembauche=$dtemb[2].'-'.$dtemb[1].'-'.$dtemb[0] ;
         $date2 = (new DateTime())->format('Y-m-d');

        $diff = abs(strtotime($date2) - strtotime($dtembauche));

        $years = floor($diff/(365*60*60*24));

        $prime_anc=$salaire_base*($years+1)/100;

        if(($years+1)>=2){ //si l'annee est sup à 2 alors calcul anciennete
           $prime_anciennete= intval($prime_anc);

            $data[]=$prime_anciennete;
         }




 
     echo json_encode($data); 


 

?>