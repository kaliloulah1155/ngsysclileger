<?php 
	
    include ('../../../../../configuration_w/mabd.php');

    $init_email=trim($_GET['init_email']);




    $result = pg_query("SELECT * FROM public.pos_tab_index_cot WHERE \"MEL\"='".$init_email."'  ");
	$find = pg_num_rows($result);

  	 echo $find;

?>