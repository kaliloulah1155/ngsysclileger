<?php

if (!defined("POS_MODIF"))
{
	define("POS_MODIF",1);

	function prend_doc($jeton, $iNumDoc)
	{
		//libere_tous_docs($jeton);
		$retour=pos_dmdmodifdoc($jeton,$iNumDoc,1);

		if($retour)
		{
			$i=count($_SESSION["sess_tab_doc_en_modif"]);
			$_SESSION["sess_tab_doc_en_modif"][$i]=$iNumDoc;
			return 1;
		}
		else
		{
			if (count($_SESSION["sess_tab_doc_en_modif"]) != 0 && 
					in_array($iNumDoc, $_SESSION["sess_tab_doc_en_modif"]))
				$retour = 1;
			else
			{
				$retour = 0;
			}
		}
		return $retour;
	}
	
	function libere_doc($jeton, $iNumDoc)
	{
		if (count($_SESSION["sess_tab_doc_en_modif"]) != 0 && 
							in_array($iNumDoc, $_SESSION["sess_tab_doc_en_modif"]))
		{
		
			$retour=pos_dmdmodifdoc($jeton,$iNumDoc,2);
	
			if($retour)	
			{
				for($i=0; $i<count($_SESSION["sess_tab_doc_en_modif"]); $i++)
				{
					if($_SESSION["sess_tab_doc_en_modif"][$i] == $iNumDoc)
						$_SESSION["sess_tab_doc_en_modif"][$i] = 0;
				}
				return 1;
			}
			else
			{
				debug($jeton);
				return 0;
			}
		}
	}

	function libere_tous_docs($jeton)
	{
		if (count($_SESSION["sess_tab_doc_en_modif"]) != 0) 
		{
			// Liberation des documents en modification.
			for($i=0; $i<count($_SESSION["sess_tab_doc_en_modif"]); $i++)
			{
				if($_SESSION["sess_tab_doc_en_modif"][$i] != 0)
				{
					$retour=pos_dmdmodifdoc($jeton,$_SESSION["sess_tab_doc_en_modif"][$i],2);
					$_SESSION["sess_tab_doc_en_modif"][$i] = 0;
				}
			}
		}
	}
}

?>