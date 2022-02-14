<?php
// les sessions sont nettoyees en cas de timeout
// mais il reste le cas de changement d'Url
// on inclut la partie pour les constantes
include ("configuration_w/constantesPHP.conf.php");
include ("interface/session/principal/include/str_rand.inc.php");
//nom du serveur -> slt pendant le developpement..
$POS_SERVEUR=POS_SERVEUR;
$POS_PORT=POS_PORT;
ini_set("session.cookie_path", URL_SITE);
session_start();
$_SESSION["sess_crypt_key"] = str_makerand(6,10,true,true,true);
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<HTML>
<HEAD>
<TITLE>Client Poseidon </TITLE>
<link rel="stylesheet" type="text/css" href="include/script/yui/build/container/assets/skins/sam/container.css"/>
<link rel="STYLESHEET" type="text/css" href="include/style/style.css">
<link rel="STYLESHEET" type="text/css" href="include/style/<?php echo (isset($_REQUEST['STYLE_THEME'])) ? $_REQUEST['STYLE_THEME'] : "theme_gris" ?>.css">
<script src="include/script/md5.js"></script>
<script src="include/script/cryptor.js"></script>
<SCRIPT language="javascript" src="include/script/yui/build/yuiloader/yuiloader-min.js"></script>
<SCRIPT language="javascript" src="include/script/yui/build/yahoo-dom-event/yahoo-dom-event.js"></script>
<SCRIPT language="javascript" src="include/script/yui/build/container/container-min.js"></script>
<script src="include/script/accueil.js"></script>
<script>
var szCleCrypt = '<?php echo $_SESSION["sess_crypt_key"]; ?>';
function onEnterProfil(event) {
    if (event.keyCode == 13) {
        document.principal.submit();
    }
}

</script>
<style>
html { 
  margin:0;
  padding:0;
  background: linear-gradient(rgba(56, 88, 124, .3),rgb(16, 29, 44, .3)),url('images/themes/fond/sesin-02.jpg') no-repeat center fixed; 
  -webkit-background-size: cover; /* pour anciens Chrome et Safari */
  background-size: cover; /* version standardis�e */
}
</style>
</HEAD>
<body class='connexion yui-skin-sam'>

<div id="dialog1" class="yui-pe-content" style="visibility:hidden;">
<div class="hd">Changement du mot de passe</div>
<div class="bd">
<form method="POST" name='form_change_pwd'>
    <table role='presentation'>
	<tr>
        <td>
	       <label for="firstname">Nouveau mot de passe</label>
        </td>
        <td>   
            <input type="password" name="NV_MDP" />
        </td>
	</tr>
  <tr>
    	<td>
            <label for="lastname">Confirmer le mot de passe</label>
        </td>
        <td>
            <input type="password" name="CONF_NV_MDP" />
        </td>
    </tr>
	</table>
</form>
</div>
</div>

<div style="width: 80%; margin: auto;text-align: center;">
<div style='width: 80%; margin: 0 auto;text-align: center;'>
<br>
<img src="images/logo/ngser.png" width="300" style="margin-top: 7%; border-radius: 3px;" alt="Poseidon">
</div>
<br>

<div style='background-color: rgba(255,255,255,0.80);  width: 50%;margin: 9% auto;text-align: center;padding:30px;'>
    <table style='margin: auto;'>
              
<?php                    
if (isset($_SESSION) && isset($_SESSION["sess_user_name"]))
{
?>                    
			<tr>
            <td>
    <table>
				<TR>
    				<TD>
            <div style='text-align:justify;font-size:1.1em;word-wrap: break-word;' >
            <span style="font-weight:bold;font-size:inherit;text-align:center;font-family:'Times New Roman'">Vous �tes d�j� connect�(e)</span><br><br>
                    Une session de cette application est d�j� ouverte dans une fen�tre ou un onglet de ce navigateur. <br><br>
                    Vous pouvez continuer dans la session d�j� ouverte. <br><br> 
                    Sinon fermez toutes les instances du navigateur et reconnectez-vous ou cliquer sur le bouton "Nouvelle session".<br>
                    L'ouverture d'une nouvelle session invalidera toutes les sessions en cours. <br> <br> 
        			<div style='text-align: center'><INPUT type="submit" NAME="new_session" VALUE="Nouvelle session" onClick="document.location.href='<?php include ("configuration/url.conf.php");echo URL_DECONNECT ?>'"></div>
                    </div>
                    </TD>
				</TR>
		     </table>
<?php                    
}
else 
{
?>
              <tr>
                <td class='connexion_form'> 
                    <FORM NAME='principal' onSubmit='return connexion();' ACTION='interface/session/principal/connexion/ident_db.php' METHOD='post'>
        			<input TYPE='hidden' NAME='POS_PORT' value='<?php echo $POS_PORT;?>'>
        			<input TYPE='hidden' NAME='POS_SERVEUR' value='<?php echo $POS_SERVEUR;?>'>
        			<input TYPE='hidden' NAME='POS_NUM_DOC' value='<?php if(isset($_REQUEST['POS_NUM_DOC'])) {echo $_REQUEST['POS_NUM_DOC']; } else echo ''; ?>'>
        			<input TYPE='hidden' NAME='MODE' value='<?php if(isset($_REQUEST['MODE'])) {echo $_REQUEST['MODE']; } else echo ''; ?>'>
                    <input TYPE="hidden" NAME='POS_CONNEXION_AUTO' value='0'>
                    
                    <input TYPE="hidden" NAME='POS_QUEST_NOM' value="<?php echo (isset($_REQUEST['question'])) ? $_REQUEST['question'] : ''; ?>">
                    <input TYPE="hidden" NAME='POS_QUEST_PUBLIC' value='1'>
                    <input TYPE="hidden" NAME='POS_QUEST_RES_VAR' value='1'>
                    <input TYPE="hidden" NAME='POS_QUEST_NB_VAR' value='1'>
                    <input TYPE="hidden" NAME='POS_VAR_RECH_1' value='<?php echo (isset($_REQUEST['q'])) ? $_REQUEST['q'] : ''; ?>'>
        			<table BORDER="0" ALIGN="center">
        				<TR>
            				<TD CLASS='labelConnexion'>Utilisateur</TD>
            				<TD><INPUT TYPE='text' class='inputChamp' SIZE="20" NAME="POS_UTIL" onKeyUp="javascript:onChangeUser();" onBlur="javascript:onChangeUser();" VALUE="<?php if(isset($_REQUEST["POS_UTIL"])) echo $_REQUEST["POS_UTIL"]; else echo ""; ?>"></TD>
        					<SCRIPT>
        					document.principal.POS_UTIL.focus();
        					</SCRIPT>
        				</TR>
        				<TR>
        					<TD CLASS='labelConnexion' >Mot de passe</TD>
        					<TD><INPUT TYPE="password" class="inputChamp" NAME="POS_PASSWD" size="20"></TD>
        				</TR>
        				<TR id='div_profil' style='display: none'>
                            <TD class='labelConnexion' valign="top">Profil</TD>
                            <TD class='labelConnexion'>
                            <SELECT class="inputChampSelect" NAME=POS_PROFIL SIZE="5" onkeydown="javascript:onEnterProfil(event);">
                            <OPTION VALUE=""> PROFIL1 </OPTION>
                            </SELECT>
                            </TD>
                        </TR>
        				<TR style="display: none">
        					<TD CLASS='labelConnexion'>Application</TD>
        					<TD class='labelConnexion'>
        						<SELECT class="inputChamp" NAME="POS_APPLI">
        						<OPTION VALUE="NGSYS" SELECTED>NGSYS</OPTION>
        						</SELECT>
        					</TD>
        				</TR>
        				<input TYPE="hidden" NAME='STYLE_THEME' value='theme_gris'>
        				
        				<TR>
        					<TD COLSPAN="2" ALIGN="center">
        					<BR>
        						<INPUT type="submit" NAME="Valider" id='btn_valider' disabled VALUE="Se connecter">
        					</TD>
        				</TR>
    			     </table>
<?php                    
}
?>                      
			         </FORM>
        		</td>
        	</tr>
        </table>
</table>
</div>
<div style="position: absolute;bottom: 0;width: 80%; margin: auto;text-align: center;font-size: 21px;">
<font face="'Times New Roman'" style="color:#FFFFFF; margin: auto">Nouvelle G&eacute;n&eacute;ration de Service </font>
</div>
</div>
</body>
</html>
