<?php

include ("../../../../../configuration_w/mabd.php");
require '../../../../../vendor/autoload.php';

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use \PhpOffice\PhpSpreadsheet\IOFactory;
use \PhpOffice\PhpSpreadsheet\Style\Alignment;
use \PhpOffice\PhpSpreadsheet\Style\Border;
use \PhpOffice\PhpSpreadsheet\Style\Fill;

ini_set('display_errors', 1);
 $export=$_GET['export'];
 $choice=$_GET['choice'];

 $contrat = $_GET['contrat'];
 $mois = $_GET['mois'];
 $year = $_GET['year'];

 /////////////////TRAITEMENT //////////////////////////////////////
 $query_="
 SELECT 
 pay.\"NUD\",
 prs.\"MAT\",
 pay.\"ENT\" ,
 CONCAT(prs.\"NOM\",' ', prs.\"PRE\") AS \"Nom prenoms\",
 pay.\"SLN\" ,
 pay.\"HNE\" ,
 pay.\"ASN\",
 pay.\"SAL\",
 pay.\"HNP\" ,
 prs.\"RIB\",
 prs.\"BQE\",
 pay.\"C2\", --type de contrat--
 pay.\"A1\",
 pay.\"DAE\"
 FROM public.pos_tab_index_pay pay
 INNER JOIN public.pos_tab_index_prs prs
 ON pay.\"MEL\"=prs.\"MEL\"
 WHERE pay.\"C2\"='".$contrat."' AND EXTRACT(MONTH FROM pay.\"DAE\")='".$mois."' AND EXTRACT(YEAR FROM pay.\"DAE\")='".$year."' AND pay.\"MEL\" IS NOT NULL;
 
     ";
 $content_ = pg_query($conn,$query_)or die('Query failed: ' . pg_last_error());
 while ($rowcontent = pg_fetch_row($content_)) {
         $retour["paies"][] = array(
                 'num'=> $rowcontent[0],
                 'matricule'=> $rowcontent[1] ?? '',
                 'entreprise'=> $rowcontent[2] ?? '',
                 'nom_complet'=> $rowcontent[3] ?? '',
                 'sal_net'=> $rowcontent[4] ?? 0,
                 'hono_net'=> $rowcontent[5] ?? 0,
                 'assurance'=> $rowcontent[6] ?? 0,
                 'sal_net_pay'=> $rowcontent[7] ?? 0,
                 'hono_net_pay'=> $rowcontent[8] ?? 0,
                 'rib'=> $rowcontent[9] ?? '',
                 'banque'=> $rowcontent[10] ?? '',
                 'contrat'=> $rowcontent[11] ?? '',
                 'date_edit'=> $rowcontent[12] ?? '',
                 'dt_edit'=> $rowcontent[13] ?? ''
         );
 }
 
 

//////////////////////////////////////////////////////////////////////////////////////////////////

$tableHead=[
    'font'=>[
        'color'=>[
            'rgb'=>'FFFFFF'
        ],
    ],
    'borders' => array(
        'outline' => array(
            'borderStyle' =>Border::BORDER_THICK,
         ),
    ),
    'fill'=>[
        'fillType'=>Fill::FILL_SOLID,
        'startColor'=>[
            'rgb'=>'000000'
        ],
    ],
];


$evenRow=[ //ligne paire
    'fill'=>[
        'fillType'=>FILL::FILL_SOLID,
        /*'startColor'=>[
            'rgb'=>'00D4FF'
        ]*/
    ]
];

$oddRow=[ //ligne impaire
    'fill'=>[
        'fillType'=>FILL::FILL_SOLID,
        /*'startColor'=>[
            'rgb'=>'FFFFFF'
        ]*/
    ]
];

$styleArray = array(   //permet d'ajouter des bordures ( tableau  excel)
    'borders' => array(
        'allBorders' => array(
            'borderStyle' => Border::BORDER_THIN,
            'color' => array('argb' => '000000'),
        ),
    ),
);

if(isset($choice)){
    //var_dump($data);

    $spreadsheet=new Spreadsheet();
    $active_sheet=$spreadsheet->getActiveSheet();

    //set default font
    $spreadsheet->getDefaultStyle()
                ->getFont()
                ->setName('Arial')
                ->setSize(11);

    $active_sheet->setCellValue('C2',"SALAIRE DU MOIS DE ".strtoupper($retour['paies'][0]['date_edit']));
    $active_sheet->mergeCells("C2:D2");
    $active_sheet->getStyle("C2")->getFont()->setSize(20);

    $active_sheet->getStyle("C2")->getAlignment()->setHorizontal(Alignment::HORIZONTAL_CENTER);
    
     $lib1='HONORAIRE NET';
     $lib2='HONORAIRE NET PAYE';
    foreach($retour['paies'] as $lrow){
        $lib1='HONORAIRE NET';
        $lib2='HONORAIRE NET PAYE';
        if($lrow['contrat']=='Consultant interne' OR $lrow['contrat']=='Consultant externe'){
        
        }else{
            $lib1='SALAIRE NET';
            $lib2='SALAIRE NET PAYE';
        }
    }
        
 
   $active_sheet->setCellValue('A4','MATRICULE');
   $active_sheet->setCellValue('B4','ENTREPRISE');
   $active_sheet->setCellValue('C4','NOM & PRENOMS');
   $active_sheet->setCellValue('D4',$lib1);
   $active_sheet->setCellValue('E4','ASSURANCE');
   $active_sheet->setCellValue('F4',$lib2);
   $active_sheet->setCellValue('G4','RIB');
   $active_sheet->setCellValue('H4','BANQUE');


   $active_sheet->getStyle("A4:H4")->getFont()->setSize(11);
   $active_sheet->getStyle("A4:H4")->getFont()->setBold(true);

   //coleur de fond et coleur 
   $active_sheet->getStyle("A4:H4")->applyFromArray($tableHead);
   $active_sheet->getStyle("A4:H4")->getAlignment()->setHorizontal(Alignment::HORIZONTAL_CENTER);
 


   $count=5;

   foreach($retour['paies'] as $lrow){

    
	 $montant1=0;
	 $montant2=0;
	 $montant3=0;
	 
	 if($lrow['contrat']=='Consultant interne' OR $lrow['contrat']=='Consultant externe'){
		$montant1=str_replace(',','.',number_format($lrow['hono_net']) );
		$montant2=str_replace(',','.',number_format($lrow['hono_net_pay']) );
	 }else{
		$montant1=str_replace(',','.',number_format($lrow['sal_net']) );
		$montant2=str_replace(',','.',number_format($lrow['sal_net_pay']) );
		 
	 }
	 $montant3=str_replace(',','.',number_format($lrow['assurance']) );

  
     $active_sheet->setCellValue('A'.$count,$lrow['matricule']);
     $active_sheet->setCellValue('B'.$count,$lrow['entreprise']);
     $active_sheet->setCellValue('C'.$count,$lrow['nom_complet']);
     $active_sheet->setCellValue('D'.$count,$montant1.' F CFA');
     $active_sheet->setCellValue('E'.$count,$montant3.' F CFA');
     $active_sheet->setCellValue('F'.$count,$montant2.' F CFA');
     $active_sheet->setCellValue('G'.$count,$lrow['rib']);
     $active_sheet->setCellValue('H'.$count,$lrow['banque']);
   

     $active_sheet->getStyle('A'.$count.':H'.$count)->applyFromArray($styleArray);

     if($count%2==0){
         $active_sheet->getStyle('A'.$count.':H'.$count)->applyFromArray($evenRow);
     }else{
        $active_sheet->getStyle('A'.$count.':H'.$count)->applyFromArray($oddRow);
     }


     
       $count=$count+1;
   }
   $active_sheet->setTitle("SALAIRE MENSUEL"); //Renomme le worksheet(onglet)

   $active_sheet->getColumnDimension('A')->setWidth(17);
   $active_sheet->getColumnDimension('B')->setWidth(30);
   $active_sheet->getColumnDimension('C')->setWidth(30);
   $active_sheet->getColumnDimension('D')->setWidth(32);
   $active_sheet->getColumnDimension('E')->setWidth(32);
   $active_sheet->getColumnDimension('F')->setWidth(32);
   $active_sheet->getColumnDimension('G')->setWidth(32);
   $active_sheet->getColumnDimension('H')->setWidth(32);

   $writer=\PhpOffice\PhpSpreadsheet\IOFactory::createWriter($spreadsheet,$choice);
  // $file_name=time().'.'.strtolower($choice);
  $file_name='salaire_'. str_replace('/','_',$retour['paies'][0]['dt_edit']).'.'.strtolower($choice);
   $writer->save($file_name);


  header('Content-Type: application/x-www-form-urlencoded');
  header('Content-Transfer-Encoding: Binary');
  header("Content-disposition: attachment; filename=\"".$file_name."\"");
  readfile($file_name);

}