<?php

	include ("../../../../../configuration_w/mabd.php");
    require('../../../../../configuration_w/tcpdf-master/tcpdf.php');
	 
    $contrat = $_GET['contrat'];
	$mois = $_GET['mois'];
	$year = $_GET['year'];

	//echo $contrat.' '.$mois.' '.$year;

/////////////////TRAITEMENT DES DONNEES ///////////////////////////////////////////////////////
$output='';
$query_="
SELECT 
pay.\"NUD\",
prs.\"MAT\",
pay.\"ENT\" ,
CONCAT(prs.\"NOM\",' ', prs.\"PRE\") AS \"Nom prenoms\",
pay.\"SLN\" ,
pay.\"HNE\" ,
pay.\"ASN\",
pay.\"SAL\",
pay.\"HNP\" ,
prs.\"RIB\",
prs.\"BQE\",
pay.\"C2\", --type de contrat--
pay.\"A1\"
FROM public.pos_tab_index_pay pay
INNER JOIN public.pos_tab_index_prs prs
ON pay.\"MEL\"=prs.\"MEL\"
WHERE pay.\"C2\"='".$contrat."' AND EXTRACT(MONTH FROM pay.\"DAE\")='".$mois."' AND EXTRACT(YEAR FROM pay.\"DAE\")='".$year."' AND pay.\"MEL\" IS NOT NULL;

	";
$content_ = pg_query($conn,$query_)or die('Query failed: ' . pg_last_error());
while ($rowcontent = pg_fetch_row($content_)) {
		$retour["paies"][] = array(
				'num'=> $rowcontent[0],
				'matricule'=> $rowcontent[1] ?? '',
				'entreprise'=> $rowcontent[2] ?? '',
				'nom_complet'=> $rowcontent[3] ?? '',
				'sal_net'=> $rowcontent[4] ?? 0,
				'hono_net'=> $rowcontent[5] ?? 0,
				'assurance'=> $rowcontent[6] ?? 0,
				'sal_net_pay'=> $rowcontent[7] ?? 0,
				'hono_net_pay'=> $rowcontent[8] ?? 0,
				'rib'=> $rowcontent[9] ?? '',
				'banque'=> $rowcontent[10] ?? '',
				'contrat'=> $rowcontent[11] ?? '',
				'date_edit'=> $rowcontent[12] ?? ''
		);
}

for ($i=0; $i <count($retour['paies']) ; $i++) { 
	
	 
	 $montant1=0;
	 $montant2=0;
	 $montant3=0;
	 $lib1='HONORAIRE NET';
	 $lib2='HONORAIRE NET PAYE';
	 if($retour['paies'][$i]['contrat']=='Consultant interne' OR $retour['paies'][$i]['contrat']=='Consultant externe'){
		$montant1=str_replace(',','.',number_format($retour['paies'][$i]['hono_net']) );
		$montant2=str_replace(',','.',number_format($retour['paies'][$i]['hono_net_pay']) );
	 }else{
		$montant1=str_replace(',','.',number_format($retour['paies'][$i]['sal_net']) );
		$montant2=str_replace(',','.',number_format($retour['paies'][$i]['sal_net_pay']) );
		 $lib1='SALAIRE NET';
		 $lib2='SALAIRE NET PAYE';
	 }
	 
	 $montant3=str_replace(',','.',number_format($retour['paies'][$i]['assurance']) );
 
	$output .='<tr width="100%">
					<td width="65px">'.$retour['paies'][$i]['matricule'].'</td>
					<td width="100px">'.$retour['paies'][$i]['entreprise'].'</td>
					<td width="150px">'.$retour['paies'][$i]['nom_complet'].'</td> 
					<td width="100px">'.$montant1.' F CFA</td>
					<td width="100px">'.$montant3.' F CFA</td>
					<td width="100px">'.$montant2.' F CFA</td>
					<td width="100px">'.$retour['paies'][$i]['rib'].'</td>
					<td width="100px">'.$retour['paies'][$i]['banque'].'</td>
					
				</tr>
	';
}

     
   

//exit;

////////////////////////////////////////////////////////////////////////////////////////////////

	// Extend the TCPDF class to create custom Header and Footer
	class PDF extends TCPDF {
	
	}
	
	// create new PDF document
	$pdf = new PDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);
	// $pdf = new PDF('P','mm','A4');

	// set document information
	$pdf->SetCreator('IBSON');

	$pdf->SetTitle('Salaire mensuel');

	//supprime les lignes au dessus
	$pdf->setPrintHeader(false);

	$pdf->setPrintFooter(false);
	 
	$pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));

	// set margins
	$pdf->SetMargins(5,20, PDF_MARGIN_RIGHT);
	$pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
	$pdf->SetFooterMargin(PDF_MARGIN_FOOTER);
	

	// set auto page breaks
	$pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);


	// set default font subsetting mode
	$pdf->setFontSubsetting(true);


	// helvetica or times to reduce file size.
	$pdf->SetFont('dejavusans', '', 11, '', true);


	// $pdf->AddPage();
	$pdf->AddPage('L', 'A4');

	//BEGIN HEADER NO REPEAT ON PAGE
	$image_file =K_PATH_IMAGES.'ngser.jpg';
	$pdf->Image($image_file, 10, 10, 40, '', 'JPG', '', 'T', false, 300, '', false, false, 0, false, false, false);
	$pdf->Ln(20);
	 
	$html2 = '
		&nbsp;&nbsp;<br/>
		
		<!-- BEGIN CONTENT -->
		<table margin:"auto" width="100%" align="center" style="font-family: Century Gothic;font-size: 15pt;text-decoration: underline;">
			<tr>
				<td>
					<b>SALAIRE DU MOIS DE '.strtoupper($retour['paies'][0]['date_edit']).'</b>
				</td>
			</tr>
		</table>
		
		
		&nbsp;&nbsp;<br/>
		&nbsp;&nbsp;<br/>
		&nbsp;&nbsp;<br/>
		&nbsp;&nbsp;<br/>

		<table border="1" align="center" width="100%" STYLE="font-family: Century Gothic; font-size: 9pt;">
			<thead>
				<tr bgcolor="#d6d3d3" >
					<td width="65px">MATRICULE</td>
					<td width="100px">ENTREPRISE</td>
					<td width="150px">NOM & PRENOMS</td>
					<td width="100px">'.$lib1.'</td>
					<td width="100px">ASSURANCE</td>
					<td width="100px">'.$lib2.'</td>
					<td width="100px">RIB</td>
					<td width="100px">BANQUE</td>
					
				</tr>
			</thead>

			<tbody>
				 

			   '.$output.'
				 
			    
				 
			</tbody>
			
		</table>
		<!-- END CONTENT -->
	';

	
	$pdf->writeHTMLCell(0, 0, '', '',$html2, 0, 1, 0, true, '', true);
	ob_end_clean();   //clean buffer important for output table
	$pdf->Output('salaire_mensuel.pdf', 'I');
	

?>