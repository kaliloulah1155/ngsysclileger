<?php

include ('../../../../../configuration_w/mabd.php');
require('../../../../../configuration_w/tcpdf-master/tcpdf.php');

   $output='';
 
    $date_deb=$_GET['date_deb'];
    $date_fin=$_GET['date_fin'];
    $email=$_GET['email'];


    $query='';
    $find=0;
    $data = array() ;

    
     $query_init="
            SELECT
            \"NOM\",\"PRE\",\"FON\",\"NAT\",\"DAE\",\"NUD\"
           FROM 
                public.pos_tab_index_san ORDER BY  \"NOM\" ASC
           ";

     $query_san_data =$query_init;

   
    if(!empty($date_deb)  AND !empty($date_fin)  ){

    $query_san_date="
            SELECT 
            \"NOM\",\"PRE\",\"FON\",\"NAT\",\"DAE\",\"NUD\"
            FROM pos_tab_index_san 
            WHERE  \"DAE\" BETWEEN '".$date_deb."' AND '".$date_fin."' ORDER BY  \"NOM\" ASC
           ";

        $query=pg_query($query_san_date);
        $find = pg_num_rows($query);

        if($find!=0){
            $query_san_data =$query_san_date;
        }else{
             $query_san_data =$query_init;
        }
    }

   if(!empty($email)){

    $query_san_mail="

           SELECT
           \"NOM\",\"PRE\",\"FON\",\"NAT\",\"DAE\",\"NUD\"
            FROM pos_tab_index_san 
            WHERE  \"INT\"='".strtolower($email)."' 
           ";   

        $query=pg_query($query_san_mail);
        $find = pg_num_rows($query);

        if($find!=0){
            $query_san_data =$query_san_mail;
        }else{
             $query_san_data =$query_init;
        }
    }

    if(!empty($email) AND !empty($date_deb) AND !empty($email)){

    $query_san_datemail="
            SELECT \"NOM\",\"PRE\",\"FON\",\"NAT\",\"DAE\",\"NUD\"
            FROM pos_tab_index_san 
            WHERE  \"DAE\" BETWEEN '".$date_deb."' AND '".$date_fin."' AND  \"INT\"='".strtolower($email)."' ORDER BY  \"NOM\" ASC
           ";

        $query=pg_query($query_san_datemail);
        $find = pg_num_rows($query);

        if($find!=0){
            $query_san_data =$query_san_datemail;
        }else{
             $query_san_data =$query_init;
        }
          
    }

   $i=0;

   $contests_san = pg_query($query_san_data) or die('Query failed: ' . pg_last_error());
   while ($row = pg_fetch_row($contests_san)) {
   
       $output .="
        <tr>
                   <td style='width: 100px;border:none;
                   '>
                      ".$row[0]."
                   </td>
                   <td style='width: 5px;border:none;'>
                       ".$row[1]."
                   </td>
                   <td style='width: 100px;border:none;'>
                       ".$row[2]."
                   </td>
                   <td style='width: 100px;border:none;'>
                      ".$row[3]."
                   </td>
                   <td style='width: 100px;border:none;'>
                     ".$row[4]."
                   </td>
                   
        </tr>";    
        
        $i++;
  }
          //  echo  $output;  


            



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
        $this->Rect(65, 25, 80,10,'DF');
        $this->Cell(0, 10, 'LISTE DES SANCTIONS', 0, false, 'C', 0, '', 0, false, 'M', 'M');
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

$pdf->SetTitle('SANCTION');
 
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



$pdf->AddPage('P', 'A4');
 $html2 ='
<!-- CSS STYLE -->
<style>
   .semjour {
     text-align:center;
 }

 .jour tr{
 	font-size:9px;
 }

</style>
<!-- <END CSS STYLE -->

<!-- BEGIN CONTENT -->
 <p>
    Nombre : '.$i.'
 </p>

 <p>
        
        <table class="jour"  align="center" cellpadding="2" border="1" width="100%">
	        <tr>
	           <td   style="background-color:#2AD4FF;">NOM</td>
	           <td   style="background-color:#2AD4FF;">PRENOMS</td>
	           <td   style="background-color:#2AD4FF;">FONCTION </td>
	           <td   style="background-color:#2AD4FF;">NATURE DE LA SANCTION</td>
	           <td   style="background-color:#2AD4FF;">DATE DE FAUTE</td>
	        </tr>
	        
	        '.$output.'
	         
        </table>
 </p>

<!-- END CONTENT -->
'; 
$pdf->writeHTMLCell(0, 0, '', '',$html2, 0, 1, 0, true, '', true);

$pdf->Output('sanction.pdf', 'I');

//============================================================+
// END OF FILE
//============================================================+


