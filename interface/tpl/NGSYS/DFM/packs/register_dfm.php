<?php 

	include ("../../../../../configuration_w/mabd.php");


	$loadcode=$_POST['loadcode'];
	$personnel=$_POST['personnel'];
	$genre=$_POST['civilite'];
	$datenaiss=$_POST['datenaiss'];
	$nationalite=$_POST['nationalite'];
	$fonction=$_POST['fonction'];
	$categorie=$_POST['categorie'];
	$dtembauche=$_POST['dtembauche'];
	$cnps=$_POST['cnps'];
	$position=$_POST['position'];


         

if(!empty($loadcode) ){
             //for update use delete-insert OR Update add always second condition after code 
           pg_query("DELETE FROM public.beneficaire WHERE code='".$loadcode."'  ");
		 foreach ($personnel as $key => $v) {


//echo $loadcode.' '.$v.' '.$genre[$key].' '.$datenaiss[$key].' '.$nationalite[$key].' '.$fonction[$key].' '.$categorie[$key].' '.$dtembauche[$key].' '.$cnps[$key].' '.$position[$key].'<br/>';

            
            $resultfind=pg_query("SELECT * FROM public.beneficaire WHERE code='".$loadcode."' ");

            $find = pg_num_rows($resultfind);
		 	    echo $find;
		 	if($find!=0){

  
		 			pg_query("INSERT INTO public.beneficaire(
				                    code,
				                    email,
				                    genre,
									datenaiss,
									nationalite,
									fonction,
									categorie,
									anneeembauche,
									cnps,
									posit
				                   )
				                    VALUES (  
				                           '".$loadcode."',
				                            '".$v."',
				                            '".$genre[$key]."',
				                            '".$datenaiss[$key]."',
				                            '".$nationalite[$key]."',
				                            '".$fonction[$key]."',
				                            '".$categorie[$key]."',
				                            '".$dtembauche[$key]."',
				                            '".$cnps[$key]."',
				                            '".$position[$key]."'
				                     );"); 

		 	 }else{ 
                
                

		 	 	$query_dfm="INSERT INTO public.beneficaire(
				                    code,
				                    email,
				                    genre,
									datenaiss,
									nationalite,
									fonction,
									categorie,
									anneeembauche,
									cnps,
									posit
				                   )
				                    VALUES (  
				                           '".$loadcode."',
				                            '".$v."',
				                            '".$genre[$key]."',
				                            '".$datenaiss[$key]."',
				                            '".$nationalite[$key]."',
				                            '".$fonction[$key]."',
				                            '".$categorie[$key]."',
				                            '".$dtembauche[$key]."',
				                            '".$cnps[$key]."',
				                            '".$position[$key]."'
				                     );";

 
                    pg_query($query_dfm) or die("Error while insert");

		 	  } 

		 }

}
 
	