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
      $pdf->Cell(80,10,strtoupper( utf8_decode("CONTRAT DE PRESTATION  DE SERVICES NGSER-CONSULTANT ")),0,1,'C',0 );
       
      $pdf->SetXY(26,40);
      $pdf->SetFont('','B',12);
      $pdf->Cell(5,10,( utf8_decode("Entre :  ")),0,1,'C',0 );
      $pdf->SetFont('','BU',12);
      $pdf->SetXY(55,50);
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
       $pdf->Cell(105,6,( utf8_decode("Ci-après indifféremment désignée «  NGSER »  ou « le Client »")),0,1,'C',0 );
       $pdf->Ln(3);
       $pdf->Cell(15,6,( html_entity_decode("D' une part ")),0,1,'C',0 );
       $pdf->Ln(3);
       $pdf->Cell(1,6,( html_entity_decode("ET ")),0,1,'C',0 );
      $pdf->SetFont('','B',12);
      $pdf->Cell(48,5,( utf8_decode("Monsieur xxxxxxxxxx, ")),0,1,'C',0 );   
      $pdf->SetFont('');
     $pdf->SetX(4.5);
      $pdf->WriteHtmlCell(195,utf8_decode("né le xxxxxx à xxxxxxxxxx, titulaire de la carte nationale d'identité immatriculée xxxxxxxx, domicilié à Abidjan-commune de xxxxxxxxxxxxx, ayant tous pouvoirs à l'effet des présentes,"));
       
      $pdf->Ln(6);
       $pdf->SetFont('','B',12);
      
      $pdf->Cell(90,5,( utf8_decode("Ci-après désigné « le Consultant » ou « le Prestataire »")),0,1,'C',0 );   
      $pdf->Ln(3);
       $pdf->Cell(15,6,( html_entity_decode("D'autre part ")),0,1,'C',0 );
       $pdf->Ln(3);
       $pdf->SetFont('');
      $pdf->Cell(90,5,( utf8_decode("NGSER et le consultant sont individuellement désignés  ")),0,0,'C',0 );
      $pdf->SetFont('','B',12);
      $pdf->Cell(25,5,( utf8_decode("« la partie » ")),0,0,'C',0 );   
      $pdf->SetFont('');
      $pdf->Cell(20,5,( utf8_decode("et ensemble")),0,0,'C',0 ); 
      $pdf->SetFont('','B',12);
      $pdf->Cell(28,5,( utf8_decode("« les parties »,")),0,1,'C',0 );  
      $pdf->Ln(5);
      $pdf->SetFont('','BU',12);    
       $pdf->Cell(100,5,( utf8_decode("IL A ETE PREALABLEMENT EXPOSE CE QUI SUIT :")),0,1,'C',0 );
       $pdf->Ln(3);
      $pdf->SetFont('');
      $pdf->SetX(5);
      $pdf->MultiCell(185,5, utf8_decode( html_entity_decode("NGSER est une société de droit ivoirien spécialisée dans toutes les opérations dans le domaine des télécommunications, le développement des Technologies de l'Information, le conseil et la gestion des projets des Nouvelles Technologies de l'Information et la Communication.") ) );
      $pdf->SetFont('','B',12);
      $pdf->Ln(3);
      $pdf->Cell(95,5,( utf8_decode("Monsieur xxxxxxxxxxxxx est un Analyste Programmeur.")),0,1,'C',0 );   
      $pdf->Ln(3);
      $pdf->SetFont('');
      $pdf->SetX(5);
      $pdf->MultiCell(185,5, utf8_decode( html_entity_decode("Au regard de ses compétences, la société NGSER a sollicité le consultant pour l'exécution de ses  projets informatiques.") ) );
      $pdf->Ln(3);
      $pdf->SetX(5);
      $pdf->MultiCell(185,5, utf8_decode( html_entity_decode("Le consultant ayant accepté la demande de NGSER, les parties ont établi le présent contrat qui fixe le cadre normatif de leur collaboration.") ) );
      $pdf->Ln(5);
      $pdf->SetFont('','BUI',12);
      $pdf->Cell(110,5,( utf8_decode("CECI EXPOSE, IL EST CONVENU ET ARRETE CE QUI SUIT : ")),0,1,'C',0 );
      $pdf->Ln(5);
      $pdf->SetFont('','BU',12);
      $pdf->Cell(80,5,( utf8_decode(html_entity_decode("Article 1. Valeur préambule - Annexes - Lexique"))),0,1,'C',0 );

      $pdf->SetFont('','B',12);
      $pdf->Ln(3);
      $pdf->Cell(55,5,( utf8_decode(html_entity_decode("1.1 Valeur du préambule-Annexes"))),0,1,'C',0 );
      $pdf->SetFont('');
      $pdf->Ln(2);
      $pdf->SetX(5);
      $pdf->MultiCell(185,5, utf8_decode( html_entity_decode("Le préambule ci-dessus et les annexes ci-jointes ont la même valeur juridique que le présent contrat cadre dont ils font partie intégrante.") ) );

      $pdf->SetFont('','B',12);
      $pdf->Ln(3);
      $pdf->Cell(35,5,( utf8_decode(html_entity_decode("1.2 Lexique contractuel"))),0,1,'C',0 );
      $pdf->SetFont('','B',12);
      $pdf->Ln(2);
      $pdf->Cell(12,5,( utf8_decode(html_entity_decode("Consultant "))),0,0,'C',0 );
      $pdf->SetFont('');
      $pdf->SetX(26);
      $pdf->MultiCell(185,5, utf8_decode( html_entity_decode("est la personne physique mandaté par NGSER pour réaliser les prestations ;") ) );
      $pdf->SetFont('','B',12);
      $pdf->Ln(2);
      $pdf->Cell(23,5,( utf8_decode(html_entity_decode("Délai d'exécution "))),0,0,'C',0 );
      $pdf->SetFont('');
      $pdf->SetX(37);
      $pdf->MultiCell(200,5, utf8_decode( html_entity_decode("désigne le délai prévu pour la réalisation des prestations ;") ) );

      $pdf->AddPage();  //page 2
      $pdf->SetFont('','B',12);
      $pdf->Ln(2);
      $pdf->Cell(12,5,( utf8_decode(html_entity_decode("Notification "))),0,0,'C',0 );
      $pdf->SetFont('');
      $pdf->SetX(27);
      $pdf->MultiCell(170,5, utf8_decode( html_entity_decode("désigne toute transmission d'information et/ou de demande ou réclamation effectuée dans le ") ) );
      $pdf->SetX(5);
      $pdf->Cell(30,5,( utf8_decode(html_entity_decode("cadre du contrat ;"))),0,1,'C',0 );
      $pdf->SetFont('','B',12);
      $pdf->Ln(2);
      $pdf->Cell(12,5,( utf8_decode(html_entity_decode("Jour Ouvré "))),0,0,'C',0 );
      $pdf->SetFont('');
      $pdf->SetX(27);
      $pdf->MultiCell(170,5, utf8_decode( html_entity_decode("désigne l'un quelconque des cinq (5) jours hebdomadaires du calendrier du lundi au vendredi ; ") ) );
       $pdf->SetFont('','B',12);
      $pdf->Ln(2);
      $pdf->SetX(7);
      $pdf->Cell(5,5,( utf8_decode(html_entity_decode("Jour "))),0,0,'C',0 );
      $pdf->SetFont('');
      $pdf->SetX(13);
      $pdf->MultiCell(170,5, utf8_decode( html_entity_decode("désigne un jour calendaire ;") ) );
       $pdf->SetFont('','B',12);
      $pdf->Ln(2);
      $pdf->Cell(31,5,( utf8_decode(html_entity_decode("Prestations ou Mission "))),0,0,'C',0 );
      $pdf->SetFont('');
      $pdf->SetX(45);
      $pdf->MultiCell(170,5, utf8_decode( html_entity_decode("désigne les prestations contractuelles convenues par les parties et devant être ") ) );
      $pdf->SetX(29);
      $pdf->Cell(60,5,( utf8_decode(html_entity_decode("fournies par le Consultant conformément au cahier des charges ;"))),0,1,'C',0 );
      $pdf->Ln(5);
      $pdf->SetFont('','BU',12);
      $pdf->Cell(50,5,( utf8_decode(html_entity_decode("Article 2. Documents contractuels"))),0,1,'C',0 );
      $pdf->SetFont('');
       $pdf->Ln(2);
       $pdf->SetX(3);
       $pdf->Cell(5,5,( utf8_decode(html_entity_decode("Les documents contractuels sont par ordre de priorité les pièces et actes suivants: "))),0,1,'L',0 );

      $pdf->Ln(2);
      $pdf->SetFont('Zapfdingbats','',12);  
      $pdf->Cell(5,5,chr(2799),0,0,'C',0 );
      $pdf->SetFont('Times','',12);
      $pdf->Cell(35,5,( utf8_decode(html_entity_decode("Le présent contrat"))),0,0,'C',0 );

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
      $pdf->Cell(100,5,( utf8_decode(html_entity_decode("Tout autre document afférent à l'exécution du contrat, acté par les parties."))),0,0,'C',0 );
       $pdf->Ln(7);
      $pdf->SetFont('','BU',12);
      $pdf->Cell(17,5,( utf8_decode(html_entity_decode("Article 3. Objet"))),0,1,'C',0 );
       $pdf->Ln(3);
        $pdf->SetFont('');
        $pdf->SetX(3.4);
      $pdf->Cell(1,5,( utf8_decode(html_entity_decode("Le Contrat a pour objet de préciser les termes et conditions dans lesquels NGSER engage le Consultant en qualité"))),0,0,'L',0 );
      $pdf->Ln(5);
       $pdf->SetFont('','B',12);
     $pdf->SetX(2);
     $pdf->WriteHtmlCell(200,utf8_decode("<b>d'Analyste Programmeur </b> pour l'exécution de divers projets informatiques, conformément au cahier des charges des missions annexé au contrat."));
      $pdf->Ln(10);
       $pdf->SetFont('','BU',12);
      $pdf->Cell(50,5,( utf8_decode(html_entity_decode("Article 4. Obligations des parties"))),0,1,'C',0 );
      $pdf->Ln(2);
      $pdf->SetFont('','B',12);
      $pdf->Cell(45,5,( utf8_decode(html_entity_decode("4.1 Obligations du Consultant"))),0,0,'C',0 );
      $pdf->SetFont('');
       $pdf->Ln(6);
      $pdf->SetX(4);
     $pdf->WriteHtmlCell(200,utf8_decode("Le Consultant s'engage à respecter toutes les obligations mises à sa charge dans le cadre du présent contrat et plus particulièrement à :"));
     $pdf->Ln(6);
     
     // $pdf->SetFont('Zapfdingbats','',12);  
       
     $pdf->SetFillColor(0 , 0, 0);
     $pdf->Rect(10,138,1, 1,'F');
      $pdf->SetFont('Times','',12);
       $pdf->SetX(13);
       $pdf->WriteHtmlCell(190,utf8_decode( html_entity_decode("Prendre toutes dispositions utiles pour réaliser sous sa seule responsabilité, toutes les prestations afférentes aux projets du Client notamment, la mise en oeuvre des livrables applicatifs et la gestion AGILE des projets, conformément au cahier des charges des missions. A cet effet, le Consultant apportera son savoir-faire, sa disponibilité et tous autres moyens nécessaires à l'exécution des prestations contractuelles dans les locaux du Client ou en tout lieu en cas de nécessité du service. Il a une obligation de résultat quant à la conformité des prestations par rapport aux besoins et attentes du Client ;")));
      $pdf->Ln(7);

       $pdf->SetFillColor(0 , 0, 0);
      $pdf->Rect(10,169,1, 1,'F');
      $pdf->SetFont('Times','',12);
       $pdf->SetX(13);
       $pdf->WriteHtmlCell(190,utf8_decode("Réaliser la mission conformément au délai d'exécution requis par Client ;"));
       $pdf->Ln(7);

       $pdf->SetFillColor(0 , 0, 0);
       $pdf->Rect(10,177,1, 1,'F');
       $pdf->SetFont('Times','',12);
       $pdf->SetX(13);
       $pdf->WriteHtmlCell(190,utf8_decode("Exécuter sa mission conformément aux règles en vigueur dans sa profession et en se conformant à toutes les données acquises dans son domaine de compétence ; "));
       $pdf->Ln(7);

      $pdf->SetFillColor(0 , 0, 0);
      $pdf->Rect(10,189,1, 1,'F');
      $pdf->SetFont('Times','',12);
       $pdf->SetX(13);
       $pdf->WriteHtmlCell(190,utf8_decode("Fournir un rapport mensuel d'activité"));
       $pdf->Ln(7);

       $pdf->SetFillColor(0 , 0, 0);
       $pdf->Rect(10,196,1, 1,'F');
       $pdf->SetFont('Times','',12);
       $pdf->SetX(13);
       $pdf->WriteHtmlCell(190,utf8_decode("Apporter son expertise et proposer au Client des solutions appropriées ;"));
      $pdf->Ln(10);

      $pdf->SetFont('','B',12);
      $pdf->Cell(35,5,( utf8_decode(html_entity_decode("4.2 Obligations du Client"))),0,0,'C',0 );
      $pdf->SetFont('');
       $pdf->Ln(6);
      $pdf->SetX(5);
     $pdf->WriteHtmlCell(200,utf8_decode("NGSER  s'engage à :"));
       $pdf->Ln(7);

       $pdf->SetFillColor(0 , 0, 0);
       $pdf->Rect(10,219,1, 1,'F');
       $pdf->SetFont('Times','',12);
       $pdf->SetX(13);
       $pdf->WriteHtmlCell(190,utf8_decode("Rémunérer le consultant selon les modalités définies à l'article 7 ci-dessous ;"));

       $pdf->Ln(7);
       $pdf->SetFillColor(0 , 0, 0);
       $pdf->Rect(10,226,1, 1,'F');
       $pdf->SetFont('Times','',12);
       $pdf->SetX(13);
       $pdf->WriteHtmlCell(190,utf8_decode("Désigner un interlocuteur principal capable de collaborer étroitement avec le Consultant pour la mise en oeuvre des projets;"));

        $pdf->Ln(7);
       $pdf->SetFillColor(0 , 0, 0);
       $pdf->Rect(10,238,1, 1,'F');
       $pdf->SetFont('Times','',12);
       $pdf->SetX(13);
       $pdf->WriteHtmlCell(190,utf8_decode("Prêter tout concours que le Consultant pourrait demander dans le cadre de ses obligations contractuelles. "));

       $pdf->Ln(7);
       $pdf->SetFillColor(0 , 0, 0);
       $pdf->Rect(10,245,1, 1,'F');
       $pdf->SetFont('Times','',12);
       $pdf->SetX(13);
       $pdf->WriteHtmlCell(190,utf8_decode("Valider les documents de recette des livrables fournis par le consultant"));
       

       $pdf->Ln(10);
       $pdf->SetFont('','BU',12);
      $pdf->Cell(22,5,( utf8_decode(html_entity_decode("Article 5. Durée"))),0,1,'C',0 );
      $pdf->Ln(2);
      $pdf->SetFont('');
       $pdf->SetX(4);
       $pdf->WriteHtmlCell(190,utf8_decode("Ce présent contrat est conclu pour une durée de xxxxxxxxxxx mois.<p>
Toutefois, les parties conviennent que le volume horaire mensuel de réalisation des travaux est fixé à xxx (xxxxxx) heures. <p/>
 Il expire dans les conditions stipulées à l'article 15 ci-dessous.
"));

          $pdf->AddPage(); //page 3

      $pdf->Ln(5);
      $pdf->SetFont('','BU',12);
      $pdf->Cell(80,5,( utf8_decode(html_entity_decode("Article 6. Modalités d'exécution des prestations"))),0,1,'C',0 );
      $pdf->Ln(2);
      $pdf->SetFont('');
       $pdf->SetX(4);
       $pdf->WriteHtmlCell(190,utf8_decode("A la demande de NGSER, le prestataire fournira les prestations soit dans les locaux de NGSER soit hors de la société conformément au cahier des charges de la mission qui lui a été confiée."));

        $pdf->Ln(8);
      $pdf->SetFont('');
       $pdf->SetX(4);
       $pdf->WriteHtmlCell(190,utf8_decode("Dès réception du cahier des charges de la mission par le prestataire, celui-ci est tenu de prendre toutes les dispositions nécessaires afin d'exécuter les prestations de services dans les délais convenus."));

        $pdf->Ln(8);
      $pdf->SetFont('');
       $pdf->SetX(4);
       $pdf->WriteHtmlCell(190,utf8_decode("Les parties conviennent qu'en l'absence de prestations fournies au cours d'une période mensuelle, le prestataire ne pourra prétendre à aucune rémunération au cours de ladite période. "));

       $pdf->Ln(8);
       $pdf->SetFont('');
       $pdf->SetX(4);
       $pdf->WriteHtmlCell(190,utf8_decode("Le prestataire informera NGSER sans délai de toutes les difficultés auxquelles il sera confronté au cours de l'exécution de ses prestations. A la demande de NGSER, le Consultant devra fournir des rapports résumant les actions réalisées dans l'exécution de ses prestations contractuelles. NGSER fournira au consultant toute information relative aux prestations qu'il pourra lui demander."));

         $pdf->Ln(10);
       $pdf->SetFont('','BU',12);
      $pdf->Cell(50,5,( utf8_decode(html_entity_decode("Article 7. Stipulations financières"))),0,1,'C',0 );
      $pdf->Ln(2);
      $pdf->SetFont('','B',12);
      $pdf->Cell(70,5,( utf8_decode(html_entity_decode("7.1 Rémunération des prestations de services"))),0,0,'C',0 );
      $pdf->SetFont('');
       $pdf->Ln(8);
      $pdf->SetX(4);
     $pdf->WriteHtmlCell(200,utf8_decode("La rémunération du prestataire est liée au volume horaire mensuel de réalisation des travaux."));

     $pdf->Ln(8);
     $pdf->SetX(4);
     $pdf->WriteHtmlCell(200,utf8_decode("Le volume horaire mensuel de réalisation des travaux est fixé à cent vingt (120) heures."));

      $pdf->Ln(8);
     $pdf->SetX(4);
     $pdf->WriteHtmlCell(200,utf8_decode("Sur la base du volume horaire mensuel des travaux effectivement réalisés par le prestataire et validés par le client, le prestataire percevra une rémunération mensuelle nette fixée à <b> xxxxxxxx (xxxxxxxxx) francs CFA </b>."));

      $pdf->Ln(10);
      $pdf->SetFont('','B',12);
      $pdf->Cell(60,5,( utf8_decode(html_entity_decode("7.2	Périodicité et modalités de paiement "))),0,0,'C',0 );
      $pdf->SetFont('');
       $pdf->Ln(8);
      $pdf->SetX(4);
     $pdf->WriteHtmlCell(200,utf8_decode("La rémunération mensuelle du prestataire doit être calculé en fonction du volume horaire mensuel des prestations effectuées par le prestataire sur la base du cahier des charges des missions qui lui ont été confiés."));

      $pdf->Ln(8);
     $pdf->SetX(4);
     $pdf->WriteHtmlCell(200,utf8_decode("Pour les besoins de chaque paiement, le prestataire doit transmettre chaque fin du mois à NGSER les documents énumérés ci-dessous :"));

     $pdf->Ln(8);
     $pdf->SetX(10);
     $pdf->WriteHtmlCell(200,utf8_decode("a.	Les fiches de fin travaux des livrables recettés et validés par les Responsables des Départements Technique Informatique et Projet ;"));

     $pdf->Ln(8);
     $pdf->SetX(10);
     $pdf->WriteHtmlCell(200,utf8_decode("b.	Les livrables documentaires techniques ;"));

      $pdf->Ln(8);
     $pdf->SetX(10);
     $pdf->WriteHtmlCell(200,utf8_decode("c.	Une copie de la fiche mensuelle du timesheet"));

     $pdf->Ln(8);
     $pdf->SetX(4);
     $pdf->WriteHtmlCell(200,utf8_decode("Les règlements du prestataire s'effectueront en espèces, dans un délai de dix (10) jours au plus tard après la réception mensuelle des documents de fin travaux et des livrables documentaires."));

     $pdf->Ln(8);
      $pdf->SetFont('','BU',12);
      $pdf->Cell(20,5,( utf8_decode(html_entity_decode("Article 8. Fiscalité"))),0,1,'C',0 );

      $pdf->Ln(2);
      $pdf->SetFont('');
       $pdf->SetX(4);
       $pdf->WriteHtmlCell(200,utf8_decode("NGSER  reste tenue du paiement des impôts, droits et taxes de toutes natures grevant  l'exécution des prestations."));

        $pdf->Ln(8);
      $pdf->SetFont('','BU',12);
      $pdf->Cell(50,5,( utf8_decode(html_entity_decode("Article 9. Indépendance des parties"))),0,1,'C',0 );

       $pdf->Ln(2);
      $pdf->SetFont('');
       $pdf->SetX(4);
       $pdf->WriteHtmlCell(200,utf8_decode("Les Parties sont des professionnels indépendants l'un de l'autre qui agiront toujours comme tels."));

      $pdf->Ln(8);
      $pdf->SetX(4);
      $pdf->WriteHtmlCell(200,utf8_decode("Les Parties déclarent que le Contrat ne saurait en aucun cas s'analyser en un contrat de travail  au sens de l'article 2 de la loi n° 2015-532 du 20 juillet 1015 portant Code du travail. "));

      $pdf->Ln(8);
      $pdf->SetX(4);
      $pdf->WriteHtmlCell(200,utf8_decode("Le consultant déclare en conséquence être indépendant vis-à-vis du Client. A ce titre, le Client ne peut être responsable envers le Consultant de tous droits dont un salarié peut bénéficier conformément à la législation du travail mentionné dans le présent article et tous autres textes règlementaires afférents à cette législation en vigueur."));


      $pdf->AddPage(); //page 4
       $pdf->Ln(8);
      $pdf->SetFont('','BU',12);
      $pdf->Cell(37,5,( utf8_decode(html_entity_decode("Article 10. Confidentialité"))),0,1,'C',0 );

       $pdf->Ln(2);
       $pdf->SetFont('');
       $pdf->SetX(4);
       $pdf->WriteHtmlCell(200,utf8_decode("Le Consultant s'engage à observer la discrétion la plus stricte sur les informations se rapportant aux activités de la société NGSER auxquelles il aura accès à l'occasion du présent contrat."));

       $pdf->Ln(8);
       $pdf->SetFont('');
       $pdf->SetX(4);
       $pdf->WriteHtmlCell(200,utf8_decode("Notamment, il ne devra pas divulguer à quiconque les informations techniques, commerciales, marketing, financières ainsi que toutes autres informations liées aux activités de NGSER qui sont couvertes par le secret professionnel le plus strict. Il sera lié par la même obligation vis-à-vis de tout renseignement ou document dont il aura pris connaissance chez les partenaires commerciaux de la société NGSER."));

      $pdf->Ln(8);
       $pdf->SetFont('');
       $pdf->SetX(4);
       $pdf->WriteHtmlCell(200,utf8_decode("Tous les documents, lettres, notes de service, instructions, méthodes, organisation et/ou fonctionnement de l'entreprise dont il pourra avoir connaissance dans l'exercice de sa fonction, seront confidentiels et resteront la propriété exclusive de la Société."));

      $pdf->Ln(8);
       $pdf->SetFont('');
       $pdf->SetX(4);
       $pdf->WriteHtmlCell(200,utf8_decode("Le Consultant ne pourra, sans accord écrit de la Société  NGSER, publier aucune étude sous quelque forme que ce soit portant sur des projets ou des informations couverts par l'obligation de confidentialité. Cette obligation de confidentialité se prolongera après la cessation du contrat de prestation de services, quelle qu'en soit la cause."));

        $pdf->Ln(8);
       $pdf->SetFont('');
       $pdf->SetX(4);
       $pdf->WriteHtmlCell(200,utf8_decode("Le Consultant, toutefois, ne saurait être tenu pour responsable d'aucune divulgation si les informations divulguées étaient dans le domaine public à la date de la divulgation, ou s'il en avait connaissance, ou les obtenait de tiers par des moyens légitimes. "));


      $pdf->Ln(8);
      $pdf->SetFont('','BU',12);
      $pdf->Cell(45,5,( utf8_decode(html_entity_decode("Article 11. Recette des travaux "))),0,1,'C',0 );

       $pdf->Ln(2);
       $pdf->SetFont('');
       $pdf->SetX(4);
       $pdf->WriteHtmlCell(200,utf8_decode("Tous les travaux donnent lieu à recette globale. Elle a lieu selon les délais convenus par les parties. Sauf objection motivée par NGSER, il sera procédé à la recette définitive des travaux et des livrables documentaires associés."));

       $pdf->Ln(8);
       $pdf->SetFont('');
       $pdf->SetX(4);
       $pdf->WriteHtmlCell(200,utf8_decode("La recette définitive des travaux est constatée par un procès-verbal de recette contradictoire signé par les parties."));


      $pdf->Ln(8);
      $pdf->SetFont('','BU',12);
      $pdf->Cell(37,5,( utf8_decode(html_entity_decode("Article 12. Responsabilité "))),0,1,'C',0 );

       $pdf->Ln(2);
       $pdf->SetFont('');
       $pdf->SetX(4);
       $pdf->WriteHtmlCell(200,utf8_decode("Chaque partie est responsable de la mauvaise exécution ou de l'inexécution totale ou partielle de ses obligations qui lui incombent au titre du contrat. Les parties s'engagent exécuter de bonne foi et sans réserve le contrat et s'abstiennent de toutes manoeuvres abusives et dilatoires sous quelques formes que ce soient, empêchant ou restreignant sa bonne exécution."));

       $pdf->Ln(8);
       $pdf->SetFont('');
       $pdf->SetX(4);
       $pdf->WriteHtmlCell(200,utf8_decode("Le prestataire reconnaît que le respect de la confidentialité des informations du client est un engagement essentiel du contrat."));

       
       $pdf->Ln(8);
       $pdf->SetFont('');
       $pdf->SetX(4);
       $pdf->WriteHtmlCell(200,utf8_decode("Le Consultant engage sa responsabilité civile et pénale en cas d’utilisation frauduleuse des informations confidentielles du client."));

        
       $pdf->Ln(8);
       $pdf->SetFont('');
       $pdf->SetX(4);
       $pdf->WriteHtmlCell(200,utf8_decode("Le consultant est responsable de tous préjudices subis par le client, liés à la violation de la clause de confidentialité susmentionnée."));


      $pdf->Ln(8);
      $pdf->SetFont('','BU',12);
      $pdf->Cell(45,5,( utf8_decode(html_entity_decode("Article 13. Résultats des projets"))),0,1,'C',0 );

       $pdf->Ln(2);
       $pdf->SetFont('');
       $pdf->SetX(4);
       $pdf->WriteHtmlCell(200,utf8_decode("La propriété intellectuelle des œuvres réalisées, notamment les résultats des études, les schémas techniques, les livrables Applicatifs, les documents élaborés etc., en application du présent contrat, est attribuée au client. A cette fin, le Consultant transfère au client tous les droits sur les œuvres précitées : droit de reproduction, droit de représentation, droit de commercialisation, droit d'usage, de détention, d'adaptation, de traduction, et plus généralement, tous droits d'exploitation."));

      $pdf->Ln(8);
      $pdf->SetFont('','BU',12);
      $pdf->Cell(35,5,( utf8_decode(html_entity_decode("Article 14. Sous-traitance"))),0,1,'C',0 );

       $pdf->Ln(2);
       $pdf->SetFont('');
       $pdf->SetX(4);
       $pdf->WriteHtmlCell(200,utf8_decode("Dans le cadre de ce contrat, le Consultant n'est autorisé à sous-traiter les prestations liées à l'exécution d'un quelconque projet qu'avec l'accord préalable de NGSER."));

      $pdf->AddPage(); //page 5

      $pdf->Ln(2);
      $pdf->SetFont('','BU',12);
      $pdf->Cell(30,5,( utf8_decode(html_entity_decode("Article 15. Résiliation"))),0,1,'C',0 );

      $pdf->Ln(2);
      $pdf->SetFont('','B',12);
      $pdf->Cell(17,5,( utf8_decode(html_entity_decode("15.1 Condition"))),0,1,'C',0 );  

      $pdf->Ln(5);
      $pdf->SetFont('');
      $pdf->SetX(4);
      $pdf->WriteHtmlCell(200,utf8_decode("Le Contrat prend fin dans les conditions ci-après : "));

       $pdf->Ln(7); 
       $pdf->SetFillColor(0 , 0, 0);
       $pdf->SetX(13);
       $pdf->Rect(10,40,1, 1,'F');
       $pdf->SetFont('Times','',12);
       $pdf->SetXY(12,38);
       $pdf->WriteHtmlCell(190,utf8_decode("Au terme de la période stipulée à l'article 5 ci-dessus ;"));

       $pdf->Ln(7); 
       $pdf->SetFillColor(0 , 0, 0);
       $pdf->SetX(13);
       $pdf->Rect(10,47,1, 1,'F');
       $pdf->SetFont('Times','',12);
       $pdf->SetXY(12,45);
       $pdf->WriteHtmlCell(190,utf8_decode("Chaque Partie peut résilier le Contrat de plein droit en cas de manquement par l'autre Partie à toute stipulation contractuelle, non réparé dans un délai de cinq (05) jours, à compter de la réception d’une notification écrite du manquement adressée par la Partie non fautive, qui devra décrire de manière suffisamment détaillée, la nature du manquement. La résiliation sera sans préjudice de tout autre recours que la Partie non fautive serait en droit d'exercer."));

       $pdf->Ln(7); 
       $pdf->SetFillColor(0 , 0, 0);
       $pdf->SetX(13);
       $pdf->Rect(10,72,1, 1,'F');
       $pdf->SetFont('Times','',12);
       $pdf->SetXY(12,70);
       $pdf->WriteHtmlCell(190,utf8_decode("Pour tout autre motif, après le respect d'un préavis d'un (01) mois."));

      $pdf->Ln(8);
      $pdf->SetFont('','B',12);
      $pdf->Cell(10,5,( utf8_decode(html_entity_decode("15.2 Effets"))),0,1,'C',0 );  

       $pdf->Ln(7); 
       $pdf->SetFillColor(0 , 0, 0);
       $pdf->SetX(13);
       $pdf->Rect(10,89,1, 1,'F');
       $pdf->SetFont('Times','',12);
       $pdf->SetXY(12,87);
       $pdf->WriteHtmlCell(190,utf8_decode("En cas de résiliation due à une faute du consultant, NGSER aura le droit de demander des dommages-intérêts pour la perte de profits causée par ladite faute et aucun montant ne sera dû au consultant au titre des prestations exécutées à la date de la résiliation. "));


       $pdf->Ln(7); 
       $pdf->SetFillColor(0 , 0, 0);
       $pdf->SetX(13);
       $pdf->Rect(10,107,1, 1,'F');
       $pdf->SetFont('Times','',12);
       $pdf->SetXY(12,105);
       $pdf->WriteHtmlCell(190,utf8_decode("En cas de résiliation du contrat pour tous autres motifs pendant la période de la mission du Consultant, celui-ci percevra un montant correspondant au prorata du temps de travaux effectué au cours de ladite période."));

      $pdf->Ln(7);
      $pdf->SetFont('','BU',12);
      $pdf->Cell(33,5,( utf8_decode(html_entity_decode("Article 16. Force majeure"))),0,1,'C',0 );

      $pdf->Ln(5);
      $pdf->SetFont('');
      $pdf->SetX(4);
      $pdf->WriteHtmlCell(200,utf8_decode("On entend par cas de force majeure, tout évènement extérieur, imprévisible, insurmontable, irrésistible et indépendant de la volonté des parties. Sont notamment considérés comme cas de force majeure les évènements suivants :"));

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
       $pdf->WriteHtmlCell(190,utf8_decode("Les aléas ou les indisponibilités des réseaux des téléphones mobiles et des accès internet;"));

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
       $pdf->WriteHtmlCell(190,utf8_decode("Le fait du prince (émeute, pillage, grève prévisible ou imprévisible dont la durée et l'ampleur demeurent inconnues, vols à main armée, ordre de l'autorité publique, expropriation, réquisition) ;"));

       $pdf->Ln(7); 
       $pdf->SetFillColor(0 , 0, 0);
       $pdf->SetX(13);
       $pdf->Rect(10,184,1, 1,'F');
       $pdf->SetFont('Times','',12);
       $pdf->SetXY(12,182);
       $pdf->WriteHtmlCell(190,utf8_decode("Panne d'électricité de grande ampleur."));

          
       $pdf->Ln(8);
       $pdf->SetFont('');
       $pdf->SetX(4);
       $pdf->WriteHtmlCell(200,utf8_decode("Il n'y a lieu à aucun dommages-intérêts lorsque, par suite d'une force majeure ou d'un cas fortuit, l'une des parties a été empêchée de donner ou de faire ce à quoi elle était obligée ou a fait ce qui lui était interdit."));


       $pdf->Ln(8);
       $pdf->SetFont('');
       $pdf->SetX(4);
       $pdf->WriteHtmlCell(200,utf8_decode("La partie affectée par l'évènement ayant le caractère de force majeure avise l'autre dans un  délai de <b>deux (2) jours</b> par courrier électronique ou appel téléphonique en précisant la nature de cet évènement, son effet, sa durée prévisible et la reprise des services, après la cessation de l'évènement. "));

       $pdf->Ln(8);
       $pdf->SetFont('');
       $pdf->SetX(4);
       $pdf->WriteHtmlCell(200,utf8_decode("En cas de  persistance de la force majeure  pendant plus de  <b>trente (30) jours </b>, les parties se réservent  le droit de résilier le présent contrat  en totalité ou en partie. Dans ces conditions, le consultant sera payé selon le volume horaire des travaux effectivement réalisés  à la date de la résiliation du contrat."));

      $pdf->Ln(8);
      $pdf->SetFont('','BU',12);
      $pdf->Cell(43,5,( utf8_decode(html_entity_decode("Article 17. Nullité d'une clause"))),0,1,'C',0 );

      $pdf->Ln(4);
      $pdf->SetFont('');
      $pdf->SetX(4);
      $pdf->WriteHtmlCell(200,utf8_decode("Si une ou plusieurs clauses du contrat sont tenues pour non valides ou déclarées comme telles en application d'une loi, d'un règlement ou à la suite d'une décision judiciaire devenue définitive, les autres clauses garderont toute leur force et portée."));

      $pdf->Ln(6);
      $pdf->SetFont('');
      $pdf->SetX(4);
      $pdf->WriteHtmlCell(200,utf8_decode("Le cas échéant, les parties s'efforceront de modifier le contrat afin qu'elle reflète le plus fidèlement possible leur intention originelle. "));


      $pdf->AddPage(); //page 6
      $pdf->SetFont('','BU',12);
      $pdf->Cell(43,5,( utf8_decode(html_entity_decode("Article 18. Renonciation"))),0,1,'C',0 );

      $pdf->Ln(4);
      $pdf->SetFont('');
      $pdf->SetX(4);
      $pdf->WriteHtmlCell(200,utf8_decode("Le fait que l'une ou l'autre des parties ne revendique pas l'application d'une clause quelconque du  Contrat  ou acquiesce à son inexécution, que ce soit de manière permanente ou temporaire, ne pourra être interprété comme une renonciation par cette partie aux droits qui découlent pour elle de ladite clause. "));

      $pdf->Ln(7);
      $pdf->SetFont('','BU',12);
      $pdf->Cell(43,5,( utf8_decode(html_entity_decode("Article 19. Intuitu personae"))),0,1,'C',0 );

      $pdf->Ln(4);
      $pdf->SetFont('');
      $pdf->SetX(4);
      $pdf->WriteHtmlCell(200,utf8_decode("Le Contrat est conclu en considération de la qualité des parties. En conséquence, aucune partie ne peut le transmettre à un tiers qu'avec l'accord préalable et écrit de l'autre."));

       $pdf->Ln(7);
      $pdf->SetFont('','BU',12);
      $pdf->Cell(32,5,( utf8_decode(html_entity_decode("Article 20. Intégralité"))),0,1,'C',0 );

      $pdf->Ln(4);
      $pdf->SetFont('');
      $pdf->SetX(4);
      $pdf->WriteHtmlCell(200,utf8_decode("Le contrat exprime l'intégralité de la volonté des parties. Tous contrats ou accords antérieurs portant sur le même objet sont révoqués et remplacés en toutes leurs stipulations par le présent contrat."));


      $pdf->Ln(7);
      $pdf->SetFont('','BU',12);
      $pdf->Cell(70,5,( utf8_decode(html_entity_decode("Article 21. Notification - Election de domicile"))),0,1,'C',0 );

      $pdf->Ln(4);
      $pdf->SetFont('');
      $pdf->SetX(4);
      $pdf->WriteHtmlCell(200,utf8_decode("Sauf disposition contraire, toutes les notifications et communications relatives au Contrat seront effectuées, au choix de l'expéditeur, (i) par courrier électronique avec accusé de réception aux adresses indiquées ci-dessous, ou aux adresses indiquées dans l’en-tête de ce document (ii) par lettre recommandée avec accusé de réception, (iii) par lettre portée contre récépissé. "));


      $pdf->Ln(7);
      $pdf->SetFont('');
      $pdf->SetX(4);
      $pdf->WriteHtmlCell(200,utf8_decode("Pour l'exécution des présentes et de leurs suites, les Parties font élection de domicile en leur siège et domicile indiqué à l'en-tête de ce document. "));

      $pdf->Ln(7);
      $pdf->SetFont('');
      $pdf->SetX(4);
      $pdf->WriteHtmlCell(200,utf8_decode("Les notifications ou communications seront réputées avoir été effectuées: "));

       $pdf->Ln(7); 
       $pdf->SetFillColor(0 , 0, 0);
       $pdf->SetX(13);
       $pdf->Rect(10,130,1, 1,'F');
       $pdf->SetFont('Times','',12);
       $pdf->SetXY(12,128);
       $pdf->WriteHtmlCell(190,utf8_decode("A la date figurant sur l'accusé de réception en cas d'envoi par courrier postal ou électronique, toutefois, si la date de réception ne correspond pas à un Jour Ouvré ou si l'heure de réception est après 17 heures , la date de réception sera le premier Jour Ouvré suivant ; ou "));


      $pdf->Ln(7); 
       $pdf->SetFillColor(0 , 0, 0);
       $pdf->SetX(13);
       $pdf->Rect(10,146,1, 1,'F');
       $pdf->SetFont('Times','',12);
       $pdf->SetXY(12,144);
       $pdf->WriteHtmlCell(190,utf8_decode("A la date figurant sur le récépissé, en cas de remise par porteur ;"));

       $pdf->Ln(7); 
       $pdf->SetFillColor(0 , 0, 0);
       $pdf->SetX(13);
       $pdf->Rect(10,152,1, 1,'F');
       $pdf->SetFont('Times','',12);
       $pdf->SetXY(12,150);
       $pdf->WriteHtmlCell(190,utf8_decode("A la date figurant sur le procès- verbal en cas de remise par exploit d'huissier."));

      $pdf->Ln(7);
      $pdf->SetFont('');
      $pdf->SetX(4);
      $pdf->WriteHtmlCell(200,utf8_decode("Les notifications ou communications par courrier électronique doivent être adressées à : "));

      $pdf->Ln(8);
      $pdf->SetFont('','B',12);
      $pdf->Cell(15,5,( utf8_decode(html_entity_decode("Pour NGSER:"))),0,1,'C',0 );

      $pdf->Ln(3);
      $pdf->SetFont('');
      $pdf->SetX(4);
      $pdf->WriteHtmlCell(200,utf8_decode("- Le Gérant: Sébastien ELLEPO, <i>sebastien.ellepo@ngser.com</i>"));

      $pdf->Ln(6);
      $pdf->SetFont('');
      $pdf->SetX(4);
      $pdf->WriteHtmlCell(200,utf8_decode("- Le Co-gérant: Michel Lucien KASSI, <i>michel.kassi@ngser.com</i>"));

      $pdf->Ln(8);
      $pdf->SetFont('','B',12);
      $pdf->Cell(25,5,( utf8_decode(html_entity_decode("Pour le Consultant :"))),0,1,'C',0 );

      $pdf->Ln(3);
      $pdf->SetFont('');
      $pdf->SetX(4);
      $pdf->WriteHtmlCell(200,utf8_decode("- xxxxxxxxxxxxxxxx "));

      $pdf->Ln(7);
      $pdf->SetFont('','BU',12);
      $pdf->Cell(58,5,( utf8_decode(html_entity_decode("Article 22. Règlement des différends"))),0,1,'C',0 );

      $pdf->Ln(7);
      $pdf->SetFont('');
      $pdf->SetX(4);
      $pdf->WriteHtmlCell(200,utf8_decode("En cas de différends entre les parties, ayant trait à la validité, l'interprétation, l'exécution ou l'inexécution du contrat, elles s'obligent à se concerter et à rechercher un règlement amiable dans un délai de trente (30) jours suivant la notification par l'une des parties à l'autre, de l'objet du différend. En cas de persistance du désaccord à l'expiration du délai indiqué ci-dessus, le litige sera soumis au Tribunal dont dépend le domicile du consultant."));

      $pdf->Ln(7);
      $pdf->SetFont('');
      $pdf->SetX(4);
      $pdf->WriteHtmlCell(200,utf8_decode("Fait à Abidjan le xxxxxxxxxxxxxxxxx,"));

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
      $pdf->Cell(150,5,( utf8_decode(html_entity_decode("ELLEPO Sébastien "))),0,1,'C',0 );









       $pdf->Output();

      


?>