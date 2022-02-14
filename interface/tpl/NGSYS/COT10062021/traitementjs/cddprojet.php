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
    /* public function Header() {
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
        $this->Cell(0, 10, 'CONTRAT DE TRAVAIL A DUREE DETERMINEE', 0, false, 'C', 0, '', 0, false, 'M', 'M');
    }*/

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

$pdf->SetTitle('CDD projet');

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

//$pdf->setY(30);
//$pdf->SetDrawColor(28 , 28, 28);
//$pdf->SetFillColor(221 , 222, 226);
//$pdf->Rect(25 , 25, 160,10,'DF');
//$pdf->Cell(0, 10, 'CONTRAT DE TRAVAIL A DUREE DETERMINEE', 0, false, 'C', 0, '', 0, false, 'M', 'M');

 //END HEADER NO REPEAT ON PAGE
 


 $html2= '
<!-- CSS STYLE -->
<style>

</style>
<!-- <END CSS STYLE -->


<!-- HEADER -->

<table border="1" width="100%" align="center" style="margin-left:50%" valign="top" >
  <tr style="background-color:#C3C3C3;color:black;margin-left:12px; text-align:center;">

    <td width="100%"  style="text-align:center; vertical-align:top;" rowspan="2">

      <span  style="border-top: 1px solid black;"> <b>CONTRAT DE TRAVAIL A DUREE DETERMINEE</b></span> 
    </td>
  </tr>
</table>

<!-- HEADER -->


<!-- BEGIN CONTENT  -->
 
<p>
<b>Entre : </b> <br/>
       <b>Nouvelle Génération de Services en abrégé NGSER,</b>
</p>

Société à Responsabilité Limitée, sise à Abidjan-Plateau, Avenue Lamblin, Immeuble MATCA, 4ème étage, Tel/fax : +225 20 22 12 53 – 28 BP 722 Abidjan 28, RC CI- ABJ- 03-2020-M-11141– CC 0909 529Q, représentée par Monsieur ELLEPO Sébastien, en sa qualité de Gérant, dûment habilité aux fins des présentes;
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
<b>Monsieur xxxxxxxxxxxxxxxxxxxx </b>né le  xxxxxxxxxx à xxxx, titulaire xxxx numéroxxxx, domicilié à xxxx , ayant tous pouvoirs à l’effet des présentes,          
</p>

<p>

Ci-après désigné par <b>« l’employé ou le salarié »</b>,
</p>

<p>
<b>D’autre part</b>
</p>

<p>
NGSER et le salarié étant individuellement désignés <b>« la partie »</b> et collectivement 
<b>« les parties »</b>

</p>

<p>
IL A ETE CONVENU CE QUI SUIT : 
</p>

<p>
<b>ARTICLE 1 : OBJET </b>
</p>

<p>
Par ce contrat, NGSER sollicite <b>Monsieur xxxxxx </b> en qualité d’Ingénieur en télécommunication, pour  l’exécution des projets de Huawei Technologies Côte d’Ivoire. 
</p>

<p>
<b>ARTICLE 2 : OBLIGATIONS DE L’EMPLOYE</b>
</p>

<p>
Dans le cadre de ses fonctions, le salarié s’engage à : 
</p>
<p>
- Exécuter personnellement la prestation de travail avec soin, conformément aux normes et qualités requises dans son domaine d’activité ;
</p>
<p>
- Respecter le règlement intérieur de la société xxxx ;
</p>
<p>
- Travailler sous les ordres et la direction de l’employeur ;
</p>
<p>
- Servir en Côte d’Ivoire, dans les locaux de la société xxxx ou en tout lieu en fonction des nécessités du service ;
</p>
<p>
- Prendre soin du matériel de travail et garder le secret professionnel conformément à la clause de confidentialité ci-dessous ;
</p>
<p>
- Etre ponctuel ;
</p>
<p>
- Travailler avec abnégation et loyauté au succès de la société xxxx ;
</p>
<p>
- Respecter la législation du travail.
</p>


<p>
<b>ARTICLE 3 : OBLIGATIONS DE L’EMPLOYEUR</b>
</p>
<p>
La société xxxx s’engage à :
</p>
<p>
- Assurer à l’employé les conditions favorables de travail ;
</p>
<p>
- Procurer à l’employé le travail convenu au lieu convenu et lui payer son salaire. Toutefois, en cas d’urgence ou de péril et pour une tâche temporaire, l’employeur peut exiger du salarié un travail autre que celui prévu au contrat. Dans ces conditions, toute modification substantielle du contrat de travail requiert l’accord préalable du salarié.
</p>
<p >
- Respecter la législation du travail.
</p>


<p>
<b>ARTICLE 4 : REMUNERATION</b>
</p>
<p>
La rémunération mensuelle nette de l’employé est de xxxx  francs CFA.
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
- en espèces. 
</p>


 <p>
<b>ARTICLE 5 : DUREE -ENTREE EN VIGUEUR </b>
</p>
 <p>
Ce présent contrat de travail est conclu pour une période  de douze  (12) mois qui prend effet à compter du 1er  xxxx et expire le xxxx . 
 </p>
  

<p>
<b>ARTICLE 6 : DROITS ET POUVOIRS DE L’EMPLOYEUR</b>
</p>
<p>
L’employeur a droit au respect scrupuleux de sa personne, de son intégrité physique, morale  de sa vie privée et de son patrimoine.
</p>
<p>
Il a les pouvoirs suivants :
</p>
<p>
-Le pouvoir de direction. A cet effet, il peut décider de l’accès d’un salarié à un niveau supérieur, déterminer les tâches à accomplir et le rythme de travail.
</p>
<p>
-Le pouvoir disciplinaire. A ce titre, l’employeur peut sanctionner les fautes commises par l’employé, à travers les sanctions telles: la mise à pied, l’amende, l’avertissement, la mutation et le licenciement.
</p>
<p>
-Le pouvoir de réviser le contrat de travail, en raison des circonstances économiques ou techniques.
</p>


<p>
<b>
ARTICLE 7 : DROITS ET AVANTAGES SOCIAUX</b>
</p>
<p>
Le salarié a droit à : 
</p>
<p>
- La déclaration à la Caisse Nationale de Prévoyance Sociale  (CNPS);
</p>
<p>
- Une prime de communication d’un montant mensuel xxxxx (xxxxx) francs CFA
</p>
<p>
- Tous autres droits et avantages prévus conformément à la législation du travail en vigueur. 
</p>


<p>
<b>ARTICLE 8 : CLAUSE DE NON CONCURRENCE</b>
</p>

<p>
Il est interdit au salarié d’exercer, même en dehors de son temps de travail, toute activité à caractère professionnelle, susceptible de concurrencer l’entreprise ou de nuire à la bonne exécution des services convenus.
</p>

<p>
<b>ARTICLE 9 : CLAUSE DE CONFIDENTIALITE</b>
</p>

<p>
Le salarié s’engage à observer la discrétion la plus stricte sur les informations se rapportant aux activités de la société auxquelles il aura accès à l’occasion et dans le cadre de sa fonction.
</p>
<p>
Notamment, il ne devra pas divulguer à quiconque les méthodes, recommandations, créations, devis, études, projets, savoir-faire de l’entreprise résultant de travaux réalisés dans l’entreprise qui sont couverts par le secret professionnel le plus strict. Il sera lié par la même obligation vis-à-vis de tout renseignement ou document dont il aura pris connaissance chez les clients de la société.
</p>
<p>
Tous les documents, lettres, notes de service, instructions, méthodes, organisation et/ou fonctionnement de l’entreprise dont il pourra avoir connaissance dans l’exercice de sa fonction, seront confidentiels et resteront la propriété exclusive de la Société.
</p>
<p>
Le salarié ne pourra, sans accord écrit de la Direction Générale de xxxxxxx, publier aucune étude sous quelque forme que ce soit portant sur des travaux ou des informations couvertes par l’obligation de confidentialité. Cette obligation de confidentialité se prolongera après la cessation du contrat de travail, quelle qu’en soit la cause.
</p>


<p>
<b>
ARTICLE 10. DROIT DE PROPRIETE
</b>
</p>
<p>
Le présent contrat prend fin dans les conditions ci-dessous :
</p>
<p>
Le contrat prend fin dans les conditions ci-après :
</p>
<p>
 <span>&#10147;</span> Au terme de la période contractuelle stipulée à l’article 5 ci-dessus ; 
</p>
<p>
<span>&#10147;</span> En cas de force majeure, l’accord commun des parties ou la faute lourde du salarié ; 
</p>
<p>
Toute rupture prononcée en violation de l’alinéa précédent donne lieu, au profit de la partie lésée, à des dommages et intérêts correspondant aux salaires et avantages de toute nature dont le salarié aurait bénéficié pendant la période restant à courir jusqu’au terme de son contrat.
</p>


<p>
<b>
ARTICLE 11 : RESILIATION
</b>
</p>

<p>
Pendant la période d’essai fixée sans fraude ni abus, le contrat de travail peut être rompu librement sans préavis et sans que l’une ou l’autre des parties puissent prétendre à  indemnités.
</p>

<p>
Si à l’expiration de la période probatoire, le salarié est maintenu dans l’entreprise, le contrat de travail pourra cesser par la volonté du salarié ou par celle de l’employeur qui justifie d’un motif légitime. 
</p>

<p>
Hormis le cas de faute lourde ou  de force majeure, la partie qui prend l’initiative de la rupture du contrat doit notifier par écrit sa décision à l’autre partie et respecter le délai de préavis stipulé <b>à l’article 34 de la convention collective interprofessionnelle du 20 Juillet 1977</b>.
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
Fait à Abidjan le xxxxxxxxxxxxxxxxxxx,   
</p>

<p>
En deux (2) exemplaires originaux.
</p>

<p>
    <table>
        <tr>
            <td> <b><u>L’EMPLOYE</b></u></td>
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

$pdf->Output('cdd_projet.pdf', 'I');

//============================================================+
// END OF FILE
//============================================================+


      


?>