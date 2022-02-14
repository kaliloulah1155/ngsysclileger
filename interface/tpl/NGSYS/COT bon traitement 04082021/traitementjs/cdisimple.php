<?php
  
// Send Headers   
    session_start();    
    include ('../../../../../configuration_w/mabd.php');
    require('../../../../../configuration_w/tcpdf-master/tcpdf.php');

     $numposeidon= $_GET['numposeidon'] ;
      $email=$_GET['email'];

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

$pdf->SetTitle('CDI standard');

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
      $majpronom='Elle';
     if($civ=='M'){
        $civilite='Monsieur';

        $determinant='le';
        $majdeterminant='Le';
        $accord='';
        $pronom='il';

        $majpronom='Il';
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
 
           $fonction=''; //FON
           $salaire_lettre='';  //MDT
           $salaire='';  //SAL
           $date_signature=''; //DSG
           $avantage=''; //COM
           $entreprise=''; //ENT
            
 

          $query_cot ="SELECT  \"FON\",\"MDT\",\"SAL\",\"DSG\",\"COM\",\"ENT\"
   FROM public.pos_tab_index_cot WHERE  \"NUD\" ='".$numposeidon."'";
      $contests_cot = pg_query($query_cot) or die('Query failed: ' . pg_last_error());

        while ($row_cot = pg_fetch_row($contests_cot)) {

             $fonction=$row_cot[0];
             $salaire_lettre=strtolower($row_cot[1]);
             $salaire=str_replace(',','.',number_format($row_cot[2]) );
             $date_signature=$row_cot[3];
              $avantage=$row_cot[4];
              $entreprise=$row_cot[5];
  
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

</style>
<!-- <END CSS STYLE -->
<!-- HEADER -->

<table border="1" width="100%" align="center" style="margin-left:50%" valign="top" >
  <tr style="background-color:#C3C3C3;color:black;margin-left:12px; text-align:center;">

    <td width="100%"  style="text-align:center; vertical-align:top;" rowspan="2">

      <span  style="border-top: 1px solid black;"> <b>CONTRAT DE TRAVAIL A DUREE INDETERMINEE</b></span> 
    </td>
  </tr>
</table>

<!-- HEADER -->


<!-- BEGIN CONTENT -->
<p>
<b>Entre : </b> <br/>
       <b>Nouvelle Génération de Services en abrégé NGSER,</b>
</p>
Société à Responsabilité Limitée, sise à Abidjan-plateau, Avenue Lambin , Immeuble  MATCA, 4e Etage, immatriculée au registre du commerce et du crédit mobilier sous le numéro CI- ABJ-03-2020-M-11141 , 28 BP 722 Abidjan 28, téléphone (225) 20 22 12 53, représentée par le gérant, <b>Monsieur ELLEPO Sébastien,</b> dûment habilité aux fins des présentes;
</p>
<p>
Ci-après désignée par <b>« L’employeur ou NGSER »</b> 
</p>

<p>
<b>D’une part </b>
</p>

<p>
<b>Et </b>
</p>

<p>
<b>'.$civilite.' '.$nom.' '.$prenoms.' </b>né'.$accord.' le '.$datenaiss.' à '.$lieunaiss.' titulaire '.$libellepiece.' numéro '.$numpiece.', domicilié '.$domicile.', ayant tous pouvoirs à l’effet des présentes, 
</p>

<p>

Ci-après désigné par <b>« l’employé'.$accord.' »</b> ou  <b>« '.$determinant.' salarié'.$accord.' »</b>,
</p>

<p>
<b>D’autre part</b>
</p>

<p>
NGSER et '.$determinant.' salarié'.$accord.' étant individuellement désignés <b>« la partie »</b> et ensemble 
<b>« les parties »</b> .



<p>
<b>ARTICLE 1 : OBJET </b>
</p>

<p>
Par ce contrat, la société '.$entreprise.'  sollicite <b>'.$civilite.' '.$nom.' '.$prenoms.'</b> qui accepte d’exécuter une prestation de travail en qualité de <b>xxxxxxxx</b> conformément à sa fiche de poste annexée au présent contrat.'.$majpronom.'  exercera ses fonctions sous l’autorité et selon les directives de l’employeur, à qui '.$pronom.' rendra compte de ses prestations de travail.
</p>

<p>
<b>ARTICLE 2 : OBLIGATIONS DE L’EMPLOYE'.strtoupper($accord).'</b>
</p>

<p>
L’employé'.$accord.' s’engage à :
</p>

<p>
- Exécuter ses prestations contractuelles, conformément à la qualité et aux normes requises dans son domaine d’activité ;
</p>
<p>
- Exécuter personnellement la prestation de travail, conformément à sa fiche de poste annexé au présent contrat ;
</p>

<p>
- Respecter le règlement intérieur de la société NGSER;
</p>

<p>
- Travailler sous les ordres et la direction de l’employeur ;
</p>

<p>
- Travailler dans les locaux de la société NGSER ou en tout lieu en fonction des nécessités du service ;
</p>
<p>
- Prendre soin du matériel de travail et garder le secret professionnel ;
</p>
<p>
- Travailler avec abnégation et loyauté au succès de la société NGSER;
</p>
<p>
- Respecter la législation du travail.
</p>

<p>
<b>ARTICLE 3 : OBLIGATIONS DE L’EMPLOYEUR</b>
</p>
<p>
L’employeur s’engage à :
</p>

<p>
- Assurer à l’employé'.$accord.' les conditions favorables de travail ;
</p>
<p>
- Procurer à l’employé'.$accord.' le travail convenu au lieu convenu et lui payer son salaire. Toutefois, en cas d’urgence ou de péril et pour une tâche temporaire, l’employeur peut exiger du  salarié'.$accord.' un travail autre que celui prévu au  contrat. Dans ces conditions, toute modification substantielle du contrat de travail requiert l’accord préalable du salarié'.$accord.'.
</p>
<p>
- Respecter la législation du travail.
</p>

<p>
<b>ARTICLE 4 : REMUNERATION</b>
</p>
<p>
La rémunération mensuelle nette de l’employé'.$accord.' est fixée à <b>'.$salaire_lettre.' ('.$salaire.') FCFA. </b>  
</p>

<p>
La rémunération lui sera régulièrement versée dans un délai de huit (8) jours au plus tard, après la fin du mois ouvrant droit au salaire par : 
</p>
<p>
- Virement bancaire ; 
</p>
<p>
- Chèque ; ou
</p>
<p>
- En espèces.
</p>

 <p>
<b>ARTICLE 5 : DUREE</b>
</p>

<p>Ce contrat de travail est conclu pour une durée indéterminée. </p>
<p>Ce contrat entre en vigueur à compter de la date de sa signature par les parties. </p>
 
<p>
<b>ARTICLE 6 : DROITS ET POUVOIRS DE L’EMPLOYEUR</b>
</p>
<p>
L’employeur a droit au respect scrupuleux de sa personne, de son intégrité physique, morale de sa vie privée et de son patrimoine.
</p>
<p>
Il a les pouvoirs suivants :
</p>
<p>
- Le pouvoir de direction. A cet effet, il peut décider de l’accès du salarié'.$accord.' à un niveau supérieur, déterminer les tâches à accomplir et le rythme de travail.
</p>
<p>
- Le pouvoir disciplinaire. A ce titre, l’employeur peut sanctionner les fautes commises par l’employé'.$accord.', à travers  les sanctions telles: la mise à pied, l’amende, l’avertissement, la mutation et le licenciement.
</p>
<p>
- Le pouvoir de réviser le contrat de travail, en raison des circonstances économiques ou techniques.
</p>

<p>
<b>
ARTICLE 7 : DROITS ET AVANTAGES SOCIAUX</b>
</p>
<p>
'.$majpronom.' salarié'.$accord.' a droit à : 
</p>
 <p>
   '. html_entity_decode(str_replace("-","<br/>",utf8_encode($avantage))).'
</p>

<p>
<b>ARTICLE 8 : CLAUSE DE NON CONCURRENCE</b>
</p>

<p>
Il est interdit au salarié'.$accord.' d’exercer, même en dehors de son temps de travail, toute activité à caractère professionnelle, susceptible de concurrencer l’entreprise ou de nuire à la bonne exécution des services convenus.
</p>

<p>
<b>ARTICLE 9 : CLAUSE DE CONFIDENTIALITE</b>
</p>

<p>
'.$majdeterminant.' salarié'.$accord.' s’engage à observer la discrétion la plus stricte sur les informations se rapportant aux activités de la société auxquelles elle aura accès à l’occasion et dans le cadre de sa fonction.
</p>
<p>
Notamment, '.$pronom.' ne devra pas divulguer à quiconque les méthodes, recommandations, créations, devis, études, projets, savoir-faire de l’entreprise résultant de travaux réalisés dans l’entreprise qui sont couverts par le secret professionnel le plus strict. '.$majpronom.' sera lié'.$accord.' par la même obligation vis-à-vis de tout renseignement ou document dont '.$pronom.' aura pris connaissance chez les clients de la société.
</p>
<p>
Tous les documents, les informations liées aux produits et services de la société NGSER  dont '.$pronom.' pourra avoir connaissance dans l’exercice de sa fonction, sont  confidentiels et restent la propriété exclusive de l’employeur.
</p>
<p>
'.$majdeterminant.' salarié'.$accord.' ne pourra, sans accord écrit de l’employeur, publier aucune étude sous quelque forme que ce soit portant sur des travaux ou des informations couverts par l’obligation de confidentialité. 
</p>

<p>
<b>
ARTICLE 10. DROIT DE PROPRIETE
</b>
</p>

<p>
Les logiciels, les applications, les documents techniques ainsi que tous autres résultats issus  de travaux effectués par '.$determinant.' salarié'.$accord.' demeurent la propriété exclusive de la société NGSER.
</p>

<p>
<b>
ARTICLE 11 : RESILIATION
</b>
</p>

<p>
Le présent contrat peut toujours cesser par la volonté du salarié'.$accord.'. La résiliation peut aussi intervenir par la volonté de l’employeur qui dispose d’un motif légitime.
</p>

<p>
Hormis le cas de faute lourde et de force majeure, la partie qui prend l’initiative de la rupture du contrat doit notifier par écrit sa décision à l’autre et respecter le délai de préavis stipulé à l’article 34 de la convention collective interprofessionnelle du 19 Juillet 1977. 
</p>

<p>
Toute rupture du contrat, sans préavis ou sans que le délai de préavis ait été intégralement observé, emporte obligation, pour la partie responsable, de verser à l’autre une indemnité dont le montant correspond à la rémunération et aux avantages de toute nature dont aurait bénéficié le salarié durant le délai de préavis qui n’a pas été effectivement respecté.
</p>

 <p>
<b>ARTICLE 12 : LOI APPLICABLE – LITIGES</b>
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

<p>
    <table>
        <tr>
            <td> <b><u>L’EMPLOYE'.strtoupper($accord).'</b></u></td>
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
             <td>'.$nom.' '.$prenoms.' </td>
            <td></td>
            <td></td>
            <td> ELLEPO Sébastien </td>
          </tr>
    </table>
</p>
 

<!-- END CONTENT -->
'; 
$pdf->writeHTMLCell(0, 0, '', '',$html2, 0, 1, 0, true, '', true);

$pdf->Output('cdi_standard.pdf', 'I');

//============================================================+
// END OF FILE
//============================================================+


      


?>