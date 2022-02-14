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

$pdf->SetTitle('Stage professionnel');

//supprime les lignes au dessus
$pdf->setPrintHeader(false);


$pdf->setPrintFooter(true);
 
// set default header data
/*
$pdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, PDF_HEADER_TITLE.' 001', PDF_HEADER_STRING, array(0,64,255), array(0,64,128));*/
$pdf->setFooterData(array(0,64,0), array(0,64,128));

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

.test{
   color:red;
}

</style>
<!-- <END CSS STYLE -->

<!-- HEADER -->

<table border="1" width="100%" align="center" style="margin-left:50%" valign="top" >
  <tr style="background-color:#C3C3C3;color:black;margin-left:12px; text-align:center;">

    <td width="100%"  style="text-align:center; vertical-align:top;" rowspan="2">

      <span  style="border-top: 1px solid black;"> <b>CONTRAT STAGE DE QUALIFICATION</b></span> 
    </td>
  </tr>
</table>

<!-- HEADER -->

<!-- BEGIN CONTENT  -->
<p>
<b>Entre : </b> <br/>
       <b>Nouvelle Génération de Services en abrégé NGSER,</b>
</p>

Société à Responsabilité Limitée, sise à Abidjan-plateau, Avenue Lambin , Immeuble  MATCA, 4e Etage, immatriculée au registre du commerce et du crédit mobilier sous le numéro CI- ABJ-03-2020-M-11141 , 28 BP 722 Abidjan 28, téléphone (225) 20 22 12 53, représentée par le gérant,<b> Monsieur ELLEPO Sébastien</b>, dûment habilité aux fins des présentes et de leurs suites,   
</p>
<p>
Ci-après désignée par <b>« l’employeur ou NGSER»</b>
</p>

<p>
<b>D’une part </b>
</p>

<p>
<b>Et </b>
</p>

<p>
Monsieur  xxxxx né le  xxx  xxx  à xxxxxx, titulaire de la CNI xxxxxxx, domicilié à Abidjan-commune de xxxxxxx, ayant tous pouvoirs à l’effet des présentes,      
</p>

<p>

Ci-après désigné par <b>« la stagiaire »</b>,
</p>

<p>
<b>D’autre part</b>
</p>

<p>
NGSER et la stagiaire étant individuellement désignées <b>« la partie »</b> et ensemble 
<b>« les parties »</b>

</p>

<p>
IL A ETE CONVENU CE QUI SUIT : 
</p>

<p>
<b>ARTICLE 1 : OBJET </b>
</p>

<p>
Le présent contrat a pour objet de donner au stagiaire une formation pratique lui permettant de se perfectionner en vue d’acquérir une expérience professionnelle dans le domaine de <b>xxxxxxxxxxxxxxxx</b>.
</p>

<p>
<b>ARTICLE 2 : OBLIGATIONS DE NGSER</b>
</p>

<p>
NGSER s’engage à : 
</p>
<p>

  <span>&#10147;</span> Mettre à la disposition de la stagiaire un maître de stage chargé d’assurer le suivi et d’optimiser les conditions de réalisation du stage ;
</p>
<p>
   <span>&#10147;</span> Fournir à la stagiaire toutes informations nécessaires à sa formation.
</p>
 

<p>
<b>ARTICLE 3 : OBLIGATIONS DE LA STAGIAIRE</b>
</p>
<p>
La stagiaire est tenue de :
</p>
<p>
   <span>&#10147;</span> Suivre les instructions fournies par son maître de stage ;
</p>
<p>
   <span>&#10147;</span> Respecter le règlement intérieur de l’entreprise d’accueil.
</p>
 


<p>
<b>ARTICLE 4 : DUREE DU STAGE</b>
</p>
<p>
Le contrat a une durée de xxxxx (xxx) mois, à compter du xxx  au  xxxx.
</p>

 <p>
<b>ARTICLE 5 : MODALITE DU STAGE </b>
</p>
 <p>
Le stage se déroule au sein de l’entreprise d’accueil.
 </p>
  <p>
La durée journalière maximale de présence de la stagiaire dans l’entreprise d’accueil est de huit (8) heures  par jour ouvré.
 </p>
<p>
Durant son stage, la stagiaire est soumise au règlement intérieur de l’entreprise d’accueil.  
 </p>
  

<p>
<b>ARTICLE 6 : ABSENCE ET INTERRUPTION DU STAGE</b>
</p>
<p>
Toute difficulté survenue au cours du déroulement du stage devra être portée à la connaissance de l’une des parties à l’autre afin d’être résolue au plus vite.
</p>
<p>
La stagiaire ne pourra s’absenter qu’après avoir obtenu l’autorisation préalable de   NGSER. 
</p>
 
 

<p>
<b>
ARTICLE 7 : REMUNERATION</b>
</p>
<p>
NGSER s’engage à allouer  à la  stagiaire une indemnité forfaitaire  mensuelle de <b>xxxx (xxxx) FCFA</b>.  
</p>
<p>
L’indemnité forfaitaire  lui sera régulièrement versée dans un délai de huit (8) jours au plus tard, après la fin du mois ouvrant droit au salaire par :
</p>
<p>
 -  Virement bancaire ; 
</p>
<p>
 -  Chèque ; ou 
</p>

<p>
 - en espèces. 
</p>


<p>
<b>ARTICLE 8 : DEVOIR DE RESERVE ET DE CONFIDENTIALITE </b>
</p>

<p>
Le devoir de réserve et de confidentialité est de rigueur absolue. Le stagiaire prend donc l’engagement de n’utiliser en aucun cas les informations recueillies ou obtenues par lui pour en faire l’objet de publication, communication à des tiers sans accord préalable de l’entreprise d’accueil, y compris le rapport de stage. Cet engagement vaudra non seulement pour la durée du stage mais également après son expiration. Le stagiaire s’engage à ne conserver, emporter, ou prendre copie d’aucun document ou logiciel, de quelque nature que ce soit, appartenant à l’entreprise d’accueil, sauf accord de cette dernière.
</p>
<p>
Dans le cadre de la confidentialité des informations contenues dans le rapport, l’entreprise d’accueil peut demander une restriction de la diffusion du rapport, voire le retrait de certains éléments très confidentiels.
</p>
<p>
Les personnes amenées à en connaître sont contraintes par le secret professionnel à n’utiliser ni ne divulguer les informations du rapport. 
</p>

<p>
<b>ARTICLE 9 : RESULTATS DES PROJETS </b>
</p>

<p>
La propriété des œuvres  réalisées, notamment les résultats des études, les schémas techniques, les produits informatiques, les documents élaborés etc.,  en application du présent contrat, est attribuée au client. A cette fin, le Consultant transfère au client tous les droits sur les œuvres précitées: droit de reproduction, droit de représentation, droit de commercialisation, droit d\'usage, de détention, d\'adaptation, de traduction, et plus généralement, tous droits d\'exploitation.
</p>
 
<p>
<b>
ARTICLE 10. FIN DU CONTRAT
</b>
</p>
<p>
Le présent contrat stage de qualification prend fin dans les conditions suivantes :
</p>
 
<p>
 <span>&#10147;</span> Au terme de la période stipulée à l’article 4 susvisé, sans indemnité ni préavis. 
</p>
<p>
<span>&#10147;</span> A l’initiative de l’entreprise d’accueil ou de la stagiaire lorsqu’ils  disposent d’un motif légitime ;
</p>
<p>
  <span>&#10147;</span> En cas de force majeure ;
</p>
<p>
  <span>&#10147;</span> En cas de force majeure ;
</p>
<p>
  <span>&#10147;</span> D’accord parties.
</p>


<p>
<b>
ARTICLE 11 : LOI APPLICABLE 
</b>
</p>

<p>
Le contrat est interprété et régi conformément à la législation du travail en vigueur, notamment la loi n°2015-532 du 20 Juillet 2015 portant code du travail en Côte d’Ivoire, la convention collective interprofessionnelle du 19 Juillet 1977 ainsi que toutes autres lois sociales.
</p>

<p>
Tout différend né de l’application de ce contrat doit être résolu selon la procédure prévue à cet effet par la législation du travail.    
</p>
 


<p>
Fait à Abidjan le xxxxxxxxxxxxxxxxxxx,   
</p>

<p>
En deux (2) exemplaires originaux.
</p>

<p>
    <table>
        <tr>
            <td> <b><u>LA STAGIAIRE</b></u></td>
           <td></td>
           <td></td>
            <td> <b><u>NGSER</b></u> </td>
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
             <td>Nom+Prenoms </td>
            <td></td>
            <td></td>
            <td> ELLEPO Sébastien </td>
          </tr>
    </table>
</p>
 

<!-- END CONTENT -->
'; 
$pdf->writeHTMLCell(0, 0, '', '',$html2, 0, 1, 0, true, '', true);

$pdf->Output('stage_professionnel.pdf', 'I');

//============================================================+
// END OF FILE
//============================================================+


      


?>