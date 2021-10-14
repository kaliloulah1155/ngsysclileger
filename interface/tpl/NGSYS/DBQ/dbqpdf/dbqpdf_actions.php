<?php
  
// Send Headers   
    session_start();    
    include ('../../../../../configuration_w/mabd.php');
    require('../../../../../configuration_w/tcpdf-master/tcpdf.php');

     $numposeidon= $_GET['numposeidon'] ; 
     $email= strtolower($_GET['email'] );





  //TRAITEMENT OF DATA //
     $query =" SELECT  \"DCR\",\"BQE\",\"RIB\" FROM public.pos_tab_index_dbq WHERE  \"NUD\" ='".$numposeidon."'";
     $contests = pg_query($query) or die('Query failed: ' . pg_last_error());

      $date_crea='';
      $banque='';
      $rib='';
     while($row =pg_fetch_row($contests)){

        $date_crea=$row[0];
        $banque=$row[1];
        $rib=$row[2];
     }

     $query_prs =" SELECT  \"CIV\",\"NOM\",\"PRE\"
   FROM public.pos_tab_index_prs WHERE  \"MEL\" ='".strtolower($email)."'";
      $contests_prs = pg_query($query_prs) or die('Query failed: ' . pg_last_error());

    $civilite='';
    $nom='';
    $prenoms='';
    $civ='';
    

    while ($row_prs = pg_fetch_row($contests_prs)) {
        $civ=$row_prs[0];
        $nom=$row_prs[1];
        $prenoms=$row_prs[2];
    }

    if($civ=='M'){
        $civilite='Monsieur';
     }
     if($civ=='MME') {
           $civilite='Madame';
     }
     if ($civ=='MLLE') {
       $civilite='Mademoiselle';
     } 

     $salairenet='';
     $salaire_lettre='';
     $type_contrat='';

     $query_cot ="SELECT  \"SAL\",\"MDT\",\"TYE\"
   FROM public.pos_tab_index_cot WHERE  \"MEL\" ='".strtolower($email)."' ORDER BY   \"NUD\" DESC LIMIT 1 ";
      $contests_cot = pg_query($query_cot) or die('Query failed: ' . pg_last_error());

    while ($row_cot = pg_fetch_row($contests_cot)) {
        $salairenet=str_replace(',','.',number_format($row_cot[0]) );
        $salaire_lettre=strtolower($row_cot[1]);
        $type_contrat=$row_cot[2];
     }

     $fonction='';
     $query_fon ="SELECT  \"IPO\"
   FROM public.pos_tab_index_fpo WHERE  \"MEL\" ='".strtolower($email)."'";
      $contests_fon = pg_query($query_fon) or die('Query failed: ' . pg_last_error());

    while ($row_fon = pg_fetch_row($contests_fon)) {
         $fonction=strtoupper($row_fon[0]) ;
     }


     $date_embauche='';
  
   if(strpos($type_contrat, "CD") !== false){
      $query_cot_eb ="SELECT  \"DSG\"
            FROM public.pos_tab_index_cot WHERE  \"MEL\" ='".strtolower($email)."' ORDER BY   \"NUD\" ASC LIMIT 1 ";
      $contests_cot_eb = pg_query($query_cot_eb) or die('Query failed: ' . pg_last_error());

       while ($row_cot_eb = pg_fetch_row($contests_cot_eb)) {
            $date_embauche=strtoupper($row_cot_eb[0]) ;
        }

    } 

    ///////////////////



     // Extend the TCPDF class to create custom Header and Footer
class PDF extends TCPDF {

    //Page header
    
   
}
// create new PDF document
$pdf = new PDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);

// set document information
$pdf->SetCreator('IBSON');

$pdf->SetTitle('domiciliation');

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

    <table>
        <tr>
            <td></td>
           <td></td>
           <td></td>
            <td> Abidjan, le '.$date_crea.' </td>
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
            <td> Monsieur le Directeur </td>
          </tr>
          <tr>
            <td></td>
            <td></td>
            <td></td>
            <td> Général de '.$banque.' </td>
          </tr>
    </table>

<p>
<b><u>Objet</u> : Engagement de domiciliation irrévocable de salaire </b> <br/> <br/> <br/> 
       Monsieur le Directeur Général,
<br/> <br/>
Nous informons que '.$civilite.' '.$nom.' '.$prenoms.' fait partie de notre personnel depuis le '.$date_embauche.' et qui occupe actuellement les fonctions '.ucwords(strtolower($fonction)).' vient de nous donner par écrit, en date du 03 Septembre 2018, l’ordre irrévocable d’avoir à verser à vos caisses, pour créditer son compte n° '.$rib.' dans vos livres, toutes sommes pouvant lui être dues par notre société, à quelque titre que ce soit, notamment son salaire mensuel net qui s’élève à '.$salaire_lettre.' francs CFA ( '.$salairenet.' CFA), ses gratifications, indemnités des congés, etc.

<br/> <br/>

Par la présente, nous nous engageons irrévocablement à exécuter ces instructions qui ne pourront être révoquées qu’avec votre accord express donné par écrit. <br/>
    De plus, nous interdisons de consentir quelque avance à l’intéressé, de manière à ce que son salaire mensuel et ses émoluments vous parviennent intégralement 

<br/> <br/>

    Enfin, nous nous engageons à vous aviser immédiatement de tout changement qui surviendrait dans la situation de '.$civilite.' '.$nom.' '.$prenoms.' <br/>
    En particulier en cas de licenciement ou de saisie sur salaire. Dans cette éventualité, nous reconnaissons que nous serions tenus de vous reverser aussitôt l’intégralité des sommes dont nous pourrions être redevables envers l’intéressé à quelque titre que ce soit.

<br/> <br/>

Veuillez agréer, Monsieur le Directeur Général, l’expression de nos salutations distinguées.
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
            <td> Le Gérant </td>
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
            <td><u> M. ELLEPO Sébastien </u></td>
          </tr>
    </table>
</p>


<!-- END CONTENT -->
'; 
$pdf->writeHTMLCell(0, 0, '', '',$html2, 0, 1, 0, true, '', true);

$pdf->Output('domiciliation.pdf', 'I');

//============================================================+
// END OF FILE
//============================================================+






?>