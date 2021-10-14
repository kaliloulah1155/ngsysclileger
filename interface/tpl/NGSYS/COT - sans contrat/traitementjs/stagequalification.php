<?php
  
// Send Headers
header('Content-type: application/pdf');
header('Content-Disposition: attachment; filename="myPDF.pdf');

// Send Headers: Prevent Caching of File
header('Cache-Control: private');
header('Pragma: private');
header('Expires: Mon, 26 Jul 1997 05:00:00 GMT');

    session_start();    
 
    include ('../../../../../configuration_w/mabd.php');
    require('../../../../../configuration_w/PDF/fpdf.php');
   //  require('../../../../../configuration_w/cellfit/cellfit.php');

     $numposeidon= $_GET['numposeidon'] ;

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
         //Police Arial italique 8
         $this->SetFont('Arial','I',8);
         //Positionnement à 1,5 cm du bas
         $this->SetY(-15);
         //Décalage
         $this->Cell(80);
         //Numéro de page
         $this->Cell(30,10,'Page '.$this->PageNo().'/{nb}');
         
         } 

          //END PIED DE PAGE

}

      

        $pdf = new PDF();
        $pdf->AliasNbPages();
        $pdf->AddPage(); //page 1
        $pdf->SetFont('Times','',12);
        $pdf->Image('../../../../../images/logo/ngser.png',10,6,50,15);
         $pdf->Ln(15);
        $pdf->Cell(55);
         // Titre html_entity_decode
      $pdf->SetDrawColor(28 , 28, 28);
      $pdf->SetFillColor(221 , 222, 226);
      $pdf->SetTextColor(0 , 0, 0); 
      $pdf->SetLineWidth(0.5);
      $pdf->Rect(25 , 25, 160,10,'DF');
      $pdf->Cell(80,10,strtoupper( utf8_decode("CONTRAT STAGE DE QUALIFICATION ")),0,1,'C',0 );
       
      $pdf->SetXY(12,40);
      $pdf->SetFont('','B',12);
      $pdf->Cell(5,10,( utf8_decode("Entre :  ")),0,1,'C',0 );
      $pdf->SetFont('','BU',12);
      $pdf->SetXY(45,50);
      $pdf->Cell(20,5,( utf8_decode("Nouvelle Génération  de Services en abrégé NGSER, ")),0,1,'C',0 );
      $pdf->SetFont('');
      $pdf->SetXY(42,60);
      $pdf->Cell(110,5,( utf8_decode("Société à Responsabilité Limitée, sise à Abidjan-plateau, Avenue Lambin, Immeuble MATCA, 4e Etage,  ")),0,1,'C',0 );
      $pdf->Cell(150,6,( utf8_decode("Appartement 65, immatriculée au registre du commerce et du crédit mobilier sous le numéro ")),0,1,'C',0 );
      $pdf->Cell(175,5,( utf8_decode("CI- ABJ-03-2020-M-11141 , 28 BP 722 Abidjan 28,téléphone (225) 20 22 12 53, représentée par le gérant,  ")),0,1,'C',0 );
      $pdf->SetFont('','B',12);
      $pdf->Cell(48,5,( utf8_decode("Monsieur ELLEPO Sébastien, ")),0,0,'C',0 );   
      $pdf->SetFont('');
      $pdf->Cell(105,5,( utf8_decode("dûment habilité aux fins des présentes et de leurs suites,")),0,1,'C',0 );
       $pdf->SetFont('','B',12);
       $pdf->Ln(3);
       $pdf->SetX(46);
       $pdf->Cell(50,6,( utf8_decode("Ci-après indifféremment désignée «  NGSER ou l'entreprise d'accueil » ")),0,1,'C',0 );
       $pdf->Ln(3);
       $pdf->Cell(15,6,( html_entity_decode("D' une part ")),0,1,'C',0 );
       $pdf->Ln(3);
       $pdf->Cell(1,6,( html_entity_decode("ET ")),0,1,'C',0 );
      $pdf->SetFont('','B',12);
      $pdf->Cell(48,5,( utf8_decode("Mademoiselle xxxxxxxxxx, ")),0,1,'C',0 );   
      $pdf->SetFont('');
     $pdf->SetX(4.5);
      $pdf->WriteHtmlCell(195,utf8_decode("né le xxxxxx à xxxxxxxxxx, titulaire de la carte nationale d'identité immatriculée xxxxxxxx, domicilié à Abidjan-commune de xxxxxxxxxxxxx, ayant tous pouvoirs à l'effet des présentes,"));
       
      $pdf->Ln(6);
       $pdf->SetFont('','B',12);
      
      $pdf->Cell(50,5,( utf8_decode("Ci-après désigné « la stagiaire »")),0,1,'C',0 );   
      $pdf->Ln(3);
       $pdf->Cell(15,6,( html_entity_decode("D'autre part ")),0,1,'C',0 );
       $pdf->Ln(3);
       $pdf->SetFont('');
      $pdf->Cell(87,5,( utf8_decode("NGSER et la stagiaire étant individuellement désignés ")),0,0,'C',0 );
      $pdf->SetFont('','B',12);
      $pdf->Cell(26,5,( utf8_decode(" « la partie » ")),0,0,'C',0 );   
      $pdf->SetFont('');
      $pdf->Cell(20,5,( utf8_decode("et ensemble")),0,0,'C',0 ); 
      $pdf->SetFont('','B',12);
      $pdf->Cell(28,5,( utf8_decode("« les parties »,")),0,1,'C',0 );  
      $pdf->Ln(5);
      $pdf->SetFont('','BU',12);
      $pdf->Cell(60,5,( utf8_decode("IL A ETE CONVENU CE QUI SUIT :")),0,1,'C',0 );
       
      $pdf->Ln(5);
      $pdf->SetFont('','B',12);
      $pdf->Cell(30,5,( utf8_decode(html_entity_decode("ARTICLE 1 : OBJET"))),0,1,'C',0 );

      $pdf->Ln(2);
      $pdf->SetFont('');
      $pdf->SetX(5);
      $pdf->MultiCell(185,5, utf8_decode( html_entity_decode("Le présent contrat a pour objet de donner au stagiaire une formation pratique lui permettant de se perfectionner en vue d'acquérir une expérience professionnelle dans le domaine de xxxxxxxxxxxxxxxx .") ) );

      $pdf->SetFont('','B',12);
      $pdf->Ln(3);
      $pdf->Cell(70,5,( utf8_decode(html_entity_decode("ARTICLE 2 : OBLIGATIONS DE NGSER "))),0,1,'C',0 );
      $pdf->SetFont('','B',12);

      $pdf->Ln(2);
      $pdf->SetFont('');
      $pdf->SetX(5);
      $pdf->MultiCell(100,5, utf8_decode( html_entity_decode("NGSER s'engage à :") ) );


      $pdf->Ln(2);
      $pdf->SetFont('Zapfdingbats','',12);  
      $pdf->Cell(5,5,chr(2799),0,0,'C',0 );
      $pdf->SetFont('Times','',12);
 
      $pdf->SetX(15);
      $pdf->MultiCell(180,5, utf8_decode( html_entity_decode("Mettre à la disposition de la stagiaire un maître de stage chargé d'assurer le suivi et d'optimiser les conditions de réalisation du stage ;") ) );

      
      $pdf->Ln(2);
      $pdf->SetFont('Zapfdingbats','',12);  
      $pdf->Cell(5,5,chr(2799),0,0,'C',0 );
      $pdf->SetFont('Times','',12);
 
      $pdf->SetX(15);
      $pdf->MultiCell(180,5, utf8_decode( html_entity_decode("Fournir à la stagiaire toutes informations nécessaires à sa formation.") ) );


      $pdf->SetFont('','B',12);
      $pdf->Ln(3);
      $pdf->Cell(85,5,( utf8_decode(html_entity_decode("ARTICLE 3 : OBLIGATIONS DE LA STAGIAIRE"))),0,1,'C',0 );
      $pdf->SetFont('','B',12);

      $pdf->Ln(2);
      $pdf->SetFont('');
      $pdf->SetX(5);
      $pdf->MultiCell(100,5, utf8_decode( html_entity_decode("La stagiaire est tenue de :") ) );

      $pdf->Ln(2);
      $pdf->SetFont('Zapfdingbats','',12);  
      $pdf->Cell(5,5,chr(2799),0,0,'C',0 );
      $pdf->SetFont('Times','',12);
 
      $pdf->SetX(15);
      $pdf->MultiCell(180,5, utf8_decode( html_entity_decode("Suivre les instructions fournies par son maître de stage ;") ) );

      $pdf->Ln(2);
      $pdf->SetFont('Zapfdingbats','',12);  
      $pdf->Cell(5,5,chr(2799),0,0,'C',0 );
      $pdf->SetFont('Times','',12);
 
      $pdf->SetX(15);
      $pdf->MultiCell(180,5, utf8_decode( html_entity_decode("Respecter le règlement intérieur de l'entreprise d'accueil.") ) );

      $pdf->SetFont('','B',12);
      $pdf->Ln(5);
      $pdf->Cell(55,5,( utf8_decode(html_entity_decode("ARTICLE 4 : DUREE DU STAGE"))),0,1,'C',0 );
      $pdf->SetFont('','B',12);

      $pdf->Ln(2);
      $pdf->SetFont('');
      $pdf->SetX(5);
      $pdf->MultiCell(185,5, utf8_decode( html_entity_decode("Le contrat a une durée de xxxxx (xxx) mois, à compter du xxx au xxxx.") ) );

      $pdf->AddPage(); //page 2

     
      $pdf->Ln(5);
      $pdf->SetFont('','B',12);
      $pdf->Cell(65,5,( utf8_decode(html_entity_decode("ARTICLE 5 : MODALITE DU STAGE"))),0,1,'C',0 );
 
      $pdf->Ln(2);
      $pdf->SetFont('');
      $pdf->SetX(5);
      $pdf->MultiCell(185,5, utf8_decode( html_entity_decode("Le stage se déroule au sein de l'entreprise d'accueil.") ) );

      $pdf->Ln(2);
      $pdf->SetFont('');
      $pdf->SetX(5);
      $pdf->MultiCell(185,5, utf8_decode( html_entity_decode("La durée journalière maximale de présence de la stagiaire dans l'entreprise d'accueil est de huit (8) heures par jour ouvré.") ) );

       $pdf->Ln(2);
      $pdf->SetFont('');
      $pdf->SetX(5);
      $pdf->MultiCell(185,5, utf8_decode( html_entity_decode("Durant son stage, la stagiaire est soumise au règlement intérieur de l'entreprise d'accueil.  ") ) );


      $pdf->Ln(5);
      $pdf->SetFont('','B',12);
      $pdf->Cell(100,5,( utf8_decode(html_entity_decode("ARTICLE 6 : ABSENCE ET INTERRUPTION DU STAGE"))),0,1,'C',0 );

      $pdf->Ln(2);
      $pdf->SetFont('');
      $pdf->SetX(5);
      $pdf->MultiCell(185,5, utf8_decode( html_entity_decode("Toute difficulté survenue au cours du déroulement du stage devra être portée à la connaissance de l'une des parties à l'autre afin d'être résolue au plus vite.") ) );

      $pdf->Ln(2);
      $pdf->SetFont('');
      $pdf->SetX(5);
      $pdf->MultiCell(185,5, utf8_decode( html_entity_decode("La stagiaire ne pourra s'absenter qu'après avoir obtenu l'autorisation préalable de NGSER. ") ) );

      $pdf->Ln(5);
      $pdf->SetFont('','B',12);
      $pdf->Cell(52,5,( utf8_decode(html_entity_decode("ARTICLE 7 : REMUNERATION"))),0,1,'C',0 );

      $pdf->Ln(2);
      $pdf->SetFont('');
      $pdf->SetX(5);
      $pdf->WriteHtmlCell(185,utf8_decode( html_entity_decode("NGSER s'engage à allouer à la stagiaire une indemnité forfaitaire mensuelle de <b>xxxx (xxxx) FCFA</b> .  ") ) );


      $pdf->Ln(7);
      $pdf->SetFont('');
      $pdf->SetX(5);
      $pdf->WriteHtmlCell(185,utf8_decode( html_entity_decode("L'indemnité forfaitaire lui sera régulièrement versée dans un délai de huit (8) jours au plus tard, après la fin du mois ouvrant droit au salaire par :") ) );

      $pdf->Ln(6);
      $pdf->SetFont('');
      $pdf->SetX(15);
      $pdf->WriteHtmlCell(200,utf8_decode("-	Virement bancaire ; "));

      $pdf->Ln(6);
      $pdf->SetFont('');
      $pdf->SetX(15);
      $pdf->WriteHtmlCell(200,utf8_decode("-	Chèque ; ou "));

       $pdf->Ln(6);
      $pdf->SetFont('');
      $pdf->SetX(15);
      $pdf->WriteHtmlCell(200,utf8_decode("-	en espèces. "));


      $pdf->Ln(8);
      $pdf->SetFont('','B',12);
      $pdf->Cell(117,5,( utf8_decode(html_entity_decode("ARTICLE 8 : DEVOIR DE RESERVE ET DE CONFIDENTIALITE "))),0,1,'C',0 );

      $pdf->Ln(7);
      $pdf->SetFont('');
      $pdf->SetX(5);
      $pdf->WriteHtmlCell(185,utf8_decode( html_entity_decode("Le devoir de réserve et de confidentialité est de rigueur absolue. Le stagiaire prend donc l'engagement de n'utiliser en aucun cas les informations recueillies ou obtenues par lui pour en faire l'objet de publication, communication à des tiers sans accord préalable de l'entreprise d'accueil, y compris le rapport de stage. Cet engagement vaudra non seulement pour la durée du stage mais également après son expiration. Le stagiaire s'engage à ne conserver, emporter, ou prendre copie d'aucun document ou logiciel, de quelque nature que ce soit, appartenant à l'entreprise d'accueil, sauf accord de cette dernière.") ) );


      $pdf->Ln(7);
      $pdf->SetFont('');
      $pdf->SetX(5);
      $pdf->WriteHtmlCell(185,utf8_decode( html_entity_decode( "Dans le cadre de la confidentialité des informations contenues dans le rapport, l'entreprise d'accueil peut demander une restriction de la diffusion du rapport, voire le retrait de certains éléments très confidentiels.") ) );


      $pdf->Ln(7);
      $pdf->SetFont('');
      $pdf->SetX(5);
      $pdf->WriteHtmlCell(185,utf8_decode( html_entity_decode( "Les personnes amenées à en connaître sont contraintes par le secret professionnel à n'utiliser ni ne divulguer les informations du rapport. ") ) );


      $pdf->Ln(8);
      $pdf->SetFont('','B',12);
      $pdf->Cell(65,5,( utf8_decode(html_entity_decode("Article 9 : RESULTATS DES PROJETS "))),0,1,'C',0 );

      $pdf->Ln(5);
      $pdf->SetFont('');
      $pdf->SetX(5);
      $pdf->WriteHtmlCell(185,utf8_decode( html_entity_decode("La propriété des oeuvres réalisées, notamment les résultats des études, les schémas techniques, les produits informatiques, les documents élaborés etc., en application du présent contrat, est attribuée au client. A cette fin, le Consultant transfère au client tous les droits sur les œuvres précitées: droit de reproduction, droit de représentation, droit de commercialisation, droit d'usage, de détention, d'adaptation, de traduction, et plus généralement, tous droits d'exploitation.") ) );


      $pdf->Ln(8);
      $pdf->SetFont('','B',12);
      $pdf->Cell(60,5,( utf8_decode(html_entity_decode("ARTICLE 10 : FIN DU CONTRAT "))),0,1,'C',0 );

      $pdf->Ln(5);
      $pdf->SetFont('');
      $pdf->SetX(5);
      $pdf->WriteHtmlCell(185,utf8_decode( html_entity_decode(" Le présent contrat stage de qualification prend fin dans les conditions suivantes :") ) );

       $pdf->Ln(6);
      $pdf->SetFont('Zapfdingbats','',12);  
      $pdf->Cell(5,5,chr(2799),0,0,'C',0 );
      $pdf->SetFont('Times','',12);
      $pdf->Cell(133,5,( utf8_decode(html_entity_decode("Au terme de la période stipulée à l'article 4 susvisé, sans indemnité ni préavis."))),0,0,'C',0 );

       $pdf->Ln(6);
      $pdf->SetFont('Zapfdingbats','',12);  
      $pdf->Cell(5,5,chr(2799),0,0,'C',0 );
      $pdf->SetFont('Times','',12);
      $pdf->Cell(163,5,( utf8_decode(html_entity_decode("A l'initiative de l'entreprise d'accueil ou de la stagiaire lorsqu'ils disposent d'un motif légitime ;"))),0,0,'C',0 );

      $pdf->Ln(6);
      $pdf->SetFont('Zapfdingbats','',12);  
      $pdf->Cell(5,5,chr(2799),0,0,'C',0 );
      $pdf->SetFont('Times','',12);
      $pdf->Cell(45,5,( utf8_decode(html_entity_decode("En cas de force majeure ;"))),0,0,'C',0 );

      $pdf->Ln(6);
      $pdf->SetFont('Zapfdingbats','',12);  
      $pdf->Cell(5,5,chr(2799),0,0,'C',0 );
      $pdf->SetFont('Times','',12);
      $pdf->Cell(30,5,( utf8_decode(html_entity_decode("D'accord parties."))),0,0,'C',0 );

       




       $pdf->AddPage(); //page 3
       /////////////////////////////////////////////////////

 
    
      $pdf->Ln(8);
      $pdf->SetFont('','B',12);
      $pdf->Cell(60,5,( utf8_decode(html_entity_decode("ARTICLE 11 : LOI APPLICABLE "))),0,1,'C',0 );

      $pdf->Ln(4);
      $pdf->SetFont('');
      $pdf->SetX(4);
      $pdf->WriteHtmlCell(200,utf8_decode("Le contrat est interprété et régi conformément à la législation du travail en vigueur, notamment la loi n°2015-532 du 20 Juillet 2015 portant code du travail en Côte d'Ivoire, la convention collective interprofessionnelle du 19 Juillet 1977 ainsi que toutes autres lois sociales."));


      $pdf->Ln(7);
      $pdf->SetFont('');
      $pdf->SetX(4);
      $pdf->WriteHtmlCell(200,utf8_decode("Tout différend né de l'application de ce contrat doit être résolu selon la procédure prévue à cet effet par la législation du travail. "));

      
      $pdf->Ln(7);
      $pdf->SetFont('');
      $pdf->SetX(4);
      $pdf->WriteHtmlCell(200,utf8_decode("Fait à Abidjan le xxxxxxxxxxxxxxxxx,"));

      $pdf->Ln(7);
      $pdf->SetFont('');
      $pdf->SetX(4);
      $pdf->WriteHtmlCell(200,utf8_decode("En deux (2) exemplaires originaux."));


     

      $pdf->Ln(10);
      $pdf->SetFont('','BU',12);
      $pdf->Cell(60,5,( utf8_decode(html_entity_decode("La stagiaire"))),0,0,'C',0 );
      $pdf->Cell(150,5,( utf8_decode(html_entity_decode("NGSER"))),0,1,'C',0 );


       $pdf->Ln(20);
      $pdf->SetFont('');
      $pdf->Cell(60,5,( utf8_decode(html_entity_decode("xxxxxxxxxxxxxxx"))),0,0,'C',0 );
      $pdf->Cell(150,5,( utf8_decode(html_entity_decode("ELLEPO Sébastien "))),0,1,'C',0 );









       $pdf->Output();

      


?>