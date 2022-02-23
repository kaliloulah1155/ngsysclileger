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
$motif1 = $_POST['motif'];
$motif= strtolower($motif1); // une demande d'absence
$numero=$_POST['numero']; //numero de la demande

 // email du receveur
$contentTitre=$objet.' de '.$destinateur; // Objet du mail


$output ="
 
<div style='font-size:20px'>
   Bonjour <b> $destinataire </b> ,<br/>
   Vous avez reçu une <b> $objet </b> pour validation de la part de <b> $destinateur </b> avec pour motif : <b> $motif </b>.<br/>
   Prières de la traiter sur l'application <b> $lien </b> .<br/>
   <small> Numero de la demande : $numero </small> 
</div>
";

/* 
   la fonction factmail prend en parametre le mail du receveur , l'ojet et le contenu 
*/
$final_response=$respfactory->factmail($emailput,$contentTitre,$output); 
echo json_encode($final_response);

 