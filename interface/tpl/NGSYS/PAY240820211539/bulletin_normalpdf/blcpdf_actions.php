<?php
  
// Send Headers   
    session_start();    
    include ('../../../../../configuration_w/mabd.php');
    require('../../../../../configuration_w/tcpdf-master/tcpdf.php');

     $numposeidon= $_GET['numposeidon'] ;

      $email= $_GET['email'] ;

       $honoraire_net_paye=0;
       $bnc=0;
       $cr=0;
       $bnc1=0;
       $cr1=0;

        $som_bnc_cr=0;
        $som_bnc1_cr1=0;

        $som_bnc_cr_at_pf=0;

        $recharge=0;

        $total_hono_rch=0;
        $total_net_paie=0;
        $brut_hono=0;
        $brut_cr=0;

       $query_pay =pg_query("SELECT  \"DCR\",\"HNP\",\"RCH\"
   FROM public.pos_tab_index_pay WHERE  \"NUD\" ='".$numposeidon."'");

       $date_edition='';
        while ($row_pay = pg_fetch_row($query_pay)) {

             $date_edition=$row_pay[0]; //date creation
             $honoraire_net_paye= str_replace(',','.',number_format($row_pay[1]) ) ?? 0;

             $bnc= str_replace(',','.',number_format(($row_pay[1]*7.5)/100) ) ?? 0;
             $cr= str_replace(',','.',number_format(($row_pay[1]*6.3)/100) ) ?? 0;

             $brut_cr=str_replace(',','.',number_format((((int)$row_pay[1]*6.3)/100)*9)) ?? 0;

              $som_bnc_cr+= (((int)$row_pay[1]*7.5)/100+((int)$row_pay[1]*6.3/100)) ?? 0;
             

             $bnc1= str_replace(',','.',number_format(($row_pay[1]*7.5)/100) ) ?? 0;
             $cr1= str_replace(',','.',number_format(($row_pay[1]*7.7)/100) ) ?? 0;

             $som_bnc1_cr1+= (((int)$row_pay[1]*7.5)/100+((int)$row_pay[1]*7.7)/100) ?? 0;
             $recharge= str_replace(',','.',number_format($row_pay[2]) ) ?? 0 ;

             $total_hono_rch=str_replace(',','.',number_format($row_pay[2]+$row_pay[1]) ) ?? 0 ;

              $total_net_paie=str_replace(',','.',number_format($row_pay[2]+$row_pay[1]*92.5/100) ) ?? 0;

              $brut_hono=str_replace(',','.',number_format($row_pay[1]*9) ) ?? 0;
        }

        $at=str_replace(',','.',number_format((70000*3)/100) ) ?? 0;
        $pf=str_replace(',','.',number_format((70000*5.8)/100) ) ?? 0;

         $som_bnc_cr_at_pf+=(((int)$som_bnc1_cr1+(70000*3)/100)+(70000*5.8)/100) ?? 0;

         $dtp = explode("/", $date_edition);
         $p_mois=$dtp[1];
         $p_annee=$dtp[2];
    $dtperiode=$dtp[2].'-'.$dtp[1].'-'.$dtp[0] ;
   //  echo date("Y-m-t", strtotime($dtperiode));
        $get_day=date("t", strtotime($dtperiode));



      $date_embauche='';
      $cnps='';
      $query_cot_eb ="SELECT \"DSG\",\"CNP\"
            FROM public.pos_tab_index_cot WHERE  \"MEL\" ='".strtolower($email)."' ORDER BY   \"NUD\" ASC LIMIT 1 ";
      $contests_cot_eb = pg_query($query_cot_eb) or die('Query failed: ' . pg_last_error());

       while ($row_cot_eb = pg_fetch_row($contests_cot_eb)) {
            $date_embauche=strtoupper($row_cot_eb[0]) ;
            $cnps=$row_cot_eb[1] ;
            
        }

   

    $dtctn = explode("/", $date_contrat);
    $dtcontrat=$dtctn[2].'-'.$dtctn[1].'-'.$dtctn[0] ;

    $dtemb = explode("/", $date_embauche);
      $dtembauche=$dtemb[2].'-'.$dtemb[1].'-'.$dtemb[0] ;
          $date2 = (new DateTime())->format('Y-m-d');
 
         $diff = abs(strtotime($date2) - strtotime($dtembauche));
         $years = floor($diff/(365*60*60*24));
         
        $months_eb = floor(( $years * 365*60*60*24) / (30*60*60*24));


    $query_prs = "SELECT  \"NOM\", \"PRE\",\"MAT\",\"SIF\",\"NAT\"  FROM public.pos_tab_index_prs WHERE \"MEL\"='".strtolower($email)."'
               ";
    $contests_prs = pg_query($query_prs) or die('Query failed: ' . pg_last_error());
     
     $nom_complet='';
     $nom='';
     $prenom='';
     $matricule='';
     $sit_mat='';
     $nationalite='';
     $fonction='';

    while ($row_prs = pg_fetch_row($contests_prs)) {
        $nom=$row_prs[0];
        $prenom=$row_prs[1];
        $matricule=$row_prs[2];
        $sit_mat=$row_prs[3];
        $nationalite=ucfirst( strtolower($row_prs[4]));
    }
    $nom_complet=$nom.' '.$prenom;


     $query_fposte="
                SELECT
                     \"IPO\"
               FROM    
                   public.pos_tab_index_fpo
               WHERE \"MEL\"='".strtolower($email)."'
               ORDER BY \"NUD\" DESC LIMIT 1
               ";
     $contests_fposte = pg_query($query_fposte) or die('Query failed: ' . pg_last_error());
      $fpo_fonction='';
     while($rowfpos=pg_fetch_row($contests_fposte)){
        $fonction=$rowfpos[0];
      }
    

      $query_abs =" SELECT \"DCR\"FROM public.pos_tab_index_abs WHERE  ( \"AUN\" ='CONGE ANNUEL'  )   AND \"CRE\" ='".strtoupper($email)."' ORDER BY \"NUD\" DESC LIMIT 1 " ;
         $contests_abs = pg_query($query_abs) or die('Query failed: ' . pg_last_error());

            
            $date_derncge='';
             while ($row_abs = pg_fetch_row($contests_abs)) {
                 $date_derncge = $row_abs[0];
             }

      // echo $honoraire_net_paye ; 
     // exit;

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

$pdf->SetTitle('bulletin_consultant');

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
        <td width= "60%" colspan="2" >
            <span style="font-weight:bold">BULLETIN DE PAIE    </span>
        </td>
        <td width= "40%" >
            <span> Période de paie : 01/'.$p_mois.'/'.$p_annee.' au '.$get_day.'/'.$p_mois.'/'.$p_annee.' </span>
        </td>
    </tr>
    
    <tr width= "100%" >
        <td width= "40%" align="center">
            <span>Nouvelle Génération de Services</span><br/>
            <span>Plateau  Avenue Lamblin, 28 BP 722 Abidjan 28</span><br/>
            <span>Tel/fax +225 20 22 12 53   RC CI-ABJ 2008-B-043</span><br/>
            <span>CC 0909529Q</span>
        </td>
        <td width= "20%">
            <span>

            </span><br/>
        </td>
        <td width= "40%">
            <span>Date d’Edition   : '.$date_edition.'</span><br/>
            <span>&#160;&#160;Ancienneté</span><br/>
            <span>&#160;&#160;Mois: '.$months_eb.'</span><br/>
        </td>
    </tr>
    <tr width= "100%" align="center" >
        <td  width= "100%">
            <span> <b>'.$nom_complet.'</b></span>
        </td>
    </tr>
    <tr width= "100%" >
        <td  width= "100%">
        &nbsp;&nbsp;<br/>
            <span>N° Matricule : '.$matricule.' &#160;   &#160; &#160;   &#160; &#160;   &#160; &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; &#160;&#160;&#160;&#160; Situation Matrimoniale: '.$sit_mat.'</span> <br/>
        &nbsp;&nbsp;<br/>
            <span>Date d’embauche : '.$date_embauche.' &#160;   &#160; &#160;   &#160; &#160;   &#160; &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;Fonction: '.strtoupper($fonction).'</span> <br/>
        &nbsp;&nbsp;<br/>
            <span>N° CNPS : '. $cnps.' &#160;   &#160; &#160;   &#160; &#160;   &#160; &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;Nationalité: '.$nationalite.'</span> <br/>
        &nbsp;&nbsp;<br/>
            <span>Date dernier Congé    : '.$date_derncge.' &#160;   &#160; &#160;   &#160; &#160;   &#160; &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; &#160;&#160;&#160;&#160; 
            </span> <br/>
        </td>
    </tr>
    <tr width= "100%" align="center" >
        <td  width= "12%">
        &nbsp;&nbsp;<br/>
            <span>CODE</span><br/>
        </td>
        <td  width= "28%">
        &nbsp;&nbsp;<br/>
            <span>LIBELLE RUBRIQUE</span><br/>
        </td>
        <td  width= "12%">
        &nbsp;&nbsp;<br/>
            <span>Taux/Nbre</span><br/>
        </td>
        <td  width= "12%">
        &nbsp;&nbsp;<br/>
            <span>BASES</span><br/>
        </td>
        <td  width= "12%">
        &nbsp;&nbsp;<br/>
            <span>GAINS</span><br/>
        </td>
        <td  width= "12%">
        &nbsp;&nbsp;<br/>
            <span>EMPLOYE</span><br/>
        </td>
        <td  width= "12%">
        &nbsp;&nbsp;<br/>
            <span>EMPLOYEUR</span><br/>
        </td>
    </tr>
    <tr width= "100%" align="center" >
        <td  width= "12%">
        &nbsp;&nbsp;<br/>
            <span>HON</span><br/>
        </td>
        <td  width= "28%">
        &nbsp;&nbsp;<br/>
            <span>Honoraire</span><br/>
        </td>
        <td  width= "12%">
        &nbsp;&nbsp;<br/>
            <span>30 jours</span><br/>
        </td>
        <td  width= "12%">
        &nbsp;&nbsp;<br/>
            <span>'.$honoraire_net_paye.'</span><br/>
        </td>
        <td  width= "12%">
        &nbsp;&nbsp;<br/>
            <span>'.$honoraire_net_paye.'</span><br/>
        </td>
        <td  width= "12%">
        &nbsp;&nbsp;<br/>
            <span></span><br/>
        </td>
        <td  width= "12%">
        &nbsp;&nbsp;<br/>
            <span></span><br/>
        </td>
    </tr>
    <tr width= "100%" align="center" >
        <td  width= "12%">
        &nbsp;&nbsp;<br/>
            <span></span><br/>
        </td>
        <td  width= "28%">
        &nbsp;&nbsp;<br/>
            <span>Total Autres Avantage (II)</span><br/>
        </td>
        <td  width= "12%">
        &nbsp;&nbsp;<br/>
            <span></span><br/>
        </td>
        <td  width= "12%">
        &nbsp;&nbsp;<br/>
            <span></span><br/>
        </td>
        <td  width= "12%">
        &nbsp;&nbsp;<br/>
            <span></span><br/>
        </td>
        <td  width= "12%">
        &nbsp;&nbsp;<br/>
            <span></span><br/>
        </td>
        <td  width= "12%">
        &nbsp;&nbsp;<br/>
            <span></span><br/>
        </td>
    </tr>
    <tr width= "100%" align="center" >
        <td  width= "12%">
        &nbsp;&nbsp;<br/>
            <span></span><br/>
        </td>
        <td  width= "28%">
        &nbsp;&nbsp;<br/>
            <span>TOTAL BASE IMPOSABLE  (II)</span><br/>
        </td>
        <td  width= "60%">
        &nbsp;&nbsp;<br/>
            <span>'.$honoraire_net_paye.'</span><br/>
        </td>
    </tr>
    <tr width= "100%" align="center" >
        <td  width= "12%">
        &nbsp;&nbsp;<br/>
            <span>BNC</span><br/>
        </td>
        <td  width= "28%">
        &nbsp;&nbsp;<br/>
            <span>Impôt sur Salaire</span><br/>
        </td>
        <td  width= "12%">
        &nbsp;&nbsp;<br/>
            <span>7,5%</span><br/>
        </td>
        <td  width= "12%">
        &nbsp;&nbsp;<br/>
            <span>'.$honoraire_net_paye.'</span><br/>
        </td>
        <td  width= "12%">
        &nbsp;&nbsp;<br/>
            <span></span><br/>
        </td>
        <td  width= "12%">
        &nbsp;&nbsp;<br/>
            <span>'.$bnc.'</span><br/>
        </td>
        <td  width= "12%">
        &nbsp;&nbsp;<br/>
            <span>'.$bnc1.'</span><br/>
        </td>
    </tr>
    <tr width= "100%" align="center" >
        <td  width= "12%">
        &nbsp;&nbsp;<br/>
            <span>CR</span><br/>
        </td>
        <td  width= "28%">
        &nbsp;&nbsp;<br/>
            <span>Caisse de Retraite</span><br/>
        </td>
        <td  width= "12%">
        &nbsp;&nbsp;<br/>
            <span>6,3%</span><br/>
        </td>
        <td  width= "12%">
        &nbsp;&nbsp;<br/>
            <span>'.$honoraire_net_paye.'</span><br/>
        </td>
        <td  width= "12%">
        &nbsp;&nbsp;<br/>
            <span></span><br/>
        </td>
        <td  width= "12%">
        &nbsp;&nbsp;<br/>
            <span>'.$cr.'</span><br/>
        </td>
        <td  width= "12%">
        &nbsp;&nbsp;<br/>
            <span>'.$cr1.'</span><br/>
        </td>
    </tr>
    <tr width= "100%" align="center" >
        <td  width= "12%">
        &nbsp;&nbsp;<br/>
            <span>AT</span><br/>
        </td>
        <td  width= "28%">
        &nbsp;&nbsp;<br/>
            <span>Accident de travail</span><br/>
        </td>
        <td  width= "12%">
        &nbsp;&nbsp;<br/>
            <span>3%</span><br/>
        </td>
        <td  width= "12%">
        &nbsp;&nbsp;<br/>
            <span>70.000</span><br/>
        </td>
        <td  width= "12%">
        &nbsp;&nbsp;<br/>
            <span></span><br/>
        </td>
        <td  width= "12%">
        &nbsp;&nbsp;<br/>
            <span></span><br/>
        </td>
        <td  width= "12%">
        &nbsp;&nbsp;<br/>
            <span>'.$at.'</span><br/>
        </td>
    </tr>
    <tr width= "100%" align="center" >
        <td  width= "12%">
        &nbsp;&nbsp;<br/>
            <span>PF</span><br/>
        </td>
        <td  width= "28%">
        &nbsp;&nbsp;<br/>
            <span>Prestation Familliale</span><br/>
        </td>
        <td  width= "12%">
        &nbsp;&nbsp;<br/>
            <span>5,8%</span><br/>
        </td>
        <td  width= "12%">
        &nbsp;&nbsp;<br/>
            <span>70.000</span><br/>
        </td>
        <td  width= "12%">
        &nbsp;&nbsp;<br/>
            <span></span><br/>
        </td>
        <td  width= "12%">
        &nbsp;&nbsp;<br/>
            <span></span><br/>
        </td>
        <td  width= "12%">
        &nbsp;&nbsp;<br/>
            <span>'.$pf.'</span><br/>
        </td>
    </tr>
    <tr width= "100%" align="center" >
        <td  width= "76%">
        &nbsp;&nbsp;<br/>
            <span>TOTAL RETENUES FISCALES  ET SOCIALES</span><br/>
        </td>
        <td  width= "12%">
        &nbsp;&nbsp;<br/>
            <span>'.str_replace(',','.',number_format($som_bnc_cr)).'</span><br/>
        </td>
        <td  width= "12%">
        &nbsp;&nbsp;<br/> 
            <span>'.str_replace(',','.',number_format($som_bnc_cr_at_pf)).'</span><br/>
        </td>
    </tr>
    <tr width= "100%" align="center" >
        <td  width= "12%">
        &nbsp;&nbsp;<br/>
            <span>FCOM</span><br/>
        </td>
        <td  width= "28%">
        &nbsp;&nbsp;<br/>
            <span>Frais de communication</span><br/>
        </td>
        <td  width= "12%">
        &nbsp;&nbsp;<br/>
            <span></span><br/>
        </td>
        <td  width= "12%">
        &nbsp;&nbsp;<br/>
            <span></span><br/>
        </td>
        <td  width= "12%">
        &nbsp;&nbsp;<br/>
            <span>'.$recharge.'</span><br/>
        </td>
        <td  width= "12%">
        &nbsp;&nbsp;<br/>
            <span></span><br/>
        </td>
        <td  width= "12%">
        &nbsp;&nbsp;<br/>
            <span></span><br/>
        </td>
    </tr>
    <tr width= "100%" align="center" >
        <td  width= "12%">
        &nbsp;&nbsp;<br/>
            <span>TAG</span><br/>
        </td>
        <td  width= "28%">
        &nbsp;&nbsp;<br/>
            <span>Total Autres Gains</span><br/>
        </td>
        <td  width= "12%">
        &nbsp;&nbsp;<br/>
            <span></span><br/>
        </td>
        <td  width= "12%">
        &nbsp;&nbsp;<br/>
            <span></span><br/>
        </td>
        <td  width= "12%">
        &nbsp;&nbsp;<br/>
            <span>'.$recharge.'</span><br/>
        </td>
        <td  width= "12%">
        &nbsp;&nbsp;<br/>
            <span></span><br/>
        </td>
        <td  width= "12%">
        &nbsp;&nbsp;<br/>
            <span></span><br/>
        </td>
    </tr>
    <tr width= "100%" align="center" >
        <td  width= "64%">
        &nbsp;&nbsp;<br/>
            <span>TOTAUX</span><br/>
        </td>
        <td  width= "36%">
        &nbsp;&nbsp;<br/>
            <span>'.$total_hono_rch.'</span><br/>
        </td>
    </tr>
    <tr width= "100%" align="center" >
        <td  width= "76%">
        &nbsp;&nbsp;<br/>
            <span>NET A PAYER </span><br/>
        </td>
        <td  width= "24%">
        &nbsp;&nbsp;<br/>
            <span>'.$total_net_paie.'</span><br/>
        </td>
    </tr>
    <tr width= "100%" align="center" >
        <td  width= "12%" rowspan="5">
        &nbsp;&nbsp;<br/>
            <span>Cumul Annuel</span><br/>
        </td>
        <td  width= "12%">
        &nbsp;&nbsp;<br/>
            <span>Sal Brut</span><br/>
        </td>
        <td  width= "14%">
        &nbsp;&nbsp;<br/>
            <span></span><br/>
        </td>
        <td  width= "62%">
        &nbsp;&nbsp;<br/>
            <span></span><br/>
        </td>
    </tr>
    <tr width= "100%" align="center" >
        <td  width= "12%">
        &nbsp;&nbsp;<br/>
            <span>'.$brut_hono.'</span><br/>
        </td>
        <td  width= "14%">
        &nbsp;&nbsp;<br/>
            <span></span><br/>
        </td>
        <td  width= "62%" rowspan="2">
        &nbsp;&nbsp;<br/>
            <span></span><br/>
        </td>
    </tr>
    <tr width= "100%" align="center" >
        <td  width= "12%">
        &nbsp;&nbsp;<br/>
            <span></span><br/>
        </td>
        <td  width= "14%">
        &nbsp;&nbsp;<br/>
            <span></span><br/>
        </td>
    </tr>
    <tr width= "100%" align="center" >
        <td  width= "12%">
        &nbsp;&nbsp;<br/>
            <span></span><br/>
        </td>
        <td  width= "14%">
        &nbsp;&nbsp;<br/>
            <span></span><br/>
        </td>
        <td  width= "31%" rowspan="2">
        &nbsp;&nbsp;<br/>
            <span>Mode de règlement </span><br/>
        </td>
        <td  width= "31%" rowspan="2">
        &nbsp;&nbsp;<br/>
            <span>Virement bancaire</span><br/>
        </td>
    </tr>
    <tr width= "100%" align="center" >
        <td  width= "12%">
        &nbsp;&nbsp;<br/>
            <span>CR</span><br/>
        </td>
        <td  width= "14%">
        &nbsp;&nbsp;<br/>
            <span>'.$brut_cr.'</span><br/>
        </td>
    </tr>

</table>


<!-- END CONTENT -->
'; 
$pdf->writeHTMLCell(0, 0, '', '',$html2, 0, 1, 0, true, '', true);

$pdf->Output('bulletin_consultant.pdf', 'I');

//============================================================+
// END OF FILE
//============================================================+


      


?>