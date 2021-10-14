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


        $query='';
		$find=0;
        $data = array() ;

        
         $query_init="
	            SELECT
                \"COD\",\"DCR\",\"NUD\"
	           FROM 
	                public.pos_tab_index_cas
	           ";

	     $query_cas_data =$query_init;

	   
	    if(!empty($date_deb)  AND !empty($date_fin)  ){

	    $query_cas_date="
				SELECT \"COD\",\"DCR\",\"NUD\"
				FROM pos_tab_index_cas 
				WHERE  \"DEI\" BETWEEN '".$date_deb."' AND '".$date_fin."'
	           ";

	        $query=pg_query($query_cas_date);
	        $find = pg_num_rows($query);

	        if($find!=0){
	        	$query_cas_data =$query_cas_date;
	        }else{
	        	 $query_cas_data =$query_init;
	        }
	    }

	  

    $contests_cas = pg_query($query_cas_data) or die('Query failed: ' . pg_last_error());
    while ($row_cas = pg_fetch_row($contests_cas)) {
    
            $data[] = $row_cas;
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

    $active_sheet->setCellValue('C2',"LISTE CONSOMMATION ASSUREE");
    $active_sheet->mergeCells("C2:I2");
    $active_sheet->getStyle("C2")->getFont()->setSize(20);
    $active_sheet->getStyle("C2")->getAlignment()->setHorizontal(Alignment::HORIZONTAL_CENTER);
     

                 
    

   $active_sheet->setCellValue('A4','CODE');
   $active_sheet->setCellValue('B4','DATE DE CREATION');

   $active_sheet->getStyle("A4:B4")->getFont()->setSize(11);
   $active_sheet->getStyle("A4:B4")->getFont()->setBold(true);

   //coleur de fond et coleur 
   $active_sheet->getStyle("A4:B4")->applyFromArray($tableHead);
   $active_sheet->getStyle("A4:B4")->getAlignment()->setHorizontal(Alignment::HORIZONTAL_CENTER);
 


   $count=5;

   foreach($data as $lrow){
  
     $active_sheet->setCellValue('A'.$count,$lrow[0]);
     $active_sheet->setCellValue('B'.$count,$lrow[1]);

     $active_sheet->getStyle('A'.$count.':B'.$count)->applyFromArray($styleArray);

     if($count%2==0){
         $active_sheet->getStyle('A'.$count.':B'.$count)->applyFromArray($evenRow);
     }else{
        $active_sheet->getStyle('A'.$count.':B'.$count)->applyFromArray($oddRow);
     }


     
       $count=$count+1;
   }
   $active_sheet->setTitle("CONSOMMATION ASSUREE"); //Renomme le worksheet(onglet)

   $active_sheet->getColumnDimension('A')->setWidth(17);
   $active_sheet->getColumnDimension('B')->setWidth(30);





   $writer=\PhpOffice\PhpSpreadsheet\IOFactory::createWriter($spreadsheet,$choice);
   $file_name='consommation.'.strtolower($choice);
   $writer->save($file_name);


  header('Content-Type: application/x-www-form-urlencoded');
  header('Content-Transfer-Encoding: Binary');
  header("Content-disposition: attachment; filename=\"".$file_name."\"");
  readfile($file_name);

}