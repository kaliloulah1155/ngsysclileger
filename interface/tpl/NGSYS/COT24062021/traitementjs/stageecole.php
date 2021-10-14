<?php
       
// Send Headers
    session_start();    
    include ('../../../../../configuration_w/mabd.php');
    require('../../../../../configuration_w/tcpdf-master/tcpdf.php');
  
     $numposeidon= $_GET['numposeidon'] ;

     $email= $_GET['email'] ;

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

$pdf->SetTitle('Stage ecole');

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


///////////////////////////////DEBUT TRAITEMENT DES DONNEES ET VARIABLES //////////////////////////////////////

                        /****************DEBUT PERSONNEL *************************/
  $query_prs =" SELECT  \"CIV\",\"NOM\",\"PRE\",\"DNS\",\"LNS\",\"NTP\",\"NPI\",\"CNE\"
   FROM public.pos_tab_index_prs WHERE  \"MEL\" ='".strtolower($email)."'";
      $contests_prs = pg_query($query_prs) or die('Query failed: ' . pg_last_error());

   // $civ='';
    $civilite='';
    $nom='';
    $prenoms='';
    $datenaiss='';
    $lieunaiss='';
    $natpiece='';
    $libellepiece='';
    $numpiece='';
    $domicile='';


      while ($row_prs = pg_fetch_row($contests_prs)) {

        $civ=$row_prs[0];
        $nom=$row_prs[1];
        $prenoms=$row_prs[2];
        $datenaiss=$row_prs[3];
        $lieunaiss=$row_prs[4];
        $natpiece=$row_prs[5];
        $numpiece=$row_prs[6];
        $domicile=$row_prs[7];

      }

      $determinant='la';
      $majdeterminant='La';
      $accord='e';
      $pronom='elle';
     if($civ=='M'){
        $civilite='Monsieur';

        $determinant='le';
        $majdeterminant='Le';
        $accord='';
        $pronom='il';
     }
     if($civ=='MME') {
           $civilite='Madame';
     }
     if ($civ=='MLLE') {
       $civilite='Mademoiselle';
     } 

     if($natpiece=='ATTESTATION'){
        $libellepiece='de l\'Attestation d\'Identité';
     }
     if($natpiece=='CNI') {
           $libellepiece='de la Carte Nationale d\'Identité';
     }
     if ($natpiece=='PERMIS DE CONDUIRE') {
       $libellepiece='du Permis de Conduire';
     } 
     if ($natpiece=='PASSEPORT') {
       $libellepiece='du Passeport';
     }
     if ($natpiece=='CARTE CONSULAIRE') {
       $libellepiece='de la Carte Consulaire';
     }  


                        /****************FIN PERSONNEL *************************/

                         /****************DEBUT CONTRAT *************************/

   $diplome=''; //DIP
   $filiere=''; //FLR
   $duree_mois=''; //MOI
   $duree_lettre=''; //M1
   $date_deb_contrat=''; //DDT
   $date_fin_contrat='';  //DEC
   $salaire_lettre='';  //MDT
   $salaire='';  //SAL
   $date_signature=''; //DSG

   $query_cot =" SELECT  \"DIP\",\"FLR\",\"MOI\",\"M1\",\"DDT\",\"DEC\",\"MDT\",\"SAL\",\"DSG\"
   FROM public.pos_tab_index_cot WHERE  \"MEL\" ='".strtolower($email)."'";
      $contests_cot = pg_query($query_cot) or die('Query failed: ' . pg_last_error());

    while ($row_cot = pg_fetch_row($contests_cot)) {

        $diplome=$row_cot[0];
        $filiere=$row_cot[1];
        $duree_mois=$row_cot[2];
        $duree_lettre=$row_cot[3];
        $date_deb_contrat=(new DateTime($row_cot[4]))->format('m/d/Y');  
        $date_fin_contrat=(new DateTime($row_cot[5]))->format('m/d/Y');
        $salaire_lettre=$row_cot[6];
        $salaire=str_replace(',','.',number_format($row_cot[7]) );
        $date_signature=(new DateTime($row_cot[8]))->format('m/d/Y');

      }

      

                        /****************FIN CONTRAT *************************/
 
///////////////////////////////FIN TRAITEMENT DES DONNEES ET VARIABLES //////////////////////////////////////


                        
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

      <span  style="border-top: 1px solid black;"> <b>CONTRAT STAGE-ECOLE</b></span> 
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
Ci-après désignée par <b>« l’entreprise d’accueil ou NGSER »</b>
</p>

<p>
<b>D’une part </b>
</p>

<p>
<b>Et </b>
</p>

<p>
<b>'.$civilite.' '.$nom.' '.$prenoms.'</b> né'.$accord.' le '.$datenaiss.' à '.$lieunaiss.', titulaire '.$libellepiece.' numéro '.$numpiece.', domicilié à '.$domicile.', ayant tous pouvoirs à l’effet des présentes,      
</p>

<p>

Ci-après désigné par <b>« '.$determinant.' stagiaire ou l’étudiant'.$accord.' »</b>,
</p>

<p>
<b>D’autre part</b>
</p>

<p>
NGSER et '.$determinant.' stagiaire étant individuellement désignées <b>« la partie »</b> et ensemble 
<b>« les parties »</b>

</p>

<p>
IL A ETE CONVENU CE QUI SUIT : 
</p>

<p>
<b>ARTICLE 1 : OBJET </b>
</p>

<p>
Le présent contrat est un contrat stage-école ayant pour objet de permettre à '.$determinant.' stagiaire de mettre en pratique les outils théoriques et méthodologiques au cours de sa formation en <b> '.$filiere.'</b>.
</p>

<p>
Le stage s\'inscrit dans le cadre de la formation professionnelle de '.$determinant.' stagiaire en vue de la validation de son diplôme de <b>'.$diplome.' en '.$filiere.'</b>. 
</p>

<p>
<b>ARTICLE 2 : OBLIGATIONS DE NGSER</b>
</p>

<p>
NGSER s’engage à : 
</p>
<p>

  <span>&#10147;</span> Mettre à la disposition de '.$determinant.' stagiaire un maître de stage chargé d’assurer le suivi et d’optimiser les conditions de réalisation du stage ;
</p>
<p>
   <span>&#10147;</span> Etablir le programme du stage ; 
</p>

<p>
   <span>&#10147;</span> Apporter à '.$determinant.' stagiaire tout concours nécessaire à sa formation et la rédaction de son rapport de stage ;
</p>

<p>
   <span>&#10147;</span> Délivrer à '.$determinant.' stagiaire à l’issue du stage une attestation de fin de  stage ;
</p>
 

<p>
<b>ARTICLE 3 : OBLIGATIONS DE '.strtoupper($determinant).' STAGIAIRE</b>
</p>
<p>
'.$majdeterminant.' stagiaire est tenu'.$accord.' de :
</p>
<p>
   <span>&#10147;</span> Suivre les instructions fournies par son maître de stage ;
</p>
<p>
   <span>&#10147;</span> Respecter le règlement intérieur de l’entreprise d’accueil ;
</p>
<p>
   <span>&#10147;</span> Etablir le rapport de stage et fournir une copie à NGSER ;
</p>
 


<p>
<b>ARTICLE 4 : DUREE DU STAGE</b>
</p>
<p>
Le stage a une durée de '.$duree_lettre.' ('.$duree_mois.') mois, à compter du '.$date_deb_contrat.' au '.$date_fin_contrat.'.
</p>

 <p>
<b>ARTICLE 5 : MODALITE DU STAGE </b>
</p>
 <p>
Le stage se déroule au sein de l’entreprise d’accueil.
 </p>
  <p>
La durée journalière maximale de présence de '.$determinant.' stagiaire dans l’entreprise d’accueil est de huit (8) heures par jour ouvré.
 </p>
<p>
Durant son stage, '.$determinant.' stagiaire est soumis'.$accord.' à la discipline de l’entreprise d’accueil, notamment en ce qui concerne l’horaire.  
 </p>
  

<p>
<b>ARTICLE 6 : ABSENCE ET INTERRUPTION DU STAGE</b>
</p>
<p>
Toute difficulté survenue au cours du déroulement du stage devra être portée à la connaissance de l’une des parties à l’autre afin d’être résolue au plus vite.
</p>
<p>
'.$majdeterminant.' stagiaire ne pourra s’absenter qu’après avoir obtenu l’autorisation préalable de l’entreprise d’accueil.  
</p>
 
 

<p>
<b>
ARTICLE 7 : REMUNERATION</b>
</p>
<p>
L’entreprise d’accueil s’engage à allouer à '.$determinant.' stagiaire une indemnité forfaitaire mensuelle de transport de <b>'.strtolower($salaire_lettre).' ('.$salaire.') francs CFA </b>. 
</p>
<p>
L’indemnité forfaitaire lui sera régulièrement versée dans un délai de huit (8) jours au plus tard, après la fin du mois ouvrant droit au salaire, en espèces.
</p>

<p>
<b>ARTICLE 8 : DEVOIR DE RESERVE ET DE CONFIDENTIALITE </b>
</p>

<p>
Le devoir de réserve et de confidentialité est de rigueur absolue. '.$majdeterminant.' stagiaire prend donc l’engagement de n’utiliser en aucun cas les informations recueillies ou obtenues par lui pour en faire l’objet de publication, communication à des tiers sans accord préalable de l’entreprise d’accueil, y compris le rapport de stage. Cet engagement vaudra non seulement pour la durée du stage mais également après son expiration. '.$majdeterminant.' stagiaire s’engage à ne conserver, emporter, ou prendre copie d’aucun document ou logiciel, de quelque nature que ce soit, appartenant à l’entreprise d’accueil, sauf accord de cette dernière.
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
La propriété des œuvres réalisées, notamment les résultats des études, les schémas techniques, les produits informatiques, les documents élaborés etc., en application du présent contrat, est attribuée au client. A cette fin, le Consultant transfère au client tous les droits sur les œuvres précitées : droit de reproduction, droit de représentation, droit de commercialisation, droit d\'usage, de détention, d\'adaptation, de traduction, et plus généralement, tous droits d\'exploitation.
</p>
 
<p>
<b>
ARTICLE 10. FIN DU CONTRAT
</b>
</p>
<p>
Le présent contrat prend fin dans les conditions suivantes :
</p>
 
<p>
 • Au terme de la période conventionnelle stipulée à l’article 4 susvisé, sans indemnité ni préavis ; 
</p>
<p>
 • A l’initiative de l’entreprise d’accueil ou de '.$determinant.' stagiaire lorsqu’ils disposent d’un motif légitime ;
</p>
<p>
 • En cas de force majeure ;
</p>
<p>
 • D’accord parties ;
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
Fait à Abidjan le '.$date_signature.',   
</p>

<p>
En deux (2) exemplaires originaux.
</p>

<table>
        <tr>
            <td> </td>
        </tr>
        <tr>
            <td> </td> 
        </tr>
        <tr>
            <td> </td>
        </tr>
        <tr>
            <td> </td>
        </tr>
</table>

<p>
    <table>
        <tr>
            <td> <b><u>'.strtoupper($determinant).' STAGIAIRE</b></u></td>
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
             <td>'.$nom.' '.$prenoms.'</td>
            <td></td>
            <td></td>
            <td> ELLEPO Sébastien </td>
          </tr>
    </table>
</p>
 

<!-- END CONTENT -->
'; 
$pdf->writeHTMLCell(0, 0, '', '',$html2, 0, 1, 0, true, '', true);

$pdf->Output('stage_ecole.pdf', 'I');

//============================================================+
// END OF FILE
//============================================================+


      


?>