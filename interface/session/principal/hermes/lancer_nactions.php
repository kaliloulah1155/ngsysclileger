<?php
/*
 * DESCRIPTION : Execution d'une action Hermès sur les N documents
 * passés en arguments
 * IMPORTANT : c'est le libelle de l'action (POS_HERM_LIBACT) qui est utilise
 * pour lancer l'action.
 * Ceci pour pouvoir lancer une action commune sur plusieurs types de document
 * Exemple : tous les types client (C01, ..,C12) ont la meme action "Initialiser"
 * qui a le meme libelle pour tous les types mais pas le meme code.
 *
 * AUTEUR : Gabrielle Guy
 * DATE de CREATION : 13/12/2001
 *
 * Donnees en entree : 
 * POS_NUM_DOC[] : tableau de numeros informatiques
 * ou POS_SZ_NUMDOC : liste des nums infos séparés par des espaces
 * POS_HERM_LIBACT : libelle de l'action hermes 
 *  		(utilise pour le lancement de l'action)
 * POS_HERM_CODEACT : code de l'action utilise pour la recuperation des rubriques
 * POS_HERM_<code action>_<code rubrique> : liste des rubriques a modifier
 *
 * Modification :
 * 06.08.2002 : mise a jour pour reaffichage de l'ecran dans tous les cas
 *
 */
session_start();

include ("../include/connexion.inc.php");
include ("../include/form_values.inc.php");
include ("../include/debug.inc.php");
include ("../include/pos_dmdmodifdoc.inc.php");
include ("../include/fonction_util.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/url.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");

echo "<HTML><HEAD><LINK REL=\"stylesheet\" TYPE=\"text/css\" HREF=\"".URL_SITE."/include/style/style.css\"></HEAD><BODY>";

$trans = array("\n" => "\\n", "\r\n" => "\\r\\n", "\"" => "\\\"");
$szRapport = "";
$tabCodeRubModif = array();
$tabNumDoc = array();
	
$retour = connexion($jeton);
if ($retour)
{

	if (isset($_REQUEST["POS_HERM_CODEACT"]))
	{
    	$prefix = "POS_HERM_".$_REQUEST["POS_HERM_CODEACT"]."_";
        $tabCodeRubModif = get_form_values_with_prefix($prefix, true); 
    }
	
	if(isset($_REQUEST["POS_SZ_NUMDOC"]))
	    $tabNumDoc = explode(";",trim($_REQUEST["POS_SZ_NUMDOC"]));
	
	for($i=0;$i<count($tabNumDoc)-1;$i++)
	{
		$retour = pos_hermes_rempliraction($jeton, $tabNumDoc[$i], /*pref*/$tabActionsHermes);

		if ($retour)
		{
			$szCodeAction = "";
			for ($j=0;$j<count($tabActionsHermes); $j++)
			{
				if(strcmp($_REQUEST["POS_HERM_LIBACT"], $tabActionsHermes[$j]->action_libelle) == 0)
				{
					$szCodeAction = $tabActionsHermes[$j]->action_code;
					break;	
				}
			}

			if(strlen($szCodeAction) > 0)
			{
				// nom du fichier d'exportation pour la liste des rubriques
				$szNomFichier = getRepTmpSession(session_id());
				$szNomFichier .= "exportationHermes_".$tabNumDoc[$i].".txt";
				$retour = pos_hermes_lanceraction($jeton, $tabNumDoc[$i], $szCodeAction, 
					$tabCodeRubModif, $szNomFichier, /*pref*/$dwAfficheDoc, /*pref*/$dwNumDocAff, /*pref*/$szInfo);
				if($retour)
				{
					//$szRapport.="\n- L'action a été réalisée avec succès sur le document ".$tabNumDoc[$i];
				}
				else
				{
					$msg = get_erreur_poseidon($jeton);
			
					$szRapport.="<br>- Il y a eu une erreur au lancement de l'action pour le document ".$tabNumDoc[$i]." :";
					$szRapport.="<br>".$msg;
				}
			}
			else
			{
				$szRapport.="<br>- L'action '".$_REQUEST["POS_HERM_LIBACT"]."' n'est pas disponible pour le document ".$tabNumDoc[$i];
			}
		}
		else
		{
			$msg = get_erreur_poseidon($jeton);
			$szRapport.="<br>- Une erreur est survenue sur la fonction 'pos_hermes_rempliraction' pour le document ".$tabNumDoc[$i]." :";
			$szRapport.="<br>".$msg;
		}
			
	}//for
	pos_disconnect($jeton);
}
else
{
	debug($jeton);
	echec_connexion();
}

$szRapport = strtr(trim($szRapport), $trans);

if (strlen($szRapport) > 0) {
	echo $szRapport;
    echo "<center><input type='button' value='Fermer' onClick='parent.parent.closeFileModif();'></center>";
}

echo "<SCRIPT LANGUAGE=JavaScript>";
if (count($tabNumDoc) > 0)
	echo "parent.center.actualiser();";

if (strlen($szRapport) == 0)
echo "parent.parent.closeFileModif();";
    
echo "</SCRIPT></BODY></HTML>";

?>