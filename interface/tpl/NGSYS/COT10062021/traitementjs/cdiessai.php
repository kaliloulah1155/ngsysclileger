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

$pdf->SetTitle('CDI avec essai');

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
       <b>Nouvelle G??n??ration de Services en abr??g?? NGSER,</b>
</p>
Soci??t?? ?? Responsabilit?? Limit??e, sise ?? Abidjan-plateau, Avenue Lambin , Immeuble  MATCA, 4e Etage, immatricul??e au registre du commerce et du cr??dit mobilier sous le num??ro CI- ABJ-03-2020-M-11141 , 28 BP 722 Abidjan 28, t??l??phone (225) 20 22 12 53, repr??sent??e par le g??rant, <b>Monsieur ELLEPO S??bastien,</b> d??ment habilit?? aux fins des pr??sentes;
</p>
<p>
Ci-apr??s d??sign??e par <b>?? NGSER ??</b> ou <b>?? l???employeur ??</b>
</p>

<p>
<b>D???une part </b>
</p>

<p>
<b>Et </b>
</p>

<p>
<b>Monsieur xxxx </b>n?? le xxxxx ?? xxxx titulaire de la carte nationale d\'identit?? num??ro xxxxx, domicili?? ?? Abidjan-commune de xxxxxxxxx, ayant tous pouvoirs ?? l???effet des pr??sentes, 
</p>

<p>

Ci-apr??s d??sign?? par <b>?? l???employ?? ??</b> ou  <b>?? le salari?? ??</b>,
</p>

<p>
<b>D???autre part</b>
</p>

<p>
NGSER et le salari?? ??tant individuellement d??sign??s <b>?? la partie ??</b> et ensemble 
<b>?? les parties ??</b>

</p>

<p>
<b> <u>IL A ETE PREALABLEMENT EXPOSE CE QUI SUIT :</u></b>
</p>

<p>
<b>Vu le d??cret n?? 96-195 du 07 Mars 1996 et l???article 14.5 de la loi n?? 2015-532 du 20 Juillet 2015 portant code du travail,</b> pr??sent contrat de travail ?? dur??e ind??termin??e comporte une p??riode d???essai. 
</p>

<p>
Ce contrat pr??sente des int??r??ts aussi bien pour l???employeur que pour le salari??.
</p>

<p>
S???agissant de l???employeur, la p??riode d???essai est l???occasion de porter un jugement de valeur, mieux ??clair?? et objectif, sur les comp??tences et les aptitudes professionnelles du travailleur ?? exercer l???emploi ?? lui offert.
</p>

<p>
Quant au salari??, cette p??riode probatoire le mettra en mesure d???appr??cier si la t??che qui lui est confi??e ainsi que les conditions dans lesquelles elle est accomplie lui conviennent ou non.
</p>

<p>
Dans l???hypoth??se o?? l???essai est satisfaisant de part et d???autre, le salari?? est d??finitivement engag??. Dans le cas contraire, chacune des parties au contrat reprendra sa libert??, sans aucune formalit?? et sans que la responsabilit?? de l???une ou de l???autre soit engag??e.
</p>

 <p>
<b><u>CECI EXPOSE, IL EST CONVENU CE QUI SUIT </u></b>
</p>

<p>
<b>ARTICLE 1 : OBJET </b>
</p>

<p>
Par ce contrat, NGSER sollicite <b>Monsieur Dxxxxxxxxx</b> qui accepte d???ex??cuter une prestation de travail en qualit?? de xxxx, conform??ment ?? sa fiche de poste annex??e au pr??sent contrat.  Il exercera ses fonctions sous l???autorit?? et selon les directives de l???employeur, ?? qui il rendra compte de ses prestations de travail.
</p>

<p>
<b>ARTICLE 2 : OBLIGATIONS DE L???EMPLOYE</b>
</p>

<p>
L???employ?? s???engage ?? :
</p>

<p>
- Ex??cuter ses prestations contractuelles, conform??ment ?? la qualit?? et aux normes requises dans son domaine d???activit?? ;
</p>
<p>
- Ex??cuter personnellement la prestation de travail, conform??ment ?? sa fiche de poste ;
</p>

<p>
- Respecter le r??glement int??rieur de la soci??t?? NGSER ;
</p>

<p>
- Respecter le r??glement int??rieur de la soci??t?? NGSER ;
</p>

<p>
- Travailler sous les ordres et la direction de l???employeur ;
</p>
<p>
- Travailler dans les locaux de la soci??t?? NGSER ou en tout lieu en fonction des n??cessit??s du service ;
</p>
<p>
- Prendre soin du mat??riel de travail et garder le secret professionnel ;
</p>
<p>
- Travailler avec abn??gation et loyaut?? au succ??s de la soci??t??  NGSER ;
</p>
<p>
- Respecter la l??gislation du travail.
</p>

<p>
<b>ARTICLE 3 : OBLIGATIONS DE L???EMPLOYEUR</b>
</p>
<p>
L???employeur s???engage ?? :
</p>

<p>
- Assurer ?? l???employ?? les conditions favorables de travail ;
</p>
<p>
- Procurer ?? l???employ?? le travail convenu au lieu convenu et lui payer son salaire. Toutefois, en cas d???urgence ou de p??ril et pour une t??che temporaire, l???employeur peut exiger du salari?? un travail autre que celui pr??vu au  contrat. Dans ces conditions, toute modification substantielle du contrat de travail requiert l???accord pr??alable du salari??.
</p>
<p>
- Respecter la l??gislation du travail.
</p>

<p>
<b>ARTICLE 4 : REMUNERATION</b>
</p>
<p>
La r??mun??ration mensuelle nette de l???employ?? est fix??e ?? <b>xxxx (xxxxxx) FCFA. </b>  
</p>

<p>
La r??mun??ration lui sera r??guli??rement vers??e dans un d??lai de huit (8) jours au plus tard, apr??s la fin du mois ouvrant droit au salaire par : 
</p>
<p>
- Virement bancaire ; 
</p>
<p>
- Ch??que ; ou
</p>
<p>
- En esp??ces.
</p>

 <p>
<b>ARTICLE 5 : DUREE</b>
</p>
 <p>
Ce contrat de travail ?? dur??e ind??termin??e comporte une p??riode d???essai xxxx (xxx) mois, pr??alable ?? l???engagement d??finitif du salari??. 
 </p>
  <p>
  Au terme de cet essai, il pourra ??tre r??sili?? s???il n???est pas satisfaisant.
 </p>
 <p>
Si ?? l???expiration de la p??riode probatoire stipul??e dans le pr??sent article, l???employeur est satisfait des comp??tences et des aptitudes professionnelles du salari??, celui-ci sera alors d??finitivement engag??. Dans ces conditions, le salari?? pourra b??n??ficier de tous les privil??ges auxquels un employ?? a droit, conform??ment ?? la l??gislation du travail en vigueur.
 </p>
 <p>
Ce contrat entre en vigueur ?? compter du  xxxxxxxxxxxx. 
  </p>


<p>
<b>ARTICLE 6 : DROITS ET POUVOIRS DE L???EMPLOYEUR</b>
</p>
<p>
L???employeur a droit au respect scrupuleux de sa personne, de son int??grit?? physique, morale  de sa vie priv??e et de son patrimoine.
</p>
<p>
Il a les pouvoirs suivants :
</p>
<p>
- Le pouvoir de direction. A cet effet, il peut d??cider de l???acc??s d???un salari?? ?? un niveau sup??rieur, d??terminer les t??ches ?? accomplir et le rythme de travail.
</p>
<p>
- Le pouvoir disciplinaire. A ce titre, l???employeur peut sanctionner les fautes commises par l???employ??, ?? travers  les sanctions telles: la mise ?? pied, l???amende, l???avertissement, la mutation et le licenciement.
</p>
<p>
- Le pouvoir de r??viser le contrat de travail, en raison des circonstances ??conomiques ou techniques.
</p>

<p>
<b>
ARTICLE 7 : DROITS ET AVANTAGES SOCIAUX</b>
</p>
<p>
Le  salari?? a droit ?? : 
</p>
<p>
- Une prime de communication d???un montant mensuel de <b>xxxxx francs CFA ;</b>
</p>
<p>
- Tous autres droits et avantages pr??vus conform??ment ?? la loi n??2015-532 du 20 Juillet 2015 portant code du travail en C??te d???Ivoire, la convention collective interprofessionnelle du 19 juillet 1977 ainsi que tous autres lois sociales en vigueur. 
</p>

<p>
<b>ARTICLE 8 : CLAUSE DE NON CONCURRENCE</b>
</p>

<p>
Il est interdit au salari?? d???exercer, m??me en dehors de son temps de travail, toute activit?? ?? caract??re professionnelle, susceptible de concurrencer l???entreprise ou de nuire ?? la bonne ex??cution des services convenus.
</p>

<p>
<b>ARTICLE 9 : CLAUSE DE CONFIDENTIALITE</b>
</p>

<p>
Le salari?? s???engage ?? observer la discr??tion la plus stricte sur les informations se rapportant aux activit??s de la soci??t?? auxquelles il aura acc??s ?? l???occasion et dans le cadre de sa fonction.
</p>
<p>
Notamment, il ne devra pas divulguer ?? quiconque les m??thodes, recommandations, cr??ations, devis, ??tudes, projets, savoir-faire de l???entreprise r??sultant de travaux r??alis??s dans l???entreprise qui sont couverts par le secret professionnel le plus strict. Il sera li?? par la m??me obligation vis-??-vis de tout renseignement ou document dont il aura pris connaissance chez les clients de la soci??t??.
</p>
<p>
Tous les documents, les informations li??es aux produits et services de la soci??t?? NGSER  dont il pourra avoir connaissance dans l???exercice de sa fonction, sont  confidentiels et restent la propri??t?? exclusive de l???employeur.
</p>
<p>
Le salari?? ne pourra, sans accord ??crit de l???employeur, publier aucune ??tude sous quelque forme que ce soit portant sur des travaux ou des informations couverts par l???obligation de confidentialit??. 
</p>

<p>
<b>
ARTICLE 10. DROIT DE PROPRIETE
</b>
</p>

<p>
Les codes sources, les logiciels, les applications, les documents techniques ainsi que tous autres r??sultats issus de travaux effectu??s par le salari?? demeurent la propri??t?? exclusive de la soci??t?? NGSER.
</p>

<p>
<b>
ARTICLE 11 : RESILIATION
</b>
</p>

<p>
Pendant la p??riode d???essai fix??e sans fraude ni abus, le contrat de travail peut ??tre rompu librement sans pr??avis et sans que l???une ou l???autre des parties puissent pr??tendre ??  indemnit??s.
</p>

<p>
Si ?? l???expiration de la p??riode probatoire, le salari?? est maintenu dans l???entreprise, le contrat de travail pourra cesser par la volont?? du salari?? ou par celle de l???employeur qui justifie d???un motif l??gitime. 
</p>

<p>
Hormis le cas de faute lourde ou  de force majeure, la partie qui prend l???initiative de la rupture du contrat doit notifier par ??crit sa d??cision ?? l???autre partie et respecter le d??lai de pr??avis stipul?? <b>?? l???article 34 de la convention collective interprofessionnelle du 20 Juillet 1977</b>.
</p>

 <p>
<b>ARTICLE 12 : LOI APPLICABLE ??? LITIGES</b>
</p>

<p>
Le contrat est interpr??t?? et r??gi conform??ment ?? la l??gislation du travail en vigueur, notamment la loi n??2015-532 du 20 Juillet 2015 portant code du travail en C??te d???Ivoire, la convention collective interprofessionnelle du 19 Juillet 1977 ainsi que toutes autres lois sociales.
</p>

<p>
Tout diff??rend n?? de l???application de ce contrat doit ??tre r??solu selon la proc??dure pr??vue ?? cet effet par la l??gislation du travail.   
</p>

 


<p>
Fait ?? Abidjan le xxxxxxxxxxxxxxxxxxx,   
</p>

<p>
En deux (2) exemplaires originaux.
</p>

<p>
    <table>
        <tr>
            <td> <b><u>L???EMPLOYE</b></u></td>
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
            <td> ELLEPO S??bastien </td>
          </tr>
    </table>
</p>
 

<!-- END CONTENT -->
'; 
$pdf->writeHTMLCell(0, 0, '', '',$html2, 0, 1, 0, true, '', true);

$pdf->Output('cdi_essai.pdf', 'I');

//============================================================+
// END OF FILE
//============================================================+


      


?>