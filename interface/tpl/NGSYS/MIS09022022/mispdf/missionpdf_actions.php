<?php

    include ('../../../../../configuration_w/mabd.php');
    require('../../../../../configuration_w/tcpdf-master/tcpdf.php');
     $numposeidon= $_GET['numposeidon'] ;



     ///////////TRAITEMENT DES DONNEES ////////////
     $rq='SELECT "COD","NOM","PRE","VLE","COM","LPR","DAA","DFI","DUR","MOT","IMM","NCH","DCR" FROM public.pos_tab_index_mis WHERE "NUD"='.$numposeidon.' ';

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

     }
     ////////////////////////////////////////////////

  
     // Extend the TCPDF class to create custom Header and Footer
class PDF extends TCPDF {

    
}
// create new PDF document
$pdf = new PDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);

// set document information
$pdf->SetCreator('IBSON');

$pdf->SetTitle('mission');

//supprime les lignes au dessus
$pdf->setPrintHeader(false);


$pdf->setPrintFooter(false);
 


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
<table border ="0" width= "100%" STYLE="font-family: Century Gothic; font-size:15pt; " >
&nbsp;&nbsp;<br/>
<table border ="0" width= "100%" STYLE="font-family: Century Gothic; " >
<tr>
    <td width= "25%"></td>
    <td width= "50%">
        <table border ="0" width= "100%" align="center" bgcolor="#C0C0C0" STYLE="font-family: Century Gothic; font-size:15pt; ">
        <tr  rowspan="3">
            <td></td>
        </tr>
        <tr>
            <td width= "100%" align="center">
                <span style="font-weight:bold; font-size:15px;">ORDRE DE MISSION</span>
            </td>
        </tr>
        <tr>
            <td></td>
        </tr>
        </table>
    </td>
    <td width= "25%"></td>   
</tr>
</table>
&nbsp;&nbsp;<br/>
</table>
    <br/>
    <br/>
    <br/>
    <br/>
    <br/>
    <br/>
<table STYLE="font-family: Century Gothic; font-size:11pt; ">
    <tr>
        <td>
            N° REF :
        </td>
        <td>
            OM N° '.$code.'
        </td>
    </tr>
</table>
    <br/>
    <br/>
    <br/>
<table STYLE="font-family: Century Gothic; font-size:11pt; ">
    <tr>
        <td>
            NOM :
        </td>
        <td>
            '.$nom.'
        </td>
    </tr>
</table>
    <br/>
    <br/>
<table STYLE="font-family: Century Gothic; font-size:11pt; ">
    <tr>
        <td>
            PRENOMS :
        </td>
        <td>
            '.$prenoms.'
        </td>
    </tr>
</table>
    <br/>
    <br/>
<table STYLE="font-family: Century Gothic; font-size:11pt; ">
    <tr>
        <td>
            DESTINATION :
        </td>
        <td>
            '.$ville.'
        </td>
    </tr>
</table>
    <br/>
    <br/>
<table STYLE="font-family: Century Gothic; font-size:11pt; ">
    <tr>
        <td>
            MOTIF DE LA MISSION :
        </td>
        <td>
            '.$motif.'
        </td>
    </tr>
</table>
    <br/>
    <br/>
<table STYLE="font-family: Century Gothic; font-size:11pt; ">
    <tr>
        <td>
            PROJET :
        </td>
        <td>
            '.$projet.'
        </td>
    </tr>
</table>
    <br/>
    <br/>
<table STYLE="font-family: Century Gothic; font-size:11pt; ">
    <tr>
        <td>
            DATE DE DEPART :
        </td>
        <td>
            '.$date_dep.'
        </td>
    </tr>
</table>
    <br/>
    <br/>
<table STYLE="font-family: Century Gothic; font-size:11pt; ">
    <tr>
        <td>
            DATE DE RETOUR :
        </td>
        <td>
            '.$date_ret.'
        </td>
    </tr>
</table>
    <br/>
    <br/>
<table STYLE="font-family: Century Gothic; font-size:11pt; ">
    <tr>
        <td>
            DUREE :
        </td>
        <td>
            '.$duree.'
        </td>
    </tr>
</table>
    <br/>
    <br/>
<table STYLE="font-family: Century Gothic; font-size:11pt; ">
    <tr>
        <td>
            MOYENS DE TRANSPORT :
        </td>
        <td>
            '.$moyen_trsp.'
        </td>
    </tr>
</table>
    <br/>
    <br/>
<table STYLE="font-family: Century Gothic; font-size:11pt; ">
    <tr>
        <td>
            IMMATRICULATION:
        </td>
        <td>
            '.$immatricule.'
        </td>
    </tr>
</table>
    <br/>
    <br/>
<table STYLE="font-family: Century Gothic; font-size:11pt; ">
    <tr>
        <td>
            NOM DU CHAUFFEUR   :
        </td>
        <td>
            '.$nomchf.'
        </td>
    </tr>
</table>
    <br/>
    <br/>
    <br/>
    <br/>
<table width= "100%" STYLE="font-family: Century Gothic; font-size:11pt; ">
    <tr>
        <td>
            <br/>
        </td>
        <td>
            <span>Fait à Abidjan, le '.$date_crea.'</span>
        </td>
    </tr>
    <br/>
    <br/>
    <br/>
    <br/>
    <br/>
    <br/>
    <tr>
        <td>
            <br/>
        </td>
        <td>
            <u><i><b>Le Gérant</b></i></u>
        </td>
    </tr>
</table>

<!-- END CONTENT -->
'; 
$pdf->writeHTMLCell(0, 0, '', '',$html2, 0, 1, 0, true, '', true);

$pdf->Output('mission.pdf', 'I');

//============================================================+
// END OF FILE
//============================================================+


     


?>