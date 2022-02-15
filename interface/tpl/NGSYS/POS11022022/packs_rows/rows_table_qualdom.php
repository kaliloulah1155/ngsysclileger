<?php 

	 include ('../../../../../configuration_w/mabd.php');

	 $loadcode=$_GET['loadcode'];

	 $result = pg_query("SELECT * FROM public.pos_qualdominante WHERE  code='".$loadcode."'");
	 $find = pg_num_rows($result);

	 $output='';

	  if($find!=0){


	  	    $rq = pg_query($conn,"
           			SELECT qualdom.libelle
					FROM public.pos_qualdominante posqd
					INNER JOIN public.qualdominante qualdom
					ON  qualdom.id=posqd.qualdominante_id
					WHERE code='".$loadcode."'
           	");


           	$query_qualdom = "SELECT  libelle  FROM public.qualdominante ORDER BY libelle ASC";
   			$contests_qualdom = pg_query($query_qualdom) or die('Query failed: ' . pg_last_error());

   			 $array_qualdom = array() ;
		    while ($row_qualdom = pg_fetch_row($contests_qualdom)) {
		        $array_qualdom[] = $row_qualdom;
		    }


		    while ($row = pg_fetch_row($rq)) {

		    		 $output .="
             		 		<tr>
								<td>
									<select  name='lib_qualdom[]'  class='form-control selectDoms lib_qualdom' style='width: 100%;margin-top: -2%'> ";

									 $output .="<option value=''>S&#233;lectionner le libell&#233;</option>";

									for ($i=0; $i <count($array_qualdom) ; $i++) { 
 										// echo $myarrayprm[$i][0] .'<br/>';
 										 $output .= '<option value="'.$array_qualdom[$i][0].'"  '.($array_qualdom[$i][0]==$row[0] ? 'selected': '').'    >'.$array_qualdom[$i][0].'</option>';
 									}

 					$output .="
 									</select>
					            </td>
				            </tr>";
		    }

		     echo  $output;  

           	


	  }

?>