<?php 

include ('../../../../../configuration_w/mabd.php');
   header('Content-Type:application/json');
   $data=[];

 try{

 	$data["success"]=200;
 	$data["workflow"]='TMS';

 	$initiateur=$_POST['employe'];  //erik.ore@ngser.com   //elisabeth.nounou@ngser.com
 	$manager='';
 	$fullname_mngr='';
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

    //Recuperation des donnés du manager 
     $contests_mng =pg_query("
     	SELECT fpos.\"MEL\",fpos.\"IPO\",prs.\"NOM\",prs.\"PRE\"
			 FROM public.pos_tab_index_pos pos
			 INNER JOIN public.pos_tab_index_fpo fpos
			 ON pos.\"IPO\" = fpos.\"IPO\"
			 INNER JOIN public.pos_tab_index_prs prs
			 ON fpos.\"MEL\"=prs.\"MEL\"
			 WHERE fpos.\"IPO\" LIKE '%SENIOR MANAGER%'  --POSTE MANAGER DTI
			 AND pos.\"DPT\"='${departement}'

       ") or die('Query failed: ' . pg_last_error());  
      
     	while ($row_mng = pg_fetch_row($contests_mng)) {
    		 $manager=$row_mng[0];
    		 $fullname_mngr=$row_mng[2].' '.$row_mng[3];
   		 }

 	//PREPARATION DES DONNEES 	 
  	  $data['data'][] = [
  	  		'initiateur'=>[
  	  		   'email'=>$initiateur ?? '',
  	  		   'departement'=>$departement ?? '',
  	  		   'poste'=>$poste ?? '',
  	  		],
  	  		'manager'=>[
  	  		   'email'=>$manager ?? '',
  	  		   'fullname'=>$fullname_mngr ?? '',
  	  		]	
	 ];
 	echo json_encode($data);

 }catch(Exception $e){
    $data["error"]=400;
    $data["message"]='Bad connexion '.$e;
}