<?php 

	 include ('../../../../../configuration_w/mabd.php');

	 $loadcode=$_GET['loadcode'];

	 $result = pg_query("SELECT * FROM public.pos_indperforma WHERE  code='".$loadcode."'");
	 $find = pg_num_rows($result);

	 $output='';

	  if($find!=0){


	  	    $rq = pg_query($conn,"
           			SELECT indperf.libelle
					FROM public.pos_indperforma posind
					INNER JOIN public.indperforma indperf
					ON  indperf.id=posind.indperforma_id
					WHERE code='".$loadcode."'
           	");


           	$query_indperforma = "SELECT  libelle  FROM public.indperforma ORDER BY libelle ASC";
   			$contests_indperforma = pg_query($query_indperforma) or die('Query failed: ' . pg_last_error());

   			 $array_indperforma = array() ;
		    while ($row_indperforma = pg_fetch_row($contests_indperforma)) {
		        $array_indperforma[] = $row_indperforma;
		    }


		    while ($row = pg_fetch_row($rq)) {

		    		 $output .="
             		 		<tr>
								<td>
									<select  name='lib_indperforma[]'  class='form-control selectIndis lib_indperforma'  style='width: 100%;margin-top: -1%'> ";

									 $output .="<option value=''>S&#233;lectionner le libell&#233;</option>";

									for ($i=0; $i <count($array_indperforma) ; $i++) { 
 										// echo $myarrayprm[$i][0] .'<br/>';
 										 $output .= '<option value="'.$array_indperforma[$i][0].'"  '.($array_indperforma[$i][0]==$row[0] ? 'selected': '').'    >'.$array_indperforma[$i][0].'</option>';
 									}

 					$output .="
 									</select>
					            </td>
				            </tr>";
		    }

		     echo  $output;  

           	


	  }

?>