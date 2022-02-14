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
       <b><u>Nouvelle Génération de Services en abrégé NGSER,</u></b>
</p>
Société à Responsabilité Limitée, sise à Abidjan-plateau, Avenue Lambin , Immeuble  MATCA, 4e Etage, immatriculée au registre du commerce et du crédit mobilier sous le numéro CI- ABJ-03-2020-M-11141 , 28 BP 722 Abidjan 28, téléphone (225) 20 22 12 53, représentée par le gérant, <b>Monsieur ELLEPO Sébastien,</b> dûment habilité aux fins des présentes et de leurs suites,
</p>
<p>
<b>Ci-après indifféremment désignée «  NGSER »  ou « le Client »</b>
</p>

<p>
<b>D’une part </b>
</p>

<p>
<b>Et </b>
</p>

<p>
<b>Monsieur xxxx </b>né le xxxxx à xxxx titulaire de la CNI numéro xxxxx, domicilié à Abidjan-commune de xxxxxxxxx, ayant tous pouvoirs à l’effet des présentes, 
</p>

<p>
<b>Ci-après désigné « le Consultant » ou « le Prestataire » </b>
</p>

<p>
<b>D’autre part</b>
</p>

<p>
NGSER  et  le consultant sont individuellement  désignés <b>« la partie »</b> et  ensemble
<b>« les parties »,</b> 
</p>

<p>
<b> <u>IL A ETE PREALABLEMENT EXPOSE CE QUI SUIT :</u></b>
</p>

<p>
NGSER est une société de droit ivoirien spécialisée dans toutes les opérations dans le domaine des télécommunications, le développement des Technologies de l’Information, le conseil et la gestion des projets des Nouvelles Technologies de l’Information et la Communication.
</p>

<p>
<b>Monsieur  xxxxxxxxxx </b> est un Analyste Programmeur.  
</p>

<p>
Au regard de ses compétences, la société NGSER a sollicité le consultant pour l’exécution de ses  projets informatiques.
</p>

<p>
Le consultant ayant accepté la demande de NGSER, les parties ont établi le présent contrat qui fixe le cadre normatif de leur collaboration.
</p>

<p>
<b><u>CECI EXPOSE, IL EST CONVENU ET ARRETE CE QUI SUIT : </u></b>
</p>

<p>
<b><u>Article 1. Valeur  préambule – Annexes - Lexique</u></b>
</p>

<p>
<b>1.1 Valeur du préambule-Annexes</b>
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
Le préambule ci-dessus et les annexes ci-jointes ont la même valeur juridique que le présent contrat cadre dont ils font partie intégrante.
</p>

<p>
<b>1.2 Lexique contractuel</b>
</p>

<p>
<b>Consultant</b> est la personne physique mandaté par NGSER pour réaliser les prestations ;
</p>

<p>
<b>Délai d’exécution</b> désigne  le délai prévu pour  la réalisation des prestations ;
</p>

<p>
<b>Notification</b> désigne toute transmission d\'information et/ou de demande ou réclamation effectuée dans le cadre du contrat ;
</p>

<p>
<b>Jour Ouvré</b> désigne l’un quelconque des cinq (5) jours hebdomadaires du calendrier du lundi au vendredi ;
</p>

<p>
<b>Jour</b> désigne un jour calendaire ;
</p>

<p>
<b>Prestations ou Mission</b> désigne les prestations contractuelles convenues par les parties et devant être fournies par le Consultant conformément au cahier des charges ;
</p>


<p>
<u><b>Article 2. Documents contractuels</b></u>
</p>
Les documents contractuels sont par ordre de priorité les pièces et actes suivants:  

<p>
 <span>&#10147;</span> Le présent contrat
</p>

<p>
 <span>&#10147;</span> Le cahier des charges
</p>
<p>
 <span>&#10147;</span> Tout autre document afférent à l’exécution du contrat, acté par les parties.
</p>


<p>
<u><b>Article 3. Objet</b></u>
</p>

<p>
Le Contrat a pour objet de préciser les termes et conditions dans lesquels NGSER engage le Consultant en qualité <b>d’Analyste Programmeur</b> pour l’exécution de divers projets informatiques, conformément au cahier des charges des missions annexé au contrat.
</p>

<p>
<u><b>Article 4. Obligations des parties</b></u>
</p>

<p>
<b>4.1 Obligations du Consultant</b>
</p>

<p>
Le Consultant s’engage à respecter toutes les obligations mises à sa charge dans le cadre du présent contrat et plus particulièrement à :
</p>

<p>
  <span>&#10066;</span>
  Prendre toutes dispositions utiles pour réaliser sous sa seule responsabilité, toutes les prestations afférentes aux projets du Client notamment, la mise en œuvre des livrables applicatifs et la gestion AGILE des projets, conformément au cahier des charges des missions. A cet effet, le Consultant apportera son savoir-faire, sa disponibilité et tous autres moyens nécessaires à l’exécution des prestations contractuelles dans les locaux du Client ou en tout lieu en cas de nécessité du service. Il a une obligation de résultat quant à la conformité des prestations par rapport aux besoins et attentes du Client ;
</p>

<p>
  <span>&#10066;</span>
  Réaliser la mission conformément au délai d’exécution requis par Client ;
</p>

<p>
  <span>&#10066;</span>
  Exécuter sa mission conformément aux règles en vigueur dans sa profession et en se conformant à toutes les données acquises dans son domaine de compétence ; 
</p>
<p>
  <span>&#10066;</span>
  Fournir un rapport mensuel d’activité
</p>

<p>
  <span>&#10066;</span>
  Apporter son expertise et proposer au Client des solutions appropriées ;
</p>

<p>
<u><b>4.2 Obligations du Client</b></u>
</p>

<p>
NGSER  s’engage à :
</p>

<p>
  <span>&#10066;</span> Rémunérer le consultant  selon les modalités définies à l’article 7 ci-dessous ;
</p>

<p>
  <span>&#10066;</span> Désigner un interlocuteur principal capable de collaborer étroitement avec le Consultant pour la mise en œuvre des projets;
</p>

<p>
  <span>&#10066;</span> Prêter tout concours que le Consultant pourrait demander dans le cadre de ses obligations contractuelles. 
</p>

<p>
  <span>&#10066;</span> Valider les documents de recette des livrables fournis par le consultant
</p>

<p>
<u><b>Article 5. Durée</b></u>
</p>

<p>
Ce présent contrat est conclu pour une durée de xxxxxxxxxxx mois . 
</p>

<p>
Toutefois, les parties conviennent que le volume horaire mensuel de réalisation des travaux est fixé à xxx (xxxxxx) heures. 
</p>

<p>
Il expire dans les conditions stipulées à l’article 15 ci-dessous.
</p>

<p>
<u><b>Article 6. Modalités d’exécution des prestations</b></u>
</p>

<p>
A la demande de NGSER, le prestataire fournira les prestations soit dans les locaux de NGSER soit hors de la société conformément au cahier des charges de la mission qui lui a été confiée.
</p>

<p>
Dès réception du cahier des charges de la mission par le prestataire, celui-ci est tenu de prendre toutes les dispositions nécessaires afin d’exécuter les prestations de services dans les délais convenus.</p>

<p>
Les parties conviennent qu’en l’absence de prestations fournies au cours d’une période mensuelle, le prestataire ne pourra prétendre à aucune rémunération au cours de ladite période. </p>

<p>
Le prestataire informera NGSER sans délai de toutes les difficultés auxquelles il sera confronté au cours de l’exécution de ses prestations. A la demande de NGSER, le Consultant devra fournir des rapports résumant les actions réalisées dans l’exécution de ses prestations contractuelles. NGSER fournira au consultant toute information relative aux prestations qu’il pourra lui demander.</p>

<p>
<u><b>Article 7. Stipulations financières</b></u>
</p>

<p>
<b>7.1 Rémunération des prestations de services</b>
</p>

<p>
La rémunération du prestataire est liée au volume horaire mensuel de réalisation des travaux.
</p>
<p>
Le volume horaire mensuel de réalisation des travaux est fixé à <b>cent vingt (120) heures</b>. 
</p>

<p>
Sur la base du volume horaire mensuel des travaux effectivement réalisés par le prestataire et validés par le client, le prestataire percevra une rémunération mensuelle nette fixée à <b>xxxxxxxx (xxxxxxxxx) francs CFA <b/>.
</p>

<p>
<b>7.2 Périodicité et modalités de paiement </b>
</p>

<p>
La rémunération mensuelle du prestataire doit être calculé en fonction du volume horaire mensuel des prestations effectuées par le prestataire sur la base du cahier des charges des missions qui lui ont été confiés.
</p>

<p>
Pour les besoins de chaque paiement, le prestataire doit transmettre chaque fin du mois à NGSER les documents énumérés ci-dessous :
</p>
<p>
a.  Les fiches de fin travaux des livrables recettés et validés par les Responsables des Départements Technique Informatique et Projet ;
</p>
<p>
b.  Les livrables documentaires techniques ;
</p>
<p>
c.  Une copie de la fiche mensuelle du timesheet
</p>

<p>
Les règlements du prestataire s’effectueront en espèces, dans un délai de dix (10) jours au plus tard après la réception mensuelle des documents de fin travaux et des livrables documentaires.
</p>

 

<p>
<b> <u>Article 8. Fiscalité </u></b>
</p>

<p>
NGSER reste tenue du paiement des impôts, droits et taxes de toutes natures grevant l’exécution des prestations. </p>

<p>
<b> <u>Article 9. Indépendance des parties</u></b>
</p>

<p>
Les Parties sont des professionnels indépendants l’un de l’autre qui agiront toujours comme tels.
</p>

<p>
Les Parties déclarent que le Contrat ne saurait en aucun cas s\'analyser en un contrat de travail  au sens de l’article 2 de la loi n° 2015-532 du 20 juillet 1015 portant Code du travail. 
</p>

<p>
Le consultant déclare en conséquence être indépendant vis–à-vis du Client. A ce titre, le Client ne peut être responsable envers le Consultant de tous droits dont un salarié peut bénéficier conformément à la législation du travail mentionné dans le présent article et tous autres textes règlementaires afférents à cette législation en vigueur.
</p>

<p>
<b> <u>Article 10. Confidentialité</u></b>
</p>

<p>
Le Consultant s’engage à observer la discrétion la plus stricte sur les informations se rapportant aux activités de la société NGSER auxquelles il aura accès à l’occasion du présent contrat.
</p>

<p>
Notamment, il ne devra pas divulguer à quiconque les informations techniques, commerciales, marketing, financières ainsi que toutes autres informations liées aux activités de NGSER qui sont couvertes par le secret professionnel le plus strict. Il sera lié par la même obligation vis-à-vis de tout renseignement ou document dont il aura pris connaissance chez les partenaires commerciaux de la société NGSER.
</p>

<p>
Tous les documents, lettres, notes de service, instructions, méthodes, organisation et/ou fonctionnement de l’entreprise dont il pourra avoir connaissance dans l’exercice de sa fonction, seront confidentiels et resteront la propriété exclusive de la Société.
</p>

<p>
Le Consultant ne pourra, sans accord écrit de la Société  NGSER, publier aucune étude sous quelque forme que ce soit portant sur des projets ou des informations couverts par l’obligation de confidentialité. Cette obligation de confidentialité se prolongera après la cessation du contrat de prestation de services, quelle qu’en soit la cause.
</p>

<p>
Le Consultant, toutefois, ne saurait être tenu pour responsable d\'aucune divulgation si les informations divulguées étaient dans le domaine public à la date de la divulgation, ou s\'il en avait connaissance, ou les obtenait de tiers par des moyens légitimes.  
</p>

<p>
<b> <u>Article 11. Recette des travaux </u></b>
</p>

<p>
Tous les travaux donnent lieu à recette globale. Elle a lieu selon les délais convenus par les parties.Sauf objection motivée par NGSER, il sera procédé à la recette définitive des travaux et des livrables documentaires associés. 
</p>

<p>
Notamment, il ne devra pas divulguer à quiconque les informations techniques, commerciales, marketing, financières ainsi que toutes autres informations liées aux activités de NGSER qui sont couvertes par le secret professionnel le plus strict. Il sera lié par la même obligation vis-à-vis de tout renseignement ou document dont il aura pris connaissance chez les partenaires commerciaux de la société NGSER.
</p>

<p>
La recette définitive des travaux est constatée par un procès-verbal de recette contradictoire signé par les parties.
</p>

 

<p>
<b> <u>Article 12. Responsabilité </u></b>
</p>

<p>
Chaque partie est responsable de la mauvaise exécution ou de l’inexécution totale ou partielle de ses obligations qui lui incombent au titre du contrat. Les parties s’engagent exécuter de bonne foi et sans réserve le contrat et s’abstiennent de toutes manœuvres abusives et dilatoires sous quelques formes que ce soient, empêchant ou restreignant sa bonne exécution.
</p>
<p>
Le prestataire reconnaît que le respect de la confidentialité des informations du client est un engagement essentiel du contrat.
</p>
<p>
Le Consultant engage sa responsabilité civile et pénale en cas d’utilisation frauduleuse des informations confidentielles du client.
</p>
<p>
Le consultant est responsable de tous préjudices subis par le client, liés à la violation de la clause de confidentialité susmentionnée.
</p>

<p>
<b> <u>Article 13. Résultats des projets </u></b>
</p>

<p>
La propriété intellectuelle des œuvres réalisées, notamment les résultats des études, les schémas techniques, les livrables Applicatifs, les documents élaborés etc., en application du présent contrat, est attribuée au client. A cette fin, le Consultant transfère au client tous les droits sur les œuvres précitées : droit de reproduction, droit de représentation, droit de commercialisation, droit d\'usage, de détention, d\'adaptation, de traduction, et plus généralement, tous droits d\'exploitation.
</p>

<p>
<b><u>Article 14. Sous-traitance </u></b>
</p>
 
<p>
Dans le cadre de ce contrat, le Consultant n’est autorisé à sous-traiter les prestations liées à l’exécution d’un quelconque projet qu’avec l’accord préalable de NGSER. 
</p>



<p>
<b><u>Article 15.Résiliation </u></b>
</p>

<p>
<b>15.1 Condition </b>
</p>

<p>
Le Contrat prend fin dans les conditions ci-après : 
</p>

<p>
• Au terme de la période stipulée à l’article 5 ci-dessus ; 
</p>
<p>
• Chaque Partie peut résilier le Contrat de plein droit en cas de manquement par l’autre Partie à toute stipulation contractuelle, non réparé dans un délai de cinq (05) jours, à compter de la réception d’une notification écrite du manquement adressée par la Partie non fautive, qui devra décrire de manière suffisamment détaillée, la nature du manquement. La résiliation sera sans préjudice de tout autre recours que la Partie non fautive serait en droit d’exercer.
</p>
<p>
• Pour tout autre motif, après le respect d’un préavis d’un (01) mois. 
</p>

<p>
<b>15.2 Effets </b>
</p>

<p>
• En cas de résiliation due à une faute du consultant, NGSER aura le droit de demander des dommages-intérêts pour la perte de profits causée par ladite faute et aucun montant ne sera dû au consultant au titre des prestations exécutées à la date de la résiliation. 
</p>
<p>
• En cas de résiliation du contrat pour tous autres motifs pendant la période de la mission du Consultant, celui-ci percevra un montant correspondant au prorata du temps de travaux effectué au cours de ladite période. 
</p>



 <p>
<b><u>Article 16. Force majeure</u></b>
</p>

 <p>
On entend par cas de force majeure, tout évènement extérieur, imprévisible, insurmontable, irrésistible et indépendant de la volonté des parties. Sont notamment considérés  comme cas de force majeure les évènements suivants :
</p>

 <p>
• Les conflits sociaux ;
 </p>

 <p>
• Les catastrophes naturelles ;
 </p>
  <p>
• Les aléas ou les indisponibilités des réseaux des téléphones mobiles et des accès internet;
 </p>
  <p>
• La carence ou le retard des moyens de transport ;
 </p>
  <p>
• Le fait du prince (émeute, pillage, grève prévisible ou imprévisible dont la durée et l’ampleur demeurent inconnues, vols à main armée, ordre de l’autorité publique, expropriation, réquisition) ;
 </p>
  <p>
• Panne d’électricité de grande ampleur.
 </p>


   <p>
Il n’y a lieu à aucun dommages-intérêts lorsque, par suite d’une force majeure ou d’un cas fortuit, l’une des parties a été empêchée de donner ou de faire ce à quoi elle était obligée ou a fait ce qui lui était interdit.
 </p>

    <p>
La partie affectée par l’évènement ayant le caractère de force majeure  avise l’autre dans un  délai de <b>deux (2) jours</b> par courrier électronique ou appel téléphonique en précisant la nature de cet évènement, son effet, sa durée prévisible et la reprise des services, après la cessation de l’évènement. 
 </p>
  <p>
En cas de  persistance de la force majeure  pendant plus de <b>trente (30) jours</b>, les parties se réservent  le droit de résilier le présent contrat  en totalité ou en partie. Dans ces conditions, le consultant sera payé selon le volume horaire des travaux effectivement réalisés  à la date de la résiliation du contrat.
 </p>


 <p>
<b><u>Article 17. Nullité d’une clause</u></b>
</p>

<p>
Si une ou plusieurs clauses du contrat sont  tenues pour non valides ou déclarées comme telles en application d\'une loi, d\'un règlement ou à la suite d\'une décision judiciaire devenue définitive, les autres clauses garderont toute leur force et portée.
</p>

<p>
Le cas échéant, les parties s\'efforceront de modifier le contrat afin qu\'elle reflète le plus fidèlement possible leur intention originelle. 
</p>

 <p>
<b><u>Article 18. Renonciation</u></b>
</p>

<p>
Le fait que l\'une ou l\'autre des parties ne revendique pas l\'application d\'une clause quelconque du  Contrat  ou acquiesce à son inexécution, que ce soit de manière permanente ou temporaire, ne pourra être interprété comme une renonciation par cette partie aux droits qui découlent pour elle de ladite clause. 
</p>

 <p>
<b><u>Article 19. Intuitu personae</u></b>
</p>

<p>
 Le Contrat est conclu en considération de la qualité des parties. En conséquence, aucune partie ne peut le transmettre à un tiers qu’avec l’accord préalable et écrit de l\'autre.
</p>

 <p>
<b><u>Article 20. Intégralité</u></b>
</p>

<p>
 Le contrat exprime l\'intégralité de la volonté des parties. Tous contrats ou accords antérieurs portant sur le même objet sont révoqués et remplacés en toutes leurs stipulations par le présent contrat.
</p>


<p>
<b><u>Article 21. Notification - Election de domicile</u></b>
</p>

<p>
Sauf disposition contraire, toutes les notifications et communications relatives au Contrat seront effectuées, au choix de l’expéditeur, (i) par courrier électronique avec accusé de réception aux adresses indiquées ci-dessous, ou aux adresses indiquées dans l’en-tête de ce document (ii) par lettre recommandée avec accusé de réception, (iii) par lettre portée contre récépissé. 
</p>

<p>
Pour l’exécution des présentes et de leurs suites, les Parties font élection de domicile en leur siège  et domicile  indiqué à l’en-tête de ce document. 
</p>
<p>
Les notifications ou communications seront réputées avoir été effectuées: 
</p>

<p>
<span>&#10066;</span> A la date figurant sur l\'accusé de réception en cas d\'envoi par courrier postal ou électronique, toutefois, si la date de réception ne correspond pas à un Jour Ouvré ou si l’heure de réception est après 17 heures , la date de réception sera le premier Jour Ouvré suivant) ; ou  
</p>

<p>
<span>&#10066;</span> A la date figurant sur le récépissé, en cas de remise par porteur ;
</p>

<p>
<span>&#10066;</span> A la date figurant sur le procès- verbal en cas de remise par exploit d’huissier.
</p>

   
<p>
Les notifications ou communications par courrier électronique doivent être adressées à : 
</p>
     
<p>
<b><u>Pour  NGSER: </u></b>
</p>

<p>
- Le Gérant: Sébastien ELLEPO,  <a> sebastien.ellepo@ngser.com </a>
</p>
<p>
- Le Co-gérant: Michel Lucien KASSI,  <a>michel.kassi@ngser.com </a>
</p>
<p>
<b><u>Pour le Consultant </b></u>
</p>
<p>
xxxxxxxxxxxxxx
</p>

 <p>
<b><u>Article 22. Règlement des différends</u></b>
</p>

 <p>
En cas de différends entre les parties, ayant trait à la validité, l’interprétation, l’exécution ou l’inexécution du contrat, elles s’obligent à se concerter et à rechercher un règlement amiable dans un délai de trente (30) jours suivant la notification par l’une des parties à l’autre, de l’objet du différend. En cas de persistance du désaccord à l’expiration du délai indiqué ci-dessus, le litige sera soumis au Tribunal dont dépend le domicile du consultant.
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
            <td> <b><u>Le consultant</b></u></td>
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

$pdf->Output('consultant_interne.pdf', 'I');

//============================================================+
// END OF FILE
//============================================================+


      


?>