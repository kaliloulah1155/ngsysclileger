<?php 

include ('../../../../../configuration_w/mabd.php');
   header('Content-Type:application/json');


   $data=[];

 try{

 	$data["success"]=200;
 	$data["workflow"]='PRT';

 	$initiateur=$_POST['employe'];  //erik.ore@ngser.com   //elisabeth.nounou@ngser.com
 	$manager='';
 	$fullname_mngr='';
 	$controleur='';
 	$fullname_ctrl='';
 	$rh='';
 	$fullname_rh='';
 	$dga='';
 	$fullname_dga='';
 	$dg='';
 	$fullname_dg='';
 	$poste='';
 	$departement='';
 	    

 	//recuperation poste
    $contests_poste =pg_query(" 
    		SELECT
			    \"IPO\"
			FROM 
			   public.pos_tab_index_fpo
			WHERE \"MEL\"='${initiateur}'
			ORDER BY \"NUD\" DESC LIMIT 1
    	");
    while ($row_poste = pg_fetch_row($contests_poste)) {
    		$poste=$row_poste[0];
    }


 	//recuperation du departement
 	$contests_depart =pg_query(" 
    		SELECT dpt.\"LIB\" 
			FROM public.pos_tab_index_pos postab
			INNER JOIN public.pos_tab_index_dpt dpt
			ON  dpt.\"LIB\"=postab.\"DPT\" 
			WHERE postab.\"IPO\"='${poste}'
    	");
    while ($row_depart = pg_fetch_row($contests_depart)) {
    		$departement=$row_depart[0];
    }

   

     
    //Recuperation des donnés du manager  finance
     $contests_mng =pg_query("
     	SELECT fpos.\"MEL\",fpos.\"IPO\",prs.\"NOM\",prs.\"PRE\"
			 FROM public.pos_tab_index_pos pos
			 INNER JOIN public.pos_tab_index_fpo fpos
			 ON pos.\"IPO\" = fpos.\"IPO\"
			 INNER JOIN public.pos_tab_index_prs prs
			 ON fpos.\"MEL\"=prs.\"MEL\"
			 WHERE fpos.\"IPO\" = 'SENIOR MANAGER DFC'  --POSTE MANAGER DTI

       ") or die('Query failed: ' . pg_last_error());  
      
     	while ($row_mng = pg_fetch_row($contests_mng)) {
    		 $manager=$row_mng[0];
    		 $fullname_mngr=$row_mng[2].' '.$row_mng[3];
   		 }


   	//Recuperation des donnés du manager  finance
     $contests_mng =pg_query("
     	SELECT fpos.\"MEL\",fpos.\"IPO\",prs.\"NOM\",prs.\"PRE\"
			 FROM public.pos_tab_index_pos pos
			 INNER JOIN public.pos_tab_index_fpo fpos
			 ON pos.\"IPO\" = fpos.\"IPO\"
			 INNER JOIN public.pos_tab_index_prs prs
			 ON fpos.\"MEL\"=prs.\"MEL\"
			 WHERE fpos.\"IPO\" = 'CONTROLE DE GESTION'  --POSTE MANAGER DTI

       ") or die('Query failed: ' . pg_last_error());  
      
     	while ($row_mng = pg_fetch_row($contests_mng)) {
    		 $controleur=$row_mng[0];
    		 $fullname_ctrl=$row_mng[2].' '.$row_mng[3];
   		 }


   		 //Recuperation des donnés du rh
   		 $contests_rh =pg_query("
     	SELECT fpos.\"MEL\",fpos.\"IPO\",prs.\"NOM\",prs.\"PRE\"
			 FROM public.pos_tab_index_pos pos
			 INNER JOIN public.pos_tab_index_fpo fpos
			 ON pos.\"IPO\" = fpos.\"IPO\"
			 INNER JOIN public.pos_tab_index_prs prs
			 ON fpos.\"MEL\"=prs.\"MEL\"
			 WHERE fpos.\"IPO\" = 'RESPONSABLE RESSOURCE HUMAINE'  --POSTE MANAGER DTI
			  

       ") or die('Query failed: ' . pg_last_error());  
      
     	while ($row_rh = pg_fetch_row($contests_rh)) {
    		 $rh=$row_rh[0];
    		 $fullname_rh=$row_rh[2].' '.$row_rh[3];
   		 }

   		 //Recuperation des donnés du dga
   		 $contests_dga =pg_query("
     	SELECT fpos.\"MEL\",fpos.\"IPO\",prs.\"NOM\",prs.\"PRE\"
			 FROM public.pos_tab_index_pos pos
			 INNER JOIN public.pos_tab_index_fpo fpos
			 ON pos.\"IPO\" = fpos.\"IPO\"
			 INNER JOIN public.pos_tab_index_prs prs
			 ON fpos.\"MEL\"=prs.\"MEL\"
			 WHERE fpos.\"IPO\" = 'DIRECTEUR GENERALE ADJOINT'  --POSTE MANAGER DTI
			  

       ") or die('Query failed: ' . pg_last_error());  
     	while ($row_dga = pg_fetch_row($contests_dga)) {
    		 $dga=$row_dga[0];
    		  $fullname_dga=$row_dga[2].' '.$row_dga[3];
   		 }


   		 //Recuperation des donnés du dg
   		 $contests_dg =pg_query("
     	SELECT fpos.\"MEL\",fpos.\"IPO\",prs.\"NOM\",prs.\"PRE\"
			 FROM public.pos_tab_index_pos pos
			 INNER JOIN public.pos_tab_index_fpo fpos
			 ON pos.\"IPO\" = fpos.\"IPO\"
			 INNER JOIN public.pos_tab_index_prs prs
			 ON fpos.\"MEL\"=prs.\"MEL\"
			 WHERE fpos.\"IPO\" = 'DIRECTEUR GENERALE'  --POSTE MANAGER DTI
			  

       ") or die('Query failed: ' . pg_last_error());  
     	while ($row_dg = pg_fetch_row($contests_dg)) {
    		 $dg=$row_dg[0];
    		 $fullname_dg=$row_dg[2].' '.$row_dg[3];
   		 }
       

 	//PREPARATION DES DONNEES 	 
  	  $data['data'][] = [
  	  		'initiateur'=>[
  	  		   'email'=>$initiateur ?? '',
  	  		   'departement'=>$departement ?? '',
  	  		   'poste'=>$poste ?? '',
  	  		],
  	  		'rh'=>[
  	  		   'email'=>$rh ?? '',
  	  		   'fullname'=>$fullname_rh ?? '',
  	  		],
  	  		'controleur'=>[
  	  		   'email'=>$controleur ?? '',
  	  		   'fullname'=>$fullname_ctrl ?? '',
  	  		],
  	  		'finance'=>[
  	  		   'email'=>$manager ?? '',
  	  		   'fullname'=>$fullname_mngr ?? '',
  	  		],
  	  		'dga'=>[
  	  		   'email'=>$dga ?? '',
  	  		   'fullname'=>$fullname_dga ?? '',
  	  		],
  	  		'dg'=>[
  	  		   'email'=>$dg ?? '',
  	  		   'fullname'=>$fullname_dg ?? '',
  	  		],
   			
	 ];
 	echo json_encode($data);

 }catch(Exception $e){
    $data["error"]=400;
    $data["message"]='Bad connexion '.$e;
}