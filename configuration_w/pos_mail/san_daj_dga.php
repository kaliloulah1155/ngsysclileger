<?php 

 include('factory_email.php');
 header('Content-Type:application/json');
 ini_set('display_errors', 1);



$respfactory=new FactoryMail;
$emailput=$_POST['sendemail'];  // email du destinataire
// $destinataire=$_POST['destinataire'] ; // nom &prenoms du destinataire
$destinateur=$_POST['destinateur'] ; // nom &prenoms du destinateur
$lien=$_POST['lien'] ;  // lien du site web 
$objet=$_POST['objet']; // demande d'absence
$numero=$_POST['numero'];   
$nomPrenomEmploye=$_POST['nomPrenomEmploye']; 
$nomPrenomManager=$_POST['nomPrenomManager']; 
 // email du receveur
$contentTitre=$objet.' de '.$nomPrenomEmploye ; // Objet du mail


$output ="
 
<div style='font-size:20px'>
   Bonjour <b> $destinateur </b> ,<br/> <br/> 
   Vous avez reçu du Département Administratif et Juridique (DAJ) une sanction de <b> $nomPrenomEmploye </b>.<br/>
   Veuillez vous connecter sur <b> $lien </b> pour sa transmission au Directeur Général  (DG). <br/>  
   Numéro demande : $numero <br/> 
   Cordialement.
</div>
";


/* 
   la fonction factmail prend en parametre le mail du receveur , l'ojet et le contenu 
*/
$final_response=$respfactory->factmail($emailput,$contentTitre,$output); 
echo json_encode($final_response);

 