<?php

 //appel de la class permettant de parametrer la requete POST CURL
//NB : Veuillez configurer CURL au prealable dans apache avant son utilisation (voir documentat apache)  
//Veuillez configurer egalement le htaccess dans apache
 include('curllib.php');

class FactoryMail{
	function factmail(string $emailput,string $contentTitre,string $output):?string{
		$resp=new LibCurl; 

		$data_array =array(
		    'email'=>explode(" ",$emailput),
		    'subject'=>$contentTitre,
		    'body'=>$output
		  );
		$response= $resp->postlibCurl('transactional',$data_array);
		$data_response= json_encode($response);
        return  $data_response;
     }
}



 