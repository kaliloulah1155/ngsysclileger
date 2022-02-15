<?php

    include ('../../../../../configuration_w/mabd.php');
    require('../../../../../configuration_w/tcpdf-master/tcpdf.php');
     $numposeidon= $_GET['numposeidon'] ;

	 ini_set('display_errors', 1);
	  ///////////TRAITEMENT DES DONNEES ////////////
	  $rq='SELECT "COD","NOM","PRE","VLE","COM","LPR","DAA","DFI","DUR","MOT","IMM","NCH","DCR","PAY","CLA","COP","E1","LOG" FROM public.pos_tab_index_mis WHERE "NUD"='.$numposeidon.' ';

	  $contents=pg_query($rq) or die('Query failed: ' . pg_last_error());
 
	  $code='';
	  $nom='';
	  $prenoms='';
	  $ville='';
	  $motif='';
	  $projet='';
	  $date_dep='';
	  $date_ret='';
	  $duree='';
	  $moyen_trsp='';
	  $immatricule='';
	  $nomchf='';
	  $date_crea='';
	  $pays='';
	  $classe='';
	  $compagnie='';
	  $nbr_duree=1;
	  $destination_ctn=0;
	  $profil_ctn=0;
	  while($row =pg_fetch_row($contents)){
 
		  $code=$row[0];
		   $nom=$row[1];
		  $prenoms=$row[2];
		  $ville=$row[3];
		  $motif=$row[4];
		  $projet=$row[5];
		  $date_dep=$row[6];
		  $date_ret=$row[7];
		  $duree=$row[8]==''?'':$row[8].' Jours';
		  $moyen_trsp=$row[9];
		  $immatricule=$row[10];
		  $nomchf=$row[11];
		  $date_crea=$row[12];
		  $pays=$row[13];
		  $classe=$row[14];
		  $compagnie=$row[15];
		  $nbr_duree=intval($row[8]);
		  $destination_ctn=intval($row[16]);
		 $profil_ctn=intval($row[17]);
 
	  }

	  $retour=array();


	  ///tableau estimation ////

	  $destination=$destination_ctn ;
	  $profil=$profil_ctn;
	  $qte=$nbr_duree;

	   
  
  
	  $id_rq=0;
	   //retrouvez les données à partir de l'id
	   $frs_id=pg_query("SELECT
		  \"COD\"
		  FROM 
		  public.pos_tab_index_frs WHERE  \"LOG\"='".$profil."' AND \"DTN\"='".$destination."'  ");
		  
		  while ($rowID = pg_fetch_row($frs_id)) {
			  $id_rq=$rowID[0];
		  }
  
		  $retour["code"]=$id_rq;
  
		  $k=1;
		  $somme=0;
  
		  $result = pg_query("SELECT * FROM public.mis_tab_besoins WHERE code_key='".$id_rq."' ");
		  $find = pg_num_rows($result);
  
		  if ($find!=0){
  
			  $rq = pg_query("SELECT id, id_besoins, pu,code_key FROM public.mis_tab_besoins WHERE code_key='".$id_rq."' ");
  
			  /////FIN AUTRES BESOIN /////////
			  while ($row = pg_fetch_row($rq)) {
				   //besoins 
  
				   $rqtitle = pg_query($conn,"
						  SELECT DISTINCT id , libelle
						  FROM public.mis_besoins
						  WHERE id='".$row[1]."'
					 ");
  
					 while ($rowtitle = pg_fetch_row($rqtitle)) {
						  
  
					  $rqcontent = pg_query($conn,"
									  SELECT id, libelle  
									  FROM public.mis_besoins  WHERE id='". $row[1]."'
									  ");
								  
								  while ($rowcontent = pg_fetch_row($rqcontent)) {
								  
									  $retour['data'][]=[
										  'id'=> intval($rowcontent[0]),
										  'lib'=> ucwords($rowcontent[1]),
										  'pu'=>intval($row[2]),
										  'qte'=>1,
										  'xof'=>intval($row[2])*1
									  ];
  
									  $somme+=intval($row[2])*1;
										  $k++;
								  }
  
  
				  }
  
  
  
			  }
  
			  /////FIN AUTRES BESOIN /////////
  
			  ///BESOIN OBLIGATOIRE
  
  
			  $frs_obl=pg_query("SELECT
			  \"L1A\",\"L1B\",\"L1C\",\"L1D\",\"L1E\",\"K9\"
			  FROM 
			  public.pos_tab_index_frs WHERE  \"COD\"='".$id_rq."'   ");
		  
		  while ($rowobg = pg_fetch_row($frs_obl)) {
			  $hotel= intval($rowobg[0]);
			  $nourriture= intval($rowobg[1]);
			  $depl_urb= intval($rowobg[2]);
			  $assurance= intval($rowobg[3]);
			  $transport= intval($rowobg[4]);
  
			  $tot_pu= intval($rowobg[5]);
		  }
  
			  $retour['data'][]=[
				  'id'=> $k,
				  'lib'=>ucwords('hotel'),
				  'pu'=>intval($hotel),
				  'qte'=>intval($qte)-1,
				  'xof'=>intval($hotel)*intval(intval($qte)-1)
			  ];
  
			  $somme+=intval($hotel)*intval(intval($qte)-1);
  
			  $retour['data'][]=[
				  'id'=> $k+1,
				  'lib'=>ucwords('nourriture'),
				  'pu'=>intval($nourriture),
				  'qte'=>intval($qte),
				  'xof'=>intval($nourriture)*intval($qte)
			  ];
			  $somme+=intval($nourriture)*intval($qte);
  
			  $retour['data'][]=[
				  'id'=> $k+2,
				  'lib'=>ucwords('deplacement urbain'),
				  'pu'=>intval($depl_urb),
				  'qte'=>intval($qte),
				  'xof'=>intval($depl_urb)*intval($qte)
			  ];
			  $somme+=intval($depl_urb)*intval($qte);
  
			  $retour['data'][]=[
				  'id'=> $k+3,
				  'lib'=>ucwords('assurance'),
				  'pu'=>intval($assurance),
				  'qte'=>1,
				  'xof'=>intval($assurance)*intval(1)
			  ];
			  $somme+=intval($assurance)*intval(1);
  
			  $retour['data'][]=[
				  'id'=> $k+4,
				  'lib'=>ucwords('transport'),
				  'pu'=>intval($transport),
				  'qte'=>1,
				  'xof'=>intval($transport)*intval(1)
			  ];
			  $somme+=intval($transport)*intval(1);
			  
  
			  $retour['tot_pu']= $tot_pu;
			  $retour['tot_xof']=$somme;
  
			  //////////////////////
  
		  }else{
			  $retour["error"]='not found';
		  }
  
		 
 		$output_tab='';


		    //var_dump($retour["tot_pu"]);

		  for ($i=0; $i < count($retour["data"]) ; $i++) { 
			
				$output_tab.="
 				<tr width='100%'>
					<td width='200px'> ".utf8_encode($retour["data"][$i]["lib"])."</td>
					<td width='100px'>".str_replace(',','.',number_format($retour["data"][$i]["pu"]) )." F CFA</td>
					<td width='100px'>".$retour["data"][$i]["qte"]."</td>
					<td width='110px'>".str_replace(',','.',number_format($retour["data"][$i]["xof"]) )." F CFA</td> 
				</tr>
 				
				";

		  }
 		  $output_tab.="
			<tr width='100%'>
				<td width='200px'><b>Total Frais de Mission</b></td>
				<td width='100px'><b> ".str_replace(',','.',number_format($retour["tot_pu"]) )." F CFA </b></td>
				<td width='100px'> </td>
				<td width='110px'><b>".str_replace(',','.',number_format($retour["tot_xof"]) )." F CFA</b></td>
			</tr>
		 
		 
		  ";
		  
 		 
	  /////fin tableau estimation



	  ////////////////////////////////////////////////

	// Extend the TCPDF class to create custom Header and Footer
	class PDF extends TCPDF {
	
	}
	     
	// create new PDF document
	$pdf = new PDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);

	// set document information
	$pdf->SetCreator('IBSON');

	$pdf->SetTitle('Estimation de mission');

	//supprime les lignes au dessus
	$pdf->setPrintHeader(false);

	$pdf->setPrintFooter(false);
	 
	$pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));

	// set margins
	$pdf->SetMargins(PDF_MARGIN_LEFT,20, PDF_MARGIN_RIGHT);
	$pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
	$pdf->SetFooterMargin(PDF_MARGIN_FOOTER);

	// set auto page breaks
	$pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);


	// set default font subsetting mode
	$pdf->setFontSubsetting(true);


	// helvetica or times to reduce file size.
	$pdf->SetFont('dejavusans', '', 11, '', true);


	$pdf->AddPage();

	//BEGIN HEADER NO REPEAT ON PAGE
	$image_file =K_PATH_IMAGES.'ngser.jpg';
	$pdf->Image($image_file, 10, 10, 40, '', 'JPG', '', 'T', false, 300, '', false, false, 0, false, false, false);
	$pdf->Ln(20);
	 
	$html2 = '
		&nbsp;&nbsp;<br/>
		&nbsp;&nbsp;<br/>
		&nbsp;&nbsp;<br/>
		&nbsp;&nbsp;<br/>
		&nbsp;&nbsp;<br/>
		&nbsp;&nbsp;<br/>
		
		<!-- BEGIN CONTENT -->
		<table border="2" width="100%" align="center" style="font-family: Century Gothic;padding: 5px">
			<tr>
				<td>
					<b>ESTIMATION DE FRAIS DE  MISSION</b>
				</td>
			</tr>
		</table>

		&nbsp;&nbsp;<br/>
		&nbsp;&nbsp;<br/>
		&nbsp;&nbsp;<br/>
		&nbsp;&nbsp;<br/>
		&nbsp;&nbsp;<br/>
		
		<table border="0" width="100%" STYLE="font-family: Century Gothic; font-size:12pt; ">                  
			<tr width="100%">
				<td width="200px">Voyageurs</td>
				<td width="200px"> '.utf8_encode($nom).' '.utf8_encode($prenoms).'</td >

			</tr>
			&nbsp;&nbsp;<br/>
			<tr width="100%">
				<td width="200px">Destination</td>
				<td width="200px">'.utf8_encode($pays).'</td >
				<td width="100px">Classe</td>
			</tr>
			&nbsp;&nbsp;<br/>
			<tr width="100%">
				<td width="200px">Moyen de Transport</td>
				<td width="200px">'.utf8_encode($moyen_trsp).'</td >
				<td width="100px">'.utf8_encode($classe).'</td>
			</tr>
			&nbsp;&nbsp;<br/>
			<tr width="100%">
				<td width="200px">Compagnie</td> 
				<td width="200px">'.utf8_encode($compagnie).'</td >
			</tr>
			&nbsp;&nbsp;<br/>
			<tr width="100%">
				<td width="200px">Période</td>
				<td width="200px">'.$date_dep.' au '.$date_ret.'</td >
			</tr>
			&nbsp;&nbsp;<br/>
			<tr width="100%">
				<td width="200px">Durée</td>
				<td width="200px">'.$duree.'</td >
			</tr>
											   
		</table>
		
		
		&nbsp;&nbsp;<br/>
		&nbsp;&nbsp;<br/>
		&nbsp;&nbsp;<br/>
		&nbsp;&nbsp;<br/>

		<table border="1" width="100%" STYLE="font-family: Century Gothic; font-size:12pt;">
			<thead>
				<tr width="100%" bgcolor="#d6d3d3">
					<td width="25%">DESIGNATION</td>
					<td width="25%">PRIX UNITAIRE</td>
					<td width="25%">DUREE</td>
					<td width="25%">TOTAL XOF</td>
				</tr>
			</thead>

			<tbody >
				 '.$output_tab.'
			</tbody>
			
		</table>
		<!-- END CONTENT -->


	<br/>
		<p>
		<table width="100%" >
			<tr>
			    <td> <b><u>Visa contrôle de gestion</b></u></td>
			    <td style="text-align:center"><b><u>Visa Finance</b></u></td>
				<td> <b><u>Visa Direction Générale</b></u> </td>
			</tr>
			 
			 
		</table>
	</p>
	';

	
	$pdf->writeHTMLCell(0, 0, '', '',$html2, 0, 1, 0, true, '', true);
	ob_end_clean();   //clean buffer important for output table
	$pdf->Output('frais_mission.pdf', 'I');
	

 