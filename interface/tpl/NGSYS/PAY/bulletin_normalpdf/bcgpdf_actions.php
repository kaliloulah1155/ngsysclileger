<?php
         
// Send Headers   
    session_start();    
    include ('../../../../../configuration_w/mabd.php');
    require('../../../../../configuration_w/tcpdf-master/tcpdf.php');

     $numposeidon= $_GET['numposeidon'] ;
     $email= $_GET['email'] ;
   

   $query_prs = "SELECT  \"NOM\", \"PRE\",\"MAT\",\"SIF\",\"NAT\",\"CIV\"  FROM public.pos_tab_index_prs WHERE \"MEL\"='".strtolower($email)."'
               ";
    $contests_prs = pg_query($query_prs) or die('Query failed: ' . pg_last_error());
     
     $nom_complet='';
     $nom='';
     $prenom='';
     $matricule='';
     $sit_mat='';
     $nationalite='';
     $fonction='';
     $civ='';
     while ($row_prs = pg_fetch_row($contests_prs)) {
        $nom=$row_prs[0];
        $prenom=$row_prs[1];
        $matricule=$row_prs[2];
        $sit_mat=$row_prs[3];
        $nationalite=ucfirst( strtolower($row_prs[4]));
        $civilite=$row_prs[5];
    }
    $nom_complet=$nom.' '.$prenom;
    $civilite=='M'? $civ='M.':$civ=$civilite;


      $query_pay =pg_query("SELECT  \"DCR\",\"PRT\",\"SAB\",\"SRA\",\"ATR\",\"DUR\",\"ACI\",\"RDT\",\"RET\",\"AT2\",\"FAM\",\"TFP\",\"TA\",\"IS\",\"CNV\",\"IGR\",\"ASN\",\"PTE\",\"TRS\",\"SAL\",\"SLB\",\"SLN\",\"PF\"
   FROM public.pos_tab_index_pay WHERE  \"NUD\" ='".$numposeidon."'");

       $date_edition='';
       $part=0;
       $salaire_base=0;
       $sursalaire=0;
       $astreinte=0;
       $anciennete=0;
       $duree=0;
       $rendement=0;
       $retraite=0;
       $at=0; 
       $fam=0; //rubrique FAM  chez salarie et PF chez consultant
       $pf=0;
       $tfp=0;
       $ta=0;
       $is=0;
       $cn=0;
       $igr=0;
       $tot_cot=0;
       $assurance=0;
       $pret=0;
       $transport=0;
       $net_a_paye=0;
       $cum_brute=0;
       $cum_net_impo=0;

       $total_brute=0;
        while ($row_pay = pg_fetch_row($query_pay)) {

             $date_edition=$row_pay[0]; //date creation
             $part=$row_pay[1]; //part
             $salaire_base=str_replace(',','.',number_format($row_pay[2]) ) ?? 0; //salaire base
             $sursalaire=str_replace(',','.',number_format($row_pay[3]) ) ?? 0; //sursalaire
             $astreinte=str_replace(',','.',number_format($row_pay[4]) ) ?? 0; //sursalaire
             $duree=str_replace(',','.',number_format($row_pay[5]) ) ?? 0; //sursalaire
             $anciennete=str_replace(',','.',number_format($row_pay[6]) ) ?? 0; //sursalaire
             $rendement=str_replace(',','.',number_format($row_pay[7]) ) ?? 0;

             $retraite=str_replace(',','.',number_format($row_pay[8]) ) ?? 0;
             $at=str_replace(',','.',number_format($row_pay[9]) ) ?? 0;
             $fam=str_replace(',','.',number_format($row_pay[10]) ) ?? 0;
             $tfp=str_replace(',','.',number_format($row_pay[11]) ) ?? 0;
             $ta=str_replace(',','.',number_format($row_pay[12]) ) ?? 0;
             $is=str_replace(',','.',number_format($row_pay[13]) ) ?? 0;
             $cn=str_replace(',','.',number_format($row_pay[14]) ) ?? 0;
             $igr=str_replace(',','.',number_format($row_pay[15]) ) ?? 0;

             $assurance=str_replace(',','.',number_format($row_pay[16]) ) ?? 0;
             $pret=str_replace(',','.',number_format($row_pay[17]) ) ?? 0;
             $transport=str_replace(',','.',number_format($row_pay[18]) ) ?? 0;
             $net_a_paye=str_replace(',','.',number_format($row_pay[19]) ) ?? 0;
             $cum_brute=str_replace(',','.',number_format($row_pay[20]) ) ?? 0;
             $cum_net_impo=str_replace(',','.',number_format($row_pay[21]) ) ?? 0;
             $pf=str_replace(',','.',number_format($row_pay[22]) ) ?? 0;

             $total_brute+=((int)$row_pay[3]+(int)$row_pay[4]+(int)$row_pay[6]+(int)$row_pay[7]);

             $tot_cot+=((int)$row_pay[8]+(int)$row_pay[9]+(int)$row_pay[22]+(int)$row_pay[11]+(int)$row_pay[12]+(int)$row_pay[13]   );

        }

         $dtp = explode("/", $date_edition);
         $p_mois=$dtp[1];
         $p_annee=$dtp[2];
    $dtperiode=$dtp[2].'-'.$dtp[1].'-'.$dtp[0] ;
   //  echo date("Y-m-t", strtotime($dtperiode));
        $get_day=date("t", strtotime($dtperiode));

         $date_embauche='';
         $cnps='';
         $categorie='';
       
      $query_cot_eb ="SELECT \"DSG\",\"CNP\",\"CAE\"  
            FROM public.pos_tab_index_cot WHERE  \"MEL\" ='".strtolower($email)."' ORDER BY   \"NUD\" ASC LIMIT 1 ";
      $contests_cot_eb = pg_query($query_cot_eb) or die('Query failed: ' . pg_last_error());

       while ($row_cot_eb = pg_fetch_row($contests_cot_eb)) {
            $date_embauche=strtoupper($row_cot_eb[0]) ;
            $cnps=$row_cot_eb[1] ;
            $categorie=$row_cot_eb[2] ;
        }
 

    $dtemb = explode("/", $date_embauche);
      $dtembauche=$dtemb[2].'-'.$dtemb[1].'-'.$dtemb[0] ;
          $date2 = (new DateTime())->format('Y-m-d');
 
         $diff = abs(strtotime($date2) - strtotime($dtembauche));
         $years = floor($diff/(365*60*60*24));

         $yea=(int)$years+1;


         $query_fposte="
                SELECT
                     \"IPO\"
               FROM    
                   public.pos_tab_index_fpo
               WHERE \"MEL\"='".strtolower($email)."'
               ORDER BY \"NUD\" DESC LIMIT 1
               ";
     $contests_fposte = pg_query($query_fposte) or die('Query failed: ' . pg_last_error());
      $fonction='';
     while($rowfpos=pg_fetch_row($contests_fposte)){
        $fonction=$rowfpos[0];
      }
      $departement='';
      $query_dpt="
        SELECT dpt.\"LIB\" 
        FROM public.pos_tab_index_pos postab
        INNER JOIN public.pos_tab_index_dpt dpt
        ON  dpt.\"LIB\"=postab.\"DPT\" 
        WHERE postab.\"IPO\"='".strtoupper($fonction)."'
       ORDER BY postab.\"NUD\" DESC LIMIT 1
           ";       
       $contests_dpt = pg_query($query_dpt) or die('Query failed: ' . pg_last_error());
       while($rowdpt=pg_fetch_row($contests_dpt)){
            $departement= strtoupper($rowdpt[0]);
       }

     

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

$pdf->SetTitle('bulletin_normal');

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

<table border ="1" width= "100%" STYLE="font-family: Century Gothic; font-size:7.9pt; ">
    <tr width= "100%" >
        <td width= "26%" align="center"  bgcolor="#b0f2b6" >
            <span style="font-weight:bold">BULLETIN DE PAIE    </span>
        </td>
        <td width= "37%" colspan="4">
            <span>Période du : 01/'.$p_mois.'/'.$p_annee.' au '.$get_day.'/'.$p_mois.'/'.$p_annee.'  </span>
        </td>
        <td width= "37%" colspan="2">
            <span>Paiement le : '.$get_day.'/'.$p_mois.'/'.$p_annee.' par : Virement  </span>
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
            <span>APE/NAF : </span><span> </span>
        </td>
        <td width= "10%">
            <span>Matricule</span><br/>
            <span>'.$matricule.'</span>
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
            <span> '.$yea.' an(s) et 0 mois </span>
        </td>
        <td width= "17%">
            <span>N°de Sécurité Sociale</span><br/>
            <span> '.$cnps.' / </span>
        </td>
    </tr>
    <tr width= "100%" align="center" >
        <td  width= "25%"   colspan="3">
            <span>Catégorie</span><br/>
            <span>'.$categorie.'</span>
        </td>
        <td  width= "24%"   colspan="3">
            <span>Emploi occupé</span><br/>
            <span> '.strtoupper($fonction).' </span>
        </td>
        <td width= "25%"   colspan="2">
            <span>Département</span><br/>
            <span>DEPARTEMENT '.strtoupper($departement).'</span>
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
                '.ucfirst( strtolower($civ)).' '.strtoupper($nom_complet).'    
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

            <span>'.$part.',00 </span>
        </td>
        <td  width= "10%" >
            <span>0,00</span>
        </td>
        <td width= "5%" align="center" >
              <span></span>
        </td>
        <td width= "9%" align="center" >
              <span>0</span>
        </td>
        <td width= "9%" align="center" >
              <span></span>
        </td>
        <td width= "5%" align="center" >
              <span></span>  
        </td>
        <td width= "11%" align="center" >
              <span></span>
        </td>
        <td width= "11%" align="center" >
              <span></span>
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
            <span>0,00</span>
        </td>
        <td  width= "10%" >
            <span>'.$salaire_base.'</span>
        </td>
        <td width= "5%" align="center" >
              <span>...</span>
        </td>
        <td width= "9%" align="center" >
              <span>0</span>
        </td>
        <td width= "9%" align="center" >
              <span>...</span>
        </td>
        <td width= "5%" align="center" >
              <span>...</span>
        </td>
        <td width= "11%" align="center" >
              <span>...</span>
        </td>
        <td width= "11%" align="center" >
              <span>...</span>
        </td>
    </tr>
     <tr width= "100%"   >
        <td width= "5%">
            11
        </td> 
        <td width= "25%" >
            <span> Transport imposable  </span>
        </td> 
        <td width= "10%">
           <span>30,00</span>
        </td>
        <td  width= "10%" >
           <span>0,00</span>
        </td>
        <td width= "5%" align="center" >
<span>...</span>
        </td>
        <td width= "9%" align="center" >
              <span>0</span>
        </td>
        <td width= "9%" align="center" >
              <span>...</span>
        </td>
        <td width= "5%" align="center" >
              <span>...</span>
        </td>
        <td width= "11%" align="center" >
              <span>...</span>
        </td>
        <td width= "11%" align="center" >
              <span>...</span>
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
            <span> 0,00 </span>
        </td>
        <td  width= "10%" >
            <span>0,00</span>
        </td>
        <td width= "5%" align="center" >
              <span>...</span>
        </td>
        <td width= "9%" align="center" >
              <span>'.$sursalaire.'</span>
        </td>
        <td width= "9%" align="center" >
              <span>...</span>
        </td>
        <td width= "5%" align="center" >
              <span>...</span>
        </td>
        <td width= "11%" align="center" >
              <span>...</span>
        </td>
        <td width= "11%" align="center" >
              <span>...</span>
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
            <span>0,00</span>
        </td>
        <td  width= "10%" >
            <span>0,00</span>
        </td>
        <td width= "5%" align="center" >
              <span>...</span>
        </td>
        <td width= "9%" align="center" >
              <span>'.$astreinte.'</span>
        </td>
        <td width= "9%" align="center" >
              <span>...</span>
        </td>
        <td width= "5%" align="center" >
              <span>...</span>
        </td>
        <td width= "11%" align="center" >
              <span>...</span>
        </td>
        <td width= "11%" align="center" >
              <span>...</span>
        </td>
    </tr>
   
    <tr width= "100%"   >
        <td width= "5%">
            105
        </td> 
        <td width= "25%" >
            <span>Gratification  </span>
        </td> 
        <td width= "10%">
            <span>30,00</span>
        </td>
        <td  width= "10%" >
            <span>0,00</span>
        </td>
        <td width= "5%" align="center" >
              <span>...</span>
        </td>
        <td width= "9%" align="center" >
              <span>'.$rendement.'</span>
        </td>
        <td width= "9%" align="center" >
              <span>...</span>
        </td>
        <td width= "5%" align="center" >
              <span>...</span>
        </td>
        <td width= "11%" align="center" >
              <span>...</span>
        </td>
        <td width= "11%" align="center" >
              <span>...</span>
        </td>
    </tr>
    <tr width= "100%"   >
        <td width= "5%"> 
        </td> 
        <td width= "25%" >
            <span> Total Brut </span>
        </td> 
        <td width= "10%">
            <span></span>
        </td>
        <td  width= "10%" >
            <span></span>
        </td>
        <td width= "5%" align="center" >
              <span></span>
        </td>
        <td width= "9%" align="center" >
              <span>'.str_replace(',','.',number_format($total_brute)).'</span>
        </td>
        <td width= "9%" align="center" >
              <span></span>
        </td>
        <td width= "5%" align="center" >
              <span></span>
        </td>
        <td width= "11%" align="center" >
              <span></span>
        </td>
        <td width= "11%" align="center" >
              <span></span>
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
            <span>...</span>
        </td>
        <td  width= "10%" >
<span>0,00</span>
        </td>
        <td width= "5%" align="center" >
<span>6,30</span>
        </td>
        <td width= "9%" align="center" >
              <span>...</span>
        </td>
        <td width= "9%" align="center" >
              <span>0</span>
        </td>
        <td width= "5%" align="center" >
<span>7,70</span>
        </td>
        <td width= "11%" align="center" >
              <span>...</span>
        </td>
        <td width= "11%" align="center" >
              <span>'.$retraite.'</span>
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
            <span>...</span>
        </td>
        <td  width= "10%" >
            <span>70000,00</span>
        </td>
        <td width= "5%" align="center" >
<span>0,00</span>
        </td>
        <td width= "9%" align="center" >
              <span>...</span>
        </td>
        <td width= "9%" align="center" >
              <span>0</span>
        </td>
        <td width= "5%" align="center" >
<span>3,00</span>
        </td>
        <td width= "11%" align="center" >
              <span>...</span>
        </td>
        <td width= "11%" align="center" >
              <span>'.$at.'</span>
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
            <span>...</span>
        </td>
        <td  width= "10%" >
            <span>70000,00</span>
        </td>
        <td width= "5%" align="center" >
<span>0,00</span>
        </td>
        <td width= "9%" align="center" >
              <span>...</span>
        </td>
        <td width= "9%" align="center" >
              <span>0</span>
        </td>
        <td width= "5%" align="center" >
<span>5,75</span>
        </td>
        <td width= "11%" align="center" >
              <span>...</span>
        </td>
        <td width= "11%" align="center" >
              <span>'.$pf.'</span>
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
            <span>...</span>
        </td>
        <td  width= "10%" >
   <span>0,00</span>
        </td>
        <td width= "5%" align="center" >
<span>0,00</span>
        </td>
        <td width= "9%" align="center" >
              <span>...</span>
        </td>
        <td width= "9%" align="center" >
              <span>0</span>
        </td>
        <td width= "5%" align="center" >
<span>0,60</span>
        </td>
        <td width= "11%" align="center" >
              <span>...</span>
        </td>
        <td width= "11%" align="center" >
              <span>'.$tfp.'</span>
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
            <span>...</span>
        </td>
        <td  width= "10%" >
            <span>0,00</span>
        </td>
        <td width= "5%" align="center" >
<span>0,00</span>
        </td>
        <td width= "9%" align="center" >
              <span>...</span>
        </td>
        <td width= "9%" align="center" >
              <span>0</span>
        </td>
        <td width= "5%" align="center" >
<span>0,40</span>
        </td>
        <td width= "11%" align="center" >
              <span>...</span>
        </td>
        <td width= "11%" align="center" >
              <span>'.$ta.'</span>
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
            <span>0,00</span>
        </td>
        <td width= "5%" align="center" >
<span>1,20</span>
        </td>
        <td width= "9%" align="center" >
              <span>...</span>
        </td>
        <td width= "9%" align="center" >
              <span>0</span>
        </td>
        <td width= "5%" align="center" >
<span>1,20</span>
        </td>
        <td width= "11%" align="center" >
              <span>...</span>
        </td>
        <td width= "11%" align="center" >
              <span>'.$is.'</span>
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
            <span>...</span>
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
              <span>'.$cn.'</span>
        </td>
        <td width= "5%" align="center" >
              <span>...</span>
        </td>
        <td width= "11%" align="center" >
              <span>...</span>
        </td>
        <td width= "11%" align="center" >
              <span>0</span>
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
              <span>'.$igr.'</span>
        </td>
        <td width= "5%" align="center" >
              <span>...</span>
        </td>
        <td width= "11%" align="center" >
              <span>...</span>
        </td>
        <td width= "11%" align="center" >
              <span>0</span>
        </td>
    </tr>
    <tr width= "100%"   >
        <td width= "5%"> 
        </td> 
        <td width= "25%" >
            <span> Total Cotisations  </span>
        </td> 
        <td width= "10%">
            <span></span>
        </td>
        <td  width= "10%" >
            <span></span>
        </td>
        <td width= "5%" align="center" >
              <span></span>
        </td>
        <td width= "9%" align="center" >
              <span>0</span>
        </td>
        <td width= "9%" align="center" >
              <span></span>
        </td>
        <td width= "5%" align="center" >
              <span></span>
        </td>
        <td width= "11%" align="center" >
              <span>   </span>
        </td>
        <td width= "11%" align="center" >
              <span>'.str_replace(',','.',number_format($tot_cot)).'</span>
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
              <span>'.$transport.'</span>
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
Période<br/>Année
        </td> 
        <td width= "11%" align="center">
            '.$cum_brute.'<br/>
            '.$cum_brute.'
        </td> 
        <td width= "11%" align="center">
            '.$cum_net_impo.'<br/>
            '.$cum_net_impo.'
        </td>
        <td width= "11%" align="center"  >
        0<br/>
           0
        </td>
        <td width= "11%" align="center" >
            '.str_replace(',','.',number_format($tot_cot)).'<br/>
            '.str_replace(',','.',number_format($tot_cot)).'
        </td>
        <td width= "11%" align="center" >
            173<br/>
            173
        </td>
        <td width= "11%" align="center" >
            0<br/>
            0
        </td>
        <td width= "11%" align="center" >
            0<br/>
            0
        </td>
        <td width= "15%" align="center" bgcolor="#b0f2b6" style="font-weight:bold" >
           '.$net_a_paye.'
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

$pdf->Output('bulletin_normal.pdf', 'I');

//============================================================+
// END OF FILE
//============================================================+


      


?>