<?php

           include ('../../../../../configuration_w/mabd.php');


        require('../../../../../configuration_w/tcpdf-master/tcpdf.php');
 
     $num_poseidonp = $_GET['numposeidon'];


      $rq=pg_query("SELECT \"NOM\"||' '||\"PRE\" AS nom_complet,\"DCL\",
                           \"CAE\",\"SAB\",\"NRR\",\"LOG\",\"PRA\",
                           \"PRR\",\"IND\",\"ATI\",\"CAU\",\"HOR\",\"DCO\",\"NMJ\",
                           \"REN\",\"A1\" 
                    FROM public.pos_tab_index_reg
                    WHERE \"NUD\" ='".$num_poseidonp."'  ");


     $nom='';
     $date_cla='';
     $categorie='';
     $salaire_base='';
     $nourriture='';
     $logement='';
     $prime_anc='';
     $prime_rdt='';
     $indem_transp='';
     $indem_autre='';
     $cautionne='';
     $horaire='';
     $dt_deb_cg='';
     $nb_cg='';
     $remun_cg=0;
     $dt_fin_cg='';

     while ($row=pg_fetch_row($rq)) {

         $nom = $row[0];
         $date_cla = $row[1];
         $categorie = $row[2];
         $salaire_base =str_replace(',','.',number_format($row[3]) );
         $nourriture = $row[4];
         $logement = $row[5];
         $prime_anc =str_replace(',','.',number_format($row[6]) );
         $prime_rdt =str_replace(',','.',number_format($row[7]) );
         $indem_transp =str_replace(',','.',number_format($row[8]) );
         $indem_autre =str_replace(',','.',number_format($row[9]) );
         $cautionne = $row[10];
         $horaire = $row[11];
         $dt_deb_cg = $row[12];
         $nb_cg = $row[13] ?? 0;
         $remun_cg = $row[14] ?? 0;
         $dt_fin_cg = $row[15] ;
         // code...
     }


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
        $this->Rect(110, 25, 80,10,'DF');
        $this->Cell(0, 10, 'REGISTRE D’EMPLOYEUR', 0, false, 'C', 0, '', 0, false, 'M', 'M');
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

$pdf->SetTitle('REGISTRE');
 
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

// set text shadow effect
//$pdf->setTextShadow(array('enabled'=>true, 'depth_w'=>0.2, 'depth_h'=>0.2, 'color'=>array(196,196,196), 'opacity'=>1, 'blend_mode'=>'Normal'));


// Set some content to print
// define some HTML content with style



$pdf->AddPage('L', 'A4');
 $html2 ='

<!-- BEGIN CONTENT -->
    
<table border ="0" width= "100%" STYLE="font-family: Century Gothic; font-size:11pt; " >

     <tr width= "100%" >
        <td width= "50%"  colspan="1" >
            <span>Nom et Prénoms du Travailleur: '.$nom.'</span><br/><br/>
        </td>
        <td width= "50%"  colspan="1" >
            <span style="display:none">Rappel du numéro d’ordre: ............</span><br/><br/>
        </td>
    </tr>

</table>

        <table border="1" align="center" width="100%" STYLE="font-family: Century Gothic; " style="font-size:8pt">
            <tr width="100%" align="center" >
                <td  align="center" rowspan="3" width= "9%">CLASSEMENT dans la hièrarchie professionnelle et date du classement </td>
                <td  align="center" rowspan="3" width= "7%" >SALAIRE DE BASE et date de fixation</td>
                <td  align="center" colspan="6" width= "42%">ACCESSOIRES DE SALAIRE(1)</td>
                <td  align="center" rowspan="3" width= "7%" >CAUTIONNEMENT</td>
                <td  align="center" rowspan="3" width= "7%" >HORAIRES DU TRAVAIL ET DATE AFFECTATION</td>
                <td  align="center" colspan="4" width= "29%" >CONGE PERIODIQUE</td>
            </tr>

            <tr width="100%" align="center" >
                <td  align="center" width= "14%" >EN NATURE (2)</td>
                <td  align="center" width= "28%" >EN ESPECES</td>
                <td  align="center" width= "8%" rowspan="2">DATE DE DEPART EN CONGE</td>
                <td  align="center" width= "6%" rowspan="2">NOMBRE de jours</td>
                <td  align="center" width= "7%" rowspan="2">RENUMERATION DE CONGE</td>
                <td  align="center" width= "8%" rowspan="2">DATE de la reprise du travail</td>
            </tr>
            <tr width="100%" align="center" >
                <td  align="center" width= "7%">Nourriture</td>
                <td  align="center" width= "7%">Logement</td>
                <td  align="center" width= "7%"> Prime d’anciennetè</td>
                <td  align="center" width= "7%">Prime de rendement</td>
                <td  align="center" width= "7%">Indemnitè de transport</td>
                <td  align="center" width= "7%">Autres indemnitès</td>
            </tr>
                <tr width="100%" align="center">
                    <td  align="center" width= "9%">
                        <span> '.$date_cla.':'.$categorie.' </span>
                    </td >
                    <td align="center" width= "7%">
                        <span> '.$salaire_base.'</span>
                    </td >
                    <td   align="center" width= "7%">
                        <span> '.$nourriture.' </span>
                    </td>
                    <td   align="center" width= "7%">
                        <span> '.$logement.'</span>
                    </td>
                    <td   align="center" width= "7%">
                        <span> '.$prime_anc.'</span>
                    </td>
                    <td   align="center" width= "7%">
                        <span>'.$prime_rdt.' </span>
                    </td>
                    <td   align="center" width= "7%">
                        <span> '.$indem_transp.' </span>
                    </td>
                    <td   align="center" width= "7%">
                        <span>'.$indem_autre.' </span>
                    </td>
                    <td   align="center" width= "7%">
                        <span>'.$cautionne.' </span>
                    </td>
                    <td   align="center" width= "7%">
                        <span> '.$horaire.' </span>
                    </td>
                    <td   align="center" width= "8%">
                        <span>'.$dt_deb_cg.' </span>
                    </td>
                    <td   align="center" width= "6%">
                        <span> '.$nb_cg.'</span>
                    </td>
                    <td   align="center" width= "7%">
                        <span> '.$remun_cg.' </span>
                    </td>
                    <td   align="center" width= "8%">
                        <span>'.$dt_fin_cg.' </span>
                    </td>
                </tr> 
        </table>

        

<!-- END CONTENT -->
'; 
$pdf->writeHTMLCell(0, 0, '', '',$html2, 0, 1, 0, true, '', true);

$pdf->Output('registre.pdf', 'I');

//============================================================+
// END OF FILE
//============================================================+
 
 


    ?>