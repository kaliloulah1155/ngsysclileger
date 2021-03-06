<?php
  
// Send Headers



    session_start();    
 
    include ('../../../../../configuration_w/mabd.php');
    require('../../../../../configuration_w/tcpdf-master/tcpdf.php');
  

     $numposeidon= $_GET['numposeidon'] ;

     // Extend the TCPDF class to create custom Header and Footer
class PDF extends TCPDF {

    //Page header
    public function Header() {
        // Logo
       // $image_file ='http://localhost:81/NGSYS/configuration_w/tcpdf-master/examples/images/logo_example.jpg';
      //$image_file =K_PATH_IMAGES.'logo_example.jpg';
       $image_file =K_PATH_IMAGES.'ngser.jpg';
        $this->Image($image_file, 10, 10, 40, '', 'JPG', '', 'T', false, 300, '', false, false, 0, false, false, false);

        // Set font
        $this->SetFont('helvetica', 'B', 12);
        // Title
        $this->Ln(15);
        $this->setY(30);
        $this->SetDrawColor(28 , 28, 28);
        $this->SetFillColor(221 , 222, 226);
        $this->Rect(25 , 25, 160,10,'DF');
        $this->Cell(0, 10, 'CONTRAT DE PRESTATION  DE SERVICES NGSER-CONSULTANT', 0, false, 'C', 0, '', 0, false, 'M', 'M');
    }

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

$pdf->SetTitle('consultant');
 
// set default header data
$pdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, PDF_HEADER_TITLE.' 001', PDF_HEADER_STRING, array(0,64,255), array(0,64,128));
$pdf->setFooterData(array(0,64,0), array(0,64,128));

// set header and footer fonts
$pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
$pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));

// set default monospaced font
$pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);

// set margins
$pdf->SetMargins(PDF_MARGIN_LEFT,50, PDF_MARGIN_RIGHT);
$pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
$pdf->SetFooterMargin(PDF_MARGIN_FOOTER);

// set auto page breaks
$pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);

// set image scale factor
$pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);


// ---------------------------------------------------------

// set default font subsetting mode
$pdf->setFontSubsetting(true);

// Set font
// dejavusans is a UTF-8 Unicode font, if you only need to
// print standard ASCII chars, you can use core fonts like
// helvetica or times to reduce file size.
$pdf->SetFont('dejavusans', '', 11, '', true);

//header

// Add a page
// This method has several options, check the source code documentation for more information.
$pdf->AddPage();



// set text shadow effect
//$pdf->setTextShadow(array('enabled'=>true, 'depth_w'=>0.2, 'depth_h'=>0.2, 'color'=>array(196,196,196), 'opacity'=>1, 'blend_mode'=>'Normal'));


// Set some content to print
// define some HTML content with style
$html1 = <<<EOF
<!-- CSS STYLE -->
<style>

</style>
<!-- <END CSS STYLE -->

<!-- BEGIN CONTENT -->
         <b><u>Entre : </u></b> <br/>
       <b><u>Nouvelle G??n??ration de Services en abr??g?? NGSER,</u></b>
<p>
Soci??t?? ?? Responsabilit?? Limit??e, sise ?? Abidjan-plateau, Avenue Lambin , Immeuble  MATCA, 4e Etage, immatricul??e au registre du commerce et du cr??dit mobilier sous le num??ro CI- ABJ-03-2020-M-11141 , 28 BP 722 Abidjan 28, t??l??phone (225) 20 22 12 53, repr??sent??e par le g??rant, <b>Monsieur ELLEPO S??bastien,</b> d??ment habilit?? aux fins des pr??sentes et de leurs suites,
</p>
<p>
<b>Ci-apr??s indiff??remment d??sign??e ??  NGSER ??  ou ?? le B??n??ficiaire ??</b>
</p>

<p>
<b>D???une part </b>
</p>

<p>
<b>Et </b>
</p>

<p>
<b>Monsieur xxxx </b>n?? le xxxxx ?? xxxx titulaire de la CNI num??ro xxxxx, domicili?? ?? Abidjan-commune de xxxxxxxxx, ayant tous pouvoirs ?? l???effet des pr??sentes, 
</p>

<p>
<b>Ci-apr??s d??sign?? ?? le Consultant ?? </b>
</p>

<p>
<b>D???autre part</b>
</p>

<p>
NGSER  et  le consultant sont individuellement  d??sign??s <b>?? la partie ??</b> et  ensemble
<b>?? les parties ??,</b> 
</p>

<p>
<b> <u>IL A ETE PREALABLEMENT EXPOSE CE QUI SUIT :</u></b>
</p>

<p>
NGSER  est une soci??t?? de droit ivoirien   sp??cialis??e dans  toutes les op??rations dans le domaine des t??l??communications, le d??veloppement des Technologies de l???Information, le conseil et la gestion des projets des Nouvelles Technologies  de l???Information et la Communication.
</p>

<p>
<b>Monsieur  xxxxxxxxxx </b> est  un ing??nieur en t??l??communication. 
</p>

<p>
Au regard de ses comp??tences, la soci??t?? NGSER a sollicit?? le consultant pour l???ex??cution des projets de T??l??communication de Huawei Technologies, Client de NGSER. 
</p>

<p>
Le consultant ayant accept?? la demande de NGSER, les parties ont ??tabli le pr??sent contrat qui fixe le cadre normatif de leur collaboration.
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
EOF; 
// Print text using writeHTMLCell()
 $pdf->writeHTMLCell(0, 0, '', '',$html1, 0, 1, 0, true, '', true);


$pdf->AddPage();
 $html2 = <<<EOF
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
<b>Consultant</b> est la personne physique mandat?? par NGSER pour r??aliser les prestations ;
</p>

<p>
<b>D??lai d???ex??cution</b> d??signe  le d??lai pr??vu pour  la r??alisation des prestations ;
</p>

<p>
<b>Notification</b> d??signe toute transmission d'information et/ou de demande ou r??clamation effectu??e dans le cadre du contrat ;
</p>

<p>
<b>Jour Ouvr??</b> d??signe l???un quelconque des cinq (5) jours hebdomadaires du calendrier du lundi au vendredi ;
</p>

<p>
<b>Jour</b> d??signe un jour calendaire ;
</p>

<p>
<b>Prestations ou Mission</b> d??signe les prestations contractuelles devant ??tre fournies par le Consultant ;
</p>

<p>
<b>Client</b> d??signe HUAWEI  TECHNOLOGIES  C??TE D???IVOIRE ;
</p>

<p>
<u><b>Article 2. Documents contractuels</b></u>
</p>
Les documents contractuels sont les pi??ces et actes suivants: 

<p>
 <span>&#10147;</span>
Le pr??sent contrat
</p>

<p>
 <span>&#10147;</span>
Tout autre document aff??rent ?? l???ex??cution du contrat, act?? par les parties.
</p>

<p>
En cas de contradiction entre les stipulations des documents contractuels,  celle qui pr??vaudra et l'emportera sur les autres sera celle pr??sentant le plus d'avantage pour le paiement des sommes dues au Consultant  en contrepartie des prestations effectivement fournies. 
</p>

<p>
<u><b>Article 3. Objet</b></u>
</p>

<p>
Le Contrat a pour objet de pr??ciser les conditions dans lesquelles NGSER  engage le Consultant  en qualit?? <b>de xxxxxxxx</b>  pour l???ex??cution des projets de Huawei Technologies C??te d??? Ivoire.
</p>

<p>
<u><b>Article 4. Obligations des parties</b></u>
</p>

<p>
<b>4.1 Obligations du Consultant</b>
</p>

<p>
Le Consultant s???engage ?? respecter toutes les obligations mises ?? sa charge dans le cadre du pr??sent contrat et plus particuli??rement ?? :
</p>

<p>
  <span>&#10066;</span>
  Prendre toutes dispositions utiles pour r??aliser sous sa seule responsabilit??, toutes les prestations aff??rentes aux projets, conform??ment au cahier des charges annex?? au pr??sent contrat. A cet effet, le Consultant apportera son savoir-faire, sa disponibilit?? et tous autres moyens n??cessaires ??  l???ex??cution des prestations contractuelles  dans les locaux du Client ou en tout lieu en cas de n??cessit?? du service. Il a une obligation de r??sultat quant ?? la conformit?? des prestations par rapport aux sp??cifications et d??lai d???ex??cution  pr??cis??s dans le cahier des charges des projets ;
</p>

<p>
 <span>&#10066;</span>
  Ex??cuter sa mission conform??ment aux r??gles en vigueur dans sa profession et en se conformant ?? toutes les donn??es acquises dans son domaine de comp??tence ; 
</p>

<p>
  <span>&#10066;</span>
  Apporter son expertise et proposer au B??n??ficiaire des  solutions appropri??es ;
</p>
<p>
<u><b>4.2 Obligations du Client</b></u>
</p>

<p>
NGSER  s???engage ?? :
</p>

<p>
  <span>&#10066;</span> R??mun??rer le consultant  selon les modalit??s d??finies ?? l???article 7 ci-dessous ;
</p>

<p>
  <span>&#10066;</span> D??signer un interlocuteur principal capable de collaborer ??troitement avec le Consultant pour la mise en ??uvre des projets;
</p>

<p>
  <span>&#10066;</span> Pr??ter tout concours que le Consultant pourrait demander dans le cadre de ses obligations contractuelles. 
</p>

<p>
<u><b>Article 5. Dur??e</b></u>
</p>

<p>
Ce pr??sent contrat est conclu pour  la dur??e li??e ?? l???ex??cution des projets de Huawei Technologies.
</p>

<p>
Il entre en vigueur ?? compter du xxxxxxxxxxxxx.
</p>

<p>
Il expire  dans les conditions stipul??es ?? l???article 14 ci-dessous.
</p>

<p>
<u><b>Article 6. Modalit??s d???ex??cution des prestations</b></u>
</p>

<p>
Le Consultant  r??alisera  ses prestations sous l???autorit?? et selon les directives du client de NGSER, ?? qui  il rendra compte de ses prestations.
</p>

<p>
Le Consultant  informera le client de NGSER sans d??lai de toutes les difficult??s auxquelles il sera confront?? au cours de l???ex??cution de ses prestations. A la demande de NGSER, le Consultant devra fournir des rapports  r??sumant les actions r??alis??es dans l???ex??cution de ses prestations contractuelles. NGSER fournira au consultant toute information relative aux prestations qu???il pourra lui demander.</p>

<p>
<u><b>Article 7. Stipulations financi??res</b></u>
</p>

<p>
<b>7.1 R??mun??ration mensuelle</b>
</p>

<p>
La r??mun??ration mensuelle nette du consultant est fix??e ?? <b>xxxxxxx (xxxx) FCFA.</b>
</p>

<p>
<b>7.2 P??riodicit?? et modalit??s de paiement </b>
</p>

<p>
La r??mun??ration lui sera r??guli??rement vers??e dans un d??lai de huit (8) jours au plus tard, apr??s la fin du mois ouvrant droit au salaire par :
</p>

<p>
    -  Virement bancaire ; 
</p>
<p>
    -    Ch??que ; ou  
</p>
<p>
    -  En esp??ces.  
</p>

<p>
<b>7.3 Autres avantages </b>
</p>

<p>
NGSER octroie au consultant les avantages ci-apr??s :  
</p>

<p>
???   Une assurance-maladie ; 
</p>
<p>
???   Un cr??dit de communication d???un montant mensuel de xxxxx (xxx) francs CFA ;
</p>
<p>
???   Une  prime de vacation ;  
</p>
<p>
???   Prime de fin d???ann??e li??e au rendement du consultant. 
</p>

<p>
<b> <u>Article 8. Fiscalit?? </u></b>
</p>

<p>
NGSER  reste tenue du paiement des imp??ts, droits et taxes de toutes natures grevant  l???ex??cution des prestations. 
</p>

<p>
<b> <u>Article 9. Ind??pendance des parties</u></b>
</p>

<p>
Les Parties sont des professionnels ind??pendants l???un de l???autre qui agiront toujours comme tels.
</p>

<p>
Les Parties d??clarent que le Contrat ne saurait en aucun cas s'analyser en un contrat de travail  au sens de l???article 2 de la loi n?? 2015-532 du 20 juillet 1015 portant Code du travail. 
</p>

<p>
Le consultant d??clare en cons??quence  ??tre ind??pendant vis?????-vis du B??n??ficiaire. A ce titre, le B??n??ficiaire  ne peut ??tre responsable envers le Consultant  de tous droits dont un salari??  peut b??n??ficier conform??ment ?? la l??gislation du travail mentionn?? dans le pr??sent article et tous autres textes r??glementaires aff??rents ?? cette l??gislation en vigueur, ?? l???exception des avantages  mentionn??s ?? l???article 7.3 susvis??. 
</p>

<p>
<b> <u>Article 10. Confidentialit??</u></b>
</p>

<p>
Le Consultant  s???engage ?? observer la discr??tion la plus stricte sur les informations se rapportant aux activit??s de la soci??t?? auxquelles il aura acc??s ?? l???occasion du pr??sent contrat.
</p>

<p>
Notamment, il ne devra pas divulguer ?? quiconque les m??thodes, recommandations, cr??ations, devis, ??tudes, projets, savoir-faire de l???entreprise r??sultant des projets r??alis??s dans l???entreprise qui sont couverts par le secret professionnel le plus strict. Il sera li?? par la m??me obligation vis-??-vis de tout renseignement ou document dont il aura pris connaissance chez les partenaires commerciaux de la soci??t??.
</p>

<p>
Tous les documents, lettres, notes de service, instructions, m??thodes, organisation et/ou fonctionnement de l???entreprise dont il pourra avoir connaissance dans l???exercice de sa fonction, seront confidentiels et resteront la propri??t?? exclusive de la Soci??t??.
</p>

<p>
Le Consultant ne pourra, sans accord ??crit de la Soci??t??  NGSER, publier aucune ??tude sous quelque forme que ce soit portant sur des projets ou des informations couverts par l???obligation de confidentialit??. Cette obligation de confidentialit?? se prolongera apr??s la cessation du contrat de travail, quelle qu???en soit la cause.
</p>

<p>
Le Consultant, toutefois, ne saurait ??tre tenu pour responsable d'aucune divulgation si les informations divulgu??es ??taient dans le domaine public ?? la date de la divulgation, ou s'il en avait connaissance, ou les obtenait de tiers par des moyens l??gitimes. 
</p>

<p>
<b> <u>Article 11. Responsabilit??</u></b>
</p>

<p>
Chaque partie est responsable de la mauvaise ex??cution ou de l???inex??cution totale ou partielle de ses obligations qui lui incombent au titre du contrat. Les parties s???engagent  ex??cuter de bonne foi et sans r??serve le contrat et s???abstiennent de toutes man??uvres abusives et dilatoires sous quelques formes que ce soient, emp??chant ou restreignant sa bonne ex??cution. 
</p>

<p>
 Le Consultant engage sa responsabilit?? en cas d???utilisation frauduleuse des informations confidentielles de la soci??t??  NGSER ou de celles du client.
</p>

<p>
Le consultant est responsable de tous pr??judices subis par NGSER, li??s ?? la violation de la clause de confidentialit?? susmentionn??e.
</p>

<p>
Sa responsabilit?? pourra ??tre engag??e s???il est ??tabli qu???il a manqu?? ?? sa mission.
</p>

<p>
Toutefois, elle ne pourra pas ??tre engag??e en cas de retard r??sultant des ??v??nements cit??s ?? l???article 15 ci-dessous ou si le Client omet de lui transmettre une information n??cessaire pour la mission.
</p>

<p>
<b> <u>Article 12. R??sultats des projets </u></b>
</p>

<p>
La propri??t?? des ??uvres  r??alis??es, notamment les r??sultats des ??tudes, les sch??mas techniques, les documents ??labor??s etc.,  en application du pr??sent contrat, est attribu??e au client. A cette fin, le Consultant transf??re au client tous les droits sur les ??uvres pr??cit??es: droit de reproduction, droit de repr??sentation, droit de commercialisation, droit d'usage, de d??tention, d'adaptation, de traduction, et plus g??n??ralement, tous droits d'exploitation.
</p>

<p>
<b> <u>Article 13. Sous-traitance</u></b>
</p>

<p>
Dans le cadre de ce contrat, le Consultant n???est autoris?? ?? sous-traiter les prestations li??es ?? l???ex??cution d???un quelconque projet qu???avec l???accord pr??alable de NGSER.
</p>

<p>
<b><u>Article 14. R??siliation </u></b>
</p>

<p>
<b>14.1 Condition</b>
</p>

<p>
Le Contrat prend fin  dans les conditions ci-apr??s : 
</p>

<p>
<span>&#10066;</span> Au terme de la p??riode stipul??e ?? l???article 5 ci-dessus;
</p>

<p>
<span>&#10066;</span> A tout moment  sans pr??avis et sans que l???une ou l???autre des parties ne puisse pr??tendre ?? indemnit??s.
</p>

<p>
<b>14.2 Effets</b>
</p>

<p>
<span>&#10066;</span> En cas de r??siliation due ?? une faute du consultant, NGSER  aura le droit de demander des dommages-int??r??ts pour la perte de profits caus??e par ladite faute et aucun montant  ne sera d??  au consultant au titre des prestations ex??cut??es ??  la date de la r??siliation. 
</p>

<p>
<span>&#10066;</span> En cas de r??siliation du contrat pour tous autres motifs pendant  la p??riode de la mission du Consultant, celui-ci percevra un montant correspondant au prorata du temps de service effectu?? au cours de ladite p??riode. 
</p>

<p>
<b><u>Article 15.Force majeure</u></b>
</p>

<p>
On entend par cas de force majeure, tout ??v??nement ext??rieur, impr??visible, insurmontable, irr??sistible et ind??pendant de la volont?? des parties. Sont notamment consid??r??s  comme cas de force majeure les ??v??nements suivants :
</p>

<p>
???   Les conflits sociaux ; 
</p>
<p>
???   Les catastrophes naturelles ; 
</p>
<p>
???   Les al??as ou les indisponibilit??s des r??seaux des t??l??phones mobiles et des acc??s internet; 
</p>
<p>
???   La carence ou le retard des moyens de transport ; 
</p>
<p>
???   Le fait du prince (??meute, pillage, gr??ve pr??visible ou impr??visible dont la dur??e et l???ampleur demeurent inconnues, vols ?? main arm??e, ordre de l???autorit?? publique, expropriation, r??quisition) ; 
</p>
<p>
???   Panne d?????lectricit?? de grande ampleur. 
</p>

<p>
Il n???y a lieu ?? aucun dommages-int??r??ts lorsque, par suite d???une force majeure ou d???un cas fortuit, l???une des parties a ??t?? emp??ch??e de donner ou de faire ce ?? quoi elle ??tait oblig??e ou a fait ce qui lui ??tait interdit.
</p>
<p>
La partie affect??e par l?????v??nement ayant le caract??re de force majeure  avise l???autre dans un  d??lai de <b>deux (2) jours</b> par courrier ??lectronique ou appel t??l??phonique en pr??cisant la nature de cet ??v??nement, son effet, sa dur??e pr??visible et la reprise des services, apr??s la cessation de l?????v??nement. 
 </p>

 <p>
En cas de  persistance de la force majeure  pendant plus de <b>trente (30) jours</b>, les parties se r??servent  le droit de r??silier le pr??sent contrat  en totalit?? ou en partie. Dans ces conditions, le consultant sera  pay?? selon les prestations fournies ?? la date de la r??siliation. 
 </p>

 <p>
<b><u>Article 16. Nullit?? d???une clause</u></b>
</p>

 <p>
 Si une ou plusieurs clauses du contrat sont  tenues pour non valides ou d??clar??es comme telles en application d'une loi, d'un r??glement ou ?? la suite d'une d??cision judiciaire devenue d??finitive, les autres clauses garderont toute leur force et port??e.
</p>

<p>
Le cas ??ch??ant, les parties s'efforceront de modifier le contrat afin qu'elle refl??te le plus fid??lement possible leur intention originelle. 
</p>

 <p>
<b><u>Article 17. Renonciation</u></b>
</p>

<p>
Le fait que l'une ou l'autre des parties ne revendique pas l'application d'une clause quelconque du  Contrat  ou acquiesce ?? son inex??cution, que ce soit de mani??re permanente ou temporaire, ne pourra ??tre interpr??t?? comme une renonciation par cette partie aux droits qui d??coulent pour elle de ladite clause. 
</p>

 <p>
<b><u>Article 18. Intuitu personae</u></b>
</p>

<p>
Le Contrat est conclu en consid??ration de la qualit?? des parties. En cons??quence, aucune partie ne peut le transmettre ?? un tiers qu???avec  l'accord pr??alable et ??crit de l'autre.
</p>

 <p>
<b><u>Article 19. Int??gralit??</u></b>
</p>

<p>
Le contrat exprime l'int??gralit?? de la volont?? des parties. Tous contrats ou accords ant??rieurs portant sur le m??me objet sont r??voqu??s et remplac??s en toutes leurs stipulations par le pr??sent  contrat.
</p>

 <p>
<b><u>Article 20. Notification - Election de domicile</u></b>
</p>

<p>
Sauf disposition contraire, toutes les notifications et communications relatives au Contrat seront effectu??es, au choix de l???exp??diteur, (i) par courrier ??lectronique avec accus?? de r??ception aux adresses indiqu??es ci-dessous, ou aux adresses indiqu??es dans l???en-t??te de ce document (ii) par lettre recommand??e avec accus?? de r??ception, (iii) par lettre port??e contre r??c??piss?? ou (iv) par exploit d???huissier.
</p>

<p>
Pour l???ex??cution des pr??sentes et de leurs suites, les Parties font ??lection de domicile en leur si??ge  et domicile  indiqu?? ?? l???en-t??te de ce document. 
</p>

<p>
Les notifications ou communications seront r??put??es avoir ??t?? effectu??es: 
</p>

<p>
<span>&#10066;</span> A la date figurant sur l'accus?? de r??ception en cas d'envoi par courrier postal ou ??lectronique, toutefois, si la date de r??ception ne correspond pas ?? un Jour Ouvr?? ou si l???heure de r??ception est apr??s 17 heures , la date de r??ception sera le premier Jour Ouvr?? suivant) ; ou  
</p>

<!-- END CONTENT -->
EOF; 
$pdf->writeHTMLCell(0, 0, '', '',$html2, 0, 1, 0, true, '', true);

$pdf->Output('consultant.pdf', 'I');

//============================================================+
// END OF FILE
//============================================================+


      


?>