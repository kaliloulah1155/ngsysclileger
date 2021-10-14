<?php
  
// Send Headers   
    session_start();    
    include ('../../../../../configuration_w/mabd.php');
    require('../../../../../configuration_w/tcpdf-master/tcpdf.php');

     $numposeidon= $_GET['numposeidon'] ;
     
     // Extend the TCPDF class to create custom Header and Footer
class PDF extends TCPDF {

    //Page header
    
    // Page footer
    /*public function Footer() {
        // Position at 15 mm from bottom
        $this->SetY(-15);
        // Set font
        $this->SetFont('helvetica', 'I', 8);
        // Page number
        $this->Cell(0, 10, 'Page '.$this->getAliasNumPage().'/'.$this->getAliasNbPages(), 0, false, 'C', 0, '', 0, false, 'T', 'M');
    } */
}
// create new PDF document
$pdf = new PDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);

// set document information
$pdf->SetCreator('IBSON');

$pdf->SetTitle('pret');

//supprime les lignes au dessus
$pdf->setPrintHeader(false);


$pdf->setPrintFooter(false);
 
// set default header data
/*
$pdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, PDF_HEADER_TITLE.' 001', PDF_HEADER_STRING, array(0,64,255), array(0,64,128));*/


//$pdf->setFooterData(array(0,64,0), array(0,64,128));

// set header and footer fonts
//$pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
$pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));

// set default monospaced font
//$pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);

// set margins
$pdf->SetMargins(PDF_MARGIN_LEFT,20, PDF_MARGIN_RIGHT);
$pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
$pdf->SetFooterMargin(PDF_MARGIN_FOOTER);

// set auto page breaks
$pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);

// set image scale factor
//$pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);


// ---------------------------------------------------------

// set default font subsetting mode
$pdf->setFontSubsetting(true);

// Set font
// dejavusans is a UTF-8 Unicode font, if you only need to
// print standard ASCII chars, you can use core fonts like
// helvetica or times to reduce file size.
$pdf->SetFont('dejavusans', '', 11, '', true);

//header

 

$pdf->AddPage();

//BEGIN HEADER NO REPEAT ON PAGE
$image_file =K_PATH_IMAGES.'ngser.jpg';
        $pdf->Image($image_file, 10, 10, 40, '', 'JPG', '', 'T', false, 300, '', false, false, 0, false, false, false);
 $pdf->Ln(20);



 
 $html2 = '
<!-- CSS STYLE -->
<style>
   .arrowRight {
  border: solid black;
  border-width: 0 3px 3px 0;
  display: inline-block;
  padding: 3px;
}

</style>
<!-- <END CSS STYLE -->

<!-- BEGIN CONTENT -->

    <table STYLE="font-family: Century Gothic; font-size:11pt;">
        <tr>
            <td></td>
           <td></td>
           <td></td>
            <td> Abidjan, le 16 Mai 2018 </td>
        </tr>
        <br/>
         <tr>
            <td></td>
            <td></td>
            <td></td>
            <td> A </td>
          </tr>
          <br/>
         <tr>
            <td></td>
            <td></td>
            <td></td>
            <td> La Direction Générale de NGSER </td>
          </tr>
    </table>
<br/>
<br/> 
<br/> 
<p>
<b><u>Objet</u></b> : Demande de réduction de mensualités de remboursement de prêt.<br/> <br/> <br/> 
       Messieurs,
<br/> <br/>
Dans un courrier en date du 19 Décembre 2017, j’ai sollicité et obtenu de votre part  un prêt  de  sept cent mille  (700.000) francs CFA en vue de couvrir les frais liés à mon déménagement.

<br/> <br/>

Le remboursement  de ce prêt couvrait   une période de  quatorze (14) mois, par le règlement de mensualités constantes de cinquante mille (50.000) francs CFA, à compter de la fin du mois de Mars 2018.  

<br/> <br/>

    Je viens par la présente vous prier de bien vouloir réduire les mensualités constantes à vingt-cinq mille (25.000) francs CFA à compter de la fin du mois de Mai 2018 et ce, jusqu’à l’apurement définitif de ma dette. 
Dans l’attente d’une suite favorable,

<br/> <br/>

Veuillez agréer, Messieurs, l’expression de ma sincère considération.

</p>
<p></p>
<p></p>
<p></p>
<p>
    <table>
        <tr>
            <td></td>
           <td></td>
           <td></td>
            <td></td>
        </tr>
         <tr> 
            <td></td>
            <td></td>
            <td></td>
         </tr>
         <tr> 
            <td></td>
            <td></td>
            <td></td>
         </tr>
          <tr> 
            <td></td>
            <td></td>
            <td></td>
         </tr>
         <tr>
             <td></td>
            <td></td>
            <td></td>
            <td><u> GANGLOZOUN A. ASSSIBA </u></td>
          </tr>
    </table>
</p>


<!-- END CONTENT -->
'; 
$pdf->writeHTMLCell(0, 0, '', '',$html2, 0, 1, 0, true, '', true);

$pdf->Output('pret.pdf', 'I');

//============================================================+
// END OF FILE
//============================================================+


      


?>