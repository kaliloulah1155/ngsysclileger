<?php

function getNumDocPanier($jeton)
{
    $iNumDossierPanier = 0;
    $tabLoc = array();
    $tabLoc[0] = new Locution(1, GESTION_PANIER_TYPEDOC, GESTION_PANIER_CODERUB_USER, "=", $_SESSION["sess_user_name"]);
    $retour = pos_searchdoc($jeton, count($tabLoc), $tabLoc, /*pref*/$iNbReponses, /*pref*/$iAdrPremiereReponse);
    if ($retour)
    {
        if ($iNbReponses >= 1)
        {
            $tabNumDoc = array();
            $retour = pos_getreponsestabnumdoc($jeton, $iAdrPremiereReponse, $iNbReponses, /*pref*/$tabNumDoc);
            if ($retour)
                $iNumDossierPanier = $tabNumDoc[0];
        }
        else
        {
            $tabCodeRubToCreate = array();
            $tabCodeRubToCreate[GESTION_PANIER_CODERUB_CREATION] = GESTION_PANIER_VALEURRUB_CREATION;
            $retour = pos_createidx($jeton, 0, 0, "", GESTION_PANIER_TYPEDOC, 
                                count($tabCodeRubToCreate), $tabCodeRubToCreate, /*pref*/$iNumDoc);
            if ($retour)
                $iNumDossierPanier = $iNumDoc;
        }
    }
    return $iNumDossierPanier;
}

function getTabLocRecherchePanier($jeton, $session, &$tabLoc)
{
    $retour = 1;
    $tabLoc = array();
    if (defined('GESTION_PANIER_DOSSIER') && GESTION_PANIER_DOSSIER == 1)
    {
       include ("../panier/fct_panier.inc.php");
       $iNumDossierPanier = getNumDocPanier($jeton);
        if ($iNumDossierPanier != 0)
        {
            $tabFils = array();
            $retour = pos_dosinfocontenu($jeton, $iNumDossierPanier, /*pref*/$tabFils);
            for($i=0;$i<count($tabFils);$i++)
            {
			    $tabLoc[$i] = new Locution(1, "000", "N D", "=", $tabFils[$i]->doc_numero);
            }
        }
    }
    else
    {
        for($i=0;$i<count($session["sess_tabPanier"]);$i++)
        {
            list ($iNumDoc, $szTypeDoc) = explode("|", $session["sess_tabPanier"][$i]);

			if(strlen($szTypeDoc) == 0)
            	$szTypeDoc = "000";
            	
            // Création de la locution.
		    $tabLoc[$i] = new Locution(1, $szTypeDoc, "N D", "=", $iNumDoc);
        }
    }
    return $retour;
}
?>
