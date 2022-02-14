<?php 

   include ('../../../../../configuration_w/mabd.php');
   header('Content-Type:application/json');

    $data=[];
 ini_set('display_errors', 1);
	try{

	    $email=$_POST['createur'];
	    $salaireNet=0;
	    $nombreEmp=0;
		$montantEmp=0;
		$montantMens=0;
		$quotite_prelevable=0;



	    $result4=pg_query($conn, "SELECT \"SAL\" as salaire FROM public.pos_tab_index_cot WHERE    \"MEL\"='".strtolower($email)."' ORDER BY \"NUD\" DESC LIMIT 1  ");
 			while($row4 = pg_fetch_row($result4)){
				$salaireNet = intval($row4[0]) ?? 0;
			}
		 
			     //PRENDRE LE SALAIRE NET DANS LA FICHE CONTRAT
			switch (true) {
				case ($salaireNet<=200000):
					$quotite=($salaireNet*35)/100;
					break;
				case ($salaireNet>200000 AND $salaireNet <= 400000):
					$quotite=($salaireNet*38)/100;
					break;
				case ($salaireNet>400000 AND $salaireNet <= 600000):
					$quotite=($salaireNet*42)/100;
					break;
				case ($salaireNet>600000 AND $salaireNet <= 800000):
					$quotite=($salaireNet*45)/100;
					break;
				case ($salaireNet>800000 AND $salaireNet<= 1000000):
					$quotite=($salaireNet*48)/100;
					break;
				case ($salaireNet>1000000 AND $salaireNet<= 1500000):
					$quotite=($salaireNet*52)/100;
					break;
				case ($salaireNet>1500000 AND $salaireNet<= 2000000):
					$quotite=($salaireNet*55)/100;
					break;
				case ($salaireNet>2000000):
					$quotite=($salaireNet*57)/100;
					break;
				
			}
			//Nbre emprunte
			$result1=pg_query($conn, "SELECT  COUNT(*) AS nbreemprunt  FROM public.pos_tab_index_prt WHERE \"CRE\"='".strtoupper($email)."' AND \"ETF\"='CLOS'");
			while($row1 = pg_fetch_array($result1)){
				$nombreEmp = intval($row1["nbreemprunt"]) ;
			}
			//montant d'emprunt en cours 
			$result2=pg_query($conn, "SELECT  SUM(\"VEM\") AS mtnemprunt FROM public.pos_tab_index_prt WHERE \"CRE\"='".strtoupper($email)."'  AND \"ETF\"='CLOS' ");
			while($row2 = pg_fetch_array($result2)){
				$montantEmp = intval($row2["mtnemprunt"]);
			}

			//montant mensuel en cours 
			$result5=pg_query($conn, "SELECT  SUM(\"DC1\") AS mtnmens FROM public.pos_tab_index_prt WHERE \"CRE\"='".strtoupper($email)."'  AND \"ETF\"='CLOS' ");
			while($row5 = pg_fetch_array($result5)){
				$montantMens = intval($row5["mtnmens"]);
			}

			//Date de fin de prelevement de l'emprunt precedent
			$result3=pg_query($conn, "

				SELECT \"DFI\" AS datefin FROM public.pos_tab_index_prt WHERE \"DFI\"=(SELECT max(\"DFI\") FROM public.pos_tab_index_prt WHERE \"ETF\"='CLOS' )  AND \"CRE\" ='".strtoupper($email)."'   ");

			while($row3 = pg_fetch_array($result3)){
				$datefin = $row3["datefin"];
			}

    
 			if (intval($montantMens)>0){
 				$quotite_prelevable = intval($quotite)-intval($montantMens);
 			}else{
 				 $quotite_prelevable = intval($quotite) ;
 			}
			


		//PREPARATION DES DONNEES 
      	  $data['data'][] = [
      	  	'initiateur'=>$email ?? '',
      	  	'salaire_net'=>intval($salaireNet) ?? 0,
      	  	'prelev_mens'=>intval($montantMens) ?? 0,
      	  	'quotite_cessible'=>intval($quotite) ?? 0,
      	  	'quotite_cessible_prelev'=>intval($quotite_prelevable) ?? 0,
      	  	'nbre_emprunte'=>intval($nombreEmp) ?? 0,
      	  	'montant_emprunte'=>intval($montantEmp) ?? 0,
      	  	'date_fin_preleve'=>$datefin ?? '',
      	  	
       			 
		 ];


	   	echo json_encode($data);

	 }catch(Exception $e){
	    $data["error"]=400;
	    $data["message"]='Bad connexion '.$e;
	}