<?php 

include ('../../../../../configuration_w/mabd.php');
   header('Content-Type:application/json');


   $data=[];

 try{

 	$data["success"]=200;

 	$initiateur=$_POST['employe'];  //erik.ore@ngser.com   //elisabeth.nounou@ngser.com
 	$fullname_initiator='';

 	// get initiator firstname & lastname 
 	$contests_init =pg_query(" 
    		SELECT
			    \"NOM\",
			    \"PRE\",
			    \"CIV\"
			FROM 
			   public.pos_tab_index_prs
			WHERE \"MEL\"='${initiateur}'
			ORDER BY \"NUD\" DESC LIMIT 1
    	");
    while ($row_init = pg_fetch_row($contests_init)) {
    		$civ=$row_init[2];
    		$fullname=$row_init[0].' '.$row_init[1];
    }

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
 	/////////////////////////////////////////////////////////
     

 	//PREPARATION DES DONNEES
  	$data['data'][] = [
	   'sexe'=>$civ ?? 'M',
	   'fonction'=>$poste ?? '',
	   'fullname'=> $fullname ?? '',
   ];
 	echo json_encode($data);

 }catch(Exception $e){
    $data["error"]=400;
    $data["message"]='Bad connexion '.$e;
}