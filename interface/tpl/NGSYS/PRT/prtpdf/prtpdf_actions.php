<?php
      
// Send Headers   
    session_start();    
    include ('../../../../../configuration_w/mabd.php');
    require('../../../../../configuration_w/tcpdf-master/tcpdf.php');

     $numposeidon= $_GET['numposeidon'] ;

     $query_prt =" SELECT  
         \"DT5\" ,
         TO_CHAR(\"DCR\" :: DATE, 'dd/mm/yyyy'),
         \"VEM\",
         \"MDT\",
         \"DUM\",
         \"DLA\",
         \"DC1\",
         \"A1\",
         TO_CHAR(\"DFI\" :: DATE, 'mm/yyyy'),
         \"COM\",
         \"NOM\" ,
         \"PRE\" ,
         \"L7\"
        FROM public.pos_tab_index_prt WHERE  \"NUD\" ='$numposeidon'";
        $contests_prt = pg_query($query_prt) or die('Query failed: ' . pg_last_error());

        $date_edit= '12/12/2020';
        $date_deb='';
        $mtn_emprunte=0;
        $mtn_lettre='';
        $mois=0;
        $mois_lettre='';
        $prelev_mens=0;
        $prelev_lettre='';
        $date_fin= '12/12/2020';
        $commentaire= "pret d'entreprise";

        while ($row_prt = pg_fetch_row($contests_prt)){
            $date_edit=$row_prt[0] ?? '01/01/2021';
            $date_deb=$row_prt[1] ?? '01/01/2021';
            $mtn_emprunte=str_replace(',','.',number_format($row_prt[2])) ?? 0;
            $mtn_lettre=strtolower($row_prt[3]) ?? '';
            $mois=$row_prt[4] ?? 0;
            $mois_lettre= strtolower($row_prt[5]) ?? '';
            $prelev_mens=str_replace(',','.',number_format($row_prt[6])) ?? 0;
            $prelev_lettre=strtolower($row_prt[7]) ?? 0;
            $date_fin=$row_prt[8] ?? '01/01/2021';
            $commentaire=$row_prt[9] ?? '';
            $nom_init = ucwords($row_prt[10]);
            $pren_init = ucwords(strtolower($row_prt[11]));
            $dtfin_lettre = ucwords(strtolower($row_prt[12]));
        }

      
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

$pdf->SetTitle('PRET');

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

<br/>
<br/> 
<br/> 
<br/>
<br/> 
<br/> 

    <table style="font-family: Verdana, Arial, Helvetica, sans-serif;font-weight: 100;font-size: 11px">
        <tr>
            <td></td>
            <td></td>
            <td style="text-align:center"> Abidjan, le '.$date_edit.' </td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td style="text-align:center"> A </td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td style="text-align:center">La Direction Générale de NGSER</td>
        </tr>

    </table>
<br/>
<br/> 
<br/> 

<br/>
<br/> 
<br/> 
<p style="font-family: Verdana, Arial, Helvetica, sans-serif;font-weight: 100;font-size: 11px">
    <b><u>Objet</u></b> : Demande de prêt.
    <br/> 
    <br/> 
    <br/> 
        Messieurs,
    <br/> 
    
    <br/>
    <span>Je viens par la présente vous prier de bien vouloir m’accorder un prêt de </span>
    <span>'.$mtn_lettre.' </span>
    <span>('.$mtn_emprunte.') </span>
    <span>francs CFA en vue de régler </span>
    <span>'.$commentaire.'.</span>
    
    <br/> 
    <br/>
    <span>Je m’engage à rembourser ce prêt à compter de la fin du mois de </span>
    <span>'.$dtfin_lettre.' </span>
    <span>par le prélèvement sur mon salaire de mensualités constantes de </span>
    <span>'.$prelev_lettre.' </span>
    <span>('.$prelev_mens.') </span>
    <span>francs CFA, et ce, jusqu’à l’apurement définitif de ma dette. </span>
    
    <br/>
    <br/>
    <span>Dans l’attente d’une suite favorable, </span>
    
    <br/>
    <br/>
    <span>Veuillez agréer, Monsieur l’expression de ma sincère considération. </span>
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
            <td><u>'.$nom_init.'  '.$pren_init.'</u></td>
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