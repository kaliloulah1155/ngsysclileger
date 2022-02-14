<?php     
   include ('../../../../../../configuration_w/mabd.php');

    $email=$_GET['user_email'];

     $dateEnreg=$_GET['dateEnreg'];

     $exDate = explode("/", $dateEnreg);
		 

    $dateInsert=(new DateTime($exDate[2].'-'.$exDate[1].'-'.$exDate[0]))->format('Y-m-d');


    $result = pg_query("SELECT * FROM public.cot_prime WHERE email='".strtoupper($email)."' AND date_enreg='".$dateInsert."'");
	$find = pg_num_rows($result);

	
	$output='';
    $i=0;  //nombre de donnees

    $sumup=0;     

    if ($find!=0){
          

           $rq = pg_query($conn,"
           	SELECT
					prm.libelle,ctprm.montant,ctprm.email,ctprm.status_cot_active,ctprm.date_enreg
			   FROM 
					public.prime prm
			   INNER JOIN  public.cot_prime ctprm
			   ON  prm.id= ctprm.prime_id
			   WHERE ctprm.email='".strtoupper($email)."' AND ctprm.date_enreg='".$dateEnreg."'
           	");


            $queryprm = "SELECT  libelle  FROM public.prime ORDER BY libelle ASC";
   			$contestsprm = pg_query($queryprm) or die('Query failed: ' . pg_last_error());

   			 $myarrayprm = array() ;
		    while ($rowprm = pg_fetch_row($contestsprm)) {
		        $myarrayprm[] = $rowprm;
		    }
             


           while ($row = pg_fetch_row($rq)) {



             	 $output .="
             		 		<tr>
								<td style='width: 100px;border:none;'>
									<select  name='lib_prime[]' class='form-control selectPrims lib_prime' style='width: 100%;border: none;margin: 2px auto'> ";

									 $output .="<option value='0'>S&#233;lectionner le libell&#233; de la prime</option>";

									for ($i=0; $i <count($myarrayprm) ; $i++) { 
 										// echo $myarrayprm[$i][0] .'<br/>';
 										 $output .= '<option value="'.$myarrayprm[$i][0].'"  '.($myarrayprm[$i][0]==$row[0] ? 'selected': '').'    >'.$myarrayprm[$i][0].'</option>';
 									}


				 $output .="
									</select>
								</td>
								<td style='width: 5px;border:none;'>
								</td>
								<td style='width: 100px;border:none;'>
									<input type='text' name='montant_prime[]' onkeypress='return testNum(event, this, 2);'  value=".$row[1]." min='0' placeholder='Montant de la prime' style='width: 100%;border: none;margin: 2px auto' class='form-control montant_prime'>
								</td>
								<td style='width: 20px;border:none;text-align: left;visibility: hidden'>
									<i class='fa fa-archive' title='Suprimer la ligne' id='Suprim'></i>
								</td>
							</tr>



             		 ";

             		 $sumup +=$row[1];

             		$i++;
             }
                $output .="<tr style='display:none' > <td><span class='total'>".number_format($sumup)."</span></td> </tr>";

             echo  $output;  

                


    }
  

?>