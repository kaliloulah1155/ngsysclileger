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
 $output='';

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
			if ($date_embauche != '') {
				$dtemb = explode("/", $date_embauche);
				$dtftemb=$dtemb[2].'-'.$dtemb[1].'-'.$dtemb[0] ;
				$annee_emb=$dtemb[2];
				$d1 = new DateTime($dtftemb);
				$d2 = new DateTime();
				$interval_curr = $d1->diff($d2);
				$annee_curr = ($d2)->format('Y');

			}
          	 
			if($date_depart !=''){
				$dtdep = explode("/", $date_depart);
				$dtftdep=  $dtdep[2].'-'.$dtdep[1].'-'.$dtdep[0] ;
				$annee_dep=$dtdep[2];
				$d3 = new DateTime($dtftdep);
				$interval_dep = $d1->diff($d3);
			 
	        } 

    		//  $dtdep = explode("/", $date_depart);
    		//  $dtftdep=  $dtdep[2].'-'.$dtdep[1].'-'.$dtdep[0] ;
    		//  $annee_dep=$dtdep[2];

    		//  if($annee_dep !=''){
    		//  		 $d3 = new DateTime($dtftdep);
    		//  		$interval_dep = $d1->diff($d3);
    		//  }
    		  
 

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
		
// $contests_prs = pg_query($rq) or die('Query failed: ' . pg_last_error());
while ($tab = $uniqueObjectArray['resultats']) {

	$output .="
	 <tr>
				<td style='width: 100px;border:none;
				'>
				   ".$tab[0]."
				</td>
				<td style='width: 5px;border:none;'>
					".$tab[1]."
				</td>
				<td style='width: 100px;border:none;'>
					".$tab[2]."
				</td>
				<td style='width: 100px;border:none;'>
				   ".$tab[3]."
				</td>
				<td style='width: 100px;border:none;'>
				  ".$tab[4]."
				</td>
				 
	 </tr>";    
	 
	 $i++;
}


      // Extend the TCPDF class to create custom Header and Footer
	  class PDF extends TCPDF {

		//Page header
		public function Header() {
			// Logo
		   // $image_file ='http://localhost:81/NGSYS/configuration_w/tcpdf-master/examples/images/logo_example.jpg';
		  //$image_file =K_PATH_IMAGES.'logo_example.jpg';
		   $image_file =K_PATH_IMAGES.'ngser.jpg';
			$this->Image($image_file, 10, 10, 40, '', 'JPG', '', 'T', false, 300, '', false, false, 0, false, false, false);
	
			// Set font
			$this->SetFont('helvetica', 'B', 12);
			// Title
			$this->Ln(15);
			$this->setY(30);
			$this->SetDrawColor(28 , 28, 28);
			$this->SetFillColor(221 , 222, 226);
			$this->Rect(65, 25, 80,10,'DF');
			$this->Cell(0, 10, 'E-DISA', 0, false, 'C', 0, '', 0, false, 'M', 'M');
		}
	
		// Page footer
		public function Footer() {
			// Position at 15 mm from bottom
			$this->SetY(-15);
			// Set font
			$this->SetFont('helvetica', 'I', 8);
			// Page number
			$this->Cell(0, 10, 'Page '.$this->getAliasNumPage().'/'.$this->getAliasNbPages(), 0, false, 'C', 0, '', 0, false, 'T', 'M');
		}
	}
	
	// create new PDF document
	$pdf = new PDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);
	
	// set document information
	$pdf->SetCreator('IBSON');
	
	$pdf->SetTitle('E-DISA');
	 
	// set default header data
	$pdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, PDF_HEADER_TITLE.' 001', PDF_HEADER_STRING, array(0,64,255), array(0,64,128));
	$pdf->setFooterData(array(0,64,0), array(0,64,128));
	
	// set header and footer fonts
	$pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
	$pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));
	
	// set default monospaced font
	$pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);
	
	// set margins
	$pdf->SetMargins(PDF_MARGIN_LEFT,50, PDF_MARGIN_RIGHT);
	$pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
	$pdf->SetFooterMargin(PDF_MARGIN_FOOTER);
	
	// set auto page breaks
	$pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);
	
	// set image scale factor
	$pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);
	
	
	// ---------------------------------------------------------
	
	// set default font subsetting mode
	$pdf->setFontSubsetting(true);
	
	// Set font
	// dejavusans is a UTF-8 Unicode font, if you only need to
	// print standard ASCII chars, you can use core fonts like
	// helvetica or times to reduce file size.
	$pdf->SetFont('dejavusans', '', 11, '', true);
	
	//header
	
	// Add a page
	// This method has several options, check the source code documentation for more information.
	
	// set text shadow effect
	//$pdf->setTextShadow(array('enabled'=>true, 'depth_w'=>0.2, 'depth_h'=>0.2, 'color'=>array(196,196,196), 'opacity'=>1, 'blend_mode'=>'Normal'));
	
	
	// Set some content to print
	// define some HTML content with style
	
	
	
	$pdf->AddPage('P', 'A4');
	 $html2 ='
	<!-- CSS STYLE -->
	<style>
	   .semjour {
		 text-align:center;
	 }
	
	 .jour tr{
		 font-size:9px;
	 }
	
	</style>
	<!-- <END CSS STYLE -->
	
	<!-- BEGIN CONTENT -->
	 <p>
		Nombre : '.$i.'
	 </p>
	
	 <p>
			
			<table class="jour"  align="center" cellpadding="2" border="1" width="100%">
				<tr>
				   <td   style="background-color:#2AD4FF;">CNPS</td>
				   <td   style="background-color:#2AD4FF;">EMAIL</td>
				   <td   style="background-color:#2AD4FF;">NOM </td>
				   <td   style="background-color:#2AD4FF;">PRENOM</td>
				   <td   style="background-color:#2AD4FF;">DATE NAISSANCE</td>
				    
				</tr>
				
				'.$output.'
				 
			</table>
	 </p>
	
	<!-- END CONTENT -->
	'; 
	$pdf->writeHTMLCell(0, 0, '', '',$html2, 0, 1, 0, true, '', true);
	
	$pdf->Output('disa.pdf', 'I');
	
	//============================================================+
	// END OF FILE
	//============================================================+
///////////////// FIN   FORMAT EXCEL DISA /////////////////////////////////


