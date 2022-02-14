<?php

	include ('../../../../../configuration_w/mabd.php');
	require('../../../../../configuration_w/PDF/fpdf.php');

	//require('../../../../../configuration_w/makefont/makefont.php');

	//define('FPDF_FONTPATH','./../../../../configuration_w/PDF/font/gothic.php');

    

   
   $numposeidon=$_GET['numposeidon'];
   $matricule=$_GET['matricule'];

   
  $query1 =" SELECT \"CIV\", \"NOM\",\"PRE\",\"FON\" FROM public.pos_tab_index_prs WHERE  \"MAT\" ='".$matricule."'";
  $result1 = pg_query($query1) or die('Query failed: ' . pg_last_error());

 $nom='';
 $prenom='';
 $civilite='';
 $fonction='';
 $civ='';
 				       
  if (!$result1){
  }else{
		while ($row1 = pg_fetch_row($result1)) {
			// as a string 
			 $civilite=$row1[0];
			 $nom=$row1[1];
			 $prenom=$row1[2];
			 $fonction=$row1[3];
			 
		}
		$civilite=='M'? $civ='M.':$civ=$civilite;
  }



//DONNEES ABSENCE

  $date_deb='';
  $date_fin='';

  $query2 =" SELECT \"DT4\",\"DFI\" FROM public.pos_tab_index_abs WHERE  \"NUD\" ='".$numposeidon."'" ;
         $result2 = pg_query($query2) or die('Query failed: ' . pg_last_error());

    if (!$result2){
  	}else{
		while ($row2 = pg_fetch_row($result2)) {
			// as a string 
			 $date_deb=$row2[0];
			 $date_fin=$row2[1];
			  
			 
		}
		 
  }


   
class PDF extends FPDF
{

   //FIT
   //Cell with horizontal scaling if text is too wide
	 
   //end FIT CELL

   // HTML PARSER
      protected $B = 0;
      protected $I = 0;
      protected $U = 0;
      protected $HREF = '';

         function WriteHTML($html)
         {
         $html = str_replace("\n",' ',$html);
         $a = preg_split('/<(.*)>/U',$html,-1,PREG_SPLIT_DELIM_CAPTURE);
         foreach($a as $i=>$e)
         {
            if($i%2==0)
            {
               // Text
               if($this->HREF)
                  $this->PutLink($this->HREF,$e);
               else
                  $this->Write(5,$e);
            }
            else
            {
               // Tag
               if($e[0]=='/')
                  $this->CloseTag(strtoupper(substr($e,1)));
               else
               {
                  // Extract attributes
                  $a2 = explode(' ',$e);
                  $tag = strtoupper(array_shift($a2));
                  $attr = array();
                  foreach($a2 as $v)
                  {
                     if(preg_match('/([^=]*)=["\']?([^"\']*)/',$v,$a3))
                        $attr[strtoupper($a3[1])] = $a3[2];
                  }
                  $this->OpenTag($tag,$attr);
               }
            }
         }
      }
      function WriteHtmlCell($cellWidth, $html){
         $rm = $this->rMargin;
         $lm = $this->lMargin;
         $this->SetRightMargin($this->w - $this->GetX() - $cellWidth);

         $this->SetLeftMargin($this->GetX());

         $this->WriteHtml($html);
         $this->SetRightMargin($rm);
         $this->SetLeftMargin($lm);
      }

      function OpenTag($tag, $attr)
      {
         // Opening tag
         if($tag=='B' || $tag=='I' || $tag=='U')
            $this->SetStyle($tag,true);
         if($tag=='A')
            $this->HREF = $attr['HREF'];
         if($tag=='BR')
            $this->Ln(5);
      }

      function CloseTag($tag)
      {
         // Closing tag
         if($tag=='B' || $tag=='I' || $tag=='U')
            $this->SetStyle($tag,false);
         if($tag=='A')
            $this->HREF = '';
      }

      function SetStyle($tag, $enable)
      {
         // Modify style and select corresponding font
         $this->$tag += ($enable ? 1 : -1);
         $style = '';
         foreach(array('B', 'I', 'U') as $s)
         {
            if($this->$s>0)
               $style .= $s;
         }
         $this->SetFont('',$style);
      }

         function PutLink($URL, $txt)
         {
            // Put a hyperlink
            $this->SetTextColor(0,0,255);
            $this->SetStyle('U',true);
            $this->Write(5,$txt,$URL);
            $this->SetStyle('U',false);
            $this->SetTextColor(0);
         }

      //END  HTML PARSER
 
         //PIED DE PAGE
         function Footer()
            {
                // Positionnement à 1,5 cm du bas
                $this->SetY(-20);
                // Police Arial italique 10
                $this->SetFont('Arial','',10);
                //couleur du text
                $this->SetTextColor(135, 206, 250); 
                // Numéro de page
                
                $this->Cell(5,10,utf8_decode('Plateau, avenue Lamblin, Imm MATCA, 4ème Etage, Tel/Fax : 20 22 12 53 28 BP 722 Abidjan 28'),0,0,'L');
                $this->Ln(5);
                $this->SetX(13);
                $this->Cell(1,10,utf8_decode('RCCM : CI- ABJ-03-2020-M-11141 CC : 09 09 52 9 Q Compte Bancaire NSIA : CI 042 0131 031360286954 87'),0,0,'L');
                 $this->Ln(5);
                 $this->Cell(50);
                $this->Cell(12,10,utf8_decode('www.ngser.com  - info@ngser.com'),0,0,'L');
            }

          //END PIED DE PAGE

}

      

        $pdf = new PDF();
        $pdf->AliasNbPages();

        $pdf->AddPage(); //page 1
         $pdf->SetMargins(25, 5);
        $pdf->SetFont('Times','U',20);
        $pdf->Image('../../../../../images/logo/ngser.png',10,6,50,15);
         $pdf->Ln(35);
        $pdf->Cell(55);
         // Titre html_entity_decode
      $pdf->SetDrawColor(28 , 28, 28);
      $pdf->SetFillColor(221 , 222, 226);
      $pdf->SetTextColor(0 , 0, 0); 
      $pdf->SetLineWidth(0.5);
     // $pdf->Rect(25 , 25, 160,10,'DF');
      $pdf->Cell(40,10,strtoupper( utf8_decode("ATTESTATION DE CONGE")),0,1,'C',0 );
       
 

      //$pdf->AddFont('CenturyGothic','','../../../../../configuration_w/PDF/font/gothic.php');
	//$pdf->SetFont('CenturyGothic','',11); 


	$pdf->SetFont('Arial','',16);
	$pdf->Ln(10); // Line gap
	$pdf->SetX(20); // abscissa of Horizontal position 
	$pdf->MultiCell(160,10, utf8_decode('   Je soussigné, Monsieur Sébastien ELLEPO , Gérant de la société NGSER (Nouvelle Génération de Services), Sise au Plateau , Avenue Lamblin , atteste par la présente que  :'));

	$pdf->Ln(10); // Line gap
	$pdf->SetX(20); // abscissa of Horizontal position 
	$pdf->MultiCell(160,10,utf8_decode($civ.' '.$nom.' '.$prenom.' employé dans notre société en qualité de '.$fonction.', sera en congé du '.$date_deb.' au '.$date_fin.' inclus . '));

	$pdf->Ln(10); // Line gap    
	 $pdf->SetX(105); // abscissa of Horizontal position 
	$pdf->MultiCell(160,10,utf8_decode('Fait à Abidjan, le '.(new DateTime())->format('d/m/Y')).' .');



	$pdf->Ln(30);
    $pdf->SetFont('','UI',12);
      
    $pdf->Cell(280,5,( utf8_decode(html_entity_decode("Le Gérant"))),0,1,'C',0 );


    $pdf->Ln(30);
    $pdf->SetFont('','','13');
    $pdf->Cell(280,5,( utf8_decode(html_entity_decode("M. Sébastien ELLEPO  "))),0,1,'C',0 );





       $pdf->Output();

      


?>

?>