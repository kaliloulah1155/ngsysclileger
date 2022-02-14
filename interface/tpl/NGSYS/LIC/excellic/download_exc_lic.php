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

        $query='';
		$find=0;
        $data = array() ;

        
         $query_init="
	            SELECT
                \"NOM\",\"PRE\",\"FON\",\"AVA\",\"DEI\",\"NUD\"
	           FROM 
	                public.pos_tab_index_lic
	           ";

	     $query_lic_data =$query_init;

	   
	    if(!empty($date_deb)  AND !empty($date_fin)  ){

	    $query_lic_date="
				SELECT \"NOM\",\"PRE\",\"FON\",\"AVA\",\"DEI\",\"NUD\"
				FROM pos_tab_index_lic
				WHERE  \"DEI\" BETWEEN '".$date_deb."' AND '".$date_fin."'
	           ";

	        $query=pg_query($query_lic_date);
	        $find = pg_num_rows($query);

	        if($find!=0){
	        	$query_lic_data =$query_lic_date;
	        }else{
	        	 $query_lic_data =$query_init;
	        }
	    }

	   if(!empty($email)){

	    $query_lic_mail="

		       SELECT \"NOM\",\"PRE\",\"FON\",\"AVA\",\"DEI\",\"NUD\"
				FROM pos_tab_index_lic
				WHERE  \"INT\"='".strtolower($email)."'
	           ";   

	        $query=pg_query($query_lic_mail);
	        $find = pg_num_rows($query);

	        if($find!=0){
	        	$query_lic_data =$query_lic_mail;
	        }else{
	        	 $query_lic_data =$query_init;
	        }
	    }

	    if(!empty($email) AND !empty($date_deb) AND !empty($email)){

	    $query_lic_datemail="
				SELECT \"NOM\",\"PRE\",\"FON\",\"AVA\",\"DEI\",\"NUD\"
				FROM pos_tab_index_lic
				WHERE  \"DEI\" BETWEEN '".$date_deb."' AND '".$date_fin."' AND  \"INT\"='".strtolower($email)."'
	           ";

	        $query=pg_query($query_lic_datemail);
	        $find = pg_num_rows($query);

	        if($find!=0){
	        	$query_lic_data =$query_lic_datemail;
	        }else{
	        	 $query_lic_data =$query_init;
	        }
	          
	    }




/* 
$rq = pg_query($conn,"
    SELECT
     \"MAT\",\"NOM\",\"PRE\",\"MEL\",\"TPH\",\"DEI\"
    FROM 
            public.pos_tab_index_lic
    ");*/

    $contests_lic = pg_query($query_lic_data) or die('Query failed: ' . pg_last_error());
    while ($row_lic = pg_fetch_row($contests_lic)) {
    
            $data[] = $row_lic;
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

    $active_sheet->setCellValue('C2',"LISTE DES LICENCIEMENTS");
    $active_sheet->mergeCells("C2:D2");
    $active_sheet->getStyle("C2")->getFont()->setSize(20);

    $active_sheet->getStyle("C2")->getAlignment()->setHorizontal(Alignment::HORIZONTAL_CENTER);
    

                 
    

   $active_sheet->setCellValue('A4','NOM');
   $active_sheet->setCellValue('B4','PRENOMS');
   $active_sheet->setCellValue('C4','FONCTION');
   $active_sheet->setCellValue('D4','ANCIENNETE');
   $active_sheet->setCellValue('E4','DATE DE PRISE DE DECISION');

   $active_sheet->getStyle("A4:E4")->getFont()->setSize(11);
   $active_sheet->getStyle("A4:E4")->getFont()->setBold(true);

   //coleur de fond et coleur 
   $active_sheet->getStyle("A4:E4")->applyFromArray($tableHead);
   $active_sheet->getStyle("A4:E4")->getAlignment()->setHorizontal(Alignment::HORIZONTAL_CENTER);
 


   $count=5;

   foreach($data as $lrow){
  
     $active_sheet->setCellValue('A'.$count,$lrow[0]);
     $active_sheet->setCellValue('B'.$count,$lrow[1]);
     $active_sheet->setCellValue('C'.$count,$lrow[2]);
     $active_sheet->setCellValue('D'.$count,str_replace(',','.',number_format($lrow[3]))." FCFA" );
     $active_sheet->setCellValue('E'.$count,trim($lrow[4]));

     $active_sheet->getStyle('A'.$count.':E'.$count)->applyFromArray($styleArray);

     if($count%2==0){
         $active_sheet->getStyle('A'.$count.':E'.$count)->applyFromArray($evenRow);
     }else{
        $active_sheet->getStyle('A'.$count.':E'.$count)->applyFromArray($oddRow);
     }


     
       $count=$count+1;
   }
   $active_sheet->setTitle("LICENCIEMENTS"); //Renomme le worksheet(onglet)

   $active_sheet->getColumnDimension('A')->setWidth(17);
   $active_sheet->getColumnDimension('B')->setWidth(30);
   $active_sheet->getColumnDimension('C')->setWidth(30);
   $active_sheet->getColumnDimension('D')->setWidth(32);
   $active_sheet->getColumnDimension('E')->setWidth(32);




   $writer=\PhpOffice\PhpSpreadsheet\IOFactory::createWriter($spreadsheet,$choice);
  // $file_name=time().'.'.strtolower($choice);
  $file_name='licenciement.'.strtolower($choice);
   $writer->save($file_name);


  header('Content-Type: application/x-www-form-urlencoded');
  header('Content-Transfer-Encoding: Binary');
  header("Content-disposition: attachment; filename=\"".$file_name."\"");
  readfile($file_name);

}