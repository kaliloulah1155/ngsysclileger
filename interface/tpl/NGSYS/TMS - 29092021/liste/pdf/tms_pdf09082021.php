<?php

       include ('../../../../../../configuration_w/mabd.php');

        require('../../../../../../configuration_w/tcpdf-master/tcpdf.php');

     $num_poseidonp = $_GET['numposeidon'];
     $dtenreg = $_GET['dtenreg'];
     $usrmail = $_GET['usrmail'];

    //echo $num_poseidonp.' '. $dtenreg.' '.$usrmail;


     

     $rq = pg_query($conn,"SELECT \"NOM\",\"PRE\",\"FON\",\"TAC\",\"SXM\",\"DXT\" FROM public.pos_tab_index_tms WHERE \"NUD\"='".$num_poseidonp."'    ");


      			 $nom='';
				 $prenom='';
				 $fonction='';
				 $tauxoccup='';
				 $semaine='';
				 $datelettre='';
				 
				
				 
				while ($row = pg_fetch_row($rq)) {
						// as a string 
						 $nom=$row[0];
						 $prenom=$row[1];
						 $fonction=$row[2];
						 $tauxoccup=$row[3];
						 $semaine=$row[4];
						 $datelettre=$row[5];

						 
				 }



	//DEBUT TACHE JOURNALIERE 
	 $output='';
     $req = pg_query($conn,"SELECT email, activites, taches, heurein, heureout, duree,taux, resultat, departement, service FROM public.tache_journalieres WHERE email='".$usrmail."'  AND date_enreg='".$dtenreg."'");
     $i=0;
      
     while ($row1 = pg_fetch_row($req)) {

     	  $output .='

 	  		<tr>
	           <td  colspan="2">'.$row1[1].'</td>
	           <td  colspan="2" >'.$row1[2].'</td>
	           <td>'.$row1[3].'</td>
	           <td>'.$row1[4].'</td>
	           <td>'.$row1[5].'</td>
	           <td>'.$row1[6].'</td>
	           <td>'.$row1[7].'</td>
	        </tr>



     	  ';

     	  	$i++;
     }



      //FIN TACHE JOURNALIERE

   


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
        $this->Rect(110, 25, 80,10,'DF');
        $this->Cell(0, 10, 'TIMESHEET', 0, false, 'C', 0, '', 0, false, 'M', 'M');
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

$pdf->SetTitle('TIMESHEET');
 
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



$pdf->AddPage('L', 'A4');
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
       <b class="semjour">SEMAINE : '.$semaine.' , '.$datelettre.'</b>

<p>
        <table  align="center" cellpadding="2" border="1">
	        <tr>
	           <td style="background-color:#2AD4FF;">EMPLOYE</td>
	           <td>'.strtoupper($nom).' '.strtoupper($prenom).'</td>
	            
	           <td style="background-color:#2AD4FF;">MANAGER </td>
	           <td>JAMES Akran </td>
	        </tr>
	        <tr>
	           <td style="background-color:#2AD4FF;">FONCTION</td>
	           <td>'.strtoupper($fonction).'</td>
	           <td style="background-color:#2AD4FF;">TAUX D\'OCCUPATION </td>
	           <td>'.$tauxoccup.'% </td>
	        </tr>
        </table>
 </p>

 <p>

 	 <span> Nombre de taches : '.$i.'</span>

 </p>

 <p>
        
        <table class="jour"  align="center" cellpadding="2" border="1" width="100%">
	        <tr>
	           <td width="20%"  colspan="2"style="background-color:#2AD4FF;">ACTIVITES</td>
	           <td width="42%" colspan="2" style="background-color:#2AD4FF;">TACHES</td>
	           <td width="8%" style="background-color:#2AD4FF;">HEURE DEBUT </td>
	           <td width="8%" style="background-color:#2AD4FF;">HEURE FIN </td>
	           <td width="6%" style="background-color:#2AD4FF;">DUREE</td>
	           <td width="5%" style="background-color:#2AD4FF;">TAUX(%) </td>
	           <td width="10%" style="background-color:#2AD4FF;">RESULTAT</td>
	        </tr>
	        
	        '.$output.'
	         
        </table>
 </p>

<!-- END CONTENT -->
'; 
$pdf->writeHTMLCell(0, 0, '', '',$html2, 0, 1, 0, true, '', true);

$pdf->Output('timesheet.pdf', 'I');

//============================================================+
// END OF FILE
//============================================================+






	?>