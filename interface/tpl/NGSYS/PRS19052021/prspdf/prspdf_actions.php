<?php

// Send Headers

    session_start();    
 
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
                $this->Cell(70,10,"FICHE D'IDENTIFICATION",1,0,'C');
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

      $query =" SELECT  \"NOM\",\"PRE\",\"DNS\",\"LNS\",\"NAT\",\"NPI\",\"NTP\",\"SIF\",\"NEF\",\"CNE\",\"TPH\",\"BP\",\"DEI\",\"FON\",\"CNP\",\"MAT\",\"TYE\",\"DUR\",\"DPT\",\"AVT\",\"CAT\",\"DCR\" ,\"NMG\",\"PMG\",\"SLT\",\"RIB\",\"BQE\",\"PAC\",\"NTC\",\"FLN\",\"CIV\" ,\"NEP\",\"PRM\",\"TPM\",\"MEL\",\"COD\" FROM public.pos_tab_index_prs WHERE  \"NUD\" ='".$numposeidon."'";
      $contests = pg_query($query) or die('Query failed: ' . pg_last_error());

      $date= date('Y');
      $nom="";
      $prenoms="";
      $datenaiss="";
      $lieu="";
      $nationalite="";
      $datecrea="";
      $numpiece="";
      $natpiece="";
      $sitmat="";
      $nbenfant="";
      $commune="";
      $tel1="";
      $tel2="";
      $email="";
      $bp="";
      $dateentree="";
      $poste="";
      $cnps="";
      $matricule="";
      $salairenet="";
      $rib="";
      $banque="";
      $type_contrat="";
      $duree_contrat=""; 
      $departement="";
      $avantage="";
       $categorie="";
      $nom_contact="";
      $prenom_contact="";
       $tel_contact="";
        $fil_contact="";
      $nom_manager="";
      $prenom_manager="";
      $civilite="";
      $epoux="";
      $code="";
      

     

     while ($row = pg_fetch_row($contests)) {
          $nom= $row[0];
          $prenoms= $row[1];
          $datenaiss= $row[2];
          $lieu= $row[3];
          $nationalite=$row[4];
          $numpiece=$row[5];
          $natpiece=$row[6];
          $sitmat=$row[7];
          $nbenfant=$row[8];
          $commune=$row[9];

          
          $tel1=$row[10];
          $tel2=$row[33] !=''? ' / '.$row[33] :'';
          $bp=$row[11];
          $dateentree=$row[12];
          $poste=$row[13];
          $cnps=$row[14];
          $matricule=$row[15];
          $type_contrat=$row[16];
          $duree_contrat=$row[17];
          $departement=$row[18];
          $avantage=$row[19];
           $categorie=$row[20];
          
          $datecrea=$row[21];
          $nom_manager=$row[22];
          $prenom_manager=$row[23];
          $salairenet=$row[24];
          $rib=$row[25];
           $banque=$row[26];
           $nom_contact=$row[27];
           $prenom_contact=$row[32];
           $tel_contact=$row[28];
           $fil_contact=$row[29];
           $civilite=$row[30];
           $epoux=$row[31];
           $email=$row[34];
           $code=$row[35];

     }


     

     $civ='';
     if($civilite=='M'){
        $civ='M.';
     }
     if ($civilite=='MME') {
       # code...
              $civ='Mme';
     }
     if ($civilite=='MLLE') {
       # code...
      $civ='Mlle';
     } 


        // Instanciation de la classe dérivée
        $pdf = new PDF();
        $pdf->AliasNbPages();
        $pdf->AddPage();
        $pdf->SetFont('Times','',12);
        
        $pdf->Cell(55);
        $pdf->Cell(80,5,strtoupper( utf8_decode('N°: '.$code)),0,1,'C',0 );
       /* $pdf->Ln(5);
        $pdf->Cell(70,7,strtoupper( utf8_decode('CIVILITE : ')),0,0  );


        $pdf->Cell(15,7, ( utf8_decode($civ)),0,0  );
        */
        if($civ=='Mme'){
        //$pdf->Cell(20,7,( utf8_decode('epouse : ')),0,0  );
        //$pdf->Cell(70,7,strtoupper( utf8_decode($epoux)),0,0  );
          $nom_epoux='epouse '.strtoupper($epoux);
      }else{
        $nom_epoux='';
      }

        $pdf->Ln(7);
        $pdf->Cell(70,7,strtoupper( utf8_decode('NOM ET PRENOMS  : ')),0,0  );
        $pdf->Cell(90,7,$civ.' '.strtoupper(utf8_decode($nom.'  '.$prenoms )).' '.$nom_epoux,0,1);
         
        $pdf->Cell(70,7,strtoupper( utf8_decode('DATE ET LIEU DE NAISSANCE  : ')),0,0  );
        $pdf->Cell(35,7,strtoupper( utf8_decode($datenaiss )),0,0);
        $pdf->Cell(20,7,strtoupper( utf8_decode('A  : ')),0,0  );
        $pdf->Cell(60,8,strtoupper( utf8_decode($lieu)),0,1);

        $pdf->Cell(70,8,strtoupper( utf8_decode('NATIONALITE : ')),0,0  );
        $pdf->Cell(35,8,$nationalite,0,1);

        $pdf->Cell(70,8,strtoupper( utf8_decode("N° DE PIECE D'IDENTITE : ")),0,0  );
        $pdf->Cell(40,8,strtoupper( utf8_decode($natpiece .' - '.$numpiece )),0,1);

        $pdf->Cell(70,8,strtoupper( utf8_decode("SITUATION MATRIMONIALE
 : ")),0,0  );
        $pdf->Cell(35,8,strtoupper( utf8_decode($sitmat )),0,1);

        $pdf->Cell(70,8,strtoupper( utf8_decode("ENFANTS EN CHARGE : ")),0,0  );
        $pdf->Cell(40,8,strtoupper( utf8_decode($nbenfant )),0,1);

        $pdf->Cell(70,8,strtoupper( utf8_decode("COMMUNE : ")),0,0  );
        $pdf->Cell(40,8,strtoupper( utf8_decode($commune )),0,1);

        $pdf->Cell(70,8,strtoupper( utf8_decode("N° DE TELEPHONE : ")),0,0  );
        $pdf->Cell(40,8,strtoupper( utf8_decode($tel1.''.$tel2 )),0,1);

        $pdf->Cell(70,8,strtoupper( utf8_decode("E-MAIL : ")),0,0  );
        $pdf->Cell(40,8,( utf8_decode($email)),0,1);

         $pdf->Cell(70,6,strtoupper( utf8_decode("BOITE POSTALE : ")),0,0  );
        $pdf->Cell(40,6,strtoupper( utf8_decode($bp )),0,1);

        $pdf->Cell(70,6,strtoupper( utf8_decode("DATE D'ENTREE : ")),0,0  );
        $pdf->Cell(40,6,strtoupper( utf8_decode($dateentree )),0,1);

        $pdf->Cell(70,6,strtoupper( utf8_decode("FONCTION : ")),0,0  );
        $pdf->Cell(40,6,strtoupper( utf8_decode($poste )),0,1);

        $pdf->Cell(70,8,strtoupper( utf8_decode("N° CNPS : ")),0,0  );
        $pdf->Cell(40,8,strtoupper( utf8_decode($cnps )),0,1);

        $pdf->Cell(70,8,strtoupper( utf8_decode("MANAGER/SUPERVISEUR : ")),0,0  );
        $pdf->Cell(90,8,strtoupper( utf8_decode($nom_manager.' '.$prenom_manager )),0,1);

        $pdf->Cell(70,8,strtoupper( utf8_decode("SALAIRE NET : ")),0,0  );
        $pdf->Cell(40,8,strtoupper( utf8_decode(number_format($salairenet))),0,1); 

        $pdf->Cell(70,8,strtoupper( utf8_decode("RIB : ")),0,0  );
        $pdf->Cell(40,8,strtoupper( utf8_decode($rib )),0,1);

        $pdf->Cell(70,8,strtoupper( utf8_decode("BANQUE : ")),0,0  );
        $pdf->Cell(40,8,strtoupper( utf8_decode($banque )),0,1);

        $pdf->Cell(70,8,strtoupper( utf8_decode("PERSONNE A CONTACTER : ")),0,0  );
        $pdf->Cell(70,8,strtoupper( utf8_decode($nom_contact.'  '.$prenom_contact )),0,1); 
 
        $pdf->Cell(70,8,strtoupper( utf8_decode("TELEPHONE DU CONTACT : ")),0,0  );
        $pdf->Cell(40,8,strtoupper( utf8_decode($tel_contact )),0,1);

        $pdf->Cell(70,8,strtoupper( utf8_decode("FILIATION : ")),0,0  );
        $pdf->Cell(40,8,strtoupper( utf8_decode($fil_contact )),0,1);

        //$pdf->Line(10,80,200,80);
      
        $pdf->Ln(1);
        $pdf->Cell(100);
        $pdf->Cell(80,5,( utf8_decode("Réservé à l'Administration NGSER")),0,1,'C',0 );
        $pdf->Ln(5);

        $pdf->SetLineWidth(0.5);
        $pdf->Line(10, 210, 197,210); //haut
        $pdf->Line(10, 210, 10,260); //gauche
        $pdf->Line(197, 260, 197,210); //droite
        $pdf->Line(10, 260, 197,260); //bas

        $pdf->Cell(70,8,strtoupper( utf8_decode('N° MATRICULE : ')),0,0  );
        $pdf->Cell(40,8,strtoupper( utf8_decode($matricule )),0,1);

        $pdf->Cell(70,8,strtoupper( utf8_decode('TYPE DE CONTRAT  : ')),0,0  );
        $pdf->Cell(40,8,strtoupper( utf8_decode($type_contrat )),0,1);

         $pdf->Cell(70,8,strtoupper( utf8_decode('DUREE DU CONTRAT  : ')),0,0  );
        $pdf->Cell(40,8,strtoupper( utf8_decode($duree_contrat )),0,1);

        $pdf->Cell(70,8,strtoupper( utf8_decode('DEPARTEMENT  : ')),0,0  );
        $pdf->Cell(40,8,strtoupper( utf8_decode($departement )),0,1);

        $pdf->Cell(70,8,strtoupper( utf8_decode('AVANTAGES  : ')),0,0  );
        $pdf->Cell(40,8,strtoupper( utf8_decode($avantage )),0,1);

         $pdf->Cell(70,8,strtoupper( utf8_decode('CATEGORIE  : ')),0,0  );
        $pdf->Cell(40,8,strtoupper( utf8_decode($categorie )),0,1);

        $pdf->Ln(5);
        $pdf->Cell(100);
        $pdf->SetFont('Times','I',11);
        $pdf->Cell(80,5,( utf8_decode("Fait à Abidjan, le ".$datecrea)),0,1,'C',0 );




        $pdf->Output();
    










    // $pdf = new FPDF();
    // $pdf->AddPage();
    // $pdf->SetFont('Arial','B',16);
    // $pdf->Cell(40,10,strtoupper( utf8_decode($numposeidon)),0,0 ,'C',0 );
    // $pdf->Output();
        
   // echo $_POST['firstname'].'  '.$_POST['lastname'];


?>