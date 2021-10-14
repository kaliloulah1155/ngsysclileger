<?php

include ('../../../../../configuration_w/mabd.php');

$loadcode= $_POST['loadcode'] ;
 

$result = pg_query("SELECT * FROM public.tab_hsu WHERE code='".$loadcode."'  ");
$find = pg_num_rows($result);


$output='';

$i=0;  //nombre de donnees

if ($find!=0){

  $rq = pg_query($conn,"SELECT date_crea,hdeb,hfin,nbrehreal,motif,montant,ferie FROM public.tab_hsu WHERE code='".$loadcode."'  ");

  while ($row = pg_fetch_row($rq)) {

    $dt_init = explode("-", $row[0]);
    $dtcrea=$dt_init[2].'-'.$dt_init[1].'-'.$dt_init[0] ;
    $date2 = (new DateTime($dtcrea))->format('d-m-Y');

    $output .="
    <tr>
            <td style='width: 20px;border:none;'>


               ";
               
             if($i==0){ 
                $output .= "";

            }else{
                $output .= "


               <i class='fa fa-archive' title='Suprimer la ligne' id='Suprim'  >

                ";

            } 

    $output .="
          </td>
          <td style='width: 100px;border:none;'>
            <input type='text'  name='date[]' value='".$date2."'   style='width: 100%;height: 11vh;background: transparent;border: 1px solid;margin-top: 2px' placeholder='jj-mm-aaaa' class='form-control date' required='true'>
          </td>
          <td style='width: 100px;border:none;'>
            <input type='time' name='heurein[]' value=".$row[1]."   style='width: 100%;height: 11vh;background: transparent;border: 1px solid;margin-top: 2px' class='form-control heurein' required='true'>
          </td>
          <td style='width: 100px;border:none;'>
            <input type='time'  name='heureout[]'  value=".$row[2]."  style='width: 100%;height: 11vh;background: transparent;border: 1px solid;margin-top: 2px' class='form-control heureout' required='true'>
          </td>
          <td style='width: 100px;border:none;'>
            <input type='text' readonly='true' name='duree[]' value=".$row[3]."  style='width: 100%; height: 11vh;background: transparent;border: 1px solid;margin-top: 2px;' rows='2' placeholder='' class='form-control duree' required='true'>
          </td>
          <td style='width: 300px;border:none;'>
            <textarea type='text' name='tache[]'  style='width: 100%; height: 11vh;background: transparent;border: 1px solid;margin-top: 2px;resize: none;' rows='2' class='form-control tache' required='true'>".$row[4]."</textarea>
          </td>
          <td style='width: 100px;border:none;'>
            <input type='text' disabled  name='montant[]' value=".$row[5]."  style='width: 100%; height: 11vh;background: transparent;border: 1px solid;margin-top: 2px' rows='2' min='0'  class='form-control montant'>
          </td>
          <td style='width: 50px;border:none;'>
            <input name='select[]' type='checkbox'";

                if($row[6]=='true'){
                  $output .=" checked='true' ";
                }else{

                }
            
             
            $output .=" class='cbk'  style='width: 80%;font-size: 12px;margin-left: -37%;' >
          </td>
  </tr>
  ";

  // checked='".$row[6]."'
  $test_mode ='';
  $i++;
  }
  echo  $output; 

}else {

  $output .="

  <tr>
        <td style='width: 20px;border:none;'>
          <!-- <i class='fa fa-archive' title='Suprimer la ligne' id='Suprim'></i> -->
        </td>
        <td style='width: 100px;border:none;'>
          <input type='text'  name='date[]'  id='date1'   style='width: 100%;height: 11vh;background: transparent;border: 1px solid;margin-top: 2px' placeholder='jj-mm-aaaa' class='form-control date' required='true'>
        </td>
        <td style='width: 100px;border:none;'>
          <input type='time' name='heurein[]'   style='width: 100%;height: 11vh;background: transparent;border: 1px solid;margin-top: 2px' class='form-control heurein' required='true'>
        </td>
        <td style='width: 100px;border:none;'>
          <input type='time'  name='heureout[]'   style='width: 100%;height: 11vh;background: transparent;border: 1px solid;margin-top: 2px' class='form-control heureout' required='true'>
        </td>
        <td style='width: 100px;border:none;'>
          <input type='text' readonly='true' name='duree[]'  style='width: 100%; height: 11vh;background: transparent;border: 1px solid;margin-top: 2px;' rows='2' placeholder='' class='form-control duree' required='true'>
        </td>
        <td style='width: 300px;border:none;'>
          <textarea type='text' name='tache[]' style='width: 100%; height: 11vh;background: transparent;border: 1px solid;margin-top: 2px;resize: none;' rows='2' class='form-control tache' required='true'></textarea>
        </td>
        <td style='width: 100px;border:none;'>
          <input type='text' disabled  name='montant[]'  style='width: 100%; height: 11vh;background: transparent;border: 1px solid;margin-top: 2px' rows='2' min='0'  class='form-control montant'>
        </td>
        <td style='width: 50px;border:none;'>
          <input name='select[]' type='checkbox'  class='cbk'  style='width: 80%;font-size: 12px;margin-left: -37%;' >
        </td>
</tr>
";

  echo  $output; 
}
  

?>