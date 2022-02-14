<?php 

include ('../../../../configuration_w/mabd.php');


$besoins =$_POST['besoins'];
$pu =$_POST['pu'];
$code_key =$_POST['code'];

ini_set('display_errors', 1);

$result = pg_query("SELECT * FROM public.mis_tab_besoins WHERE code_key='".$code_key."'  ");
$find = pg_num_rows($result);

 function donnees($besoins,$pu,$code_key){

    if(!empty($besoins[0]) AND  !empty($pu[0]) ){
        foreach ($besoins as $key => $v) {
        $query1="INSERT INTO public.mis_tab_besoins(
            id_besoins, pu, code_key)
            VALUES (  
                   '".$v."',
                   '".$pu[$key]."',
                   '".$code_key."' 
            );";
                            
            pg_query($query1) or die("Error while insert"); 
        }
    }

 }
 
if ($find==0){ 
    donnees($besoins,$pu,$code_key);
}else{
    pg_query("DELETE FROM public.mis_tab_besoins WHERE code_key='".$code_key."'  ");

     donnees($besoins,$pu,$code_key);
}
