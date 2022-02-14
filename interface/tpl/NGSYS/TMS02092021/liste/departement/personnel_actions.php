<?php 
 include ('../../../../../../configuration_w/mabd.php');


   $departement=$_POST['departement'];

    $service=$_POST['service'];

	//echo $departement.' '.$service;


	$data = array() ;

	if(!empty($service)){
			reset($data);
		$query_ser="
	            SELECT fpo.\"MEL\", pers.\"NOM\",pers.\"PRE\"
				FROM public.pos_tab_index_fpo fpo
				INNER JOIN public.pos_tab_index_pos pos
				ON  fpo.\"IPO\"=pos.\"IPO\"
				INNER JOIN public.pos_tab_index_prs pers
				ON  LOWER(pers.\"MEL\")=LOWER(fpo.\"MEL\")
				WHERE pos.\"SER\"='".$service."'
	           ";

		 $contests_ser= pg_query($query_ser) or die('Query failed: ' . pg_last_error());
	     while ($row_ser = pg_fetch_row($contests_ser)) {
	    
	         $data[] = $row_ser;
	     }
	     echo json_encode($data);

	}else{
		reset($data);


		$query_dpt="

	            SELECT fpo.\"MEL\", pers.\"NOM\",pers.\"PRE\" 
				FROM public.pos_tab_index_fpo fpo
				INNER JOIN public.pos_tab_index_pos pos
				ON  fpo.\"IPO\"=pos.\"IPO\"
				INNER JOIN public.pos_tab_index_prs pers
				ON  LOWER(pers.\"MEL\")=LOWER(fpo.\"MEL\")
				WHERE pos.\"DPT\"='".$departement."'
	           ";




		 $contests_dpt= pg_query($query_dpt) or die('Query failed: ' . pg_last_error());
	     while ($row_dpt = pg_fetch_row($contests_dpt)) {
	    
	         $data[] = $row_dpt;
	     }
	     echo json_encode($data);

	}





    

?>