<?php

if (!defined("GET_TPL"))
{
	define("GET_TPL",1);

	function get_file_tpl($szTypeTpl, $szTypeDoc, $dwMumFiche, &$szFileTpl)
	{
		$szFileTpl = "../../../tpl/".$_SESSION["sess_application"]."/".$szTypeDoc."/".strtolower($szTypeTpl);
		$szFileTpl.= "_".$szTypeDoc."_".$_SESSION["sess_profil_fi_param"]."_".$dwMumFiche.".tpl";
	
		if(!file_exists($szFileTpl))
		{
			$szFileTpl = "../../../tpl/".$_SESSION["sess_application"]."/".$szTypeDoc."/".strtolower($szTypeTpl);
			$szFileTpl.= "_".$szTypeDoc."_".$dwMumFiche.".tpl";
			
			if(!file_exists($szFileTpl))
				return FALSE;
			else
				return TRUE;
		}
		else
			return TRUE;
	}
}

?>