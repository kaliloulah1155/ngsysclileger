<?php
include ('../../../../../configuration_w/mabd.php');

$dateEnreg= $_GET['dateEnreg'] ;

$user_email= $_GET['user_email'] ;



$result = pg_query("SELECT * FROM public.tache_journalieres WHERE email='".$user_email."' AND date_enreg='".$dateEnreg."'");
$find = pg_num_rows($result);

//echo $find.' lignes '.$dateEnreg;
    

$output='';
$i=0;  //nombre de donnees


if ($find!=0){


         $rq = pg_query($conn,"SELECT email, activites, taches, heurein, heureout, duree,taux, resultat, departement, service FROM public.tache_journalieres WHERE email='".$user_email."'  AND date_enreg='".$dateEnreg."'");

 
        
         while ($row = pg_fetch_row($rq)) {

                $output .="
                        <tr>
                                <td style='width: 20px;border:none;'>


                                   ";
                                   
                                 if($i==0){ 
                                    $output .= "";

                                }else{
                                    $output .= "


                                   <i class='fa fa-archive' title='Suprimer la ligne' id='suprim'>

                                    ";

                                } 


              $output .="

                        </td>
                        <!--bouton plus-->
                       
                         <!--fin bouton plus-->
                        <td style='width: 150px;border:none;'>
                             
                              <input type='text' name='activite[]'  value=".$row[1]." style='width: 100%;height: 11vh;' class='form-control activite'>
                        </td>
                        <td style='width: 300px;border:none;'>
                            <textarea type='text' name='tache[]' style='width: 100%; resize: none' rows='2' class='form-control tache'>".$row[2]."</textarea>
                        </td>
                        <td style='width: 100px;border:none;'>
                            <input type='time' name='heurein[]' value=".$row[3]." style='width: 100%;height: 11vh;' class='form-control heurein'>
                        </td>
                        <td style='width: 100px;border:none;'>
                            <input type='time'  name='heureout[]'  value=".$row[4]." style='width: 100%;height: 11vh;' class='form-control heureout'>
                        </td>
                        <td style='width: 100px;border:none;'>
                            <input type='text' name='duree[]'  value=".$row[5]." style='width: 100%;height: 11vh;' class='form-control duree'>
                        </td>
                        <td style='width: 100px;border:none;'>
                            <input type='text' step='1' min='1' name='taux[]'  value='".$row[6]."' max='100' style='width: 100%;height: 11vh;' class='form-control taux'  id='taux'>
                        </td>
                        <td style='width: 150px;border:none;'>
                            <input type='text' name='resultat[]'  value=".$row[7]." style='width: 100%;height: 11vh;' class='form-control resultat'  id='resultat'>
                        </td>
                    </tr>


                ";

                $i++;


         }

      


      echo  $output;  

}else {

    $output .="

        <tr>
            <!--bouton plus-->
            <td style='width: 20px;border:none;'>
                   
             </td>
             <!--fin bouton plus-->
            <td style='width: 150px;border:none;'>
                  <input type='text' name='activite[]' style='width: 100%;height: 11vh;' class='form-control activite'>
            </td>
            <td style='width: 300px;border:none;'>
                <textarea type='text' name='tache[]' style='width: 100%; resize: none' rows='2' class='form-control tache'></textarea>
            </td>
            <td style='width: 100px;border:none;'>
                <input type='time' name='heurein[]' style='width: 100%;height: 11vh;' class='form-control heurein'>
            </td>
            <td style='width: 100px;border:none;'>
                <input type='time'  name='heureout[]' style='width: 100%;height: 11vh;' class='form-control heureout'>
            </td>
            <td style='width: 80px;border:none;'>
                <input type='text' name='duree[]' style='width: 100%;height: 11vh;' class='form-control duree'>
            </td>
            <td style='width: 100px;border:none;'>
                <input type='text' name='taux[]' step='1' min='1' max='100' style='width: 100%;height: 11vh;' class='form-control taux'  id='taux'>
            </td> 
            
            <td style='width: 150px;border:none;'>
                <input type='text' name='resultat[]' style='width: 100%;height: 11vh;' class='form-control resultat'  id='resultat'>
            </td>
        </tr>

    ";

    echo  $output;  


}



