<html>
	<head>
		<title>Redaction web</title>
	</head>
	<frameset rows="50,*" border="0">
	<frame src="../redaction_web/afficher_edition_action.php?POS_NUM_DOC=<?php echo $_REQUEST['POS_NUM_DOC'];?>&POS_NUM_PAGE=<?php echo $_REQUEST['POS_NUM_PAGE'];?>&MODELE_HTML=<?php echo $_REQUEST['MODELE_HTML'];?>" name="edition_action" scrolling="no">
    <frame src="../redaction_web/afficher_edition_vue.php?POS_NUM_DOC=<?php echo $_REQUEST['POS_NUM_DOC'];?>&POS_NUM_PAGE=<?php echo $_REQUEST['POS_NUM_PAGE'];?>&MODELE_HTML=<?php echo $_REQUEST['MODELE_HTML'];?>" name="edition_vue" border="0" marginheight="0" marginwidth="0">
    </frameset>
</html>