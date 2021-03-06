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
         //Positionnement ?? 1,5 cm du bas
         $this->SetY(-15);
         //D??calage
         $this->Cell(80);
         //Num??ro de page
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
      $pdf->Cell(80,10,strtoupper( utf8_decode("CONTRAT DE PRESTATION  DE SERVICES NGSER-CONSULTANT ")),0,1,'C',0 );
       
      $pdf->SetXY(26,40);
      $pdf->SetFont('','B',12);
      $pdf->Cell(5,10,( utf8_decode("Entre :  ")),0,1,'C',0 );
      $pdf->SetFont('','BU',12);
      $pdf->SetXY(55,50);
      $pdf->Cell(20,5,( utf8_decode("Nouvelle G??n??ration  de Services en abr??g?? NGSER, ")),0,1,'C',0 );
      $pdf->SetFont('');
      $pdf->SetXY(42,60);
      $pdf->Cell(110,5,( utf8_decode("Soci??t?? ?? Responsabilit?? Limit??e, sise ?? Abidjan-plateau, Avenue Lambin, Immeuble MATCA, 4e Etage,  ")),0,1,'C',0 );
      $pdf->Cell(150,6,( utf8_decode("Appartement 65, immatricul??e au registre du commerce et du cr??dit mobilier sous le num??ro ")),0,1,'C',0 );
      $pdf->Cell(175,5,( utf8_decode("CI- ABJ-03-2020-M-11141 , 28 BP 722 Abidjan 28,t??l??phone (225) 20 22 12 53, repr??sent??e par le g??rant,  ")),0,1,'C',0 );
      $pdf->SetFont('','B',12);
      $pdf->Cell(48,5,( utf8_decode("Monsieur ELLEPO S??bastien, ")),0,0,'C',0 );   
      $pdf->SetFont('');
      $pdf->Cell(105,5,( utf8_decode("d??ment habilit?? aux fins des pr??sentes et de leurs suites,")),0,1,'C',0 );
       $pdf->SetFont('','B',12);
       $pdf->Ln(3);
       $pdf->Cell(105,6,( utf8_decode("Ci-apr??s indiff??remment d??sign??e ??  NGSER ??  ou ?? le Client ??")),0,1,'C',0 );
       $pdf->Ln(3);
       $pdf->Cell(15,6,( html_entity_decode("D' une part ")),0,1,'C',0 );
       $pdf->Ln(3);
       $pdf->Cell(1,6,( html_entity_decode("ET ")),0,1,'C',0 );
      $pdf->SetFont('','B',12);
      $pdf->Cell(48,5,( utf8_decode("Monsieur xxxxxxxxxx, ")),0,1,'C',0 );   
      $pdf->SetFont('');
     $pdf->SetX(4.5);
      $pdf->WriteHtmlCell(195,utf8_decode("n?? le xxxxxx ?? xxxxxxxxxx, titulaire de la carte nationale d'identit?? immatricul??e xxxxxxxx, domicili?? ?? Abidjan-commune de xxxxxxxxxxxxx, ayant tous pouvoirs ?? l'effet des pr??sentes,"));
       
      $pdf->Ln(6);
       $pdf->SetFont('','B',12);
      
      $pdf->Cell(90,5,( utf8_decode("Ci-apr??s d??sign?? ?? le Consultant ?? ou ?? le Prestataire ??")),0,1,'C',0 );   
      $pdf->Ln(3);
       $pdf->Cell(15,6,( html_entity_decode("D'autre part ")),0,1,'C',0 );
       $pdf->Ln(3);
       $pdf->SetFont('');
      $pdf->Cell(90,5,( utf8_decode("NGSER et le consultant sont individuellement d??sign??s  ")),0,0,'C',0 );
      $pdf->SetFont('','B',12);
      $pdf->Cell(25,5,( utf8_decode("?? la partie ?? ")),0,0,'C',0 );   
      $pdf->SetFont('');
      $pdf->Cell(20,5,( utf8_decode("et ensemble")),0,0,'C',0 ); 
      $pdf->SetFont('','B',12);
      $pdf->Cell(28,5,( utf8_decode("?? les parties ??,")),0,1,'C',0 );  
      $pdf->Ln(5);
      $pdf->SetFont('','BU',12);    
       $pdf->Cell(100,5,( utf8_decode("IL A ETE PREALABLEMENT EXPOSE CE QUI SUIT :")),0,1,'C',0 );
       $pdf->Ln(3);
      $pdf->SetFont('');
      $pdf->SetX(5);
      $pdf->MultiCell(185,5, utf8_decode( html_entity_decode("NGSER est une soci??t?? de droit ivoirien sp??cialis??e dans toutes les op??rations dans le domaine des t??l??communications, le d??veloppement des Technologies de l'Information, le conseil et la gestion des projets des Nouvelles Technologies de l'Information et la Communication.") ) );
      $pdf->SetFont('','B',12);
      $pdf->Ln(3);
      $pdf->Cell(95,5,( utf8_decode("Monsieur xxxxxxxxxxxxx est un Analyste Programmeur.")),0,1,'C',0 );   
      $pdf->Ln(3);
      $pdf->SetFont('');
      $pdf->SetX(5);
      $pdf->MultiCell(185,5, utf8_decode( html_entity_decode("Au regard de ses comp??tences, la soci??t?? NGSER a sollicit?? le consultant pour l'ex??cution de ses  projets informatiques.") ) );
      $pdf->Ln(3);
      $pdf->SetX(5);
      $pdf->MultiCell(185,5, utf8_decode( html_entity_decode("Le consultant ayant accept?? la demande de NGSER, les parties ont ??tabli le pr??sent contrat qui fixe le cadre normatif de leur collaboration.") ) );
      $pdf->Ln(5);
      $pdf->SetFont('','BUI',12);
      $pdf->Cell(110,5,( utf8_decode("CECI EXPOSE, IL EST CONVENU ET ARRETE CE QUI SUIT : ")),0,1,'C',0 );
      $pdf->Ln(5);
      $pdf->SetFont('','BU',12);
      $pdf->Cell(80,5,( utf8_decode(html_entity_decode("Article 1. Valeur pr??ambule - Annexes - Lexique"))),0,1,'C',0 );

      $pdf->SetFont('','B',12);
      $pdf->Ln(3);
      $pdf->Cell(55,5,( utf8_decode(html_entity_decode("1.1 Valeur du pr??ambule-Annexes"))),0,1,'C',0 );
      $pdf->SetFont('');
      $pdf->Ln(2);
      $pdf->SetX(5);
      $pdf->MultiCell(185,5, utf8_decode( html_entity_decode("Le pr??ambule ci-dessus et les annexes ci-jointes ont la m??me valeur juridique que le pr??sent contrat cadre dont ils font partie int??grante.") ) );

      $pdf->SetFont('','B',12);
      $pdf->Ln(3);
      $pdf->Cell(35,5,( utf8_decode(html_entity_decode("1.2 Lexique contractuel"))),0,1,'C',0 );
      $pdf->SetFont('','B',12);
      $pdf->Ln(2);
      $pdf->Cell(12,5,( utf8_decode(html_entity_decode("Consultant "))),0,0,'C',0 );
      $pdf->SetFont('');
      $pdf->SetX(26);
      $pdf->MultiCell(185,5, utf8_decode( html_entity_decode("est la personne physique mandat?? par NGSER pour r??aliser les prestations ;") ) );
      $pdf->SetFont('','B',12);
      $pdf->Ln(2);
      $pdf->Cell(23,5,( utf8_decode(html_entity_decode("D??lai d'ex??cution "))),0,0,'C',0 );
      $pdf->SetFont('');
      $pdf->SetX(37);
      $pdf->MultiCell(200,5, utf8_decode( html_entity_decode("d??signe le d??lai pr??vu pour la r??alisation des prestations ;") ) );

      $pdf->AddPage();  //page 2
      $pdf->SetFont('','B',12);
      $pdf->Ln(2);
      $pdf->Cell(12,5,( utf8_decode(html_entity_decode("Notification "))),0,0,'C',0 );
      $pdf->SetFont('');
      $pdf->SetX(27);
      $pdf->MultiCell(170,5, utf8_decode( html_entity_decode("d??signe toute transmission d'information et/ou de demande ou r??clamation effectu??e dans le ") ) );
      $pdf->SetX(5);
      $pdf->Cell(30,5,( utf8_decode(html_entity_decode("cadre du contrat ;"))),0,1,'C',0 );
      $pdf->SetFont('','B',12);
      $pdf->Ln(2);
      $pdf->Cell(12,5,( utf8_decode(html_entity_decode("Jour Ouvr?? "))),0,0,'C',0 );
      $pdf->SetFont('');
      $pdf->SetX(27);
      $pdf->MultiCell(170,5, utf8_decode( html_entity_decode("d??signe l'un quelconque des cinq (5) jours hebdomadaires du calendrier du lundi au vendredi ; ") ) );
       $pdf->SetFont('','B',12);
      $pdf->Ln(2);
      $pdf->SetX(7);
      $pdf->Cell(5,5,( utf8_decode(html_entity_decode("Jour "))),0,0,'C',0 );
      $pdf->SetFont('');
      $pdf->SetX(13);
      $pdf->MultiCell(170,5, utf8_decode( html_entity_decode("d??signe un jour calendaire ;") ) );
       $pdf->SetFont('','B',12);
      $pdf->Ln(2);
      $pdf->Cell(31,5,( utf8_decode(html_entity_decode("Prestations ou Mission "))),0,0,'C',0 );
      $pdf->SetFont('');
      $pdf->SetX(45);
      $pdf->MultiCell(170,5, utf8_decode( html_entity_decode("d??signe les prestations contractuelles convenues par les parties et devant ??tre ") ) );
      $pdf->SetX(29);
      $pdf->Cell(60,5,( utf8_decode(html_entity_decode("fournies par le Consultant conform??ment au cahier des charges ;"))),0,1,'C',0 );
      $pdf->Ln(5);
      $pdf->SetFont('','BU',12);
      $pdf->Cell(50,5,( utf8_decode(html_entity_decode("Article 2. Documents contractuels"))),0,1,'C',0 );
      $pdf->SetFont('');
       $pdf->Ln(2);
       $pdf->SetX(3);
       $pdf->Cell(5,5,( utf8_decode(html_entity_decode("Les documents contractuels sont par ordre de priorit?? les pi??ces et actes suivants: "))),0,1,'L',0 );

      $pdf->Ln(2);
      $pdf->SetFont('Zapfdingbats','',12);  
      $pdf->Cell(5,5,chr(2799),0,0,'C',0 );
      $pdf->SetFont('Times','',12);
      $pdf->Cell(35,5,( utf8_decode(html_entity_decode("Le pr??sent contrat"))),0,0,'C',0 );

       $pdf->Ln(5);
      $pdf->SetFont('Zapfdingbats','',12);  
      $pdf->Cell(5,5,chr(2799),0,0,'C',0 );
      $pdf->SetFont('Times','',12);
      $pdf->Cell(40,5,( utf8_decode(html_entity_decode("Le cahier des charges"))),0,0,'C',0 );

      
      $pdf->Ln(5);
      $pdf->SetFont('Zapfdingbats','',12);  
      $pdf->Cell(5,5,chr(2799),0,0,'C',0 );
      $pdf->SetFont('Times','',12);
       $pdf->SetX(29);
      $pdf->Cell(100,5,( utf8_decode(html_entity_decode("Tout autre document aff??rent ?? l'ex??cution du contrat, act?? par les parties."))),0,0,'C',0 );
       $pdf->Ln(7);
      $pdf->SetFont('','BU',12);
      $pdf->Cell(17,5,( utf8_decode(html_entity_decode("Article 3. Objet"))),0,1,'C',0 );
       $pdf->Ln(3);
        $pdf->SetFont('');
        $pdf->SetX(3.4);
      $pdf->Cell(1,5,( utf8_decode(html_entity_decode("Le Contrat a pour objet de pr??ciser les termes et conditions dans lesquels NGSER engage le Consultant en qualit??"))),0,0,'L',0 );
      $pdf->Ln(5);
       $pdf->SetFont('','B',12);
     $pdf->SetX(2);
     $pdf->WriteHtmlCell(200,utf8_decode("<b>d'Analyste Programmeur </b> pour l'ex??cution de divers projets informatiques, conform??ment au cahier des charges des missions annex?? au contrat."));
      $pdf->Ln(10);
       $pdf->SetFont('','BU',12);
      $pdf->Cell(50,5,( utf8_decode(html_entity_decode("Article 4. Obligations des parties"))),0,1,'C',0 );
      $pdf->Ln(2);
      $pdf->SetFont('','B',12);
      $pdf->Cell(45,5,( utf8_decode(html_entity_decode("4.1 Obligations du Consultant"))),0,0,'C',0 );
      $pdf->SetFont('');
       $pdf->Ln(6);
      $pdf->SetX(4);
     $pdf->WriteHtmlCell(200,utf8_decode("Le Consultant s'engage ?? respecter toutes les obligations mises ?? sa charge dans le cadre du pr??sent contrat et plus particuli??rement ?? :"));
     $pdf->Ln(6);
     
     // $pdf->SetFont('Zapfdingbats','',12);  
       
     $pdf->SetFillColor(0 , 0, 0);
     $pdf->Rect(10,138,1, 1,'F');
      $pdf->SetFont('Times','',12);
       $pdf->SetX(13);
       $pdf->WriteHtmlCell(190,utf8_decode( html_entity_decode("Prendre toutes dispositions utiles pour r??aliser sous sa seule responsabilit??, toutes les prestations aff??rentes aux projets du Client notamment, la mise en oeuvre des livrables applicatifs et la gestion AGILE des projets, conform??ment au cahier des charges des missions. A cet effet, le Consultant apportera son savoir-faire, sa disponibilit?? et tous autres moyens n??cessaires ?? l'ex??cution des prestations contractuelles dans les locaux du Client ou en tout lieu en cas de n??cessit?? du service. Il a une obligation de r??sultat quant ?? la conformit?? des prestations par rapport aux besoins et attentes du Client ;")));
      $pdf->Ln(7);

       $pdf->SetFillColor(0 , 0, 0);
      $pdf->Rect(10,169,1, 1,'F');
      $pdf->SetFont('Times','',12);
       $pdf->SetX(13);
       $pdf->WriteHtmlCell(190,utf8_decode("R??aliser la mission conform??ment au d??lai d'ex??cution requis par Client ;"));
       $pdf->Ln(7);

       $pdf->SetFillColor(0 , 0, 0);
       $pdf->Rect(10,177,1, 1,'F');
       $pdf->SetFont('Times','',12);
       $pdf->SetX(13);
       $pdf->WriteHtmlCell(190,utf8_decode("Ex??cuter sa mission conform??ment aux r??gles en vigueur dans sa profession et en se conformant ?? toutes les donn??es acquises dans son domaine de comp??tence ; "));
       $pdf->Ln(7);

      $pdf->SetFillColor(0 , 0, 0);
      $pdf->Rect(10,189,1, 1,'F');
      $pdf->SetFont('Times','',12);
       $pdf->SetX(13);
       $pdf->WriteHtmlCell(190,utf8_decode("Fournir un rapport mensuel d'activit??"));
       $pdf->Ln(7);

       $pdf->SetFillColor(0 , 0, 0);
       $pdf->Rect(10,196,1, 1,'F');
       $pdf->SetFont('Times','',12);
       $pdf->SetX(13);
       $pdf->WriteHtmlCell(190,utf8_decode("Apporter son expertise et proposer au Client des solutions appropri??es ;"));
      $pdf->Ln(10);

      $pdf->SetFont('','B',12);
      $pdf->Cell(35,5,( utf8_decode(html_entity_decode("4.2 Obligations du Client"))),0,0,'C',0 );
      $pdf->SetFont('');
       $pdf->Ln(6);
      $pdf->SetX(5);
     $pdf->WriteHtmlCell(200,utf8_decode("NGSER  s'engage ?? :"));
       $pdf->Ln(7);

       $pdf->SetFillColor(0 , 0, 0);
       $pdf->Rect(10,219,1, 1,'F');
       $pdf->SetFont('Times','',12);
       $pdf->SetX(13);
       $pdf->WriteHtmlCell(190,utf8_decode("R??mun??rer le consultant selon les modalit??s d??finies ?? l'article 7 ci-dessous ;"));

       $pdf->Ln(7);
       $pdf->SetFillColor(0 , 0, 0);
       $pdf->Rect(10,226,1, 1,'F');
       $pdf->SetFont('Times','',12);
       $pdf->SetX(13);
       $pdf->WriteHtmlCell(190,utf8_decode("D??signer un interlocuteur principal capable de collaborer ??troitement avec le Consultant pour la mise en oeuvre des projets;"));

        $pdf->Ln(7);
       $pdf->SetFillColor(0 , 0, 0);
       $pdf->Rect(10,238,1, 1,'F');
       $pdf->SetFont('Times','',12);
       $pdf->SetX(13);
       $pdf->WriteHtmlCell(190,utf8_decode("Pr??ter tout concours que le Consultant pourrait demander dans le cadre de ses obligations contractuelles. "));

       $pdf->Ln(7);
       $pdf->SetFillColor(0 , 0, 0);
       $pdf->Rect(10,245,1, 1,'F');
       $pdf->SetFont('Times','',12);
       $pdf->SetX(13);
       $pdf->WriteHtmlCell(190,utf8_decode("Valider les documents de recette des livrables fournis par le consultant"));
       

       $pdf->Ln(10);
       $pdf->SetFont('','BU',12);
      $pdf->Cell(22,5,( utf8_decode(html_entity_decode("Article 5. Dur??e"))),0,1,'C',0 );
      $pdf->Ln(2);
      $pdf->SetFont('');
       $pdf->SetX(4);
       $pdf->WriteHtmlCell(190,utf8_decode("Ce pr??sent contrat est conclu pour une dur??e de xxxxxxxxxxx mois.<p>
Toutefois, les parties conviennent que le volume horaire mensuel de r??alisation des travaux est fix?? ?? xxx (xxxxxx) heures. <p/>
 Il expire dans les conditions stipul??es ?? l'article 15 ci-dessous.
"));

          $pdf->AddPage(); //page 3

      $pdf->Ln(5);
      $pdf->SetFont('','BU',12);
      $pdf->Cell(80,5,( utf8_decode(html_entity_decode("Article 6. Modalit??s d'ex??cution des prestations"))),0,1,'C',0 );
      $pdf->Ln(2);
      $pdf->SetFont('');
       $pdf->SetX(4);
       $pdf->WriteHtmlCell(190,utf8_decode("A la demande de NGSER, le prestataire fournira les prestations soit dans les locaux de NGSER soit hors de la soci??t?? conform??ment au cahier des charges de la mission qui lui a ??t?? confi??e."));

        $pdf->Ln(8);
      $pdf->SetFont('');
       $pdf->SetX(4);
       $pdf->WriteHtmlCell(190,utf8_decode("D??s r??ception du cahier des charges de la mission par le prestataire, celui-ci est tenu de prendre toutes les dispositions n??cessaires afin d'ex??cuter les prestations de services dans les d??lais convenus."));

        $pdf->Ln(8);
      $pdf->SetFont('');
       $pdf->SetX(4);
       $pdf->WriteHtmlCell(190,utf8_decode("Les parties conviennent qu'en l'absence de prestations fournies au cours d'une p??riode mensuelle, le prestataire ne pourra pr??tendre ?? aucune r??mun??ration au cours de ladite p??riode. "));

       $pdf->Ln(8);
       $pdf->SetFont('');
       $pdf->SetX(4);
       $pdf->WriteHtmlCell(190,utf8_decode("Le prestataire informera NGSER sans d??lai de toutes les difficult??s auxquelles il sera confront?? au cours de l'ex??cution de ses prestations. A la demande de NGSER, le Consultant devra fournir des rapports r??sumant les actions r??alis??es dans l'ex??cution de ses prestations contractuelles. NGSER fournira au consultant toute information relative aux prestations qu'il pourra lui demander."));

         $pdf->Ln(10);
       $pdf->SetFont('','BU',12);
      $pdf->Cell(50,5,( utf8_decode(html_entity_decode("Article 7. Stipulations financi??res"))),0,1,'C',0 );
      $pdf->Ln(2);
      $pdf->SetFont('','B',12);
      $pdf->Cell(70,5,( utf8_decode(html_entity_decode("7.1 R??mun??ration des prestations de services"))),0,0,'C',0 );
      $pdf->SetFont('');
       $pdf->Ln(8);
      $pdf->SetX(4);
     $pdf->WriteHtmlCell(200,utf8_decode("La r??mun??ration du prestataire est li??e au volume horaire mensuel de r??alisation des travaux."));

     $pdf->Ln(8);
     $pdf->SetX(4);
     $pdf->WriteHtmlCell(200,utf8_decode("Le volume horaire mensuel de r??alisation des travaux est fix?? ?? cent vingt (120) heures."));

      $pdf->Ln(8);
     $pdf->SetX(4);
     $pdf->WriteHtmlCell(200,utf8_decode("Sur la base du volume horaire mensuel des travaux effectivement r??alis??s par le prestataire et valid??s par le client, le prestataire percevra une r??mun??ration mensuelle nette fix??e ?? <b> xxxxxxxx (xxxxxxxxx) francs CFA </b>."));

      $pdf->Ln(10);
      $pdf->SetFont('','B',12);
      $pdf->Cell(60,5,( utf8_decode(html_entity_decode("7.2	P??riodicit?? et modalit??s de paiement "))),0,0,'C',0 );
      $pdf->SetFont('');
       $pdf->Ln(8);
      $pdf->SetX(4);
     $pdf->WriteHtmlCell(200,utf8_decode("La r??mun??ration mensuelle du prestataire doit ??tre calcul?? en fonction du volume horaire mensuel des prestations effectu??es par le prestataire sur la base du cahier des charges des missions qui lui ont ??t?? confi??s."));

      $pdf->Ln(8);
     $pdf->SetX(4);
     $pdf->WriteHtmlCell(200,utf8_decode("Pour les besoins de chaque paiement, le prestataire doit transmettre chaque fin du mois ?? NGSER les documents ??num??r??s ci-dessous :"));

     $pdf->Ln(8);
     $pdf->SetX(10);
     $pdf->WriteHtmlCell(200,utf8_decode("a.	Les fiches de fin travaux des livrables recett??s et valid??s par les Responsables des D??partements Technique Informatique et Projet ;"));

     $pdf->Ln(8);
     $pdf->SetX(10);
     $pdf->WriteHtmlCell(200,utf8_decode("b.	Les livrables documentaires techniques ;"));

      $pdf->Ln(8);
     $pdf->SetX(10);
     $pdf->WriteHtmlCell(200,utf8_decode("c.	Une copie de la fiche mensuelle du timesheet"));

     $pdf->Ln(8);
     $pdf->SetX(4);
     $pdf->WriteHtmlCell(200,utf8_decode("Les r??glements du prestataire s'effectueront en esp??ces, dans un d??lai de dix (10) jours au plus tard apr??s la r??ception mensuelle des documents de fin travaux et des livrables documentaires."));

     $pdf->Ln(8);
      $pdf->SetFont('','BU',12);
      $pdf->Cell(20,5,( utf8_decode(html_entity_decode("Article 8. Fiscalit??"))),0,1,'C',0 );

      $pdf->Ln(2);
      $pdf->SetFont('');
       $pdf->SetX(4);
       $pdf->WriteHtmlCell(200,utf8_decode("NGSER  reste tenue du paiement des imp??ts, droits et taxes de toutes natures grevant  l'ex??cution des prestations."));

        $pdf->Ln(8);
      $pdf->SetFont('','BU',12);
      $pdf->Cell(50,5,( utf8_decode(html_entity_decode("Article 9. Ind??pendance des parties"))),0,1,'C',0 );

       $pdf->Ln(2);
      $pdf->SetFont('');
       $pdf->SetX(4);
       $pdf->WriteHtmlCell(200,utf8_decode("Les Parties sont des professionnels ind??pendants l'un de l'autre qui agiront toujours comme tels."));

      $pdf->Ln(8);
      $pdf->SetX(4);
      $pdf->WriteHtmlCell(200,utf8_decode("Les Parties d??clarent que le Contrat ne saurait en aucun cas s'analyser en un contrat de travail  au sens de l'article 2 de la loi n?? 2015-532 du 20 juillet 1015 portant Code du travail. "));

      $pdf->Ln(8);
      $pdf->SetX(4);
      $pdf->WriteHtmlCell(200,utf8_decode("Le consultant d??clare en cons??quence ??tre ind??pendant vis-??-vis du Client. A ce titre, le Client ne peut ??tre responsable envers le Consultant de tous droits dont un salari?? peut b??n??ficier conform??ment ?? la l??gislation du travail mentionn?? dans le pr??sent article et tous autres textes r??glementaires aff??rents ?? cette l??gislation en vigueur."));


      $pdf->AddPage(); //page 4
       $pdf->Ln(8);
      $pdf->SetFont('','BU',12);
      $pdf->Cell(37,5,( utf8_decode(html_entity_decode("Article 10. Confidentialit??"))),0,1,'C',0 );

       $pdf->Ln(2);
       $pdf->SetFont('');
       $pdf->SetX(4);
       $pdf->WriteHtmlCell(200,utf8_decode("Le Consultant s'engage ?? observer la discr??tion la plus stricte sur les informations se rapportant aux activit??s de la soci??t?? NGSER auxquelles il aura acc??s ?? l'occasion du pr??sent contrat."));

       $pdf->Ln(8);
       $pdf->SetFont('');
       $pdf->SetX(4);
       $pdf->WriteHtmlCell(200,utf8_decode("Notamment, il ne devra pas divulguer ?? quiconque les informations techniques, commerciales, marketing, financi??res ainsi que toutes autres informations li??es aux activit??s de NGSER qui sont couvertes par le secret professionnel le plus strict. Il sera li?? par la m??me obligation vis-??-vis de tout renseignement ou document dont il aura pris connaissance chez les partenaires commerciaux de la soci??t?? NGSER."));

      $pdf->Ln(8);
       $pdf->SetFont('');
       $pdf->SetX(4);
       $pdf->WriteHtmlCell(200,utf8_decode("Tous les documents, lettres, notes de service, instructions, m??thodes, organisation et/ou fonctionnement de l'entreprise dont il pourra avoir connaissance dans l'exercice de sa fonction, seront confidentiels et resteront la propri??t?? exclusive de la Soci??t??."));

      $pdf->Ln(8);
       $pdf->SetFont('');
       $pdf->SetX(4);
       $pdf->WriteHtmlCell(200,utf8_decode("Le Consultant ne pourra, sans accord ??crit de la Soci??t??  NGSER, publier aucune ??tude sous quelque forme que ce soit portant sur des projets ou des informations couverts par l'obligation de confidentialit??. Cette obligation de confidentialit?? se prolongera apr??s la cessation du contrat de prestation de services, quelle qu'en soit la cause."));

        $pdf->Ln(8);
       $pdf->SetFont('');
       $pdf->SetX(4);
       $pdf->WriteHtmlCell(200,utf8_decode("Le Consultant, toutefois, ne saurait ??tre tenu pour responsable d'aucune divulgation si les informations divulgu??es ??taient dans le domaine public ?? la date de la divulgation, ou s'il en avait connaissance, ou les obtenait de tiers par des moyens l??gitimes. "));


      $pdf->Ln(8);
      $pdf->SetFont('','BU',12);
      $pdf->Cell(45,5,( utf8_decode(html_entity_decode("Article 11. Recette des travaux "))),0,1,'C',0 );

       $pdf->Ln(2);
       $pdf->SetFont('');
       $pdf->SetX(4);
       $pdf->WriteHtmlCell(200,utf8_decode("Tous les travaux donnent lieu ?? recette globale. Elle a lieu selon les d??lais convenus par les parties. Sauf objection motiv??e par NGSER, il sera proc??d?? ?? la recette d??finitive des travaux et des livrables documentaires associ??s."));

       $pdf->Ln(8);
       $pdf->SetFont('');
       $pdf->SetX(4);
       $pdf->WriteHtmlCell(200,utf8_decode("La recette d??finitive des travaux est constat??e par un proc??s-verbal de recette contradictoire sign?? par les parties."));


      $pdf->Ln(8);
      $pdf->SetFont('','BU',12);
      $pdf->Cell(37,5,( utf8_decode(html_entity_decode("Article 12. Responsabilit?? "))),0,1,'C',0 );

       $pdf->Ln(2);
       $pdf->SetFont('');
       $pdf->SetX(4);
       $pdf->WriteHtmlCell(200,utf8_decode("Chaque partie est responsable de la mauvaise ex??cution ou de l'inex??cution totale ou partielle de ses obligations qui lui incombent au titre du contrat. Les parties s'engagent ex??cuter de bonne foi et sans r??serve le contrat et s'abstiennent de toutes manoeuvres abusives et dilatoires sous quelques formes que ce soient, emp??chant ou restreignant sa bonne ex??cution."));

       $pdf->Ln(8);
       $pdf->SetFont('');
       $pdf->SetX(4);
       $pdf->WriteHtmlCell(200,utf8_decode("Le prestataire reconna??t que le respect de la confidentialit?? des informations du client est un engagement essentiel du contrat."));

       
       $pdf->Ln(8);
       $pdf->SetFont('');
       $pdf->SetX(4);
       $pdf->WriteHtmlCell(200,utf8_decode("Le Consultant engage sa responsabilit?? civile et p??nale en cas d???utilisation frauduleuse des informations confidentielles du client."));

        
       $pdf->Ln(8);
       $pdf->SetFont('');
       $pdf->SetX(4);
       $pdf->WriteHtmlCell(200,utf8_decode("Le consultant est responsable de tous pr??judices subis par le client, li??s ?? la violation de la clause de confidentialit?? susmentionn??e."));


      $pdf->Ln(8);
      $pdf->SetFont('','BU',12);
      $pdf->Cell(45,5,( utf8_decode(html_entity_decode("Article 13. R??sultats des projets"))),0,1,'C',0 );

       $pdf->Ln(2);
       $pdf->SetFont('');
       $pdf->SetX(4);
       $pdf->WriteHtmlCell(200,utf8_decode("La propri??t?? intellectuelle des ??uvres r??alis??es, notamment les r??sultats des ??tudes, les sch??mas techniques, les livrables Applicatifs, les documents ??labor??s etc., en application du pr??sent contrat, est attribu??e au client. A cette fin, le Consultant transf??re au client tous les droits sur les ??uvres pr??cit??es : droit de reproduction, droit de repr??sentation, droit de commercialisation, droit d'usage, de d??tention, d'adaptation, de traduction, et plus g??n??ralement, tous droits d'exploitation."));

      $pdf->Ln(8);
      $pdf->SetFont('','BU',12);
      $pdf->Cell(35,5,( utf8_decode(html_entity_decode("Article 14. Sous-traitance"))),0,1,'C',0 );

       $pdf->Ln(2);
       $pdf->SetFont('');
       $pdf->SetX(4);
       $pdf->WriteHtmlCell(200,utf8_decode("Dans le cadre de ce contrat, le Consultant n'est autoris?? ?? sous-traiter les prestations li??es ?? l'ex??cution d'un quelconque projet qu'avec l'accord pr??alable de NGSER."));

      $pdf->AddPage(); //page 5

      $pdf->Ln(2);
      $pdf->SetFont('','BU',12);
      $pdf->Cell(30,5,( utf8_decode(html_entity_decode("Article 15. R??siliation"))),0,1,'C',0 );

      $pdf->Ln(2);
      $pdf->SetFont('','B',12);
      $pdf->Cell(17,5,( utf8_decode(html_entity_decode("15.1 Condition"))),0,1,'C',0 );  

      $pdf->Ln(5);
      $pdf->SetFont('');
      $pdf->SetX(4);
      $pdf->WriteHtmlCell(200,utf8_decode("Le Contrat prend fin dans les conditions ci-apr??s : "));

       $pdf->Ln(7); 
       $pdf->SetFillColor(0 , 0, 0);
       $pdf->SetX(13);
       $pdf->Rect(10,40,1, 1,'F');
       $pdf->SetFont('Times','',12);
       $pdf->SetXY(12,38);
       $pdf->WriteHtmlCell(190,utf8_decode("Au terme de la p??riode stipul??e ?? l'article 5 ci-dessus ;"));

       $pdf->Ln(7); 
       $pdf->SetFillColor(0 , 0, 0);
       $pdf->SetX(13);
       $pdf->Rect(10,47,1, 1,'F');
       $pdf->SetFont('Times','',12);
       $pdf->SetXY(12,45);
       $pdf->WriteHtmlCell(190,utf8_decode("Chaque Partie peut r??silier le Contrat de plein droit en cas de manquement par l'autre Partie ?? toute stipulation contractuelle, non r??par?? dans un d??lai de cinq (05) jours, ?? compter de la r??ception d???une notification ??crite du manquement adress??e par la Partie non fautive, qui devra d??crire de mani??re suffisamment d??taill??e, la nature du manquement. La r??siliation sera sans pr??judice de tout autre recours que la Partie non fautive serait en droit d'exercer."));

       $pdf->Ln(7); 
       $pdf->SetFillColor(0 , 0, 0);
       $pdf->SetX(13);
       $pdf->Rect(10,72,1, 1,'F');
       $pdf->SetFont('Times','',12);
       $pdf->SetXY(12,70);
       $pdf->WriteHtmlCell(190,utf8_decode("Pour tout autre motif, apr??s le respect d'un pr??avis d'un (01) mois."));

      $pdf->Ln(8);
      $pdf->SetFont('','B',12);
      $pdf->Cell(10,5,( utf8_decode(html_entity_decode("15.2 Effets"))),0,1,'C',0 );  

       $pdf->Ln(7); 
       $pdf->SetFillColor(0 , 0, 0);
       $pdf->SetX(13);
       $pdf->Rect(10,89,1, 1,'F');
       $pdf->SetFont('Times','',12);
       $pdf->SetXY(12,87);
       $pdf->WriteHtmlCell(190,utf8_decode("En cas de r??siliation due ?? une faute du consultant, NGSER aura le droit de demander des dommages-int??r??ts pour la perte de profits caus??e par ladite faute et aucun montant ne sera d?? au consultant au titre des prestations ex??cut??es ?? la date de la r??siliation. "));


       $pdf->Ln(7); 
       $pdf->SetFillColor(0 , 0, 0);
       $pdf->SetX(13);
       $pdf->Rect(10,107,1, 1,'F');
       $pdf->SetFont('Times','',12);
       $pdf->SetXY(12,105);
       $pdf->WriteHtmlCell(190,utf8_decode("En cas de r??siliation du contrat pour tous autres motifs pendant la p??riode de la mission du Consultant, celui-ci percevra un montant correspondant au prorata du temps de travaux effectu?? au cours de ladite p??riode."));

      $pdf->Ln(7);
      $pdf->SetFont('','BU',12);
      $pdf->Cell(33,5,( utf8_decode(html_entity_decode("Article 16. Force majeure"))),0,1,'C',0 );

      $pdf->Ln(5);
      $pdf->SetFont('');
      $pdf->SetX(4);
      $pdf->WriteHtmlCell(200,utf8_decode("On entend par cas de force majeure, tout ??v??nement ext??rieur, impr??visible, insurmontable, irr??sistible et ind??pendant de la volont?? des parties. Sont notamment consid??r??s comme cas de force majeure les ??v??nements suivants :"));

       $pdf->Ln(7); 
       $pdf->SetFillColor(0 , 0, 0);
       $pdf->SetX(13);
       $pdf->Rect(10,145,1, 1,'F');
       $pdf->SetFont('Times','',12);
       $pdf->SetXY(12,143);
       $pdf->WriteHtmlCell(190,utf8_decode("Les conflits sociaux ;"));

       $pdf->Ln(7); 
       $pdf->SetFillColor(0 , 0, 0);
       $pdf->SetX(13);
       $pdf->Rect(10,152,1, 1,'F');
       $pdf->SetFont('Times','',12);
       $pdf->SetXY(12,150);
       $pdf->WriteHtmlCell(190,utf8_decode("Les catastrophes naturelles ;"));

       $pdf->Ln(7); 
       $pdf->SetFillColor(0 , 0, 0);
       $pdf->SetX(13);
       $pdf->Rect(10,158,1, 1,'F');
       $pdf->SetFont('Times','',12);
       $pdf->SetXY(12,156);
       $pdf->WriteHtmlCell(190,utf8_decode("Les al??as ou les indisponibilit??s des r??seaux des t??l??phones mobiles et des acc??s internet;"));

        $pdf->Ln(7); 
       $pdf->SetFillColor(0 , 0, 0);
       $pdf->SetX(13);
       $pdf->Rect(10,165,1, 1,'F');
       $pdf->SetFont('Times','',12);
       $pdf->SetXY(12,163);
       $pdf->WriteHtmlCell(190,utf8_decode("La carence ou le retard des moyens de transport ;"));

       $pdf->Ln(7); 
       $pdf->SetFillColor(0 , 0, 0);
       $pdf->SetX(13);
       $pdf->Rect(10,172,1, 1,'F');
       $pdf->SetFont('Times','',12);
       $pdf->SetXY(12,170);
       $pdf->WriteHtmlCell(190,utf8_decode("Le fait du prince (??meute, pillage, gr??ve pr??visible ou impr??visible dont la dur??e et l'ampleur demeurent inconnues, vols ?? main arm??e, ordre de l'autorit?? publique, expropriation, r??quisition) ;"));

       $pdf->Ln(7); 
       $pdf->SetFillColor(0 , 0, 0);
       $pdf->SetX(13);
       $pdf->Rect(10,184,1, 1,'F');
       $pdf->SetFont('Times','',12);
       $pdf->SetXY(12,182);
       $pdf->WriteHtmlCell(190,utf8_decode("Panne d'??lectricit?? de grande ampleur."));

          
       $pdf->Ln(8);
       $pdf->SetFont('');
       $pdf->SetX(4);
       $pdf->WriteHtmlCell(200,utf8_decode("Il n'y a lieu ?? aucun dommages-int??r??ts lorsque, par suite d'une force majeure ou d'un cas fortuit, l'une des parties a ??t?? emp??ch??e de donner ou de faire ce ?? quoi elle ??tait oblig??e ou a fait ce qui lui ??tait interdit."));


       $pdf->Ln(8);
       $pdf->SetFont('');
       $pdf->SetX(4);
       $pdf->WriteHtmlCell(200,utf8_decode("La partie affect??e par l'??v??nement ayant le caract??re de force majeure avise l'autre dans un  d??lai de <b>deux (2) jours</b> par courrier ??lectronique ou appel t??l??phonique en pr??cisant la nature de cet ??v??nement, son effet, sa dur??e pr??visible et la reprise des services, apr??s la cessation de l'??v??nement. "));

       $pdf->Ln(8);
       $pdf->SetFont('');
       $pdf->SetX(4);
       $pdf->WriteHtmlCell(200,utf8_decode("En cas de  persistance de la force majeure  pendant plus de  <b>trente (30) jours </b>, les parties se r??servent  le droit de r??silier le pr??sent contrat  en totalit?? ou en partie. Dans ces conditions, le consultant sera pay?? selon le volume horaire des travaux effectivement r??alis??s  ?? la date de la r??siliation du contrat."));

      $pdf->Ln(8);
      $pdf->SetFont('','BU',12);
      $pdf->Cell(43,5,( utf8_decode(html_entity_decode("Article 17. Nullit?? d'une clause"))),0,1,'C',0 );

      $pdf->Ln(4);
      $pdf->SetFont('');
      $pdf->SetX(4);
      $pdf->WriteHtmlCell(200,utf8_decode("Si une ou plusieurs clauses du contrat sont tenues pour non valides ou d??clar??es comme telles en application d'une loi, d'un r??glement ou ?? la suite d'une d??cision judiciaire devenue d??finitive, les autres clauses garderont toute leur force et port??e."));

      $pdf->Ln(6);
      $pdf->SetFont('');
      $pdf->SetX(4);
      $pdf->WriteHtmlCell(200,utf8_decode("Le cas ??ch??ant, les parties s'efforceront de modifier le contrat afin qu'elle refl??te le plus fid??lement possible leur intention originelle. "));


      $pdf->AddPage(); //page 6
      $pdf->SetFont('','BU',12);
      $pdf->Cell(43,5,( utf8_decode(html_entity_decode("Article 18. Renonciation"))),0,1,'C',0 );

      $pdf->Ln(4);
      $pdf->SetFont('');
      $pdf->SetX(4);
      $pdf->WriteHtmlCell(200,utf8_decode("Le fait que l'une ou l'autre des parties ne revendique pas l'application d'une clause quelconque du  Contrat  ou acquiesce ?? son inex??cution, que ce soit de mani??re permanente ou temporaire, ne pourra ??tre interpr??t?? comme une renonciation par cette partie aux droits qui d??coulent pour elle de ladite clause. "));

      $pdf->Ln(7);
      $pdf->SetFont('','BU',12);
      $pdf->Cell(43,5,( utf8_decode(html_entity_decode("Article 19. Intuitu personae"))),0,1,'C',0 );

      $pdf->Ln(4);
      $pdf->SetFont('');
      $pdf->SetX(4);
      $pdf->WriteHtmlCell(200,utf8_decode("Le Contrat est conclu en consid??ration de la qualit?? des parties. En cons??quence, aucune partie ne peut le transmettre ?? un tiers qu'avec l'accord pr??alable et ??crit de l'autre."));

       $pdf->Ln(7);
      $pdf->SetFont('','BU',12);
      $pdf->Cell(32,5,( utf8_decode(html_entity_decode("Article 20. Int??gralit??"))),0,1,'C',0 );

      $pdf->Ln(4);
      $pdf->SetFont('');
      $pdf->SetX(4);
      $pdf->WriteHtmlCell(200,utf8_decode("Le contrat exprime l'int??gralit?? de la volont?? des parties. Tous contrats ou accords ant??rieurs portant sur le m??me objet sont r??voqu??s et remplac??s en toutes leurs stipulations par le pr??sent contrat."));


      $pdf->Ln(7);
      $pdf->SetFont('','BU',12);
      $pdf->Cell(70,5,( utf8_decode(html_entity_decode("Article 21. Notification - Election de domicile"))),0,1,'C',0 );

      $pdf->Ln(4);
      $pdf->SetFont('');
      $pdf->SetX(4);
      $pdf->WriteHtmlCell(200,utf8_decode("Sauf disposition contraire, toutes les notifications et communications relatives au Contrat seront effectu??es, au choix de l'exp??diteur, (i) par courrier ??lectronique avec accus?? de r??ception aux adresses indiqu??es ci-dessous, ou aux adresses indiqu??es dans l???en-t??te de ce document (ii) par lettre recommand??e avec accus?? de r??ception, (iii) par lettre port??e contre r??c??piss??. "));


      $pdf->Ln(7);
      $pdf->SetFont('');
      $pdf->SetX(4);
      $pdf->WriteHtmlCell(200,utf8_decode("Pour l'ex??cution des pr??sentes et de leurs suites, les Parties font ??lection de domicile en leur si??ge et domicile indiqu?? ?? l'en-t??te de ce document. "));

      $pdf->Ln(7);
      $pdf->SetFont('');
      $pdf->SetX(4);
      $pdf->WriteHtmlCell(200,utf8_decode("Les notifications ou communications seront r??put??es avoir ??t?? effectu??es: "));

       $pdf->Ln(7); 
       $pdf->SetFillColor(0 , 0, 0);
       $pdf->SetX(13);
       $pdf->Rect(10,130,1, 1,'F');
       $pdf->SetFont('Times','',12);
       $pdf->SetXY(12,128);
       $pdf->WriteHtmlCell(190,utf8_decode("A la date figurant sur l'accus?? de r??ception en cas d'envoi par courrier postal ou ??lectronique, toutefois, si la date de r??ception ne correspond pas ?? un Jour Ouvr?? ou si l'heure de r??ception est apr??s 17 heures , la date de r??ception sera le premier Jour Ouvr?? suivant ; ou "));


      $pdf->Ln(7); 
       $pdf->SetFillColor(0 , 0, 0);
       $pdf->SetX(13);
       $pdf->Rect(10,146,1, 1,'F');
       $pdf->SetFont('Times','',12);
       $pdf->SetXY(12,144);
       $pdf->WriteHtmlCell(190,utf8_decode("A la date figurant sur le r??c??piss??, en cas de remise par porteur ;"));

       $pdf->Ln(7); 
       $pdf->SetFillColor(0 , 0, 0);
       $pdf->SetX(13);
       $pdf->Rect(10,152,1, 1,'F');
       $pdf->SetFont('Times','',12);
       $pdf->SetXY(12,150);
       $pdf->WriteHtmlCell(190,utf8_decode("A la date figurant sur le proc??s- verbal en cas de remise par exploit d'huissier."));

      $pdf->Ln(7);
      $pdf->SetFont('');
      $pdf->SetX(4);
      $pdf->WriteHtmlCell(200,utf8_decode("Les notifications ou communications par courrier ??lectronique doivent ??tre adress??es ?? : "));

      $pdf->Ln(8);
      $pdf->SetFont('','B',12);
      $pdf->Cell(15,5,( utf8_decode(html_entity_decode("Pour NGSER:"))),0,1,'C',0 );

      $pdf->Ln(3);
      $pdf->SetFont('');
      $pdf->SetX(4);
      $pdf->WriteHtmlCell(200,utf8_decode("- Le G??rant: S??bastien ELLEPO, <i>sebastien.ellepo@ngser.com</i>"));

      $pdf->Ln(6);
      $pdf->SetFont('');
      $pdf->SetX(4);
      $pdf->WriteHtmlCell(200,utf8_decode("- Le Co-g??rant: Michel Lucien KASSI, <i>michel.kassi@ngser.com</i>"));

      $pdf->Ln(8);
      $pdf->SetFont('','B',12);
      $pdf->Cell(25,5,( utf8_decode(html_entity_decode("Pour le Consultant :"))),0,1,'C',0 );

      $pdf->Ln(3);
      $pdf->SetFont('');
      $pdf->SetX(4);
      $pdf->WriteHtmlCell(200,utf8_decode("- xxxxxxxxxxxxxxxx "));

      $pdf->Ln(7);
      $pdf->SetFont('','BU',12);
      $pdf->Cell(58,5,( utf8_decode(html_entity_decode("Article 22. R??glement des diff??rends"))),0,1,'C',0 );

      $pdf->Ln(7);
      $pdf->SetFont('');
      $pdf->SetX(4);
      $pdf->WriteHtmlCell(200,utf8_decode("En cas de diff??rends entre les parties, ayant trait ?? la validit??, l'interpr??tation, l'ex??cution ou l'inex??cution du contrat, elles s'obligent ?? se concerter et ?? rechercher un r??glement amiable dans un d??lai de trente (30) jours suivant la notification par l'une des parties ?? l'autre, de l'objet du diff??rend. En cas de persistance du d??saccord ?? l'expiration du d??lai indiqu?? ci-dessus, le litige sera soumis au Tribunal dont d??pend le domicile du consultant."));

      $pdf->Ln(7);
      $pdf->SetFont('');
      $pdf->SetX(4);
      $pdf->WriteHtmlCell(200,utf8_decode("Fait ?? Abidjan le xxxxxxxxxxxxxxxxx,"));

      $pdf->Ln(7);
      $pdf->SetFont('');
      $pdf->SetX(4);
      $pdf->WriteHtmlCell(200,utf8_decode("En deux (2) exemplaires originaux."));



       $pdf->AddPage(); //page 7

      $pdf->Ln(7);
      $pdf->SetFont('','BU',12);
      $pdf->Cell(60,5,( utf8_decode(html_entity_decode("Le Consultant"))),0,0,'C',0 );
      $pdf->Cell(150,5,( utf8_decode(html_entity_decode("NGSER"))),0,1,'C',0 );


       $pdf->Ln(20);
      $pdf->SetFont('');
      $pdf->Cell(60,5,( utf8_decode(html_entity_decode("xxxxxxxxxxxxxxx"))),0,0,'C',0 );
      $pdf->Cell(150,5,( utf8_decode(html_entity_decode("ELLEPO S??bastien "))),0,1,'C',0 );









       $pdf->Output();

      


?>