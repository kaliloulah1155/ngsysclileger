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
    /*public function Footer() {
        // Position at 15 mm from bottom
        $this->SetY(-15);
        // Set font
        $this->SetFont('helvetica', 'I', 8);
        // Page number
        $this->Cell(0, 10, 'Page '.$this->getAliasNumPage().'/'.$this->getAliasNbPages(), 0, false, 'C', 0, '', 0, false, 'T', 'M');
    } */
}
// create new PDF document
$pdf = new PDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);

// set document information
$pdf->SetCreator('IBSON');

$pdf->SetTitle('bulletin_congé_gratif');

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

<table border ="1" width= "100%" STYLE="font-family: Century Gothic; font-size:8pt; ">
    <tr width= "100%" >
        <td width= "26%" align="center"  bgcolor="#b0f2b6" >
            <span style="font-weight:bold">BULLETIN DE PAIE    </span>
        </td>
        <td width= "37%" colspan="4">
            <span>Période du : 01/05/21  au : 31/05/21  </span>
        </td>
        <td width= "37%" colspan="2">
            <span>Paiement le : 31/05/21 par : Virement  </span>
        </td>
    </tr>
    <tr width= "100%"  >
        <td width= "26%" rowspan="3">
            <span>NGSER</span><br/>
            <span>28 BP 722 ABIDJAN 28</span><br/>
            <span>PLATEAU Av. Lamblin, Imm. MATCA</span><br/>
            <span>225 &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;   PLATEAU</span>
            <br/><br/>
            <span>N°SIRET : 0909529</span><br/>
            <span>APE/NAF : </span><span>XXX</span>
        </td>
        <td width= "10%">
            <span>Matricule</span><br/>
            <span>G0D0</span>
        </td>
        <td width= "9%">
            <span>Niveau</span><br/>
            <span> </span>
        </td>
        <td  width= "11%">
            <span>Coefficient</span><br/>
            <span> </span>
        </td>
        <td width= "10%">
            <span>Indice</span><br/>
            <span> </span>
        </td>
        <td width= "17%">
            <span>Ancienneté</span><br/>
            <span> 8 an(s) et 0 mois </span>
        </td>
        <td width= "17%">
            <span>N°de Sécurité Sociale</span><br/>
            <span> 11212 / </span>
        </td>
    </tr>
    <tr width= "100%" align="center" >
        <td  width= "25%"   colspan="3">
            <span>Catégorie</span><br/>
            <span>  </span>
        </td>
        <td  width= "24%"   colspan="3">
            <span>Emploi occupé</span><br/>
            <span> ASSISTANT RH </span>
        </td>
        <td width= "25%"   colspan="2">
            <span>Département</span><br/>
            <span>DEPARTEMENT ADMINISTRATIF</span>
        </td>
    </tr>
    <tr width= "100%" align="center" >
        <td  width= "16%">
            <span>Qualification</span><br/>
            <span>  </span>
        </td>
        <td  width= "9%">
            <span>Horaire</span><br/>
            <span>173,33</span>
        </td>
        <td  width= "49%"   colspan="2">
            <span>CCN CONVENTION COLLECTIVE INTERPROFESSIONNELLE</span>
        </td>
    </tr>
    <tr width= "100%" align="center" >
        <td  width= "26%">
            <span> </span><br/>
            <span> </span>
        </td>
        <td  width= "20%">
            <span> </span><br/>
            <span> </span>
        </td>
        <td width= "54%"  rowspan="3" bgcolor="#b0f2b6" align="center">
            <span align="center">
                <br/><br/>
                M. XXXXXXXXX    
            </span>
        </td>
    </tr>
    <tr width= "100%" align="center" >
        <td  width= "12%" >
            <span>Repos comp.</span><br/>
            <span>Congés</span>
        </td>
        <td  width= "11%" >
            <span>Acquis</span><br/>
            <span align="right"> 0,00 </span><br/>
            <span align="right"> 2,50 </span>
        </td>
        <td  width= "12%" >
            <span>Reste à prendre</span><br/>
            <span> 0,00 </span><br/>
            <span> 2,50 </span>
        </td>
        <td  width= "11%" >
            <span>Pris</span><br/>
            <span> 0,00 </span><br/>
            <span> 0,00 </span>
        </td>
    </tr>
    <tr width= "100%"   >
        <td width= "46%" colspan="4">
            <span>Dates de congés : du ..... &#160;   &#160;  du ..... &#160;   &#160;  du ..... &#160;   &#160;</span> <br/>
            &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; &#160;&#160;&#160;&#160;&#160;
            &nbsp;&nbsp;<br/>
            <span> &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; &#160;&#160;&#160;&#160;&#160;  au ..... &#160;   &#160;  au ..... &#160;   &#160;au ..... &#160;   &#160; </span>
        </td> 
    </tr>
    <tr width= "100%"   >
        <td width= "61%" colspan="5" >
            <span>Commentaire : </span>
        </td> 
        <td width= "13%" >
            <span>  </span><br/>
            <span> 0,00  </span>
        </td> 
        <td width= "13%" >
            <span>  </span><br/>
            <span>   </span>
        </td>
        <td width= "13%" >
            <span>  </span><br/>
            <span>   </span>
        </td>
    </tr>
    <tr width= "100%"   >
        <td width= "5%" align="center">
             N° 
        </td> 
        <td width= "25%" align="center" >
            <span> Désignation  </span>
        </td> 
        <td  width= "10%" align="center">
            <span> Nombre </span>
        </td>
        <td  width= "10%" align="center">
            <span> Base </span>
        </td>
        <td width= "23%" align="center"  colspan="3" >
            <span > Part salariale </span><br/>
             Taux &#160;&#160;&#160;&#160;&#160; Gain &#160;&#160;&#160;&#160;&#160; Retenue   
        </td>
        <td width= "27%" align="center"  colspan="3" >
            <span > Part patronale </span><br/>
             Taux &#160;&#160; Retenue(+) &#160;&#160; Retenue(-)
        </td>
    </tr>
    <tr width= "100%"   >
        <td width= "5%">
            1
        </td> 
        <td width= "25%" >
            <span> Nombre de parts  </span>
        </td> 
        <td width= "10%">
            <span> ... </span>
        </td>
        <td  width= "10%" >
            <span> ... </span>
        </td>
        <td width= "5%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "9%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "9%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "5%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "11%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "11%" align="center" >
              <span> ...  </span>
        </td>
    </tr>
    <tr width= "100%"   >
        <td width= "5%">
            10
        </td> 
        <td width= "25%" >
            <span> Salaire de Base  </span>
        </td> 
        <td width= "10%">
            <span> ... </span>
        </td>
        <td  width= "10%" >
            <span> ... </span>
        </td>
        <td width= "5%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "9%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "9%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "5%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "11%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "11%" align="center" >
              <span> ...  </span>
        </td>
    </tr>
    <tr width= "100%"   >
        <td width= "5%">
            11
        </td> 
        <td width= "25%" >
            <span> Transport Imposable  </span>
        </td> 
        <td width= "10%">
            <span> ... </span>
        </td>
        <td  width= "10%" >
            <span> ... </span>
        </td>
        <td width= "5%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "9%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "9%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "5%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "11%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "11%" align="center" >
              <span> ...  </span>
        </td>
    </tr>
    <tr width= "100%"   >
        <td width= "5%">
            20
        </td> 
        <td width= "25%" >
            <span> Sursalaire  </span>
        </td> 
        <td width= "10%">
            <span> ... </span>
        </td>
        <td  width= "10%" >
            <span> ... </span>
        </td>
        <td width= "5%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "9%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "9%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "5%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "11%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "11%" align="center" >
              <span> ...  </span>
        </td>
    </tr>
    <tr width= "100%"   >
        <td width= "5%">
            32
        </td> 
        <td width= "25%" >
            <span> Prime d’Astreinte  </span>
        </td> 
        <td width= "10%">
            <span> ... </span>
        </td>
        <td  width= "10%" >
            <span> ... </span>
        </td>
        <td width= "5%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "9%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "9%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "5%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "11%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "11%" align="center" >
              <span> ...  </span>
        </td>
    </tr>
    <tr width= "100%"   >
        <td width= "5%">
            131
        </td> 
        <td width= "25%" >
            <span> Gratification  </span>
        </td> 
        <td width= "10%">
            <span> ... </span>
        </td>
        <td  width= "10%" >
            <span> ... </span>
        </td>
        <td width= "5%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "9%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "9%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "5%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "11%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "11%" align="center" >
              <span> ...  </span>
        </td>
    </tr>
    <tr width= "100%"   >
        <td width= "5%"> 
        </td> 
        <td width= "25%" >
            <span> Total Brut </span>
        </td> 
        <td width= "10%">
            <span>  </span>
        </td>
        <td  width= "10%" >
            <span>  </span>
        </td>
        <td width= "5%" align="center" >
              <span>   </span>
        </td>
        <td width= "9%" align="center" >
              <span>   </span>
        </td>
        <td width= "9%" align="center" >
              <span>   </span>
        </td>
        <td width= "5%" align="center" >
              <span>   </span>
        </td>
        <td width= "11%" align="center" >
              <span>   </span>
        </td>
        <td width= "11%" align="center" >
              <span>   </span>
        </td>
    </tr>
    <tr width= "100%"   >
        <td width= "5%">
            830
        </td> 
        <td width= "25%" >
            <span> Retraite  </span>
        </td> 
        <td width= "10%">
            <span> ... </span>
        </td>
        <td  width= "10%" >
            <span> ... </span>
        </td>
        <td width= "5%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "9%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "9%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "5%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "11%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "11%" align="center" >
              <span> ...  </span>
        </td>
    </tr>
    <tr width= "100%"   >
        <td width= "5%">
            835
        </td> 
        <td width= "25%" >
            <span> Accident de Travail  </span>
        </td> 
        <td width= "10%">
            <span> ... </span>
        </td>
        <td  width= "10%" >
            <span> ... </span>
        </td>
        <td width= "5%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "9%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "9%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "5%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "11%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "11%" align="center" >
              <span> ...  </span>
        </td>
    </tr>
    <tr width= "100%"   >
        <td width= "5%">
            840
        </td> 
        <td width= "25%" >
            <span> Prestations Familiales  </span>
        </td> 
        <td width= "10%">
            <span> ... </span>
        </td>
        <td  width= "10%" >
            <span> ... </span>
        </td>
        <td width= "5%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "9%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "9%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "5%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "11%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "11%" align="center" >
              <span> ...  </span>
        </td>
    </tr>
    <tr width= "100%"   >
        <td width= "5%">
            845
        </td> 
        <td width= "25%" >
            <span> Taxe FPC  </span>
        </td> 
        <td width= "10%">
            <span> ... </span>
        </td>
        <td  width= "10%" >
            <span> ... </span>
        </td>
        <td width= "5%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "9%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "9%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "5%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "11%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "11%" align="center" >
              <span> ...  </span>
        </td>
    </tr>
    <tr width= "100%"   >
        <td width= "5%">
            850
        </td> 
        <td width= "25%" >
            <span> Taxe d’Apprentissage  </span>
        </td> 
        <td width= "10%">
            <span> ... </span>
        </td>
        <td  width= "10%" >
            <span> ... </span>
        </td>
        <td width= "5%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "9%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "9%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "5%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "11%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "11%" align="center" >
              <span> ...  </span>
        </td>
    </tr>
    <tr width= "100%"   >
        <td width= "5%">
            860
        </td> 
        <td width= "25%" >
            <span> ITS mensuel  </span>
        </td> 
        <td width= "10%">
            <span> ... </span>
        </td>
        <td  width= "10%" >
            <span> ... </span>
        </td>
        <td width= "5%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "9%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "9%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "5%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "11%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "11%" align="center" >
              <span> ...  </span>
        </td>
    </tr>
    <tr width= "100%"   >
        <td width= "5%">
            865
        </td> 
        <td width= "25%" >
            <span> Contribution Nationale  </span>
        </td> 
        <td width= "10%">
            <span> ... </span>
        </td>
        <td  width= "10%" >
            <span> ... </span>
        </td>
        <td width= "5%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "9%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "9%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "5%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "11%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "11%" align="center" >
              <span> ...  </span>
        </td>
    </tr>
    <tr width= "100%"   >
        <td width= "5%">
            876
        </td> 
        <td width= "25%" >
            <span> IGR mensuel  </span>
        </td> 
        <td width= "10%">
            <span> ... </span>
        </td>
        <td  width= "10%" >
            <span> ... </span>
        </td>
        <td width= "5%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "9%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "9%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "5%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "11%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "11%" align="center" >
              <span> ...  </span>
        </td>
    </tr>
    <tr width= "100%"   >
        <td width= "5%"> 
        </td> 
        <td width= "25%" >
            <span> Total Cotisations  </span>
        </td> 
        <td width= "10%">
            <span>  </span>
        </td>
        <td  width= "10%" >
            <span>  </span>
        </td>
        <td width= "5%" align="center" >
              <span>   </span>
        </td>
        <td width= "9%" align="center" >
              <span>   </span>
        </td>
        <td width= "9%" align="center" >
              <span>   </span>
        </td>
        <td width= "5%" align="center" >
              <span>   </span>
        </td>
        <td width= "11%" align="center" >
              <span>   </span>
        </td>
        <td width= "11%" align="center" >
              <span>   </span>
        </td>
    </tr>
    <tr width= "100%"   >
        <td width= "5%">
            1028
        </td> 
        <td width= "25%" >
            <span> Indemnité de Transport  </span>
        </td> 
        <td width= "10%">
            <span> ... </span>
        </td>
        <td  width= "10%" >
            <span> ... </span>
        </td>
        <td width= "5%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "9%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "9%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "5%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "11%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "11%" align="center" >
              <span> ...  </span>
        </td>
    </tr>
    
    <tr width= "100%"   >
        <td width= "5%">
            ...
        </td> 
        <td width= "25%" >
            <span> ...  </span>
        </td> 
        <td width= "10%">
            <span> ...  </span>
        </td>
        <td  width= "10%" >
            <span> ...  </span>
        </td>
        <td width= "5%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "9%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "9%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "5%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "11%" align="center" >
              <span> ...  </span>
        </td>
        <td width= "11%" align="center" >
              <span> ...  </span>
        </td>
    </tr>
    
    <tr width= "100%"   >
        <td width= "8%" align="center" >
            Cumuls
        </td> 
        <td width= "11%" align="center">
            <span>Salaire brut</span>
        </td> 
        <td width= "11%" align="center">
            <span>Net imposable</span>
        </td>
        <td width= "11%" align="center"  >
            <span>Charges salariales</span>
        </td>
        <td width= "11%" align="center" >
             Charges patronales
        </td>
        <td width= "11%" align="center" >
            Heures travaillées
        </td>
        <td width= "11%" align="center" >
            Heures sup.
        </td>
        <td width= "11%" align="center" >
            Avantages en nature
        </td>
        <td width= "15%" align="center" bgcolor="#b0f2b6" style="font-weight:bold" >
            NET A PAYER
        </td>
    </tr>
    <tr width= "100%"   >
        <td width= "8%" align="center" >
            Période <br/>Année
        </td> 
        <td width= "11%" align="center">
            ...<br/>
            ...
        </td> 
        <td width= "11%" align="center">
            ...<br/>
            ...
        </td>
        <td width= "11%" align="center"  >
            ...<br/>
            ...
        </td>
        <td width= "11%" align="center" >
            ...<br/>
            ...
        </td>
        <td width= "11%" align="center" >
            ...<br/>
            ...
        </td>
        <td width= "11%" align="center" >
            ...<br/>
            ...
        </td>
        <td width= "11%" align="center" >
            ...<br/>
            ...
        </td>
        <td width= "15%" align="center" bgcolor="#b0f2b6" style="font-weight:bold" >
            <br/>
        </td>
    </tr>
    
</table>
<br/>
    <span STYLE="font-family: Century Gothic; font-size:8pt; "> 
    Pour vous aider à faire valoir vos droits, conservez ce bulletin de paie sans limitation de durée &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; Sage
    </span>


<!-- END CONTENT -->
'; 
$pdf->writeHTMLCell(0, 0, '', '',$html2, 0, 1, 0, true, '', true);

$pdf->Output('bulletin_congé_gratif.pdf', 'I');

//============================================================+
// END OF FILE
//============================================================+


      


?>