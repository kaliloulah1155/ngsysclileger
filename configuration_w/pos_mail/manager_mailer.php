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
$dateDebut = $_POST['dateDebut']; // date de debut de l'interim
$dateFin = $_POST['dateFin']; // date de fin de l'interim
 // email du receveur
$contentTitre=$objet.' de '.$destinateur; // Objet du mail
$demandeur = $_POST['demandeur']; // 'initateur de la demande
$interimaire = $_POST['interimaire']; // 'interimaire

$output ="
 
<div style='font-size:20px'>
   Bonjour <b> $destinateur </b> ,<br/><br/>
   Vous avez reçu une <b> $objet </b> de <b> $demandeur </b> pour validation sur <b> $lien </b> .<br/>
   L’intérim de cette demande sera assuré par <b> $interimaire </b> et durera du  <b> $dateDebut </b> au <b> $dateFin </b> <br/>  
   Numero demande : $numero <br/> 
   Cordialement. 
</div>
";

/* 
   la fonction factmail prend en parametre le mail du receveur , l'ojet et le contenu 
*/
$final_response=$respfactory->factmail($emailput,$contentTitre,$output); 
echo json_encode($final_response);

 