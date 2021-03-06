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

$pdf->SetTitle('Consultant interne');

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
      $presta='trice';
     if($civ=='M'){
        $civilite='Monsieur';

        $determinant='le';
        $majdeterminant='Le';
        $accord='';
        $pronom='il';

        $majpronom='Il';

        $presta='taire';
     }
     if($civ=='MME') {
           $civilite='Madame';
     }
     if ($civ=='MLLE') {
       $civilite='Mademoiselle';
     } 

     if($natpiece=='ATTESTATION'){
        $libellepiece='de l\'Attestation d\'Identit??';
     }
     if($natpiece=='CNI') {
           $libellepiece='de la Carte Nationale d\'Identit??';
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
           $duree_mois=''; //MOI
           $duree_lettre=''; //M1
           $horaire=''; //VHE
           $horaire_lettre=''; //A1
           $nbrejrs=''; //NBR
           $nbrejrs_lettre=''; //A2
           $salaire_lettre='';  //MDT
           $salaire='';  //SAL
           $date_signature=''; //DSG
           
           
            
 

          $query_cot ="SELECT  \"FON\",\"MOI\",\"M1\",\"VHE\",\"A1\",\"NBR\",\"A2\",\"MDT\",\"SAL\",\"DSG\" 
   FROM public.pos_tab_index_cot WHERE  \"NUD\" ='".$numposeidon."'";
      $contests_cot = pg_query($query_cot) or die('Query failed: ' . pg_last_error());

        while ($row_cot = pg_fetch_row($contests_cot)) {
          /*
             $fonction=$row_cot[0];
             $salaire_lettre=strtolower($row_cot[1]);
             $salaire=str_replace(',','.',number_format($row_cot[2]) );
             $date_signature=$row_cot[3];*/

             $fonction=$row_cot[0]; //FON
             $duree_mois=$row_cot[1]; //MOI
             $duree_lettre=strtolower($row_cot[2]); //M1
             $horaire=$row_cot[3]; //VHE
             $horaire_lettre=strtolower($row_cot[4]); //A1
             $nbrejrs=$row_cot[5]; //NBR
             $nbrejrs_lettre=strtolower($row_cot[6]); //A2
             $salaire_lettre=strtolower($row_cot[7]);  //MDT
             $salaire= str_replace(',','.',number_format($row_cot[8]) );  //SAL
             $date_signature=$row_cot[9]; //DSG
   
        }
 

                        /****************FIN CONTRAT *************************/


 
///////////////////////////////FIN TRAITEMENT DES DONNEES ET VARIABLES //////////////////////////////////////
  
 

$pdf->AddPage();

//BEGIN HEADER NO REPEAT ON PAGE
 $image_file =K_PATH_IMAGES.'ngser.jpg';
        $pdf->Image($image_file, 10, 10, 40, '', 'JPG', '', 'T', false, 300, '', false, false, 0, false, false, false);

 $pdf->Ln(20);




// Set some content to print
// define some HTML content with style
$html1 = '
<!-- CSS STYLE -->
<style>

</style>
<!-- <END CSS STYLE -->
<!-- HEADER -->

<table border="1" width="100%" align="center" style="margin-left:50%" valign="top" >
  <tr style="background-color:#C3C3C3;color:black;margin-left:12px; text-align:center;">

    <td width="100%"  style="text-align:center; vertical-align:top;" rowspan="2">

      <span  style="border-top: 1px solid black;"> <b>CONTRAT DE PRESTATION  DE SERVICES NGSER-CONSULTANT
</b></span> 
    </td>
  </tr>
</table>

<!-- HEADER -->

<!-- BEGIN CONTENT -->
<p>
<b><u>Entre : </u></b> <br/>
       <b><u>Nouvelle G??n??ration de Services en abr??g?? NGSER,</u></b>
</p>
Soci??t?? ?? Responsabilit?? Limit??e, sise ?? Abidjan-plateau, Avenue Lambin , Immeuble  MATCA, 4e Etage, immatricul??e au registre du commerce et du cr??dit mobilier sous le num??ro CI- ABJ-03-2020-M-11141 , 28 BP 722 Abidjan 28, t??l??phone (225) 20 22 12 53, repr??sent??e par le g??rant, <b>Monsieur ELLEPO S??bastien,</b> d??ment habilit?? aux fins des pr??sentes et de leurs suites,
</p>
<p>
<b>Ci-apr??s indiff??remment d??sign??e ??  NGSER ??  ou ?? le Client ??</b>
</p>

<p>
<b>D???une part </b>
</p>

<p>
<b>Et </b>
</p>

<p>
<b>'.$civilite.' '.$nom.' '.$prenoms.' </b>n??'.$accord.' le '.$datenaiss.' ?? '.$lieunaiss.' titulaire '.$libellepiece.' num??ro '.$numpiece.', domicili?? ?? '.$domicile.', ayant tous pouvoirs ?? l???effet des pr??sentes, 
</p>

<p>
<b>Ci-apr??s d??sign?? ?? '.$determinant.' Consultant'.$accord.' ?? ou ?? '.$determinant.' Presta'.$presta.' ?? </b>
</p>

<p>
<b>D???autre part</b>
</p>

<p>
NGSER  et '.$determinant.' consultant sont individuellement d??sign??s <b>?? la partie ??</b> et  ensemble
<b>?? les parties ??,</b> 
</p>

<p>
<b> <u>IL A ETE PREALABLEMENT EXPOSE CE QUI SUIT :</u></b>
</p>

<p>
NGSER est une soci??t?? de droit ivoirien sp??cialis??e dans toutes les op??rations dans le domaine des t??l??communications, le d??veloppement des Technologies de l???Information, le conseil et la gestion des projets des Nouvelles Technologies de l???Information et la Communication.
</p>

<p>
<b>'.$civilite.' '.$nom.' '.$prenoms.' </b> est un XXXXXX.  
</p>

<p>
Au regard de ses comp??tences, la soci??t?? NGSER a sollicit?? '.$determinant.' consultant'.$accord.' pour l???ex??cution de ses  projets informatiques.
</p>

<p>
'.$majdeterminant.' consultant'.$accord.' ayant accept??'.$accord.' la demande de NGSER, les parties ont ??tabli le pr??sent contrat qui fixe le cadre normatif de leur collaboration.
</p>

<p>
<b><u>CECI EXPOSE, IL EST CONVENU ET ARRETE CE QUI SUIT : </u></b>
</p>

<p>
<b><u>Article 1. Valeur  pr??ambule ??? Annexes - Lexique</u></b>
</p>

<p>
<b>1.1 Valeur du pr??ambule-Annexes</b>
</p>
<!-- END CONTENT -->
'; 
// Print text using writeHTMLCell()
 $pdf->writeHTMLCell(0, 0, '', '',$html1, 0, 1, 0, true, '', true);


$pdf->AddPage();
 $html2 ='
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
         
<p>
Le pr??ambule ci-dessus et les annexes ci-jointes ont la m??me valeur juridique que le pr??sent contrat cadre dont ils font partie int??grante.
</p>

<p>
<b>1.2 Lexique contractuel</b>
</p>

<p>
<b>Consultant'.$accord.'</b> est la personne physique mandat??'.$accord.' par NGSER pour r??aliser les prestations ;
</p>

<p>
<b>D??lai d???ex??cution</b> d??signe le d??lai pr??vu pour la r??alisation des prestations ;
</p>

<p>
<b>Notification</b> d??signe toute transmission d\'information et/ou de demande ou r??clamation effectu??e dans le cadre du contrat ;
</p>

<p>
<b>Jour Ouvr??</b> d??signe l???un quelconque des cinq (5) jours hebdomadaires du calendrier du lundi au vendredi ;
</p>

<p>
<b>Jour</b> d??signe un jour calendaire ;
</p>

<p>
<b>Prestations ou Mission</b> d??signe les prestations contractuelles convenues par les parties et devant ??tre fournies par '.$determinant.' Consultant'.$accord.' conform??ment au cahier des charges ;
</p>


<p>
<u><b>Article 2. Documents contractuels</b></u>
</p>
Les documents contractuels sont par ordre de priorit?? les pi??ces et actes suivants:  

<p>
 <span>&#10147;</span> Le pr??sent contrat
</p>

<p>
 <span>&#10147;</span> Le cahier des charges
</p>
<p>
 <span>&#10147;</span> Tout autre document aff??rent ?? l???ex??cution du contrat, act?? par les parties.
</p>


<p>
<u><b>Article 3. Objet</b></u>
</p>

<p>
Le Contrat a pour objet de pr??ciser les termes et conditions dans lesquels NGSER engage '.$determinant.' Consultant'.$accord.' en qualit?? <b>de '.strtoupper($fonction).'</b> pour l???ex??cution de divers projets informatiques, conform??ment au cahier des charges des missions annex?? au contrat.
</p>

<p>
<u><b>Article 4. Obligations des parties</b></u>
</p>

<p>
<b>4.1 Obligations du Consultant</b>
</p>

<p>
'.$majdeterminant.' Consultant'.$accord.' s???engage ?? respecter toutes les obligations mises ?? sa charge dans le cadre du pr??sent contrat et plus particuli??rement ?? :
</p>

<p>
  <span>&#10066;</span>
  Prendre toutes dispositions utiles pour r??aliser sous sa seule responsabilit??, toutes les prestations aff??rentes aux projets du Client notamment, la mise en ??uvre des livrables applicatifs et la gestion AGILE des projets, conform??ment au cahier des charges des missions. A cet effet, '.$determinant.' Consultant'.$accord.' apportera son savoir-faire, sa disponibilit?? et tous autres moyens n??cessaires ?? l???ex??cution des prestations contractuelles dans les locaux du Client ou en tout lieu en cas de n??cessit?? du service. '.$majpronom.' a une obligation de r??sultat quant ?? la conformit?? des prestations par rapport aux besoins et attentes du Client ;
</p>

<p>
  <span>&#10066;</span>
  R??aliser la mission conform??ment au d??lai d???ex??cution requis par Client ;
</p>

<p>
  <span>&#10066;</span>
  Ex??cuter sa mission conform??ment aux r??gles en vigueur dans sa profession et en se conformant ?? toutes les donn??es acquises dans son domaine de comp??tence ; 
</p>
<p>
  <span>&#10066;</span>
  Fournir un rapport mensuel d???activit??
</p>

<p>
  <span>&#10066;</span>
  Apporter son expertise et proposer au Client des solutions appropri??es ;
</p>

<p>
<u><b>4.2 Obligations du Client</b></u>
</p>

<p>
NGSER  s???engage ?? :
</p>

<p>
  <span>&#10066;</span> R??mun??rer '.$determinant.' consultant'.$accord.'  selon les modalit??s d??finies ?? l???article 7 ci-dessous ;
</p>

<p>
  <span>&#10066;</span> D??signer un interlocuteur principal capable de collaborer ??troitement avec '.$determinant.' Consultant'.$accord.' pour la mise en ??uvre des projets;
</p>

<p>
  <span>&#10066;</span> Pr??ter tout concours que '.$determinant.' Consultant'.$accord.' pourrait demander dans le cadre de ses obligations contractuelles. 
</p>

<p>
  <span>&#10066;</span> Valider les documents de recette des livrables fournis par '.$determinant.' consultant'.$accord.'
</p>

<p>
<u><b>Article 5. Dur??e</b></u>
</p>

<p>
Ce pr??sent contrat est conclu pour une dur??e de '.$duree_lettre.' ('.$duree_mois.') mois . 
</p>

<p>
Toutefois, les parties conviennent que le volume horaire mensuel de r??alisation des travaux est fix?? ?? '.$horaire_lettre.' ('.$horaire.') heures. 
</p>

<p>
Il expire dans les conditions stipul??es ?? l???article 15 ci-dessous.
</p>

<p>
<u><b>Article 6. Modalit??s d???ex??cution des prestations</b></u>
</p>

<p>
A la demande de NGSER, '.$determinant.' presta'.$presta.' fournira les prestations soit dans les locaux de NGSER soit hors de la soci??t?? conform??ment au cahier des charges de la mission qui lui a ??t?? confi??e.
</p>

<p>
D??s r??ception du cahier des charges de la mission par le prestataire, celui-ci est tenu de prendre toutes les dispositions n??cessaires afin d???ex??cuter les prestations de services dans les d??lais convenus.</p>

<p>
Les parties conviennent qu???en l???absence de prestations fournies au cours d???une p??riode mensuelle, '.$determinant.' presta'.$presta.' ne pourra pr??tendre ?? aucune r??mun??ration au cours de ladite p??riode. </p>

<p>
'.$majdeterminant.' presta'.$presta.' informera NGSER sans d??lai de toutes les difficult??s auxquelles '.$pronom.' sera confront??'.$accord.' au cours de l???ex??cution de ses prestations. A la demande de NGSER, '.$determinant.' Consultant'.$accord.' devra fournir des rapports r??sumant les actions r??alis??es dans l???ex??cution de ses prestations contractuelles. NGSER fournira au consultant'.$accord.' toute information relative aux prestations qu???il pourra lui demander.</p>

<p>
<u><b>Article 7. Stipulations financi??res</b></u>
</p>

<p>
<b>7.1 R??mun??ration des prestations de services</b>
</p>

<p>
La r??mun??ration du presta'.$presta.' est li??e au volume horaire mensuel de r??alisation des travaux.
</p>
<p>
Le volume horaire mensuel de r??alisation des travaux est fix?? ?? <b> '.$horaire_lettre.'('.$horaire.') heures</b>. 
</p>

<p>
Sur la base du volume horaire mensuel des travaux effectivement r??alis??s par le prestataire et valid??s par le client, '.$determinant.' presta'.$presta.' percevra une r??mun??ration mensuelle nette fix??e ?? <b>'.$salaire_lettre.' ('.$salaire.') francs CFA <b/>.
</p>

<p>
<b>7.2 P??riodicit?? et modalit??s de paiement </b>
</p>

<p>
La r??mun??ration mensuelle du presta'.$presta.' doit ??tre calcul?? en fonction du volume horaire mensuel des prestations effectu??es par '.$determinant.' presta'.$presta.' sur la base du cahier des charges des missions qui lui ont ??t?? confi??s.
</p>

<p>
Pour les besoins de chaque paiement, '.$determinant.' presta'.$presta.' doit transmettre chaque fin du mois ?? NGSER les documents ??num??r??s ci-dessous :
</p>
<p>
a.  Les fiches de fin travaux des livrables recett??s et valid??s par les Responsables des D??partements Technique Informatique et Projet ;
</p>
<p>
b.  Les livrables documentaires techniques ;
</p>
<p>
c.  Une copie de la fiche mensuelle du timesheet
</p>

<p>
Les r??glements du presta'.$presta.' s???effectueront en esp??ces, dans un d??lai de '.$nbrejrs_lettre.' ('.$nbrejrs.') jours au plus tard apr??s la r??ception mensuelle des documents de fin travaux et des livrables documentaires.
</p>

 

<p>
<b> <u>Article 8. Fiscalit?? </u></b>
</p>

<p>
NGSER reste tenue du paiement des imp??ts, droits et taxes de toutes natures grevant l???ex??cution des prestations. </p>

<p>
<b> <u>Article 9. Ind??pendance des parties</u></b>
</p>

<p>
Les Parties sont des professionnels ind??pendants l???un de l???autre qui agiront toujours comme tels.
</p>

<p>
Les Parties d??clarent que le Contrat ne saurait en aucun cas s\'analyser en un contrat de travail  au sens de l???article 2 de la loi n?? 2015-532 du 20 juillet 1015 portant Code du travail. 
</p>

<p>
'.$majdeterminant.' consultant'.$accord.' d??clare en cons??quence ??tre ind??pendant vis?????-vis du Client. A ce titre, le Client ne peut ??tre responsable envers '.$determinant.' Consultant'.$accord.' de tous droits dont un'.$accord.' salari??'.$accord.' peut b??n??ficier conform??ment ?? la l??gislation du travail mentionn?? dans le pr??sent article et tous autres textes r??glementaires aff??rents ?? cette l??gislation en vigueur.
</p>

<p>
<b> <u>Article 10. Confidentialit??</u></b>
</p>

<p>
'.$majdeterminant.' consultant'.$accord.' s???engage ?? observer la discr??tion la plus stricte sur les informations se rapportant aux activit??s de la soci??t?? NGSER auxquelles il aura acc??s ?? l???occasion du pr??sent contrat.
</p>

<p>
Notamment, '.$pronom.' ne devra pas divulguer ?? quiconque les informations techniques, commerciales, marketing, financi??res ainsi que toutes autres informations li??es aux activit??s de NGSER qui sont couvertes par le secret professionnel le plus strict. '.$majpronom.' sera li?? par la m??me obligation vis-??-vis de tout renseignement ou document dont '.$pronom.' aura pris connaissance chez les partenaires commerciaux de la soci??t?? NGSER.
</p>

<p>
Tous les documents, lettres, notes de service, instructions, m??thodes, organisation et/ou fonctionnement de l???entreprise dont '.$pronom.' pourra avoir connaissance dans l???exercice de sa fonction, seront confidentiels et resteront la propri??t?? exclusive de la Soci??t??.
</p>

<p>
'.$majdeterminant.' consultant'.$accord.' ne pourra, sans accord ??crit de la Soci??t??  NGSER, publier aucune ??tude sous quelque forme que ce soit portant sur des projets ou des informations couverts par l???obligation de confidentialit??. Cette obligation de confidentialit?? se prolongera apr??s la cessation du contrat de prestation de services, quelle qu???en soit la cause.
</p>

<p>
'.$majdeterminant.' consultant'.$accord.', toutefois, ne saurait ??tre tenu pour responsable d\'aucune divulgation si les informations divulgu??es ??taient dans le domaine public ?? la date de la divulgation, ou s\'il ou si '.$pronom.' en avait connaissance, ou les obtenait de tiers par des moyens l??gitimes.  
</p>

<p>
<b> <u>Article 11. Recette des travaux </u></b>
</p>

<p>
Tous les travaux donnent lieu ?? recette globale. Elle a lieu selon les d??lais convenus par les parties.Sauf objection motiv??e par NGSER, il sera proc??d?? ?? la recette d??finitive des travaux et des livrables documentaires associ??s. 
</p>

<p>
Notamment, '.$pronom.' ne devra pas divulguer ?? quiconque les informations techniques, commerciales, marketing, financi??res ainsi que toutes autres informations li??es aux activit??s de NGSER qui sont couvertes par le secret professionnel le plus strict. '.$majpronom.' sera li?? par la m??me obligation vis-??-vis de tout renseignement ou document dont '.$pronom.' aura pris connaissance chez les partenaires commerciaux de la soci??t?? NGSER.
</p>

<p>
La recette d??finitive des travaux est constat??e par un proc??s-verbal de recette contradictoire sign?? par les parties.
</p>

 

<p>
<b> <u>Article 12. Responsabilit?? </u></b>
</p>

<p>
Chaque partie est responsable de la mauvaise ex??cution ou de l???inex??cution totale ou partielle de ses obligations qui lui incombent au titre du contrat. Les parties s???engagent ex??cuter de bonne foi et sans r??serve le contrat et s???abstiennent de toutes man??uvres abusives et dilatoires sous quelques formes que ce soient, emp??chant ou restreignant sa bonne ex??cution.
</p>
<p>
'.$majdeterminant.' presta'.$presta.' reconna??t que le respect de la confidentialit?? des informations du client est un engagement essentiel du contrat.
</p>
<p>
'.$majdeterminant.' Consultant'.$accord.' engage sa responsabilit?? civile et p??nale en cas d???utilisation frauduleuse des informations confidentielles du client.
</p>
<p>
'.$majdeterminant.' Consultant'.$accord.' est responsable de tous pr??judices subis par le client, li??s ?? la violation de la clause de confidentialit?? susmentionn??e.
</p>

<p>
<b> <u>Article 13. R??sultats des projets </u></b>
</p>

<p>
La propri??t?? intellectuelle des ??uvres r??alis??es, notamment les r??sultats des ??tudes, les sch??mas techniques, les livrables Applicatifs, les documents ??labor??s etc., en application du pr??sent contrat, est attribu??e au client. A cette fin, '.$determinant.' Consultant'.$accord.' transf??re au client tous les droits sur les ??uvres pr??cit??es : droit de reproduction, droit de repr??sentation, droit de commercialisation, droit d\'usage, de d??tention, d\'adaptation, de traduction, et plus g??n??ralement, tous droits d\'exploitation.
</p>

<p>
<b><u>Article 14. Sous-traitance </u></b>
</p>
 
<p>
Dans le cadre de ce contrat, '.$determinant.' Consultant'.$accord.' n???est autoris??'.$accord.' ?? sous-traiter les prestations li??es ?? l???ex??cution d???un quelconque projet qu???avec l???accord pr??alable de NGSER. 
</p>



<p>
<b><u>Article 15.R??siliation </u></b>
</p>

<p>
<b>15.1 Condition </b>
</p>

<p>
Le Contrat prend fin dans les conditions ci-apr??s : 
</p>

<p>
??? Au terme de la p??riode stipul??e ?? l???article 5 ci-dessus ; 
</p>
<p>
??? Chaque Partie peut r??silier le Contrat de plein droit en cas de manquement par l???autre Partie ?? toute stipulation contractuelle, non r??par?? dans un d??lai de cinq (05) jours, ?? compter de la r??ception d???une notification ??crite du manquement adress??e par la Partie non fautive, qui devra d??crire de mani??re suffisamment d??taill??e, la nature du manquement. La r??siliation sera sans pr??judice de tout autre recours que la Partie non fautive serait en droit d???exercer.
</p>
<p>
??? Pour tout autre motif, apr??s le respect d???un pr??avis d???un (01) mois. 
</p>

<p>
<b>15.2 Effets </b>
</p>

<p>
??? En cas de r??siliation due ?? une faute du consultant, NGSER aura le droit de demander des dommages-int??r??ts pour la perte de profits caus??e par ladite faute et aucun montant ne sera d?? au consultant'.$accord.' au titre des prestations ex??cut??es ?? la date de la r??siliation. 
</p>
<p>
??? En cas de r??siliation du contrat pour tous autres motifs pendant la p??riode de la mission du Consultant, celui-ci percevra un montant correspondant au prorata du temps de travaux effectu?? au cours de ladite p??riode. 
</p>



 <p>
<b><u>Article 16. Force majeure</u></b>
</p>

 <p>
On entend par cas de force majeure, tout ??v??nement ext??rieur, impr??visible, insurmontable, irr??sistible et ind??pendant de la volont?? des parties. Sont notamment consid??r??s  comme cas de force majeure les ??v??nements suivants :
</p>

 <p>
??? Les conflits sociaux ;
 </p>

 <p>
??? Les catastrophes naturelles ;
 </p>
  <p>
??? Les al??as ou les indisponibilit??s des r??seaux des t??l??phones mobiles et des acc??s internet;
 </p>
  <p>
??? La carence ou le retard des moyens de transport ;
 </p>
  <p>
??? Le fait du prince (??meute, pillage, gr??ve pr??visible ou impr??visible dont la dur??e et l???ampleur demeurent inconnues, vols ?? main arm??e, ordre de l???autorit?? publique, expropriation, r??quisition) ;
 </p>
  <p>
??? Panne d?????lectricit?? de grande ampleur.
 </p>


   <p>
Il n???y a lieu ?? aucun dommages-int??r??ts lorsque, par suite d???une force majeure ou d???un cas fortuit, l???une des parties a ??t?? emp??ch??e de donner ou de faire ce ?? quoi elle ??tait oblig??e ou a fait ce qui lui ??tait interdit.
 </p>

    <p>
La partie affect??e par l?????v??nement ayant le caract??re de force majeure  avise l???autre dans un  d??lai de <b>deux (2) jours</b> par courrier ??lectronique ou appel t??l??phonique en pr??cisant la nature de cet ??v??nement, son effet, sa dur??e pr??visible et la reprise des services, apr??s la cessation de l?????v??nement. 
 </p>
  <p>
En cas de  persistance de la force majeure  pendant plus de <b>trente (30) jours</b>, les parties se r??servent  le droit de r??silier le pr??sent contrat  en totalit?? ou en partie. Dans ces conditions, '.$determinant.' Consultant'.$accord.' sera pay??'.$accord.' selon le volume horaire des travaux effectivement r??alis??s  ?? la date de la r??siliation du contrat.
 </p>


 <p>
<b><u>Article 17. Nullit?? d???une clause</u></b>
</p>

<p>
Si une ou plusieurs clauses du contrat sont  tenues pour non valides ou d??clar??es comme telles en application d\'une loi, d\'un r??glement ou ?? la suite d\'une d??cision judiciaire devenue d??finitive, les autres clauses garderont toute leur force et port??e.
</p>

<p>
Le cas ??ch??ant, les parties s\'efforceront de modifier le contrat afin qu\'elle refl??te le plus fid??lement possible leur intention originelle. 
</p>

 <p>
<b><u>Article 18. Renonciation</u></b>
</p>

<p>
Le fait que l\'une ou l\'autre des parties ne revendique pas l\'application d\'une clause quelconque du  Contrat  ou acquiesce ?? son inex??cution, que ce soit de mani??re permanente ou temporaire, ne pourra ??tre interpr??t?? comme une renonciation par cette partie aux droits qui d??coulent pour elle de ladite clause. 
</p>

 <p>
<b><u>Article 19. Intuitu personae</u></b>
</p>

<p>
 Le Contrat est conclu en consid??ration de la qualit?? des parties. En cons??quence, aucune partie ne peut le transmettre ?? un tiers qu???avec l???accord pr??alable et ??crit de l\'autre.
</p>

 <p>
<b><u>Article 20. Int??gralit??</u></b>
</p>

<p>
 Le contrat exprime l\'int??gralit?? de la volont?? des parties. Tous contrats ou accords ant??rieurs portant sur le m??me objet sont r??voqu??s et remplac??s en toutes leurs stipulations par le pr??sent contrat.
</p>


<p>
<b><u>Article 21. Notification - Election de domicile</u></b>
</p>

<p>
Sauf disposition contraire, toutes les notifications et communications relatives au Contrat seront effectu??es, au choix de l???exp??diteur, (i) par courrier ??lectronique avec accus?? de r??ception aux adresses indiqu??es ci-dessous, ou aux adresses indiqu??es dans l???en-t??te de ce document (ii) par lettre recommand??e avec accus?? de r??ception, (iii) par lettre port??e contre r??c??piss??. 
</p>

<p>
Pour l???ex??cution des pr??sentes et de leurs suites, les Parties font ??lection de domicile en leur si??ge  et domicile  indiqu?? ?? l???en-t??te de ce document. 
</p>
<p>
Les notifications ou communications seront r??put??es avoir ??t?? effectu??es: 
</p>

<p>
<span>&#10066;</span> A la date figurant sur l\'accus?? de r??ception en cas d\'envoi par courrier postal ou ??lectronique, toutefois, si la date de r??ception ne correspond pas ?? un Jour Ouvr?? ou si l???heure de r??ception est apr??s 17 heures , la date de r??ception sera le premier Jour Ouvr?? suivant) ; ou  
</p>

<p>
<span>&#10066;</span> A la date figurant sur le r??c??piss??, en cas de remise par porteur ;
</p>

<p>
<span>&#10066;</span> A la date figurant sur le proc??s- verbal en cas de remise par exploit d???huissier.
</p>

   
<p>
Les notifications ou communications par courrier ??lectronique doivent ??tre adress??es ?? : 
</p>
     
<p>
<b><u>Pour  NGSER: </u></b>
</p>

<p>
- Le G??rant: S??bastien ELLEPO,  <a> sebastien.ellepo@ngser.com </a>
</p>
<p>
- Le Co-g??rant: Michel Lucien KASSI,  <a>michel.kassi@ngser.com </a>
</p>
<p>
<b><u>Pour le Consultant </b></u>
</p>
<p>
'.$nom.' '.$prenoms.'
</p>

 <p>
<b><u>Article 22. R??glement des diff??rends</u></b>
</p>

 <p>
En cas de diff??rends entre les parties, ayant trait ?? la validit??, l???interpr??tation, l???ex??cution ou l???inex??cution du contrat, elles s???obligent ?? se concerter et ?? rechercher un r??glement amiable dans un d??lai de trente (30) jours suivant la notification par l???une des parties ?? l???autre, de l???objet du diff??rend. En cas de persistance du d??saccord ?? l???expiration du d??lai indiqu?? ci-dessus, le litige sera soumis au Tribunal dont d??pend le domicile du consultant.
</p>

<p>
Fait ?? Abidjan le '.$date_signature.',   
</p>

<p>
En deux (2) exemplaires originaux.
</p>

<p>
    <table>
        <tr>
            <td> <b><u>'.$determinant.' consultant'.$accord.'</b></u></td>
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
            <td> ELLEPO S??bastien </td>
          </tr>
    </table>
</p>
 

<!-- END CONTENT -->
'; 
$pdf->writeHTMLCell(0, 0, '', '',$html2, 0, 1, 0, true, '', true);

$pdf->Output('consultant_interne.pdf', 'I');

//============================================================+
// END OF FILE
//============================================================+


      


?>