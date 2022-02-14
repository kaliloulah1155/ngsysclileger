<?php

include ("../../../../../configuration_w/mabd.php");
require '../../../../../vendor/autoload.php';

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use \PhpOffice\PhpSpreadsheet\IOFactory;
use \PhpOffice\PhpSpreadsheet\Style\Alignment;
use \PhpOffice\PhpSpreadsheet\Style\Border;
use \PhpOffice\PhpSpreadsheet\Style\Fill;

//ini_set('display_errors', 1);
 $export=$_GET['export'];
 $choice=$_GET['choice'];

 $date_deb=$_GET['date_deb'];
 $date_fin=$_GET['date_fin'];
 $email=$_GET['email'];
 $contrat=$_GET['contrat'];
 $profil=$_GET['profil'];

       
 		$query='';
         $find=0;
         $data = array() ;
 
         
         $query_init="";

		if($profil=="ADMIN" OR $profil=="RH" OR $profil=="MANAGER_ADM" OR $profil=="DGA"  OR $profil=="DG"){
         $query_init="
	            SELECT
			     	\"NOM\",\"PRE\",\"TYE\",\"DSG\",\"NUD\",\"MEL\"
	           FROM 
	                public.pos_tab_index_cot
	           ";
		}	
		
	     $query_cot_data =$query_init;
 
           //1- Date de debut+ Date de fin
         if(!empty($date_deb)  AND !empty($date_fin)  ){
 
         $query_cot_date="
                 SELECT \"NOM\",\"PRE\",\"TYE\",\"DSG\",\"NUD\",\"MEL\"
                 FROM pos_tab_index_cot
                 WHERE  \"DSG\" BETWEEN '".$date_deb."' AND '".$date_fin."'
                ";
 
             $query=pg_query($query_cot_date);
             $find = pg_num_rows($query);
 
             if($find!=0){
                 $query_cot_data =$query_cot_date;
             }else{
                  $query_cot_data =$query_init;
             }
         }
 
          //2- E-mail
        if(!empty($email)){
         $query_cot_mail="
                SELECT \"NOM\",\"PRE\",\"TYE\",\"DSG\",\"NUD\",\"MEL\"
                 FROM pos_tab_index_cot 
                 WHERE  \"MEL\"='".strtolower($email)."'
                ";   
 
             $query=pg_query($query_cot_mail);
             $find = pg_num_rows($query);
 
             if($find!=0){
                 $query_cot_data =$query_cot_mail;
             }else{
                  $query_cot_data =$query_init;
             }
         }
 
         //3-Type de contrat
          if(!empty($contrat)){
         $query_cot_contrat="
                 SELECT \"NOM\",\"PRE\",\"TYE\",\"DSG\",\"NUD\",\"MEL\"
                 FROM pos_tab_index_cot 
                 WHERE   \"TYE\"='".$contrat."'
                ";
 
             $query=pg_query($query_cot_contrat);
             $find = pg_num_rows($query);
 
             if($find!=0){
                 $query_cot_data =$query_cot_contrat;
             }else{
                  $query_cot_data =$query_init;
             }
               
         }
         //4-Date de debut+ Date de fin + Type de contrat
         if(!empty($date_deb) AND !empty($date_fin) AND !empty($contrat)  ){
             $query_cot_datcnt="
                     SELECT \"NOM\",\"PRE\",\"TYE\",\"DSG\",\"NUD\",\"MEL\"
                     FROM pos_tab_index_cot
                     WHERE  \"DSG\" BETWEEN '".$date_deb."' AND '".$date_fin."' AND \"TYE\"='".$contrat."'
                    ";
                 $query=pg_query($query_cot_datcnt);
                 $find = pg_num_rows($query);
     
                 if($find!=0){
                     $query_cot_data =$query_cot_datcnt;
                 }else{
                      $query_cot_data =$query_init;
                 }
             }

        //5- E-mail + Type de contrat
		if(!empty($email) AND !empty($contrat)  ){
			$query_cot_melcnt="
					SELECT \"NOM\",\"PRE\",\"TYE\",\"DSG\",\"NUD\",\"MEL\"
					FROM pos_tab_index_cot
					WHERE  \"MEL\"='".strtolower($email)."' AND \"TYE\"='".$contrat."'
				   ";
				$query=pg_query($query_cot_melcnt);
				$find = pg_num_rows($query);
	
				if($find!=0){
					$query_cot_data =$query_cot_melcnt;
				}else{
					 $query_cot_data =$query_init;
				}
			}


    $contests_cot = pg_query($query_cot_data) or die('Query failed: ' . pg_last_error());
    while ($row_cot = pg_fetch_row($contests_cot)) {
    
            $data[] = $row_cot;
        }
          

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

if(isset($export)){
    //var_dump($data);

    $spreadsheet=new Spreadsheet();
    $active_sheet=$spreadsheet->getActiveSheet();

    //set default font
    $spreadsheet->getDefaultStyle()
                ->getFont()
                ->setName('Arial')
                ->setSize(11);

    $active_sheet->setCellValue('B2',"LISTE DES CONTRATS");
    $active_sheet->mergeCells("B2:C2");
    $active_sheet->getStyle("B2")->getFont()->setSize(20);

    $active_sheet->getStyle("B2")->getAlignment()->setHorizontal(Alignment::HORIZONTAL_CENTER);
    

                 
    

   $active_sheet->setCellValue('A4','NOM');
   $active_sheet->setCellValue('B4','PRENOMS');
   $active_sheet->setCellValue('C4','TYPE DE CONTRAT');
   $active_sheet->setCellValue('D4','DATE DE SIGNATURE');


   $active_sheet->getStyle("A4:D4")->getFont()->setSize(11);
   $active_sheet->getStyle("A4:D4")->getFont()->setBold(true);

   //coleur de fond et coleur 
   $active_sheet->getStyle("A4:D4")->applyFromArray($tableHead);
   $active_sheet->getStyle("A4:D4")->getAlignment()->setHorizontal(Alignment::HORIZONTAL_CENTER);
 


   $count=5;

   foreach($data as $lrow){
  
     $active_sheet->setCellValue('A'.$count,$lrow[0]);
     $active_sheet->setCellValue('B'.$count,$lrow[1]);
     $active_sheet->setCellValue('C'.$count,$lrow[2]);
     $active_sheet->setCellValue('D'.$count,$lrow[3]);
   

     $active_sheet->getStyle('A'.$count.':D'.$count)->applyFromArray($styleArray);

     if($count%2==0){
         $active_sheet->getStyle('A'.$count.':D'.$count)->applyFromArray($evenRow);
     }else{
        $active_sheet->getStyle('A'.$count.':D'.$count)->applyFromArray($oddRow);
     }


     
       $count=$count+1;
   }
   $active_sheet->setTitle("CONTRAT"); //Renomme le worksheet(onglet)

   $active_sheet->getColumnDimension('A')->setWidth(17);
   $active_sheet->getColumnDimension('B')->setWidth(30);
   $active_sheet->getColumnDimension('C')->setWidth(30);
   $active_sheet->getColumnDimension('D')->setWidth(32);

   $writer=\PhpOffice\PhpSpreadsheet\IOFactory::createWriter($spreadsheet,$choice);
  // $file_name=time().'.'.strtolower($choice);
  $file_name='contrat.'.strtolower($choice);
   $writer->save($file_name);


  header('Content-Type: application/x-www-form-urlencoded');
  header('Content-Transfer-Encoding: Binary');
  header("Content-disposition: attachment; filename=\"".$file_name."\"");
  readfile($file_name);

}