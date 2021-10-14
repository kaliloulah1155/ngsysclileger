<?php 

	 include ('../../../../../configuration_w/mabd.php');

	 $loadcode=$_GET['loadcode'];

	 $result = pg_query("SELECT * FROM public.pos_relinterne WHERE  code='".$loadcode."'");
	 $find = pg_num_rows($result);

	 $output='';

	  if($find!=0){

 
	  	    $rq = pg_query($conn,"
           			SELECT pdpt.\"LIB\" as departements,psrc.\"LIB\" as services
					FROM public.pos_relinterne posint
					LEFT JOIN public.pos_tab_index_dpt pdpt
					ON  pdpt.\"NUD\"=posint.departement_id 
					LEFT JOIN public.pos_tab_index_src psrc
					ON  psrc.\"NUD\"=posint.service_id
					WHERE code='".$loadcode."'
           	");

       
           	$query_depart = "SELECT  \"LIB\" FROM public.pos_tab_index_dpt ";
   			$contests_depart = pg_query($query_depart) or die('Query failed: ' . pg_last_error());

   			 $array_depart = array() ;
		    while ($row_depart = pg_fetch_row($contests_depart)) {
		        $array_depart[] = $row_depart;
		    }

		    $query_service = "SELECT  \"LIB\" FROM public.pos_tab_index_src ";
   			$contests_service = pg_query($query_service) or die('Query failed: ' . pg_last_error());

   			 $array_service = array() ;
		    while ($row_service = pg_fetch_row($contests_service)) {
		        $array_service[] = $row_service;
		    }


		    while ($row = pg_fetch_row($rq)) {

		    		 $output .="
             		 		<tr>
								<td class='col-sm-6'>
									<select  name='all_lib_depart[]'  class='form-control selectIntDeps all_depart' style='width: 100%;'> ";

									 $output .="<option value=''>Veuillez selectionner le d&#233;partement</option>";

									for ($i=0; $i <count($array_depart) ; $i++) { 
 										// echo $myarrayprm[$i][0] .'<br/>';
 										 $output .= '<option value="'.$array_depart[$i][0].'"  '.($array_depart[$i][0]==$row[0] ? 'selected': '').'    >'.$array_depart[$i][0].'</option>';
 									}

 					$output .="
 									</select>
					            </td>";
				   $output .=" <td class='col-sm-6'>
									<select  name='all_lib_service[]'  class='form-control selectIntServs all_service' style='width: 100%;'> ";

									 $output .="<option value=''>Veuillez selectionner le service</option>";

									for ($k=0; $k <count($array_service) ; $k++) { 
 										// echo $myarrayprm[$i][0] .'<br/>';
 										 $output .= '<option value="'.$array_service[$k][0].'"  '.($array_service[$k][0]==$row[1] ? 'selected': '').'    >'.$array_service[$k][0].'</option>';
 									}

 					$output .="
 									</select>
					            </td>";

				  $output .="</tr>";
		    }

		     echo  $output;  

           	


	  }

?>