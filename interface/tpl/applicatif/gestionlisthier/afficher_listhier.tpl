<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
	<title>{TITRE_PAGE} {POS_LIBELLE_LISTHIER}</title>
	<link REL="stylesheet" TYPE="text/css" HREF="/{NOM_APPLICATION}/include/style/style.css">
    <link rel="stylesheet" href="/{NOM_APPLICATION}/include/script/jstree/themes/proton/style.css" />
    <script src="/{NOM_APPLICATION}/include/script/jquery/jquery-1.11.1.min.js"></script>
    <script src="/{NOM_APPLICATION}/include/script/jstree/jstree.js"></script>
    <SCRIPT language='JavaScript' SRC='/{NOM_APPLICATION}/configuration/constantes.js'></SCRIPT>

    <!-- Some custom style for the expand/contract section-->
    <style>
    #treeDiv1 { 
    	background: #fff;
    	padding:1em;
    	margin-top:1em;
    	width:80%;
    	height: 280px;
    	position:absolute;
    	top:125px;
    	left:50px;
    	border: 1px solid #ddd;
    	overflow-x:auto;
    	overflow-y:auto;
	}
    #select_profilhier {
	position: absolute;
	top: 100px;
	left: 50px;
	}
	
	#interface_modif {
	width:80%;
	height: 90px;
	position: absolute;
	top: 450px;
	left: 50px;
	border: 1px solid #ddd;
	}
	
	#bouton_fermer {
	width: 350px;
	align: center;
	position: absolute;
	top: 650px;
	left: 450px;
	}	
    .example-container {overflow:auto;height:400px;} 
    </style>

</head>

<script type="text/javascript">
function treeInit() {
	
	//instantiate the tree:
	$('#treeDiv1').jstree({
      'core' : {
        'themes': {
                "name": "proton",
                'responsive': false
        },
        'data' : function (node, cb) {
          if(node.id === "#") {
              cb([{"text" : "{POS_LIBELLE_LISTHIER}", "children" : true}]);
          }
          else {
            var chemin = getPathLhFromNode(node);
            
            var requester = getXmlHttpRequestObject();
        	var suffixe_adr = "";
            var str = "recherche";
        	if (str == "ajout" || str == "modification") {
        		suffixe_adr = "&POS_VAL_HIER=" + escape(document.principal.NODE_LABEL.value);
        	}
        	var profilhier = document.principal.POS_PROFIL_HIER.value;
        	var adr = (CST_TYPE_APPLI == 1) ? "../../../../interface/session/principal/gestionlisthier/modifier_listhier.php" : "../../../../servlet/interface/session/principal/gestionlisthier.ModifierListHier";
            adr += "?POS_CODE_LISTHIER=" + document.principal.CODE_LISTHIER.value + "&POS_CHEMIN=" + escape(chemin) + "&POS_ACTION=" + str + "&POS_PROFILHIER=" + document.principal.POS_PROFIL_HIER.value;
            adr += suffixe_adr;
        	
            requester.open("GET", adr, false);
        	requester.send(null);
        	if (requester.readyState == 4 || requester.readyState == 0)
            {
            	var obj = eval('(' + requester.responseText + ')');
        		if (obj.code_retour == 1)
                {	
            		if (str == "recherche" || str.substr(0,5) == "ajout") {
            		    var children = new Array();
                        children = obj.listhier;
        				for(var i=0;i<obj.listhier.length;i++) {				
        					children[i] = {"text": obj.listhier[i], children: true};
        				}
                        cb(children);
        			}
        		}
                else
                	alert(obj.msg_erreur);
        	}
        }
        }
        }
    });
    //$('#treeDiv1').jstree().hide_dots();
    var root = $('#treeDiv1').jstree("_get_node");
    root.find("ins:first").css("background-position-x", "-18px");
}

function getPathLhFromNode(node)
{
    var instance = $("#treeDiv1").jstree(true);
    var m = instance._model.data; 
    var chemin = (node.parents.length === 1) ? "" : node.text;
    for (var i=0; i < node.parents.length - 2;i++) {
        if (node.parents[i] !== "#") {
            var nodeInfo = $("#" + node.parents[i]);
            var textNode = m[node.parents[i]].text;
            chemin = textNode  + String.fromCharCode(2) + chemin;
        }
    }
    return chemin;
}

// lors du changement de profil hierarchique
function ChangeTreeListe()
{
    $('#treeDiv1').jstree(true).refresh();
}

function onActionNodeSelected(str)
{
    var listNode = $("#treeDiv1").jstree(true).get_selected(true);
    var currentSelectedNode = null;
    if (listNode != null && listNode.length == 1)
        currentSelectedNode = listNode[0];
            
    if (currentSelectedNode == null)
    {
        parent.posMessageBoxWarning(document.principal.CST_MSG_SELECT_NODE_LISTHIER.value);
        return;
    }
    
    if (document.principal.NODE_LABEL.value.length == 0 && str != "suppression")
    {
        parent.posMessageBoxWarning(document.principal.CST_MSG_SAISIR_LIBELLE_NOEUD.value);
        return;
    }
    
    if (str == "suppression" && !confirm(document.principal.CST_MSG_CONFIRM_SUPP_NOEUD.value))
        return;
    
    // ajout ou modification
	if (str == "modification"  && currentSelectedNode.parent == "RootNode") {
		parent.posMessageBoxWarning(document.principal.CST_MSG_ERR_MODIFIER_NOM_LISTE.value);
		return
	}

    handleNode(currentSelectedNode, str);
}


function getXmlHttpRequestObject() {

	if(window.XMLHttpRequest) {
		return new XMLHttpRequest();
	}
	else if (window.ActiveXObject) {
		return new ActiveXObject("Microsoft.XMLHTTP");
	}
}
 
function handleNodeResponse(req, node, str) {
	if (req.readyState == 4) {
		var obj = eval('(' + req.responseText + ')');
		if (obj.code_retour == 1)
        {
            var instance = $("#treeDiv1").jstree(true);
            var m = instance._model.data; 
            if (node.parent !== "#") {
                //$("#treeDiv1").jstree(true).redraw(m[node.parent]);
                $("#" + node.parent).jstree(true).refresh();
             }
            /*	
    		if (str == "recherche" || str.substr(0,5) == "ajout") {
    		    node.children = new Array();
				for(var i=0;i<obj.listhier.length;i++) {				
					var tmpNode = new YAHOO.widget.TextNode(obj.listhier[i], node, false);
				}
			}
			else if (str == "modification") {
			    node.label = obj.listhier[0];
			    tree.draw();
 			}
			else if (str == "suppression") {
				tree.removeNode(node, true);
				currentSelectedNode = null;
 			}
            */
 			
 			document.principal.NODE_LABEL.value= "";	
		}
        else
        	alert(obj.msg_erreur);
	}
} 


function handleNode(node, str) {
	
    var codelisthier = document.principal.CODE_LISTHIER.value;
	var chemin = "";
	
	if (node)
		chemin = getPathLhFromNode(node);

	// recuperation Objet 
	var requester = getXmlHttpRequestObject();
	var suffixe_adr = "";
	if (str == "ajout" || str == "modification") {
		suffixe_adr = "&POS_VAL_HIER=" + escape(document.principal.NODE_LABEL.value);
	}
	var profilhier = document.principal.POS_PROFIL_HIER.value;
	var adr = "";
    if(CST_TYPE_APPLI == 1)
	   adr = "../../../../interface/session/principal/gestionlisthier/modifier_listhier.php?POS_CODE_LISTHIER=" + codelisthier + "&POS_CHEMIN=" + escape(chemin) + "&POS_ACTION=" + str + "&POS_PROFILHIER=" + profilhier;
    else
        adr = "../../../../servlet/interface/session/principal/gestionlisthier.ModifierListHier?POS_CODE_LISTHIER=" + codelisthier + "&POS_CHEMIN=" + escape(chemin) + "&POS_ACTION=" + str + "&POS_PROFILHIER=" + profilhier;
	adr = adr + suffixe_adr;
	
    requester.open("GET", adr, false);
	requester.send(null);
	if (requester.readyState == 4 || requester.readyState == 0)
    {
    	handleNodeResponse(requester, node, str);
	}
}
  
function initEcranListeHier()
{
    parent.setTitle();
    treeInit();
}
</script>
	
	<!--END SOURCE CODE FOR EXAMPLE =============================== -->
<body topmargin="10" leftmargin="10"  onLoad="initEcranListeHier();">
<h1 align = "center">{TITRE_PAGE}</h1>
<h1 align = "center">{POS_LIBELLE_LISTHIER}</h1>
<div class="example-container">
<div id="treeDiv1"></div>
</div>
	
	
<form name="principal">
<input type="hidden" name="CST_MSG_SELECT_NODE_LISTHIER" value="{CST_MSG_SELECT_NODE_LISTHIER}">
<input type="hidden" name="CST_MSG_SAISIR_LIBELLE_NOEUD" value="{CST_MSG_SAISIR_LIBELLE_NOEUD}">
<input type="hidden" name="CST_MSG_ERR_MODIFIER_NOM_LISTE" value="{CST_MSG_ERR_MODIFIER_NOM_LISTE}">
<input type="hidden" name="CST_MSG_NOEUD_FILS_EXIST" value="{CST_MSG_NOEUD_FILS_EXIST}">
<input type="hidden" name="CST_MSG_CONFIRM_SUPP_NOEUD" value="{CST_MSG_CONFIRM_SUPP_NOEUD}">
	<input TYPE=hidden NAME="CODE_LISTHIER" VALUE="{POS_CODE_LISTHIER}">
	<div id="select_profilhier">
		<table role='presentation'>
			<tr>
				<td class="labelChamp">{LIBELLE_PROFILHIER}</td>
				<td nowrap>
						<SELECT class="inputChamp" NAME="POS_PROFIL_HIER"  SIZE="1" onChange="javascript:ChangeTreeListe();">
						<!-- BEGIN BLOC_TOUS_PROFILS_HIERARCHIQUES -->
						<OPTION VALUE="{PROFIL_HIERARCHIQUE}" {TOUS_PROFIL_HIERARCHIQUE_SELECTED}>{PROFIL_HIERARCHIQUE}</OPTION>
						<!-- END BLOC_TOUS_PROFILS_HIERARCHIQUES -->
						</SELECT>
				</td>
			</tr>
		</table>
	</div>
    <div id="interface_modif">
	<table role='presentation' width="100%" >
	<tr>
		<td class="labelChamp" colspan='2'>
		{LIBELLE_SELECT_NODE_LISTHIER}<br/>
		</td>
	</tr>
		<tr>
		 <td class="labelChamp"><label for='id_rub_VAL' >{LIBELLE_VALEUR_LISTHIER}</label></td>	
		  <td>
		      <input type="text" class="inputChamp" id='id_rub_VAL' size="60" maxlength="119" name="NODE_LABEL" value="">
		  </td>	
	</tr>
	<tr>
        <td colspan='2'>
            <table role='presentation'>
            <tr>
            <td width="74%" align="left">
            	<input type="button"  class="bouton" value="{LIBELLE_AJOUTER_NOEUD}" onclick="javascript:onActionNodeSelected('ajout');">
            	<input type="button" class="bouton" value="{LIBELLE_MODIFIER_NOEUD}" onclick="javascript:onActionNodeSelected('modification');">
            </td>
            <td width="26%" align="right">
            	<input type="button" class="bouton" value="{LIBELLE_SUPPRIMER_NOEUD}" onclick="javascript:onActionNodeSelected('suppression');">
            </td>
            </tr>
            </table>
		</td>
	</tr>
	</table>
</div>
<br/><br/>
<div id="bouton_fermer">
<input TYPE=BUTTON class="bouton" VALUE="{LIBELLE_FERMER}" onClick="location.href='{URL_FERMER}'">
</div>
</form>
</body>
</html>
