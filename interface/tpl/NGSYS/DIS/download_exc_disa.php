 <?php

include ("../../../../configuration_w/mabd.php");
require '../../../../vendor/autoload.php';


use PhpOffice\PhpSpreadsheet\Spreadsheet;
use \PhpOffice\PhpSpreadsheet\IOFactory;
use \PhpOffice\PhpSpreadsheet\Style\Alignment;
use \PhpOffice\PhpSpreadsheet\Style\Border;
use \PhpOffice\PhpSpreadsheet\Style\Fill;

//ini_set('display_errors', 1);

///DONNEES E-DISA /////
 $data=[];
 $uniqueObjectArray=[];

   $data["success"]=200;

   //Declaration des variables 
   $numposeidon='';
   
   $nom='';
   $prenoms='';
   $date_naiss='';
   $cnps=''; //CNPS
   $type_contrat= ''; //type de contrat
   $date_embauche=''; //date d'embauche
   $date_depart=''; //date de depart
   $email='';
   $mois='';

     

     $counter=1;
    
    	$demission=false;
      //Données de la fiche contrat 
     $query_cot ="SELECT DISTINCT \"CNP\",\"TYE\",\"DSG\",\"DFI\",\"DEC\",\"MEL\"
       FROM public.pos_tab_index_cot WHERE  \"MEL\"  IS NOT NULL AND \"TYE\"  LIKE '%CD%' OR \"TYE\"  LIKE '%Consultant%' ORDER BY \"MEL\" ASC, \"DSG\" DESC   ";
      $contests_cot = pg_query($query_cot) or die('Query failed: ' . pg_last_error());
        while ($row_cot = pg_fetch_row($contests_cot)) {
        	 $cnps=$row_cot[0];
          	 $email =$row_cot[5];
          	 $date_embauche=$row_cot[2]?? '';
          	 if(strpos($row_cot[1], "CDI") !== false){
              		$date_depart=$row_cot[4] ?? '';
              }
              if(strpos($row_cot[1], "CDD") !== false){

              		$date_depart=$row_cot[3] ?? '';
              }

              //Statut demission
	        if($date_depart !=''){
	        	$demission=true;
	        }else{
	        	$demission=false;
	        }

            //données de la fiche d'identification
          	 $rq = pg_query($conn,"
				    SELECT
				         \"NOM\",\"PRE\",\"DNS\"
				    FROM 
				            public.pos_tab_index_prs
				     WHERE \"MEL\" ='".strtolower($email)."'
			    ");

          	 while ($row = pg_fetch_row($rq)) {
          	 		$nom = $row[0];
          	 		$prenoms = $row[1];
          	 		$date_naiss = $row[2];
          	 }
          	 ////////////////////////////////////////


          	 ////PERIODE TRAVAILLE 

          	 $dtemb = explode("/", $date_embauche);
    		 $dtftemb=$dtemb[2].'-'.$dtemb[1].'-'.$dtemb[0] ;
    		 $annee_emb=$dtemb[2];
    		 $d1 = new DateTime($dtftemb);
			 $d2 = new DateTime();
			 $interval_curr = $d1->diff($d2);
    		 $annee_curr = ($d2)->format('Y');


    		 $dtdep = explode("/", $date_depart);
    		 $dtftdep=  $dtdep[2].'-'.$dtdep[1].'-'.$dtdep[0] ;
    		 $annee_dep=$dtdep[2];

    		 if($annee_dep !=''){
    		 		 $d3 = new DateTime($dtftdep);
    		 		$interval_dep = $d1->diff($d3);
    		 }
    		  
 

    		 if(!$demission){
    		 	if($annee_emb==$annee_curr){
    		 		$mois=$interval_curr->m;
    		 	}else{
    		 		$mois=12;
    		 	}
    		 }else{
    		 	 
	    		 	if($annee_emb==$annee_dep){
	    		 		$mois=$interval_dep->m;
	    		 	}else{
	    		 		$mois=$interval_dep->m;
	    		 	}
    			 
    		 }

          	 ///////////////////////////////////////

         ///DONNEES DE LA FICHE DE PAIE
          $query_pay =pg_query("SELECT  \"SRA\",\"ATR\",\"ACI\",\"RDT\" FROM public.pos_tab_index_pay WHERE  \"MEL\" ='".strtolower($email)."'   ");

          $total_brute=0;
        while ($row_pay = pg_fetch_row($query_pay)) {

            $total_brute+=((int)$row_pay[3]+(int)$row_pay[4]+(int)$row_pay[6]+(int)$row_pay[7]);
        }
         //////////////////////////////////

          	 //PREPARATION DES DONNEES 
          	 
          	  $data['data'][] = [
          	  	'cnps'=>$cnps ?? '',
           			'email'=>$email ?? '',
           			'nom'=>$nom ??'',
           			'prenoms'=>$prenoms ??'',
           			'date_naiss'=>$date_naiss ??'',
           			'contrat'=>$row_cot[1] ?? '',
           			'date_embauche'=>$date_embauche ??'',
           			'date_depart'=>$date_depart ??'',
           			'demission'=>$demission,
           			"mensualite"=>'M',
           			"mois"=>$mois,
                "brute"=>$total_brute
    		 ];
        }

       //Permet de filter un tableau d'objet et enlève les doublons sur les valeurs repetitives

        function returnUniqueProperty($array,$property){
        	$tempArray=array_unique(array_column($array, $property));
        	$moreUniqueArray=array_values(array_intersect_key($array, $tempArray));
        	return $moreUniqueArray;
        }
        $counter=count(returnUniqueProperty($data['data'],'email'));

        $uniqueObjectArray['nb']=$counter;
       $uniqueObjectArray['resultats']=returnUniqueProperty($data['data'],'email');

		// echo json_encode($uniqueObjectArray);
////////////////////// FIN DE RECUPERATION DES DONNEES //////////////////////////


/////////////////  FORMAT EXCEL DISA /////////////////////////////////

 
    $choice='Xls';

    $spreadsheet=new Spreadsheet();
    $active_sheet=$spreadsheet->getActiveSheet();

    //set default font
   $spreadsheet->getDefaultStyle()
                ->getFont()
                ->setName('Calibri')
                ->setSize(11);
  $count=1;

  //echo count($uniqueObjectArray['resultats']); exit;

  for ($i=0; $i < count($uniqueObjectArray['resultats']) ; $i++) { 

  	 $active_sheet->setCellValue('A'.$count,$uniqueObjectArray['resultats'][$i]['cnps']);
     $active_sheet->setCellValue('B'.$count,$uniqueObjectArray['resultats'][$i]['nom']);
     $active_sheet->setCellValue('C'.$count,$uniqueObjectArray['resultats'][$i]['prenoms']);
     $active_sheet->setCellValue('D'.$count,$uniqueObjectArray['resultats'][$i]['date_naiss']);
     $active_sheet->setCellValue('E'.$count,$uniqueObjectArray['resultats'][$i]['date_embauche']);
     $active_sheet->setCellValue('F'.$count,$uniqueObjectArray['resultats'][$i]['date_depart']);
     $active_sheet->setCellValue('G'.$count,$uniqueObjectArray['resultats'][$i]['mensualite']);
     $active_sheet->setCellValue('H'.$count,$uniqueObjectArray['resultats'][$i]['brute']);


  	$count=$count+1;
  } 

   

   $writer=\PhpOffice\PhpSpreadsheet\IOFactory::createWriter($spreadsheet,$choice);
  //$file_name=time().'.'.strtolower($choice);
 
   $file_name='cnps_edisa.'.strtolower($choice);
   $writer->save($file_name);

  ob_end_clean();  //utilise ce code lorsqu'on a erreur de probleme de extension et fichier dans le module
  header('Content-Type: application/x-www-form-urlencoded');
  header('Content-Transfer-Encoding: Binary');
  header("Content-disposition: attachment; filename=\"".$file_name."\"");
  readfile($file_name); 




///////////////// FIN   FORMAT EXCEL DISA /////////////////////////////////


