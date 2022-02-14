<!--<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">-->
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:pos="http://www.sesin.com/"> 
<head>
<link REL="stylesheet" TYPE="text/css" HREF="/{NOM_APPLICATION}/include/style/style.css">
<script language="javascript" type="text/javascript" src="../../../../include/script/tiny_mce/tiny_mce.js"> </script>
<script type="text/javascript">

var tabRub = new Array();
<!-- BEGIN BLOC_RUBINFO -->
tabRub["{CODERUB}"] =  "{LIBELLERUB}";
<!-- END BLOC_RUBINFO -->


</script>
<script language="javascript" type="text/javascript" src="tiny_mce/tiny_mce.js"> </script><script type="text/javascript">
    tinyMCE.init({
        mode : "exact",
        theme : "advanced",
        language : "fr",
        elements : "contenu_modele",
        plugins : "advhr,advimage,advlink,contextmenu,directionality,emotions,iespell,inlinepopups,insertdatetime,fullscreen,layer,noneditable,paste,print,save,searchreplace,table,sesin",
        theme_advanced_buttons1 : "print,separator,undo,redo,separator,cut,copy,pastetext,pasteword,separator,search,replace,separator,charmap,separator,fullscreen,separator,help",
        theme_advanced_buttons2 : "bold,italic,underline,strikethrough,separator,justifyleft,justifycenter,justifyright,justifyfull,separator,forecolor,backcolor,rubselector,separator,zoneeditable",
        theme_advanced_buttons3 : "bullist,numlist,separator,outdent,indent,separator,tablecontrols,separator,separator,image,separator,hr,separator,cleanup,separator,inserttime,pagebreak",
        theme_advanced_layout_manager : "SimpleLayout",
        theme_advanced_toolbar_align : "left",
        theme_advanced_toolbar_location : "top",
        theme_advanced_statusbar_location : "none",
        theme_advanced_path : true,
        theme_advanced_fonts : "Arial=arial,helvetica,sans-serif",
        apply_source_formatting : true,
        convert_on_click : false,
        entity_encoding : "raw",
        force_br_newlines : true
        });
</script>      
<script xmlns="http://www.w3.org/1999/xhtml" language="javascript" type="text/javascript" src="../../../../include/script/redaction_web/edition.js">
       <xsl:text> </xsl:text>
</script></head>
  
<body onLoad="loadEdition()">
<form name="principal" method="POST" action="/{NOM_APPLICATION}/interface/session/principal/redaction_web/enregistrer_modele.php">
	<INPUT TYPE=HIDDEN NAME="POS_TYPEDOC" VALUE="{POS_TYPEDOC}">
	<div style="font-family:Arial;margin: 3em 3em 3em 3em;"> 
		<div style="border:1px solid black;margin-right:100pt"> 
			<p style="text-align:center;font-style:bold;font-size:20pt"> <b>CREATION DE MODELE POUR LA REDACTION WEB</b></p>
		</div>
		<div style="font-size:10pt">
			<p></p>
			<div style="margin-right:100pt"> 
				<img xmlns:xhtml="http://www.w3.org/1999/xhtml" src="../../../../images/redaction_web/edition.gif" border="0" style="display:none" id="img_postext1" onClick="javascript:changerVisuEdition(this)"/>
				<div xmlns:xhtml="http://www.w3.org/1999/xhtml" style="display:block;border:1px outset white;;cursor:pointer;" id="visu_postext1" onClick="javascript:changerVisuEditionDiv(this)">

				<p>
				<strong>Cliquer dans ce cadre</strong><br/>
				et créer votre modèle de document avec l'outil d'édition qui apparait.<br/>
 				<br/> 
				</p>

 				</div>
				<div xmlns:xhtml="http://www.w3.org/1999/xhtml" id="div_textarea_postext1" style="display:block">
					<textarea rows="50" cols="150" id="textarea_postext1" name="contenu_modele" title="">
					{HTML_CONTENU}
					</textarea>
				</div>
 			</div>
		</div>
	
		<div style="margin-right:100pt">
	<CENTER>
		<p>Saisissez le nom (sans extension) du fichier généré </p>
		<input type="text" value="{NOM_FICHIER}" name="nomdufichier">
		<input TYPE="submit" class="bouton" VALUE="Enregistrer">
	</CENTER>
	</div>
		
	</div>
	
</form>
</body>
</html>
