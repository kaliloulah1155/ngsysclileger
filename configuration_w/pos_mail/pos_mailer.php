<?php 

 include('factory_email.php');
 // header('Content-Type:application/json');
 //ini_set('display_errors', 1);




$respfactory=new FactoryMail;
$emailput=$_POST['sendemail'];  // email du destinataire


$destinataire=$_POST['destinataire'] ; // nom &prenoms
$destinateur=$_POST['destinateur'] ;  // nom &prenoms
$lien=$_POST['lien'] ;  // lien du site web 
$objet=$_POST['objet']; // demande d'absence
$motif=$_POST['motif']; // une demande d'absence
$numero=$_POST['numero']; //numero de la demande

 // email du receveur
$contentTitre=$objet.' Numéro '.$numero.' '.$destinateur; // Objet du mail


$output ="

<div style='font-size:20px'>
   Bonjour  $destinataire ,<br/>

   Vous avez reçu $objet  pour validation de la part de $destinateur avec pour motif : $motif .<br/>
   Prières de la traiter sur l'application $lien .<br/>

 </div>
";

/* 
   la fonction factmail prend en parametre le mail du receveur , l'ojet et le contenu 
*/
$final_response=$respfactory->factmail($emailput,$contentTitre,$output); 
echo json_encode($final_response);

 