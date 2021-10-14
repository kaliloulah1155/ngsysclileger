<?php

// Send Headers

        
    include ('../../../../../configuration_w/mabd.php');
    require('../../../../../configuration_w/tcpdf-master/tcpdf.php');
 

 
     $numposeidon= $_GET['numposeidon'] ;


     $loadcode=$_GET['loadcode'];
       
// Extend the TCPDF class to create custom Header and Footer

    $numpage='';
class PDF extends TCPDF {

    //Page header

    public function isPage(){
         $numpage=$this->getAliasNbPages();
         return $numpage;
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


    $client = new PDF;

    //echo $client->isPage();


    // create new PDF document
$pdf = new PDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);

// set document information
$pdf->SetCreator('IBSON');

$pdf->SetTitle('poste');

//supprime les lignes au dessus
$pdf->setPrintHeader(false);


$pdf->setPrintFooter(true);
 
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

/////////////////////////TRAITEMENT DES DONNEES /////////////////////////////////

     $intitule_poste='';
     $departement_poste='';
     $service_poste='';
     $hierop_poste='';
     $hierfonc_poste='';
     $date_etab='';

     $diplome1='';
     $diplome2='';
     $specialite1='';
     $specialite2='';
     $experience1='';
     $experience2='';
     $exigence1='';
     $exigence2='';

     $cbk1='';
     $cbk2='';
     $cbk3='';
     $cbk4='';
     $cbk5='';
     $cbk6='';
     $cbk7='';
     $cbk8='';
     $cbk9='';
     $cbk10='';
     $cbk11='';
     $cbk12='';


     $query_poste="
                SELECT
                     \"IPO\",\"DPT\",\"SER\",\"HIO\",\"HIF\",\"DCR\",
                     \"DP1\",\"DP2\",\"SPE\",\"SP1\",\"EX1\",\"EX2\",
                     \"EXG\",\"EGC\",
                     \"E1\",\"E2\",\"E3\",\"E4\",
                     \"EX3\",\"EX4\",\"EX5\",\"EX6\",
                     \"FC1\",\"FC2\",\"FC3\",\"FC4\"
               FROM 
                   public.pos_tab_index_pos
               WHERE \"COD\"='".$loadcode."'
               ";

     $contests_poste= pg_query($query_poste) or die('Query failed: ' . pg_last_error());
     while ($row_poste = pg_fetch_row($contests_poste)) {
    
          $intitule_poste= $row_poste[0];
          $departement_poste= $row_poste[1];
          $service_poste= $row_poste[2];
          $hierop_poste= $row_poste[3];
          $hierfonc_poste= $row_poste[4];
          $date_etab= $row_poste[5];

          $diplome1= $row_poste[6];
          $diplome2= $row_poste[7];
          $specialite1= $row_poste[8];
          $specialite2= $row_poste[9];
          $experience1= $row_poste[10];
          $experience2= $row_poste[11];
          $exigence1=  $row_poste[12];
          $exigence2= $row_poste[13];

          $cbk1=$row_poste[14];
          $cbk2=$row_poste[15];
          $cbk3=$row_poste[16];
          $cbk4=$row_poste[17];
          $cbk5=$row_poste[18];
          $cbk6=$row_poste[19];
          $cbk7=$row_poste[20];
          $cbk8=$row_poste[21];
          $cbk9=$row_poste[22];
          $cbk10=$row_poste[23];
          $cbk11=$row_poste[24];
          $cbk12=$row_poste[25];
     }

     
     //echo htmlentities($exigence1);

     $st_cbk1='';
     $st_cbk2='';
     $st_cbk3='';
     $st_cbk4='';
     $st_cbk5='';
     $st_cbk6='';
     $st_cbk7='';
     $st_cbk8='';
     $st_cbk9='';
     $st_cbk10='';
     $st_cbk11='';
     $st_cbk12='';
    

     if($cbk1=='OUI'){
        $st_cbk1='X';
     } 
     if($cbk2=='OUI'){
        $st_cbk2='X';
     } 
     if($cbk3=='OUI'){
        $st_cbk3='X';
     } 
     if($cbk4=='OUI'){
        $st_cbk4='X';
     } 
     if($cbk5=='OUI'){
        $st_cbk5='X';
     } 
     if($cbk6=='OUI'){
        $st_cbk6='X';
     } 
     if($cbk7=='OUI'){
        $st_cbk7='X';
     }
     if($cbk8=='OUI'){
        $st_cbk8='X';
     }  
     if($cbk9=='OUI'){
        $st_cbk9='X';
     } 
     if($cbk10=='OUI'){
        $st_cbk10='X';
     } 
     if($cbk11=='OUI'){
        $st_cbk11='X';
     } 
     if($cbk12=='OUI'){
        $st_cbk12='X';
     } 
    //  echo $st_cbk1;


     $nom='';
     $prenoms='';
     $diplome3='';
     $expro='';
     $exgic='';
     $query_fposte="
                SELECT
                     \"NOM\",\"PRE\",\"DIP\",\"EXP\",\"EXG\"
               FROM 
                   public.pos_tab_index_fpo
               WHERE \"NUD\"='".$numposeidon."'
               ORDER BY \"NUD\" DESC LIMIT 1
               ";

     $contests_fposte= pg_query($query_fposte) or die('Query failed: ' . pg_last_error());
     while ($row_fposte = pg_fetch_row($contests_fposte)) {
    
          $nom= $row_fposte[0];
          $prenoms= $row_fposte[1];
          $diplome3= $row_fposte[2];
           $expro= $row_fposte[3];
           $exgic= $row_fposte[4];
          
      }

    $output_relinterne='';

    $rq = pg_query($conn,"
                    SELECT pdpt.\"LIB\" as departements,psrc.\"LIB\" as services
                    FROM public.pos_relinterne posint
                    LEFT JOIN public.pos_tab_index_dpt pdpt
                    ON  pdpt.\"NUD\"=posint.departement_id 
                    LEFT JOIN public.pos_tab_index_src psrc
                    ON  psrc.\"NUD\"=posint.service_id
                    WHERE code='".$loadcode."'
            ");

             
          
    while ($row_relinterne = pg_fetch_row($rq)) {

         if(empty($row_relinterne[1])){

              $sttx='';
               $output_relinterne .= '<span>'.$row_relinterne[0].' '.$sttx.' </span><br/><br/>';
         }else{
            $sttx='('.$row_relinterne[1].')';
             $output_relinterne .= '<span>'.$row_relinterne[0].' '.$sttx.' </span><br/><br/>';
         }
    }
     //echo $output_relinterne;


        $outputext='';
       $rqext = pg_query($conn,"
                    SELECT relexterne.libelle
                    FROM public.pos_relexterne prelext
                    INNER JOIN public.relexterne relexterne
                    ON  relexterne.id=prelext.relexterne_id
                    WHERE code='".$loadcode."'
            ");


            
            while ($rowext = pg_fetch_row($rqext)) {
                         
                     $outputext .='<span> '.$rowext[0].'</span><br/><br/>';
            }

         // echo  $outputext;  


            $rqmiss = pg_query($conn,"
                    SELECT mission.libelle
                    FROM public.pos_mission posmis
                    INNER JOIN public.mission mission
                    ON  mission.id=posmis.mission_id
                    WHERE code='".$loadcode."'
            ");
            $outputmiss .='';
            $incmiss=1;
             while ($rowmiss = pg_fetch_row($rqmiss)) {

                    $outputmiss .='<span> '.$incmiss++.'. '.$rowmiss[0].'</span><br/><br/>';
             }

            // echo $outputmiss;


    $rqperforma = pg_query($conn,"
                    SELECT indperf.libelle
                    FROM public.pos_indperforma posind
                    INNER JOIN public.indperforma indperf
                    ON  indperf.id=posind.indperforma_id
                    WHERE code='".$loadcode."'
        ");

    $outputperforma .='';
    $incperforma=1;
    while ($rowperforma = pg_fetch_row($rqperforma)) {

                     $outputperforma .='<span> '.$incperforma++.'. '.$rowperforma[0].'</span><br/><br/>';
            }

    // echo  $outputperforma; 

     $outputactivite .='';
     $incctt=1;
     $rqtitle = pg_query($conn,"
                SELECT DISTINCT ptt.id as id, ptt.libelle as titres
                FROM public.pos_activite posact
                LEFT JOIN public.ptitre ptt
                ON  ptt.id=posact.titre_id
                WHERE code='".$loadcode."'
        ");

      while ($rowtitle = pg_fetch_row($rqtitle)) {

          $outputactivite .='<span> <b> <u> '.$rowtitle[1].' </u> </b> </span><br/><br/>';

                     $rqcontent = pg_query($conn,"
                            SELECT pact.libelle as activites
                            FROM public.pos_activite posact
                            LEFT JOIN public.pactivite pact
                            ON  pact.id=posact.activite_id 
                            LEFT JOIN public.ptitre ptt
                            ON  ptt.id=posact.titre_id
                            WHERE code='".$loadcode."' AND   posact.titre_id='".$rowtitle[0]."'
                    ");

                          
                      
                     while ($rowcontent = pg_fetch_row($rqcontent)) {

                            $outputactivite .='<span> '.$incctt++.'. '.$rowcontent[0].' </span><br/><br/>';
                     }

                  
     }

 // echo  $outputactivite; 


      $rqqual = pg_query($conn,"
                    SELECT qualdom.libelle
                    FROM public.pos_qualdominante posqd
                    INNER JOIN public.qualdominante qualdom
                    ON  qualdom.id=posqd.qualdominante_id
                    WHERE code='".$loadcode."'
            ");
      $outputqual .='';
      while ($rowqual = pg_fetch_row($rqqual)) {
           $outputqual .=' <span> '.$rowqual[0].' </span><br/><br/>';
      }

  
 ///DATE DE MODIFICATION A PRENDRE EN COMPTE DANS L'IMPRIMEE

      /* <span> Date de Modification :   </span><br/><br/>
            <span> Date de Modification 2 :  </span><br/><br/>
            <span> Date de Modification 3 :  </span><br/><br/>*/

////////////////////////////////////////////////////////////////////////////////////


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

<table border ="1"  width= "100%" STYLE="font-family: Century Gothic; font-size:11pt; " >
    
    <tr width= "100%" align="center" >
        <td width= "30%"   rowspan="2">
        &nbsp;&nbsp;<br/>
            <span> NGSER </span>
        </td>
        <td width= "40%"   rowspan="2" >
        &nbsp;&nbsp;<br/>
            <span> FICHE DE POSTE </span><br/>
        </td>
        <td width= "30%"   colspan="5" >
            <span> RH – IM - ... </span><br/>
        </td>     
    </tr>
    <tr width= "100%" align="center" >
       <td colspan="5" >
            <span> V.01 </span><br/>
        </td>
        
    </tr>
    <tr width= "100%" align="center" >
        <td width= "100%" colspan="6" bgcolor="7F7F7F" >
        &nbsp;&nbsp;<br/>
            <span style="font-weight:bold" >INTITULE DU POSTE : '.strtoupper($intitule_poste).' (DEPARTEMENT '.strtoupper($departement_poste).') </span><br/>
        </td>     
    </tr>
    <tr width= "100%" >
        <td width= "50%"  colspan="1" >
        &nbsp;&nbsp;<br/>
            <span> Département : '.ucwords( strtolower($departement_poste)).' </span><br/><br/>
            <span> Service : '.ucwords( strtolower($service_poste)).' </span><br/><br/>
            <span> Titulaire du Poste : '.strtoupper( htmlentities($nom, ENT_QUOTES, "UTF-8")).' '.ucwords( strtolower( htmlentities($prenoms, ENT_QUOTES, "UTF-8"))).'</span><br/><br/>
            <span> Hiérarchie Opérationnelle : '.ucwords( strtolower($hierop_poste)).' </span><br/><br/>
            <span> Hiérarchie Fonctionnelle : '.ucwords( strtolower($hierfonc_poste)).' </span><br/><br/>
        </td>
        <td width= "50%"   colspan="5" >
        &nbsp;&nbsp;<br/>
            <span> Date d’établissement : '.ucwords( strtolower($date_etab)).' </span><br/><br/>
           
        </td>
    </tr>

</table>

<table border ="1" width= "100%" STYLE="font-family: Century Gothic; font-size:11pt; " >
    
    <tr width= "100%" align="center" bgcolor="7F7F7F" >
        <td width= "100%" colspan="6" >
        &nbsp;&nbsp;<br/>
            <span style="font-weight:bold">POSITIONNEMENT HIERARCHIQUE
(SOUS FORME D’ORGANIGRAMME)
            </span><br/>
        </td>     
    </tr>

</table>

<table border ="1" width= "100%" STYLE="font-family: Century Gothic; font-size:11pt; " >
&nbsp;&nbsp;<br/>
<table border ="0" width= "100%" STYLE="font-family: Arial; font-size:9pt" >
<tr>
    <td width= "25%"></td>
    <td width= "50%">
        <table border ="1" width= "100%" align="center">
        <tr>
            <td width= "100%" align="center">
                <span>'.strtoupper($hierop_poste).'</span>
            </td>
        </tr>
        </table>
    </td>
    <td width= "25%"></td>   
</tr>
<tr>
    <td width= "25%"></td>
    <td width= "50%">
        <table border ="0" width= "100%" align="center">
        <tr>
            <td width= "100%" align="center">
                <span></span>
            </td>
        </tr>
        </table>
    </td>
    <td width= "25%"></td>   
</tr>
<tr>
    <td width= "25%"></td>
    <td width= "50%">
        <table border ="1"  width= "100%" align="center">
        <tr>
            <td width= "100%" align="center" >
                
                <span> ' .strtoupper($intitule_poste).' <br/> (DEPARTEMENT '.strtoupper($departement_poste).')  <br/> '.strtoupper( htmlentities($nom, ENT_QUOTES, "UTF-8")).' '.ucwords( strtolower( htmlentities($prenoms, ENT_QUOTES, "UTF-8"))).'
</span>
            </td>
        </tr>
        </table>
    </td>
    <td width= "25%"></td>   
</tr>
</table>
&nbsp;&nbsp;<br/>
</table>

<table border ="1" width= "100%" STYLE="font-family: Century Gothic; font-size:11pt; " >

    <tr width= "100%" align="center" >
        <td width= "100%" colspan="6" bgcolor="7F7F7F" >
        &nbsp;&nbsp;<br/>
            <span style="font-weight:bold">CHAMP DES RELATIONS</span><br/>
        </td>     
    </tr>
     <tr width= "100%" >
        <td width= "50%"  colspan="1" >
        &nbsp;&nbsp;<br/>
            <span> <b> <u> HIERARCHIE OPERATIONNELLE </u> </b> </span><br/><br/>
            <span> '.ucwords(strtolower($hierop_poste)).' </span><br/><br/><br/>
            <span> <b> <u> HIERARCHIE FONCTIONNELLE </u> </b> </span><br/><br/>
            <span> '.ucwords( strtolower($hierfonc_poste)).' </span><br/><br/>
        </td>

        <td width= "50%"  colspan="5" >
        &nbsp;&nbsp;<br/>
            <span> <b> <u> RELATIONS INTERIEURES </u> </b> </span><br/><br/>
            &nbsp;'.$output_relinterne.'
            <span> <b> <u> RELATIONS EXTERIEURES </u> </b> </span><br/><br/>
           '.$outputext.'
        </td>
    </tr>

</table>

<table border ="1" width= "100%" STYLE="font-family: Century Gothic; font-size:11pt; " >

    <tr width= "100%" align="center" >
        <td width= "100%" colspan="6" bgcolor="7F7F7F" >
        &nbsp;&nbsp;<br/>
            <span style="font-weight:bold">MISSIONS (FINALITES) DU POSTE</span><br/>
        </td>     
    </tr>
    <tr width= "100%" >
        <td width= "100%"  colspan="6" >
        &nbsp;&nbsp;<br/>
           '.$outputmiss.'

        </td>
    </tr>

</table>

<table border ="1" width= "100%" STYLE="font-family: Century Gothic; font-size:11pt; " >

     <tr width= "100%" align="center" >
        <td width= "100%" colspan="6" bgcolor="7F7F7F" >
        &nbsp;&nbsp;<br/>
            <span style="font-weight:bold">ACTIVITES DU POSTE</span><br/>
        </td>     
    </tr>
    <tr width= "100%" >
        <td width= "100%"  colspan="1" >
        &nbsp;&nbsp;<br/>
            '.$outputactivite.'
        </td>
    </tr>

</table>

<table border ="1" width= "100%" STYLE="font-family: Century Gothic; font-size:11pt; " >


    <tr width= "100%" align="center" >
        <td width= "100%" colspan="6" bgcolor="7F7F7F" >
        &nbsp;&nbsp;<br/>
            <span style="font-weight:bold">CONDITIONS D’ACCES AU POSTE</span><br/>
        </td>     
    </tr>
    <tr width= "100%" >
        <td width= "100%"  colspan="6" >
        &nbsp;&nbsp;<br/>
            <span> <b> <u> 1/ RECRUTEMENT INTERNE </u> </b> </span><br/><br/>
            <span> Niveau de formation /Diplôme : '.$diplome1.' </span><br/><br/>
            <span> Spécialité : '.$specialite1.' </span><br/><br/>
            <span> Expérience professionnelle : '.$experience1.'  </span><br/><br/>
            <span> Exigences particulières  : '.htmlentities($exigence1).' </span><br/><br/><br/>

            <span> <b> <u> 2/ RECRUTEMENT EXTERNE </u> </b> </span><br/><br/>
            <span> Niveau de formation /Diplôme : '.$diplome2.' </span><br/><br/>
            <span> Spécialité : '.$specialite2.'  </span><br/><br/>
            <span> Expérience professionnelle : '.$experience2.' </span><br/><br/>
            <span> Exigences particulières  :  '.htmlentities($exigence2).' </span><br/><br/><br/>
        </td>
    </tr>

</table>

<table border ="1" width= "100%" STYLE="font-family: Century Gothic; font-size:11pt; " >

    <tr width= "100%" align="center" >
        <td width= "100%" colspan="6" bgcolor="7F7F7F" >
        &nbsp;&nbsp;<br/>
            <span style="font-weight:bold">PROFIL DU POSTE</span><br/>
        </td>     
    </tr>
     <tr width= "100%" >
        <td width= "25%" bgcolor="7F7F7F">
        &nbsp;&nbsp;<br/>
            <span> CAPACITES TECHNIQUES </span><br/>
        </td>
        <td width= "25%" colspan="5" bgcolor="7F7F7F">
        &nbsp;&nbsp;<br/>
            <span> CAPACITES D’ENCADREMENT </span><br/>
        </td>
        <td width= "25%" bgcolor="7F7F7F">
        &nbsp;&nbsp;<br/>
            <span> CAPACITES D’ORGANISATION </span><br/>
        </td>
        <td width= "25%" colspan="5" bgcolor="7F7F7F">
        &nbsp;&nbsp;<br/>
            <span> QUALITES DOMINANTES </span><br/>
        </td>
    </tr>
    <tr width= "100%" >
        <td width= "20%">
        &nbsp;&nbsp;<br/>
            <span> PAS SIGNIFICATIVE </span><br/>
        </td>
        <td width= "5%">
            <span> '.$st_cbk1.' </span><br/>
        </td>
        <td width= "20%">
        &nbsp;&nbsp;<br/>
            <span> SANS OBJET </span><br/>
        </td>
        <td width= "5%">
            <span> '.$st_cbk5.' </span><br/>
        </td>
        <td width= "20%">
        &nbsp;&nbsp;<br/>
            <span> PAS SIGNIFICATIVE </span><br/>
        </td>
        <td width= "5%">
            <span> '.$st_cbk9.' </span><br/>
        </td>
        <td width= "25%" rowspan="4">
        &nbsp;&nbsp;<br/>
           '. $outputqual.'
        </td>
    </tr>
    <tr width= "100%" >
        <td width= "20%">
        &nbsp;&nbsp;<br/>
            <span> NORMALE </span><br/>
        </td>
        <td width= "5%">
            <span> '.$st_cbk2.' </span><br/>
        </td>
        <td width= "20%">
        &nbsp;&nbsp;<br/>
            <span> NORMALE </span><br/>
        </td>
        <td width= "5%">
            <span> '.$st_cbk6.' </span><br/>
        </td>
        <td width= "20%">
        &nbsp;&nbsp;<br/>
            <span> NORMALE </span><br/>
        </td>
        <td width= "5%">
            <span> '.$st_cbk10.' </span><br/>
        </td>
    </tr>
    <tr width= "100%" >
        <td width= "20%">
        &nbsp;&nbsp;<br/>
            <span> FORTE </span><br/>
        </td>
        <td width= "5%">
            <span> '.$st_cbk3.' </span><br/>
        </td>
        <td width= "20%">
        &nbsp;&nbsp;<br/>
            <span> IMPORTANTE </span><br/>
        </td>
        <td width= "5%">
            <span> '.$st_cbk7.' </span><br/>
        </td>
        <td width= "20%">
        &nbsp;&nbsp;<br/>
            <span> FORTE </span><br/>
        </td>
        <td width= "5%">
            <span> '.$st_cbk11.' </span><br/>
        </td>
    </tr>
    <tr width= "100%" >
        <td width= "20%">
        &nbsp;&nbsp;<br/>
            <span> TRES FORTE</span><br/>
        </td>
        <td width= "5%">
            <span> '.$st_cbk4.' </span><br/>
        </td>
        <td width= "20%">
        &nbsp;&nbsp;<br/>
            <span> TRES IMPORTANTE </span><br/>
        </td>
        <td width= "5%">
            <span> '.$st_cbk8.' </span><br/>
        </td>
        <td width= "20%">
        &nbsp;&nbsp;<br/>
            <span> TRES FORTE </span><br/>
        </td>
        <td width= "5%">
            <span> '.$st_cbk12.' </span><br/>
        </td>
    </tr>

</table>

<table border ="1" width= "100%" STYLE="font-family: Century Gothic; font-size:11pt; " >

     <tr width= "100%" align="center" >
        <td width= "100%" colspan="6" bgcolor="7F7F7F" >
         &nbsp;&nbsp;<br/>
            <span style="font-weight:bold">INDICATEURS DE PERFORMANCES</span><br/>
        </td>     
    </tr>
    <tr width= "100%" >
        <td width= "100%"  colspan="6" >
        &nbsp;&nbsp;<br/>
               '.$outputperforma.'
            

        </td>
    </tr>

</table>

<table border ="1" width= "100%" STYLE="font-family: Century Gothic; font-size:11pt; " >


    <tr width= "100%" align="center" >
        <td width= "100%" colspan="6" bgcolor="7F7F7F" >
        &nbsp;&nbsp;<br/>
            <span style="font-weight:bold">NIVEAU DE FORMATION ET/OU CONNAISSANCES DU TITULAIRE DU POSTE</span><br/>
        </td>     
    </tr>
    <tr width= "100%" >
        <td width= "100%"  colspan="6" >
        &nbsp;&nbsp;<br/>
            <span> Niveau de formation : '.$diplome3.' </span><br/><br/>
            <span> Expérience professionnelle : '.$expro.' </span><br/><br/>
            <span> Exigences particulières  : '.htmlentities($exgic).'</span><br/><br/>
        </td>
    </tr>

</table>

<table border ="1" width= "100%" STYLE="font-family: Century Gothic; font-size:11pt; " >

    <tr width= "100%" align="center" >
        <td width= "50%" bgcolor="7F7F7F" >
         &nbsp;&nbsp;<br/>
            <span style="font-weight:bold">DATE ET  SIGNATURE DU TITULAIRE DU POSTE</span><br/>
        </td>
        <td width= "50%" bgcolor="7F7F7F" >
        &nbsp;&nbsp;<br/>
            <span style="font-weight:bold">DATE ET SIGNATURE DU SUPERIEUR HIERARCHIQUE</span><br/>
        </td>     
    </tr>
     <tr width= "100%" >
        <td width= "50%"  colspan="1" >
          &nbsp;&nbsp;<br/>
            <span> <u> Titulaire du Poste : </u> </span><br/><br/>
            <span> '.strtoupper( htmlentities($nom, ENT_QUOTES, "UTF-8")).' '.ucwords( strtolower( htmlentities($prenoms, ENT_QUOTES, "UTF-8"))).' </span><br/><br/><br/>
        </td>
        <td width= "50%"  colspan="1" >
        &nbsp;&nbsp;<br/>
            <span> <u> Supérieur Hiérarchique  </u> </span><br/><br/>
            <span> </span><br/><br/><br/>
        </td>
    </tr>

</table>

<!-- END CONTENT -->
'; 
$pdf->writeHTMLCell(0, 0, '', '',$html2, 0, 1, 0, true, '', true);

$pdf->Output('poste.pdf', 'I');

//============================================================+
// END OF FILE
//============================================================+

 

?>