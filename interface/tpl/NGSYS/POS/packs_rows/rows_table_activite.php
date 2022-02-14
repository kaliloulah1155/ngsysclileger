<?php 
    
	 include ('../../../../../configuration_w/mabd.php');

	 $loadcode=$_GET['loadcode'];

	 $result = pg_query("SELECT * FROM public.pos_activite WHERE  code='".$loadcode."'");
	 $find = pg_num_rows($result);

	 $output='';

	  if($find!=0){

 
	  	    $rq = pg_query($conn,"
           			SELECT pact.libelle as activites,ptt.libelle as titres
					FROM public.pos_activite posact
					LEFT JOIN public.pactivite pact
					ON  pact.id=posact.activite_id 
					LEFT JOIN public.ptitre ptt
					ON  ptt.id=posact.titre_id
					WHERE code='".$loadcode."'
           	");


           	$query_activite = "SELECT  libelle FROM public.pactivite ";
   			$contests_activite = pg_query($query_activite) or die('Query failed: ' . pg_last_error());

   			 $array_activite = array() ;
		    while ($row_activite = pg_fetch_row($contests_activite)) {
		        $array_activite[] = $row_activite;
		    }

		    $query_titre = "SELECT  libelle FROM public.ptitre ";
   			$contests_titre = pg_query($query_titre) or die('Query failed: ' . pg_last_error());

   			 $array_titre = array() ;
		    while ($row_titre = pg_fetch_row($contests_titre)) {
		        $array_titre[] = $row_titre;
		    }


		    while ($row = pg_fetch_row($rq)) {

		    		 $output .="
             		 		<tr>
								<td class='col-sm-6'>
									<select  name='lib_pactivite[]'  class='form-control selectLibPost lib_pactivite' style='width: 100%;'> ";

									 $output .="<option value=''>Veuillez selectionner le libell&#233;</option>";

									for ($i=0; $i <count($array_activite) ; $i++) { 
 										// echo $myarrayprm[$i][0] .'<br/>';
 										 $output .= '<option value="'.$array_activite[$i][0].'"  '.($array_activite[$i][0]==$row[0] ? 'selected': '').'    >'.$array_activite[$i][0].'</option>';
 									}

 					$output .="
 									</select>
					            </td>";
				   $output .=" <td class='col-sm-6'>
									<select  name='lib_ptitre[]'  class='form-control selectTitbPost lib_ptitre' style='width: 100%;'> ";

									 $output .="<option value=''>Veuillez selectionner le libell&#233;</option>";

									for ($k=0; $k <count($array_titre) ; $k++) { 
 										// echo $myarrayprm[$i][0] .'<br/>';
 										 $output .= '<option value="'.$array_titre[$k][0].'"  '.($array_titre[$k][0]==$row[1] ? 'selected': '').'    >'.$array_titre[$k][0].'</option>';
 									}

 					$output .="
 									</select>
					            </td>";

				  $output .="</tr>";
		    }

		     echo  $output;  

           	


	  }

?>