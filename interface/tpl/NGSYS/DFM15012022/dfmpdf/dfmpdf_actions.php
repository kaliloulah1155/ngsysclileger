<?php

    include ('../../../../../configuration_w/mabd.php');
    require('../../../../../configuration_w/tcpdf-master/tcpdf.php');
     $numposeidon= $_GET['numposeidon'] ;
     $loadcode= $_GET['code'] ;


       $query_dfm="
                SELECT
                     \"ENT\",\"APL\",\"ANF\",\"IAF\",\"TA1\",\"LIF\",\"DCR\",
                     \"E1\",\"E2\",\"DEI\",\"DFI\",\"SET\",\"NGP\",
                     \"NHG\",\"COT\",
                     \"BUF\",\"BU1\"
               FROM 
                   public.pos_tab_index_dfm
               WHERE \"NUD\"='".$numposeidon."'
               ";

      $entreprise='';
      $annee='';
      $date_crea='';
      $act_formation='';
      $intitule_forma='';
      $iii='';
      $structure_forma='';
      $etranger ='';
      $diplomant='';
      $date_deb='';
      $date_fin='';
      $lieu_forma='';
      $nbre_group='';
      $hr_group='';
      $cout='';
      $but_forma='';
      $autres='';
      $cadre=0;
      $agent=0;
      $ouvrier_emp=0;
     $contests_dfm= pg_query($query_dfm) or die('Query failed: ' . pg_last_error());
     while ($row_dfm = pg_fetch_row($contests_dfm)) {


            $entreprise=$row_dfm[0];
            $annee=$row_dfm[1];
            $act_formation=$row_dfm[2];
            $intitule_forma=$row_dfm[3];
            $iii=$row_dfm[4];
            $lieu_forma=$row_dfm[5];
            $date_crea=$row_dfm[6];
            $etranger=$row_dfm[7];
            $diplomant=$row_dfm[8];
            $date_deb=$row_dfm[9];
            $date_fin=$row_dfm[10];
            $structure_forma=$row_dfm[11];
            $nbre_group=$row_dfm[12];
            $hr_group=$row_dfm[13];
            $cout=str_replace(',','.',number_format($row_dfm[14]) );
            $but_forma=$row_dfm[15];
            $autres=$row_dfm[16];
     }

      $total=0;
     $rq_emp=pg_query("SELECT count(*) FROM public.beneficaire WHERE posit='EMPLOYE';");
     while ($row_emp = pg_fetch_row($rq_emp)) {
            $ouvrier_emp=$row_emp[0];
            $total +=$ouvrier_emp;
     }

     $rq_ag=pg_query("SELECT count(*) FROM public.beneficaire WHERE posit='AGENT DE MAITRISE';");
     while ($row_ag = pg_fetch_row($rq_ag)) {
            $agent=$row_ag[0];

            $total +=$agent;
     }

     $rq_cdre=pg_query("SELECT count(*) FROM public.beneficaire WHERE posit='CADRE';");
     while ($row_cdre = pg_fetch_row($rq_cdre)) {
            $cadre=$row_cdre[0];

            $total +=$cadre;
     }
     
     $st_cbk1='';
     $st_cbk2='';
     if($etranger=='OUI'){
        $st_cbk1='X';
     } 
     if($diplomant=='OUI'){
        $st_cbk2='X';
     } 


     $st_cbk3='';
     $st_cbk4='';
     $st_cbk5='';

     if($iii=='INTRA'){
        $st_cbk3='X';
     } 
     if($iii=='INTER'){
        $st_cbk4='X';
     } 
     if($iii=='INTERNE'){
        $st_cbk5='X';
     } 

     $st_cbk6='';
     $st_cbk7='';
     $st_cbk8='';
     $st_cbk9='';

     if($but_forma=='INITIATION'){
        $st_cbk6='X';
     } 
     if($but_forma=='PERFECTIONNEMENT'){
        $st_cbk7='X';
     } 
     if($but_forma=='RECONVERSION'){
        $st_cbk8='X';
     } 
     if($but_forma=='AUTRES'){
        $st_cbk9='X';
     } 


     $output_benef='';
      
      $numb=1;
      $rq = pg_query($conn,"
                    SELECT email, genre, datenaiss, nationalite, fonction, categorie, anneeembauche, cnps
                    FROM public.beneficaire WHERE code='".$loadcode."' ORDER BY  email DESC
            ");

       while ($row = pg_fetch_row($rq)) {

            
             $rqext = pg_query($conn,"
                    SELECT \"NOM\",\"PRE\" FROM public.pos_tab_index_prs
                    WHERE \"MEL\"='".$row[0]."' ORDER BY  \"NOM\" DESC
            ");
                
            while ($rowext = pg_fetch_row($rqext)) {

$output_benef .=" <tr width='100%' >
                    <td  align='center'> ";
                         
                 $output_benef .=' <span> '.$rowext[0].' '.$rowext[1].'  </span> ';

                 $output_benef .="
                    </td >
                    <td  >
                        <span> ".$row[1]." </span>
                    </td >
                    <td   align='center'>
                        <span>".$row[2]." </span>
                    </td>
                    <td   align='center'>
                        <span> ".$row[3]." </span>
                    </td>
                    <td   align='center'>
                        <span> ".$row[4]." </span>
                    </td>
                    <td   align='center'>
                        <span> ".$row[5]."</span>
                    </td>
                    <td   align='center'>
                        <span>".$row[6]." </span>
                    </td>
                    <td   align='center'>
                        <span>".$row[7]." </span>
                    </td>
                </tr> 
             ";


            }
                 

 
/*$output_benef .=' <span> "'.$array_personnel[$i][1].' '.$array_personnel[$i][2].'"  </span> ';*/
                     
               
           
       }



     //echo $but_forma;
//exit;
   
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

$pdf->SetTitle('demandes de formation');

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

 
$out='';

$pdf->AddPage('L', 'A3');
//$pdf->AddPage('P', 'A4');

//BEGIN HEADER NO REPEAT ON PAGE
$image_file =K_PATH_IMAGES.'ngser.jpg';
        $pdf->Image($image_file, 10, 10, 40, '', 'JPG', '', 'T', false, 300, '', false, false, 0, false, false, false);
 $pdf->Ln(20);


 $html1 = '

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

<br/>

<h1 class="entete" align="center" > <u STYLE="font-family: Century Gothic; " style="font-size:15pt">  FICHE A <br/> DEMANDE D’AGREMENT </u></h1>
&nbsp;&nbsp;<br/>

<table border ="1" width= "100%" STYLE="font-family: Century Gothic; font-size:11pt; " >
    <tr width= "100%" >
        <td width= "70%" colspan="4">
        &nbsp;&nbsp;<br/>
            <span>ENTREPRISE : '.strtoupper($entreprise).' </span><br/>
        </td>
        <td width="30%" align="center"   colspan="2" >
        &nbsp;&nbsp;<br/>
            <span>BENEFICIAIRE DE LA FORMATION   </span><br/>
        </td>
    </tr>
    <tr width= "100%" >
        <td colspan="3" >
        &nbsp;&nbsp;<br/>
            <span>ANNEE DE PLAN : '.$annee.'   </span><br/>
        </td>
        <td   >
        &nbsp;&nbsp;<br/>
            <span>FICHE ETABLIE: '.$date_crea.'  </span><br/>
        </td>
        <td align="center">
        &nbsp;&nbsp;<br/>
            <span> CATEGORIE </span><br/>
        </td>
        <td  align="center" >
        &nbsp;&nbsp;<br/>
            <span> NOMBRE </span><br/>
        </td>
    </tr>
    <tr width= "100%" >
        <td  colspan="4" >
        &nbsp;&nbsp;<br/>
            <span>ACTION DE FORMATION N° : '.$act_formation.' </span><br/>
        </td>
        <td align="center">
        &nbsp;&nbsp;<br/>
            <span> CADRES </span><br/>
        </td>
        <td  align="center" >
        &nbsp;&nbsp;<br/>
            <span>'.$cadre.'</span><br/>
        </td>
    </tr>
    <tr width= "100%" >
        <td  width= "40%" >
        &nbsp;&nbsp;<br/>
            <span>INTITULE DE L’ACTION DE FORMATION : '.$intitule_forma.'  </span><br/>
        </td>
        <td align="center" width= "9%"  colspan="2">
        &nbsp;&nbsp;<br/>
            <span>INTER</span><br/>
            <table border ="1" width= "100%" align="center">
                <tr>
                    <td width= "100%" align="center">
                        <span>'.$st_cbk3.' </span>
                    </td>
                </tr>
            </table>
            <br/>
        </td>
        <td align="center" width= "9%"  colspan="2">
        &nbsp;&nbsp;<br/>
            <span>INTRA</span><br/>
            <table border ="1" width= "100%" align="center">
                <tr>
                    <td width= "100%" align="center">
                        <span>'.$st_cbk4.' </span>
                    </td>
                </tr>
            </table>
        </td>
        <td align="center" width= "12%"  colspan="2">
        &nbsp;&nbsp;<br/>
            <span>INTERNE</span><br/>
            <table border ="1" width= "100%" align="center">
                <tr>
                    <td width= "100%" align="center">
                        <span>'.$st_cbk5.' </span>
                    </td>
                </tr>
            </table>
        </td>
        <td align="center" width= "15%"  colspan="2">
        &nbsp;&nbsp;<br/>
            <span>AGENTS DE MAITRISE</span><br/>
        </td>
        <td align="center" width= "15%"  colspan="2">
        &nbsp;&nbsp;<br/>
            <span>'.$agent.'</span><br/>
        </td>  
    </tr>

    <tr width= "100%" >
        <td  width= "40%" >
        &nbsp;&nbsp;<br/>
            <span>STRUCTURE OU ETABLISSEMENT DE FORMATION : '.$structure_forma.'  </span><br/>
        </td>
        <td align="center" width= "15%"  colspan="2">
        &nbsp;&nbsp;<br/>
            <span>ETRANGER</span><br/>
            <table border ="1" width= "100%" align="center">
                <tr>
                    <td width= "100%" align="center">
                        <span>'.$st_cbk1.' </span>
                    </td>
                </tr>
            </table>
            <br/>
        </td>
        <td align="center" width= "15%"  colspan="1">
             &nbsp;&nbsp;<br/>
            <span>DIPLOMANT</span><br/>
            <table border ="1" width= "100%" align="center">
                <tr>
                    <td width= "100%" align="center">
                        <span> '.$st_cbk1.' </span>
                    </td>
                </tr>
            </table>
        </td>
        <td align="center" width= "15%"  colspan="2">
        &nbsp;&nbsp;<br/>
            <span>EMPLOYES/OUVRIERS</span><br/>
        </td>
        <td align="center" width= "15%"  colspan="2">
        &nbsp;&nbsp;<br/>
            <span>'.$ouvrier_emp.'</span><br/>
        </td>  
    </tr>

    <tr width= "100%" > 
        <td align="center" width= "18%" colspan="2"  >
        &nbsp;&nbsp;<br/>
            <span>PERIODE DE REALISATION</span>
            <br/><br/>
            DEBUT <span> '.$date_deb.'</span>
            FIN <span>'.$date_fin.'</span>
        </td>
        <td align="center" width= "10%"  >
        &nbsp;&nbsp;<br/>
            <span>LIEU DE FORMATION</span><br/>
             <span>'.$lieu_forma.'</span> 
        </td>   
        <td align="center" width= "12%"  >
            <span>NOMBRE DE GROUPES</span><br/>
            <span>'.$nbre_group.'</span>
               <br/>
            <span>NOMBRE D’HEURES PAR GROUPE </span><br/>
            <span>'.$hr_group.'</span> <br/>
            <span style="color:red"> (obligatoire) </span>
        </td>   
        <td align="center" width= "30%" colspan="2"  >
          &nbsp;&nbsp;<br/>
            <span style="font-weight:bold">COUT TOTAL</span><br/>
            <span style="font-weight:bold" > '.$cout.' FCFA </span> 
        </td>
        <td align="center" width= "15%"  colspan="2">
        &nbsp;&nbsp;<br/>
            <span>TOTAL</span><br/>
        </td>
        <td align="center" width= "15%"  colspan="2">
        &nbsp;&nbsp;<br/>
            <span>'.$total.'</span><br/>
        </td>   
    </tr>
    <tr width= "100%">
        <td width= "28%" align="center">
        &nbsp;&nbsp;<br/>
            <center><span>*** BUT DE LA FORMATION *** </span></center>
        </td>
        <td width= "72%" align="center">
        &nbsp;&nbsp;<br/>
                <center><span>*** OBJECTIFS PEDAGOGIQUES *** </span></center>
        </td>
    </tr>

    <tr width= "100%">
        <td width= "28%"  colspan="1">
        &nbsp;&nbsp;<br/>
            <span>Initialisation</span><br/>
            <table border ="1" width= "50%" align="center">
                <tr>
                    <td width= "100%" align="center">
                        <span>'.$st_cbk6.' </span>
                    </td>
                </tr>
            </table>
            &nbsp;&nbsp;<br/>
            <span>Perfectionnement</span><br/>
            <table border ="1" width= "50%">
                <tr>
                    <td width= "100%" align="center">
                        <span> '.$st_cbk7.' </span>
                    </td>
                </tr>
            </table>
            &nbsp;&nbsp;<br/>
            <span>Reconversion</span><br/>
            <table border ="1" width= "50%">
                <tr>
                    <td width= "100%" align="center">
                        <span>'.$st_cbk8.' </span>
                    </td>
                </tr>
            </table>
            &nbsp;&nbsp;<br/>
            <span>Autres(à préciser)</span><br/>
            <table border ="1" width= "50%">
                <tr>
                    <td width= "100%" align="center">
                        <span> '.$st_cbk9.'</span>
                    </td>
                </tr>
            </table>
            &nbsp;&nbsp;<br/>
        </td>

        <td width= "72%"  colspan="1">
        &nbsp;&nbsp;<br/>
            A l’issue de la formation, le (s) bénéficiaire (s) doit (vent) &#234;tre capable (s) de : <br/>
            <span>'.$autres.'</span>
        </td>
    </tr>

    <p>
        <table border="0" width="100%" STYLE="font-family: Century Gothic; font-size:11pt; " > 
            <tr>
                <td>  
                     Joindre les informations concernant le contenu de l’action de formation ainsi que les factures pro forma
                     <br/>
                     Fournir la liste des bénéficiaires au verso.

                </td>
            </tr>
        </table>
    </p> 

<br/>
';

    $out.=$html1;

  $html2 = '

<h1 class="entete" align="center" > <u STYLE="font-family: Century Gothic; " style="font-size:15pt">  LISTE DES BENEFICIAIRES DE LA FORMATION </u></h1>
&nbsp;&nbsp;<br/>

        <table border="1" align="center" width="100%" STYLE="font-family: Century Gothic; " style="font-size:11pt">
            <tr width="100%" align="center" >
                <td  align="center" >NOM ET PRENOMS</td>
                <td  align="center">GENRE</td>
                <td  align="center">ANNEE DE NAISSANCE</td>
                <td  align="center">NATIONALITE</td>
                <td  align="center">FONCTION</td>
                <td  align="center">CATEGORIE</td>
                <td  align="center">ANNEE D’EMBAUCHE</td>
                <td  align="center">MATRICULE CNPS</td>
            </tr>
                '.$output_benef.'
        </table>

        <br/>
        <br/>
        <br/>

        <table border="0" width="100%" STYLE="font-family: Century Gothic; " style="font-size:11pt">
            
            <tr>
                <td> 
                    <u><span style="font-size:10pt"> IMPORTANT: </span> </u> 
                    Les changements de bénéficiaires doivent obéir aux crit&#234;res suivants : profils ou activités similaires, besoins réels, formation adaptée au poste de travail. <br/>
                    Tout changement de bénéficiaire (s) non conforme fera l’objet d’un non paiement de l’action.
                    
                </td>
            </tr>
        </table>
        
</table>


<!-- END CONTENT -->
'; 

$out.=$html2;
$pdf->writeHTMLCell(0, 0, '', '',$out, 0, 1, 0, true, '', true);

$pdf->Output('demandeform.pdf', 'I');

//============================================================+
// END OF FILE
//============================================================+


      


?>