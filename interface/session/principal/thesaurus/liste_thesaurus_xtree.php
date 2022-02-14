<?php
/* 
 * Affichage de la liste des thésaurus 
 *
 * Patrick 09/06/2008
 *
 * Données en entrée :
 *
 */
session_start();
include ("../include/connexion.inc.php");
include ("../include/debug.inc.php");
include ("../include/template.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../../../../configuration/url.conf.php");

$retour = connexion($jeton);

if ($retour)
{
	// vérification du droit à gérer les domaines fermés 
	if ($_SESSION["sess_droitThesaurus"] == false)
	{	
		echo CST_LIBELLE_NO_ADMIN_THESAURUS;
	}
	else
	{
		$t = new Template(".");
		
		$t->set_File("thesaurus", REP_TEMPLATE_APPLICATIF."thesaurus/liste_thesaurus_xtree.tpl");
		$t->set_var("TITRE_PAGE", CST_LIBELLE_TOOLBAR_GEST_THESAURUS);
		$t->set_var("DROIT_ADMIN_THESAURUS", ($_SESSION["sess_droitThesaurus"])?1:0);
		$t->set_var("LIBELLE_NO_ADMIN_THESAURUS", CST_LIBELLE_NO_ADMIN_THESAURUS); 
		$t->set_var("MESSAGE_SELECT_THESAURUS", CST_LIBELLE_SELECT_THESAURUS);
		$t->set_var("CST_TITRE_TABLEAU_ALL_THESAURUS", CST_TITRE_TABLEAU_ALL_THESAURUS);
		
		$t->set_var("LIBELLE_MODIFIER", CST_LIBELLE_MODIF);
		
		$t->set_block("thesaurus", "BLOC_THESAURUS", "bloc_thesaurus");
		
		$tabThesaurus = array();
		//on récupère les types de documents
    	//$retour = pos_getlistalltypes($jeton, /*pref*/$tabLstTypDoc);
    	$retour = pos_getinfoalltypes($jeton, "999", /*pref*/$tabInfoType, /*pref*/$tabInfoZonesKeys);
    	if (!$retour)
    		debug($jeton);
    	else {
    		// on récupére les types de document gérant un thésaurus
    		for($i=0; $i<count($tabInfoType); $i++)
    		{
    			if($tabInfoType[$i]->b_thesaurus > 0)
    			{
    				$tabThesaurus[$tabInfoType[$i]->code]=$tabInfoType[$i]->libelle;
    			}
    		}
    		
			if($retour)
			{
				// Affichage
				if(count($tabThesaurus) != 0) {
				    
                    asort($tabThesaurus);
                    $i=0;
            		while (list($key, $val) = each($tabThesaurus))
            		{
						$szIdentListhier = "POS_TYPETHE=".urlencode(addslashes(trim($key)));
						$szIdentListhier .= "&POS_LIBELLETHE=".urlencode(addslashes(trim($val)));
						if ($_SESSION["sess_droitThesaurus"] == 1)
							$szIdentListhier .= "&POS_ETAT=GESTION";
						else
							$szIdentListhier .= "&POS_ETAT=CONSULTATION";
							
						$t->set_var("POS_IDENT_THESAURUS",$szIdentListhier);
						$t->set_var("POS_TYPETHE", $key);
						$t->set_var("POS_LIBELLETHE", $val);
                        $t->set_var("PAIR_OU_IMPAIR", (($i++ % 2) == 0) ? "pair" : "impair");
						$t->parse("bloc_thesaurus", "BLOC_THESAURUS",true);
            		}
				}
				else
					$t->set_var("bloc_thesaurus","");
					
				$t->pparse("MyOutput", "thesaurus");
			}
			else
				debug($jeton);
		}				
		pos_disconnect($jeton);		
	}
}
else
{
	debug($jeton);
	echec_connexion();
}


?>
