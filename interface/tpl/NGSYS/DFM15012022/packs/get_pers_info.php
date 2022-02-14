<?php 

 include ("../../../../../configuration_w/mabd.php");


$query="SELECT \"CIV\",\"DNS\",\"NAT\" FROM public.pos_tab_index_prs WHERE \"MEL\"='".$_POST['email']."'  ";
    
    $contests = pg_query($query) or die('Query failed: ' . pg_last_error());

    $retour = array() ;

        
    $civ='';
     

    while ($row = pg_fetch_array($contests)) {
        $civilite=$row[0];
         
        if($civilite=='M'){
           $retour['civ']='M';
	     }
	     if ($civilite=='MME') {
	       # code...
	           $retour['civ']='F';
	     }
	     if ($civilite=='MLLE') {
	       # code...
	         $retour['civ']='F';
	     } 

        $retour['dtenaiss'] = $row[1];
        $retour['nationalite'] = $row[2];
    }

    
     $query_fposte="
                SELECT
                     \"IPO\"
               FROM    
                   public.pos_tab_index_fpo
               WHERE \"MEL\"='".strtolower($_POST['email'])."'
               ORDER BY \"NUD\" DESC LIMIT 1
               ";
	 $contests_fposte = pg_query($query_fposte) or die('Query failed: ' . pg_last_error());
	  $fpo_fonction='';
	 while($rowfpos=pg_fetch_row($contests_fposte)){

	    $fonction=$rowfpos[0];
	    $retour['fonction'] = $fonction;
	 }



     $type_contrat='';
     $categorie='';
     $cnps='';

     $query_cot ="SELECT  \"SAL\",\"MDT\",\"TYE\",\"CAE\",\"CNP\"
   FROM public.pos_tab_index_cot WHERE  \"MEL\" ='".strtolower($_POST['email'])."' ORDER BY   \"NUD\" DESC LIMIT 1 ";
      $contests_cot = pg_query($query_cot) or die('Query failed: ' . pg_last_error());

    while ($row_cot = pg_fetch_row($contests_cot)) {

        $type_contrat=$row_cot[2];
        $categorie=$row_cot[3];
        $retour['categorie']=$categorie;
        $cnps=$row_cot[4];
        $retour['cnps']=$cnps;
     }


   $position='';
   $query_position ="SELECT  \"TCT\"
   FROM public.pos_tab_index_cat WHERE \"CAE\" ='".$categorie."' ";
   $contests_position = pg_query($query_position) or die('Query failed: ' . pg_last_error());

   while ($row_position = pg_fetch_row($contests_position)) {
   		 $position=$row_position[0];
   		 $retour['position']=$position;
   } 





   $date_embauche='';
   if(strpos($type_contrat, "CD") !== false){
      $query_cot_eb ="SELECT  \"DSG\"
            FROM public.pos_tab_index_cot WHERE  \"MEL\" ='".strtolower($_POST['email'])."' ORDER BY   \"NUD\" ASC LIMIT 1 ";
      $contests_cot_eb = pg_query($query_cot_eb) or die('Query failed: ' . pg_last_error());

       while ($row_cot_eb = pg_fetch_row($contests_cot_eb)) {
            $date_embauche=strtoupper($row_cot_eb[0]) ;
            $retour['date_embauche'] = $date_embauche;
        }

    } 



     

      
    echo json_encode($retour);




?>