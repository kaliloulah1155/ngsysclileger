<?php

include ('../../../../../configuration_w/mabd.php');


ini_set('display_errors', 1);

$activites= $_GET['activites'] ;

$taches= $_GET['taches'] ;

$heureins= $_GET['heureins'] ;

$heureouts= $_GET['heureouts'] ;

$durees= $_GET['durees'] ;

$taux= $_GET['taux'] ;    

$resultats= $_GET['resultats'] ;

$dateEnreg=$_GET['dateEnreg'] ;

$user_email=$_GET['user_email'] ;

$departement=$_GET['departement'] ;

$service=$_GET['service'] ;



 $hs="false";
 $ferie="false";

     

$result = pg_query("SELECT * FROM public.tache_journalieres WHERE email='".$user_email."' AND date_enreg='".$dateEnreg."' ");
$find = pg_num_rows($result);


if ($find!=0){

		 ////VUE DE CONSULTATION ////

     //trouve
    if(!empty($activites[0]) AND  !empty($taches[0])  AND !empty($heureins[0])  AND !empty($heureouts[0]) AND !empty($durees[0]) AND !empty($taux[0]) AND !empty($resultats[0] ) ){ // verification si les données de la premiere ligne n'est pas vide

         pg_query(" DELETE FROM public.tache_journalieres WHERE email='".$user_email."' AND date_enreg='".$dateEnreg."' ");


        foreach ($activites as $key => $v) {
            /*echo ' Email : '.$user_email .' Activite : '.$v .'  Tache : '.$taches[$key].'  Heure in : '.$heureins[$key].'  Heure out : '.$heureouts[$key].'  Duree : '.$durees[$key].'  Taux : '.$taux[$key].'resultat : '.$resultats[$key].'  Date  : '.$dateEnreg.'  Service  : '.$service.'  departement  : '.$departement.'</br>'; */
             if(!empty($v) AND !empty($taches[$key])  AND !empty($heureins[$key])  AND !empty($heureouts[$key]) AND !empty($durees[$key]) AND !empty($taux[$key]) AND !empty($resultats[$key]) ){

                 $query1="INSERT INTO public.tache_journalieres(
                    email, activites, taches, heurein, heureout, duree,taux, resultat, departement,service,hs,ferie)
                    VALUES (  
                           '".$user_email."',
                            '".htmlentities($v, ENT_QUOTES, "UTF-8")."',
                            '".$taches[$key]."',
                             '".$heureins[$key]."',
                              '".$heureouts[$key]."',
                               '".$durees[$key]."',
                                '".$taux[$key]."',
                                 '".$resultats[$key]."',
                                 '".$service."',
                                  '".$departement."',
                                  '".$dateEnreg."',
                                  '".$hs."',
                                  '".$ferie."'
                              );";
                                    
                        pg_query($query1) or die("Error while insert"); 

             } 
        }
        // echo "Enregistrement effectue avec succes <br/>";
    }else{
           //  echo "Veuillez renseigner les taches correctements<br/>";
    }


}else{

			////VUE DE CREATION ////
		   //non trouve
		 if(!empty($activites[0]) AND  !empty($taches[0])  AND !empty($heureins[0])  AND !empty($heureouts[0]) AND !empty($durees[0]) AND !empty($taux[0]) AND !empty($resultats[0] ) ){ // verification si les données de la premiere ligne n'est pas vide  
		       foreach ($activites as $key => $v) {

		            if(!empty($v) AND !empty($taches[$key])  AND !empty($heureins[$key])  AND !empty($heureouts[$key]) AND !empty($durees[$key]) AND !empty($taux[$key]) AND !empty($resultats[$key]) ){

		           /*echo ' Email : '.$user_email .' Activite : '.$v .'  Tache : '.$taches[$key].'  Heure in : '.$heureins[$key].'  Heure out : '.$heureouts[$key].'  Duree : '.$durees[$key].'  Taux : '.$taux[$key].'resultat : '.$resultats[$key].'  Date  : '.$dateEnreg.'  Service  : '.$service.'  departement  : '.$departement.'</br>'; */
   
		                    $query2="INSERT INTO public.tache_journalieres(
		                    email, activites, taches, heurein, heureout, duree,taux, resultat, departement, service,date_enreg,hs,ferie)
		                    VALUES (  
		                           '".$user_email."',
		                            '".htmlentities($v, ENT_QUOTES, "UTF-8")."',
		                            '".$taches[$key]."',
		                             '".$heureins[$key]."',
		                              '".$heureouts[$key]."',
		                               '".$durees[$key]."',
		                                '".$taux[$key]."',
		                                 '".$resultats[$key]."',
		                                 '".$service."',
		                                  '".$departement."',
		                                  '".$dateEnreg."',
		                                  '".$hs."',
                                 		   '".$ferie."'
		                              );";

		                    pg_query($query2) or die("Error while insert");

		           }

		       }
		         //echo "Enregistrement effectue avec succes <br/>";
		    }else{
		           // echo "Veuillez renseigner les taches correctements<br/>";
		    }





}

			


 

?>