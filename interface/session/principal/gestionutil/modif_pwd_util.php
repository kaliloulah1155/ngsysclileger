<?php
/*
 * DESCRIPTION : Changement du mot de passe par l'administrateur
 */

session_start();
require("../ajax/JSON.php");
require("../include/util_headers.php");
include("../include/connexion.inc.php");
include("../include/debug.inc.php");
include("../include/md5.inc.php");
include("../include/fonction_cryptage.php");
include("../../../../configuration_w/constantesPHP.conf.php");
include("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");

writeHeadersNoCache();
$json = new Services_JSON();
$objRetour = array();
$objRetour["code_retour"] = 0;
$objRetour["msg_retour"] = "";

$szNvPwd = decrypt_text($_REQUEST['POS_NV_PWD'], $_SESSION["sess_crypt_key"]);
$szCopieNvPwd = decrypt_text($_REQUEST['POS_COPIE_NV_PWD'], $_SESSION["sess_crypt_key"]);
if ($_SESSION["sess_droitAdminUtilisateur"] == false && $_SESSION["sess_droitAdministration"] == false)
{
	$objRetour["msg_retour"] = CST_LIBELLE_NO_ADMIN_USER;
}
else
{
    if (strcmp($szNvPwd, $szCopieNvPwd) == 0)
    {
    	$retour = connexion($jeton);
    	if (!$retour)
    	{
    		$objRetour["msg_retour"] = get_erreur_poseidon($jeton);
    	}
    	else
    	{
    		$retour = pos_changepwdadmin($jeton, $_REQUEST['POS_CODE_UTIL'], $szNvPwd); 
    		if (!$retour)
    		{
    			$objRetour["msg_retour"] = get_erreur_poseidon($jeton);
    		}
    		else
    		{
    			$objRetour["code_retour"] = 1;
    			//$objRetour["msg_retour"] = "Le mot de passe a été modifié";
    			$objRetour["msg_retour"] = CST_MESSAGE_MDP_MODIFIE;
    		}
    			
    	}
    	pos_disconnect($jeton);
    }
    else
    {
    	//$objRetour["msg_retour"] = "Vous n'avez pas saisi deux fois le même mot de passe";
    	$objRetour["msg_retour"] = CST_MESSAGE_MDPS_DIFFERENTS;
    }
}
$output = $json->encode($objRetour);
print($output);
?>
