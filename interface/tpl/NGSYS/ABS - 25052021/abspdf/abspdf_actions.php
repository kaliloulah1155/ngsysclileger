<?php

// Send Headers


    include ('../../../../../configuration_w/mabd.php');
    require('../../../../../configuration_w/PDF/fpdf.php');

 

 
     $numposeidon= $_GET['numposeidon'] ;

   
      class PDF extends FPDF
      {
            // En-tête
            function Header()
            {
                // Logo
                $this->Image('../../../../../images/logo/ngser.png',10,6,50,15);
                 $this->Ln(10);
                // Police Arial gras 15
                $this->SetFont('Arial','B',15);
                
                // Décalage à droite 8cm
                $this->Cell(65);
                // Titre
                $this->SetDrawColor(0,80,180);
                $this->SetFillColor(230,230,0);
                $this->SetTextColor(0,0,0);
                $this->SetLineWidth(1);
                $this->Cell(80,10,"AUTORISATION D'ABSENCE",1,0,'C');
                // Saut de ligne
                $this->Ln(15);
            }

   
            // Pied de page
            function Footer()
            {
                // Positionnement à 1,5 cm du bas
                $this->SetY(-20);
                // Police Arial italique 10
                $this->SetFont('Arial','',10);
                //couleur du text
                $this->SetTextColor(135, 206, 250); 
                // Numéro de page
                 $this->Cell(12);
                $this->Cell(12,10,utf8_decode('Plateau, avenue Lamblin, Imm MATCA, 4ème Etage, Tel/Fax : 20 22 12 53 28 BP 722 Abidjan 28'),0,0,'L');
                $this->Ln(5);
                 $this->Cell(5);
                $this->Cell(12,10,utf8_decode('RCCM : CI- ABJ-03-2020-M-11141 CC : 09 09 52 9 Q Compte Bancaire NSIA : CI 042 0131 031360286954 87'),0,0,'L');
                 $this->Ln(5);
                 $this->Cell(60);
                $this->Cell(12,10,utf8_decode('www.ngser.com  - info@ngser.com'),0,0,'L');
            }
      }

      //traitement des données
      $query =" SELECT  \"NOM\",\"PRE\" ,\"AUN\",\"DPT\",\"HRA\",\"DT4\",\"DRU\",\"COM\",\"INT\",\"DOS\",\"DCR\",\"DSC\",\"AUS\"    FROM public.pos_tab_index_abs WHERE  \"NUD\" ='".$numposeidon."'";
      $contests = pg_query($query) or die('Query failed: ' . pg_last_error());
   

      $nom="";
      $prenoms="";
      $typauto="";
      $departement="";
      $duree=$_GET['duree'];
      $heure="";
      $datedepart="";
      $dateretour="";
      $motif="";
      $interimaire="";
      $dossier="";
     $datecrea="";
     $motifrefus="";
     $choixdir="";


     
       while ($row = pg_fetch_row($contests)) {
          $nom= $row[0];
          $prenoms= $row[1];
          $typauto= $row[2];
          $departement= $row[3];
          $heure= $row[4];
          $datedepart=  $row[5] ;
          $dateretour= $row[6];
          $motif= $row[7];
          $interimaire= $row[8];
          $dossier= $row[9];
          $datecrea= $row[10];
          $motifrefus= $row[11];
          $choixdir= $row[12];
        
      }


        // Instanciation de la classe dérivée
        $pdf = new PDF();
        $pdf->AliasNbPages();
        $pdf->AddPage();
        $pdf->SetFont('Times','',12);
          
        $pdf->Cell(70,8,strtoupper( utf8_decode('Autorisation : ')),0,0  );
        $pdf->Cell(35,8,strtoupper( utf8_decode($typauto )),0,1);

        $pdf->Cell(70,8,strtoupper( utf8_decode("NOM ET PRÉNOMS : ")),0,0  );
        $pdf->Cell(40,8,strtoupper( utf8_decode($nom.'  '.$prenoms )),0,1);

        $pdf->Cell(70,8,strtoupper( utf8_decode('DÉPARTEMENT  : ')),0,0  );
        $pdf->Cell(40,8,strtoupper( utf8_decode($departement )),0,1);

        $pdf->Cell(70,8,strtoupper( utf8_decode('DURÉE  : ')),0,0  );
        $pdf->Cell(40,8,( utf8_decode($duree. ($duree <= 1 ? ' jour ':' jours ').$heure.($heure <= 1 ? ' heure ':' heures ') )),0,1);

        $pdf->Cell(70,8,strtoupper( utf8_decode('DATE DE DÉPART  : ')),0,0  );
        $pdf->Cell(40,8,strtoupper( utf8_decode($datedepart )),0,1);

         $pdf->Cell(70,8,strtoupper( utf8_decode('DATE DE RETOUR  : ')),0,0  );
        $pdf->Cell(40,8,( html_entity_decode($dateretour  )),0,1);

        $pdf->setY(90);

        $pdf->Cell(42,8,strtoupper( utf8_decode('MOTIF  : ')),0,0  );
       $pdf->MultiCell(140,5, ( html_entity_decode($motif) ));
         
        $pdf->Cell(60,20,strtoupper( utf8_decode('INTERIMAIRE  : ')),0,0  );
        $pdf->Cell(40,20,( utf8_decode($interimaire   )),0,1);

        $pdf->Cell(50,8,strtoupper( utf8_decode('DOSSIER EN COURS  : ')),0,0  );
        $pdf->MultiCell(150,8, ( html_entity_decode($dossier) ));

         $pdf->Ln(5);
        $pdf->SetFont('','U');
        $pdf->Cell(120,8,strtoupper( utf8_decode("SIGNATURE DE L'INTÉRESSÉ")),0,0  );
        $pdf->Cell(70,8,strtoupper( utf8_decode("SIGNATURE DU RESPONSABLE")),0,1  );

        $pdf->SetFont('','');
        $pdf->SetX(110);
        $pdf->Cell(80,5,( utf8_decode("Fait à Abidjan, le ".$datecrea)),0,1,'R',0 );

        $pdf->SetFont('','U');
        $pdf->SetY(175);
        $pdf->Cell(125,8,strtoupper( utf8_decode("AVIS DE LA DIRECTION")),0,1  );

        
         //Debut traitement of checkbox1
        $choice1=1; //checkbox value
        if($choixdir=='AUTORISATION ACCORDE AVEC TRAITEMENT'){
			$check1 = "4";  
		}else{
			$check1 = "";
		}
		$pdf->SetTextColor(0 ,0, 0); 
		$pdf->SetFillColor(0 , 0, 0);
		$pdf->SetDrawColor(0 , 0, 0);
		$pdf->SetFont('ZapfDingbats','', 10);
		$pdf->SetXY(10,183);
		//$pdf->Cell(5,5, $check, 1, 0);
		
        $pdf->Cell(5,5, $check1, 1, 0);
        $pdf->SetFont('Times','',12);
        $pdf->Cell(80,5,( utf8_decode("AUTORISATION ACCORDÉ AVEC TRAITEMENT")),0,1,'L',0 );

        //Fin traitement of checkbox1

        //Debut traitement of checkbox2
        $choice2=1; //checkbox value
        if($choixdir=='AUTORISATION ACCORDE AVEC RETENUE'){
			$check2 = "4";  
		}else{
			$check2 = "";
		}
		$pdf->SetTextColor(0 ,0, 0); 
		$pdf->SetFillColor(0 , 0, 0);
		$pdf->SetDrawColor(0 , 0, 0);
		$pdf->SetFont('ZapfDingbats','', 10);
		$pdf->SetXY(10,190);
		//$pdf->Cell(5,5, $check, 1, 0);
		
        $pdf->Cell(5,5, $check2, 1, 0);
        $pdf->SetFont('Times','',12);
        $pdf->Cell(80,5,( utf8_decode("AUTORISATION ACCORDÉ AVEC RETENUE")),0,1,'L',0 );
        //Fin traitement of checkbox2


        //Debut traitement of checkbox3
        $choice3=0; //checkbox value
        if($choixdir=='AUTORISATION REFUSEE'){
			$check3 = "4";  
		}else{
			$check3 = "";
		}
		$pdf->SetTextColor(0 ,0, 0); 
		$pdf->SetFillColor(0 , 0, 0);
		$pdf->SetDrawColor(0 , 0, 0);
		$pdf->SetFont('ZapfDingbats','', 10);
		$pdf->SetXY(10,197);
		//$pdf->Cell(5,5, $check, 1, 0);
		
        $pdf->Cell(5,5, $check3, 1, 0);
        $pdf->SetFont('Times','',12);
        $pdf->Cell(80,5,( utf8_decode("AUTORISATION REFUSÉE")),0,1,'L',0 );
        //Fin traitement of checkbox3

        $pdf->Cell(50,15,strtoupper( utf8_decode(' MOTIF DU REFUS : ')),0,1  );
        $pdf->MultiCell(150,8, ( html_entity_decode($motifrefus) ));
       
        $pdf->Cell(80,8,( utf8_decode("Fait à Abidjan, le ".$datecrea)),0,0,'L',0 );

        $pdf->SetFont('','BU');
        $pdf->SetXY(130,225);
        $pdf->Cell(125,8,strtoupper( utf8_decode("LA DIRECTION GÉNÉRALE")),0,1  );



        
        $pdf->Output();
    








 


?>