<?php 

 include('factory_email.php');
 ini_set('display_errors', 1);


$respfactory=new FactoryMail;
$emailput=$_POST['sendemail'];  // email du receveur
$contentTitre=$_POST['titre']; // Objet du mail
$output=$_POST['contenu']; //Contenu du mail il peut prendre du html

    

/* 
   la fonction factmail prend en parametre le mail du receveur , l'ojet et le contenu 
*/
$final_response=$respfactory->factmail($emailput,$contentTitre,$output); 
echo json_encode($final_response);

 