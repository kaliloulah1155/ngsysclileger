<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
	<title>{POS_TYPETHE}&nbsp;:&nbsp;{POS_LIBELLETHE}</title>
	<link REL="stylesheet" TYPE="text/css" HREF="/{NOM_APPLICATION}/include/style/style.css">
	<link rel="stylesheet" type="text/css" href="/{NOM_APPLICATION}/include/style/yui/tree.css">
	<SCRIPT language="javascript" SRC="/{NOM_APPLICATION}/configuration/constantes.js"></SCRIPT>
	<SCRIPT language="javascript" SRC="/{NOM_APPLICATION}/include/script/yui/build/yahoo-dom-event/yahoo-dom-event.js"></SCRIPT>
    <SCRIPT language="javascript" SRC="/{NOM_APPLICATION}/include/script/yui/build/treeview/treeview.js"></SCRIPT>
	<SCRIPT language="javascript" SRC="/{NOM_APPLICATION}/include/script/vocabulaire.js"></SCRIPT>
    <!-- Some custom style for the expand/contract section-->
    
	<SCRIPT>
	
	function getUrlGestionThe(type_url)
    {
    	var tabCodeUrl = new Array();
    	if(CST_TYPE_APPLI == 1) {
        	tabCodeUrl["URL_GESTION"] = "../../../../interface/session/principal/thesaurus/gestion_thesaurus_xtree.php";
            tabCodeUrl["URL_RECHERCHE"] = "../../../../interface/session/principal/thesaurus/ajax_rechercher_descripteur.php";
        }
    	
    	else {
            tabCodeUrl["URL_GESTION"] = URL_SITE + "/servlet/interface/session/principal/consultation.ConsulterIndex?MODE=CONSULTATION&";
            tabCodeUrl["URL_RECHERCHE"] = URL_SITE + "/servlet/interface/session/principal/consultation.ConsulterIndex?MODE=CONSULTATION&";
        }
    	
    	return tabCodeUrl[type_url];	
    }
	
	var currentSelectedNode = null;
    var tree; //will hold our TreeView instance
    
    YAHOO.widget.MyNode = function(oData, oParent, expanded) {

        if (oData) { 
            this.init(oData, oParent, expanded);
            this.setUpLabel(oData);
            //this.labelStyle = "icon-ppt";
        }
    };

    YAHOO.extend(YAHOO.widget.MyNode, YAHOO.widget.TextNode, {
    
        getStyle: function() { 
            if (this.isLoading) {
                return "ygtvloading";
            } else {
                // location top or bottom, middle nodes also get the top style
                var loc = (this.nextSibling) ? "t" : "l";

                // type p=plus(expand), m=minus(collapase), n=none(no children)
                var type = "n";
                if (this.hasChildren(true) || (this.isDynamic() && !this.getIconMode())) {
                // if (this.hasChildren(true)) {
                    type = (this.expanded) ? "m" : "p";
                }

                var classe = "";
                if (isRoot(this))
                    classe = "ygtv_root_vert_l" + type;
                else
                {
                    if (!isDescripteur(this))
                        classe = "ygtv_vert_" + loc + type;
                    else
                        classe = "ygtv" + loc + type;
                }
                return classe;
            }
        },
    
        toString: function() { 
            return "MyNode (" + this.index + ") " + this.label;
        }
        
    });
    
    function treeInit() {
    	
    	//instantiate the tree:
    	tree = new YAHOO.widget.TreeView("treeDiv1");
    	tree.setDynamicLoad(loadNodeData, 0);
        tree.singleNodeHighlight = true; 
    	var tmpNode = new YAHOO.widget.MyNode("{POS_TYPETHE} - {POS_LIBELLETHE}", tree.getRoot(), false);
    	//once it's all built out, we need to render our TreeView instance:
    	tree.draw();
    	
    	// affiche le premier niveau
    	//handleNode(tmpNode, 'recherche');
    	ouvrirDescendanceNoeudRoot(tmpNode);
    	
    	//handler for collapsing all nodes
    	YAHOO.util.Event.on("collapse", "click", function(e) {
    		YAHOO.log("Collapsing all TreeView  nodes.", "info", "example");
    		tree.collapseAll();
    		YAHOO.util.Event.preventDefault(e);
    	});
    	
    	// Expand and collapse happen prior to the actual expand/collapse,   
        // and can be used to cancel the operation   
        tree.subscribe("expand", function(node) {   
               // return false; // return false to cancel the expand   
            });   
    
        tree.subscribe("collapse", function(node) {   
           });   
    
        // Trees with TextNodes will fire an event for when the label is clicked: 
        tree.subscribe("labelClick", function(node) {
            
            selectNode(node, false);
        	// arrete la propagation de l'évenement 
        	// sinon ouverture automatique
        	return false;
        });
    }
    
    function selectNode(node, bAuto) {
        
        if (currentSelectedNode != null)
            currentSelectedNode.labelStyle = "ygtvlabel";
        node.labelStyle = "ygtvlabelselect";
        currentSelectedNode = node;
        tree.draw();

        if (bAuto) {
            var xy = YAHOO.util.Dom.getXY(node.contentElId);
            containerTreeDiv.scrollTop = xy[1]-200; 
        }
                
        // Si droit uniquement en consultation, restriction du renseignement du champ des saisie
    	// pour remplir le champ de la rubrique
    	if (document.ajoutvalform.etat.value == "CONSULTATION") {
    	
            document.getElementById("consultation").style.display = "";
            document.getElementById("bloc_id_consultation_descripteur").style.display = "none";
            document.ajoutvalform.terme.value = isDescripteur(node) ? node.label : "";
            document.getElementById("vocabulaire_gestion").style.display = isDescripteur(node) ? "inline" : "none";
    	}
    	else 
        {
            if (document.ajoutvalform.etat.value == "GESTION") {
                
                document.getElementById("bloc_id_modification").style.display = "none";
                if (isDescripteur(node) || isChampSemantique(node))
                {
                    document.getElementById("gestion").style.display = "inline";
                    document.getElementById("btn_consulter_noeud").style.display = isChampSemantique(node) ? "none" : "inline";
                    document.getElementById("btn_supprimer_noeud").style.display = isChampSemantique(node) ? "none" : "inline";
                }
                else 
                    document.getElementById("gestion").style.display = "none";
        	}
    	}
        onActionNodeSelected('consultation');
        document.getElementById('bloc_id_consultation_descripteur').style.display = "";
    }
    
    function loadNodeData(node, fnLoadComplete) {
        handleNode(node, "recherche");
    }

    //When the DOM is done loading, we can initialize our TreeView instance:
    YAHOO.util.Event.onDOMReady(treeInit);
    var separateur = "{POS_SEPARATEUR}";

	function xtreeRemplisTemplate() 
    {
		var terme = document.ajoutvalform.terme.value;
		// champ à compléter
		var obj = eval("{OBJ_CHAMP}");
		
		if(obj.readOnly != true) 
        {
            if (obj.value.length > 0)
                obj.value += separateur;
			obj.value += terme;
			//obj.focus();
			document.ajoutvalform.terme.value = "";
		}
		//parent.close();
	}
	
	function initEcran() {
		if (document.ajoutvalform.etat.value == "CONSULTATION")
            document.getElementById("consultation").style.display = "";
        else
        {
            document.getElementById("bouton_fermer_gestion").style.display = "";
            document.getElementById("br_fermer_gestion").style.display = "";            
        }
        parent.setTitle();
	}
	
    // root : noeud root (non affiché)
    // fils de root : Thesaurus
    // fils du Thésaurus : Domaine
    // fils du Domaine : Champ sémantique	
    function isDescripteur(node) 
    {
    	if( node == "RootNode" || node.parent == "RootNode" || node.parent.parent == "RootNode"
            || node.parent.parent.parent == "RootNode")
    	   return false;
    	return true;
    }
    
    // root : noeud root (non affiché)
    // fils de root : Thesaurus
    // fils du Thésaurus : Domaine
    // fils du Domaine : Champ sémantique
    function isChampSemantique(node) 
    {
    	if(node.parent.parent.parent == "RootNode")
    	   return true;
    	return false;
    }
    
    function isRoot(node) 
    {
    	if(node.parent == "RootNode")
    	   return true;
    	return false;
    }
    
    
    function onActionNodeSelected(str)
    {
        if (currentSelectedNode == null)
        {
            alert("Veuillez sélectionner un noeud.");
            return;
        }
        if (str == "suppression") 
        {
			if (confirm("Voulez-vous réellement supprimer ce terme du thésaurus ?"))
		      handleNode(currentSelectedNode, str);
    	}
    	// ajout ou modification
    	else {
			if (str == "ajout" && document.ajoutvalform.DESCRIPTEUR_COURANT.value== "")
			{
                alert("Veuillez saisir une valeur dans le champ descripteur.");
            }
			else {
				// l'action "ajout" devient ajout_recherche car les fils du noeud sont toujours ouverts
				if (str == "ajout") {
			 	   str = "ajout_recherche";
                }

				// envoi de la requête	 	
				handleNode(currentSelectedNode, str);	 		
		 	}
    	}
    }

    function getXmlHttpRequestObject() {
    
    	if(window.XMLHttpRequest) {
    		return new XMLHttpRequest();
    	}
    	else if (window.ActiveXObject) {
    		return new ActiveXObject("Microsoft.XMLHTTP");
    	}
    }
    
    var initSequence = true;
    function handleNodeResponse(req, node, str) 
    {
		var obj = eval('(' + req.responseText + ')');
		
		if (obj.code_retour == 1)
        {
    		if (str == "recherche" || str.substr(0,5) == "ajout" || str == "consultation") 
            {
				if (str != "consultation") 
                {
                    afficherNoeuds(node, obj.thesaurus, obj.ispere);
                    node.loadComplete();
                    if (str.substr(0,5) == "ajout")
                    {
                        afficherBlocModification(false);
                    }
				}
				else 
                {
                    var s = "";
                    if (obj.thesaurus.length > 0)
                        s += "<b>" + obj.thesaurus[0] + "</b>";
                    if (obj.note.length > 0)
                        s += "<br><img src='/{NOM_APPLICATION}/images/icons/thesaurus/note.gif' title=\"Note d'application\" border='0'>&nbsp;" + obj.note;
                    
                    if (obj.employe.length > 0)
                        s += "<br><img src='/{NOM_APPLICATION}/images/icons/thesaurus/synonyme.gif' title='Synonyme' border='0'>&nbsp;" + obj.employe;
                        
                    if (obj.associe.length > 0)
                        s += "<br><img src='/{NOM_APPLICATION}/images/icons/thesaurus/terme_associe.gif' title='Terme associé' border='0'>&nbsp;" + replaceAll(obj.associe, "\n", "<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
                    
                    if (obj.histo.length > 0)
                        s += "<br><img src='/{NOM_APPLICATION}/images/icons/thesaurus/terme_historique.gif' title='Terme historique' border='0'>&nbsp;" + obj.histo;
                    if (obj.pere)
                        s += "<br><img src='/{NOM_APPLICATION}/images/icons/thesaurus/pere.gif' title='Père' border='0'>&nbsp;" + obj.pere;
                    document.getElementById("bloc_id_consultation_descripteur").innerHTML = s;

                    if (document.ajoutvalform.etat.value != "CONSULTATION")
                    {
                        document.ajoutvalform.DESCRIPTEUR_COURANT.value = obj.thesaurus[0];
    					document.ajoutvalform.POS_VAL_RUB_D.value = obj.note;
    					document.ajoutvalform.POS_VAL_RUB_S.value = obj.employe;
    					document.ajoutvalform.POS_VAL_RUB_H.value = obj.histo;
    					document.ajoutvalform.POS_VAL_RUB_A.value = obj.associe;
                    }
				}
			}
			else if (str == "suppression") {
				
				tree.removeNode(node, true);
			    currentSelectedNode = null;
 			}
            else if (str == "modification") {
                afficherBlocModification(false);
 			}	
		}
        else
        	alert(obj.msg_erreur);
    } 
    
    function ouvrirNoeudDescripteur(node) {
    	
    	var objRetour = null;
    	var typethesaurus = document.ajoutvalform.type_thesaurus.value;
   		var descripteur = node.label;
   		if (node.parent == "RootNode")
   		   descripteur = "";
    	var requester = getXmlHttpRequestObject();
    	var adr = getUrlGestionThe("URL_GESTION") + "?POS_TYPETHE=" + typethesaurus + "&POS_DESCRIPTEUR=" + escape(descripteur) + "&POS_ACTION=recherche";
    	requester.open("GET", adr, false);
    	requester.send(null);
    	if (requester.readyState == 4 || requester.readyState == 0)
        {
            objRetour = eval('(' + requester.responseText + ')');
    		if (objRetour.code_retour == 1)
                afficherNoeuds(node, objRetour.thesaurus, objRetour.ispere);
            else
            	alert(objRetour.msg_erreur);
        }
        node.loadComplete();
    }
    
    function ouvrirDescendanceNoeudRoot(node) {
    	
    	var tmpNode = node;
    	ouvrirNoeudDescripteur(tmpNode);
    	
    	while (tmpNode.children.length == 1)
    	{
    	   tmpNode = tmpNode.children[0];
    	   ouvrirNoeudDescripteur(tmpNode);
        }
    }

    function replaceAll(str, search, repl) { 
      while (str.indexOf(search) != -1) 
    	 str = str.replace(search, repl); 
    	return str; 
    }

    /*
     * Appelée depuis l'écran de recherche pour ouvrir l'arborescence
     * Arguments : la liste des descripteurs du père 
     * Exemple : DOMAINE THESAURUS, 0027 PARAMETRES CARACTERISTIQUES DES EAUX ET DES BOUES, AZOTE           
     */     
    function ouvrirArborescence() {
    	
    	// tous les fils de la racine
    	var tabNode = tree.getRoot().children[0].children;
        for (var j=0;j<tabNode.length;j++)
        {
           if (arguments[0] == tabNode[j].label)
           {
               ouvrirSousArborescence(tabNode[j], 1, arguments);
               break;
           }
        }
    }
    
    /*
     * Fonction recursive appelée depuis ouvrirArborescence
     * ou par elle-même     
     * 
     * Arguments : la liste des descripteurs du père 
     * Exemple : DOMAINE THESAURUS, 0027 PARAMETRES CARACTERISTIQUES DES EAUX ET DES BOUES, AZOTE           
     */ 
    function ouvrirSousArborescence(node, position, tabDescripteurs) {
    	
        var tabNode = null;
        // si le noeud n'a pas de fils, lance l'ouverture du noeud (accès serveur) 
        if (node.children == null || node.children.length == 0)
            ouvrirNoeudDescripteur(node);
        tabNode = node.children;
       
        for (var j=0;j<tabNode.length;j++)
        {
            if (tabDescripteurs[position] == tabNode[j].label)
            {
                // tant que l'on a pas atteint le dernier descripteur de l'arborescence
                // on continue à ouvrir l'arborescence
                if (position != (tabDescripteurs.length - 1))
                    ouvrirSousArborescence(tabNode[j], position + 1, tabDescripteurs);
                // on essai de sélectionner le terme de l'arborescence
	            else
                    selectNode(tabNode[j], true);
            }
        }
    }
    
    function afficherNoeuds(nodePere, tabLibelleFils, tabIsPere)
    {
        nodePere.children = new Array();
		for(var i=0;i<tabLibelleFils.length;i++) 
        {
            var tmpNode = new YAHOO.widget.MyNode(tabLibelleFils[i], nodePere, false);
            if (tabIsPere[i] != "1")
                tmpNode.isLeaf = true;
		}
    }
    
    function handleNode(node, str) {
    	
    	var typethesaurus = document.ajoutvalform.type_thesaurus.value;
    	if (node) {
    		var descripteur = node.label;
    	}
    	var requester = getXmlHttpRequestObject();
    	var suffixe_adr = "";
    	var suffixe_num = "&POS_SUFFIXE_RUB_NUM=" + document.ajoutvalform.suffixe_rub_num.value;
    	if (str == "recherche" || str == "consultation") {
    		suffixe_adr = suffixe_adr + suffixe_num;
    	}
    	else if ( str == "suppression")	{
    		suffixe_adr = suffixe_adr + suffixe_num;
    	}
    	else  if (str.substr(0,5) == "ajout") { // ajout, modification
    		suffixe_adr = "&POS_VAL_NEW_DESCRIPTEUR=";
    		var val = escape(document.ajoutvalform.DESCRIPTEUR_COURANT.value);
    		suffixe_adr = suffixe_adr + val;
    		var suffixe_info1 = "&POS_VAL_RUB_D=" + escape(document.ajoutvalform.POS_VAL_RUB_D.value);
    		var suffixe_info2 = "&POS_VAL_RUB_S=" + escape(document.ajoutvalform.POS_VAL_RUB_S.value);
    		var suffixe_info3 = "&POS_VAL_RUB_A=" + escape(document.ajoutvalform.POS_VAL_RUB_A.value);
    		var suffixe_info4 = "&POS_VAL_RUB_H=" + escape(document.ajoutvalform.POS_VAL_RUB_H.value);
    		var suffixe_pere = "&POS_DESCRIPTEUR_PERE=" + escape(descripteur);
    		suffixe_adr = suffixe_adr + suffixe_info1 + suffixe_info2 + suffixe_info3 + suffixe_info4 + suffixe_pere + suffixe_num;
    		}
    	else if ( str == "modification")	{
    		var suffixe_info1 = "&POS_CURRENT_VAL_RUB_D=" + escape(document.ajoutvalform.POS_VAL_RUB_D.value);
    		var suffixe_info2 = "&POS_CURRENT_VAL_RUB_S=" + escape(document.ajoutvalform.POS_VAL_RUB_S.value);
    		var suffixe_info3 = "&POS_CURRENT_VAL_RUB_A=" + escape(document.ajoutvalform.POS_VAL_RUB_A.value);
    		var suffixe_info4 = "&POS_CURRENT_VAL_RUB_H=" + escape(document.ajoutvalform.POS_VAL_RUB_H.value);
    		suffixe_adr = suffixe_adr + suffixe_info1 + suffixe_info2 + suffixe_info3 + suffixe_info4 + suffixe_num;
    	}	
    	// Déclaration de la requête
    	var adr = getUrlGestionThe("URL_GESTION") + "?POS_TYPETHE=" + typethesaurus + "&POS_DESCRIPTEUR=" + urlencode(escape(descripteur)) + "&POS_ACTION=" + str;
    	adr = adr + suffixe_adr;
    	requester.open("GET", adr, false);
    	// Envoi de la requête
    	requester.send(null);
    	if (requester.readyState == 4 || requester.readyState == 0)
        {
        	handleNodeResponse(requester, node, str);
    	}
    }
    
	function urlencode(str) {
	   return escape(str.replace(/\+/g, '%2B'));
    }

    function afficherBlocModification(bAffiche) {
        if (document.ajoutvalform.etat.value == "GESTION")
            document.getElementById('bloc_id_modification').style.display = bAffiche ? "" : "none";
    }
    
    function onModifierNoeud()
    {
        viderEcranModification();
        onActionNodeSelected('consultation');
        
        afficherBlocModification(true);
        document.getElementById('valider_modif').style.display = "";
        document.getElementById('valider_ajout').style.display = "none";
        document.ajoutvalform.DESCRIPTEUR_COURANT.readOnly = true;
        document.ajoutvalform.DESCRIPTEUR_COURANT.className = "verrouille";
    }
    
    function onAjouterNoeud()
    {
        viderEcranModification();
        afficherBlocModification(true);
        document.getElementById('valider_modif').style.display = "none";
        document.getElementById('valider_ajout').style.display = "";
        document.ajoutvalform.DESCRIPTEUR_COURANT.readOnly = false;
        document.ajoutvalform.DESCRIPTEUR_COURANT.className = "inputChamp";
    }

    function viderEcranModification()
    {
        document.ajoutvalform.DESCRIPTEUR_COURANT.value = "";
        document.ajoutvalform.POS_VAL_RUB_D.value = "";
        document.ajoutvalform.POS_VAL_RUB_S.value = "";
        document.ajoutvalform.POS_VAL_RUB_A.value = "";
        document.ajoutvalform.POS_VAL_RUB_H.value = "";
    }
        
    function search() {
    
    	if(document.principal.RECH_DESC.value.length == 0)
    	{
    		alert("Le code descripteur est vide.");
    		document.principal.RECH_DESC.focus();
    		return false;
    	}
        setWaitCursor();
        var requester = getXmlHttpRequestObject();
    	var adr = getUrlGestionThe("URL_RECHERCHE") + "?POS_TYPETHE=" + document.ajoutvalform.type_thesaurus.value + "&RECH_DESC=" + escape(document.principal.RECH_DESC.value);
        if (document.principal.TERME_EXACT.checked)
            adr += "&TERME_EXACT=OUI"; 
    	requester.open("GET", adr, false);
    	requester.send(null);
    	if (requester.readyState == 4 || requester.readyState == 0)
        {
            objRetour = eval('(' + requester.responseText + ')');
    		if (objRetour.code_retour == 1) {
                var s = "<ul>";
                for (var i=0;i<objRetour.tabdescripteurs.length;i++) {
                    s += "<li><a onClick=\"javascript:ouvrirArborescence("+objRetour.tabdescripteurs[i]["arbo"]+")\" href=\"#\" >"+objRetour.tabdescripteurs[i]["chemin_libelle"]+"</a></li>";
                }
                s += "</ul>";
                document.getElementById('result_recherche').innerHTML = s;
            }
            else
            	alert(objRetour.msg_erreur);
        }
        setDefaultCursor();
        return false;    
    }
    function setWaitCursor() {
        document.body.style.cursor = 'wait';
        document.principal.RECH_DESC.style.cursor = 'wait';
        document.getElementById('result_recherche').style.cursor = 'wait';
    }
    function setDefaultCursor() {
        document.body.style.cursor = 'default';
        document.principal.RECH_DESC.style.cursor = 'default';
        document.getElementById('result_recherche').style.cursor = 'default';
    }
	</SCRIPT>
</head>

<body topmargin="10" leftmargin="10" onload='javascript:initEcran();'>
<form name="principal" onSubmit="return search();">
<input type="hidden" name="POS_TYPETHE" value="{POS_TYPETHE}">
<h1 id="bloc_gestion_titre" style="display:;" align="center">{POS_TYPETHE}&nbsp;:&nbsp;{POS_LIBELLETHE}</h1>
<div style="padding: 5px;">
	&nbsp;&nbsp;<b>Recherche par descripteur : </b><INPUT TYPE=text class="inputChamp" NAME="RECH_DESC" VALUE="" SIZE=20> &nbsp; 
    <INPUT TYPE="checkbox" NAME="TERME_EXACT" VALUE="OUI">Terme exact
    <INPUT TYPE=submit class="bouton_sub" NAME=Rechercher VALUE="Rechercher">
</div>
<div id="result_recherche" style='max-height: 100px;overflow-y:auto;margin-top:10px;margin-bottom:10px;'>
</div>
</form>

<form name="ajoutvalform">
<input TYPE=hidden NAME=type_thesaurus VALUE="{POS_TYPETHE}">
<input TYPE=hidden NAME=etat VALUE="{POS_ETAT}">
<input TYPE=hidden NAME=suffixe_rub_num VALUE="{POS_SUFFIXE_RUB_NUM}">

<!-- affichage de l'arbre -->
<div id='containerTreeDiv' style="height:400px; padding: 5px; border: 1px solid #aaa; overflow: auto;">
<div id="treeDiv1"></div>
</div>
<br>
<!-- ajout pour les écrans de vocabulaire -->
<div id='bloc_id_consultation_descripteur' style="display:none;border:1px solid #aaa;">
</div>
<div id="consultation" style="display:none;padding: 1px;width: 90%;">
	<table>
	<tr>
		<td>
			<input type="text" class="inputChamp" size="45" maxlength="119" name="terme" value="">
		</td>
		<td>
		    <div id="vocabulaire_gestion" style="display: none;">
			     <input type=button class=bouton value="{LIBELLE_AJOUTER}" onClick='javascript:xtreeRemplisTemplate();'>
            </div>
            <input TYPE=BUTTON class="bouton" VALUE="{LIBELLE_FERMER}" onClick="parent.window.close();">
		</td>
	</tr>
	</table>
</div>
		
<!-- Affichage avec bloc masqués -->
<CENTER>
<div id="gestion" style="display: none;">
<br>
<input TYPE=BUTTON class="bouton" id="btn_consulter_noeud" VALUE="{LIBELLE_MODIFIER}" onClick="javascript:onModifierNoeud();">
<input TYPE=BUTTON class="bouton" id="btn_ajouter_noeud" VALUE="{LIBELLE_AJOUTER}" onClick="javascript:onAjouterNoeud();">
<input TYPE=BUTTON class="bouton" id="btn_supprimer_noeud" VALUE="{LIBELLE_SUPPRIMER}" onClick="onActionNodeSelected('suppression');">
&nbsp;&nbsp;&nbsp;
</div>
<input TYPE=BUTTON class="bouton" id="bouton_fermer_gestion" style="display:none;" VALUE="{LIBELLE_FERMER}" onClick="document.location.href='{URL_FERMER}'">
</CENTER>
<br id="br_fermer_gestion" style="display:none;">
<div id='bloc_id_modification' style="display:none;padding: 5px; border:1px solid #aaa; overflow: auto;">
    <table width="100%" cellpadding="2" cellspacing="0">
	    <tr>
            <td>Libellé</td>	
    		<td>
    			<input type="text" size="40" maxlength="119" style="text-transform:uppercase;" name="DESCRIPTEUR_COURANT" value="" onChange="this.value=this.value.toUpperCase();">
    		</td>	
	    </tr>
		<tr>
			<td>NOTE D'APPLICATION</td>
			<td><TEXTAREA class="inputChamp" name="POS_VAL_RUB_D" rows="2" cols="40"></TEXTAREA></td>
		</tr>
		<tr>
			<td>EMPLOYE POUR</td>
			<td><TEXTAREA class="inputChamp" name="POS_VAL_RUB_S" rows="2" cols="40"></TEXTAREA></td>
		</tr>
		<tr>
			<td>TERME ASSOCIE</td>
            <td><TEXTAREA class="inputChamp" name="POS_VAL_RUB_A" rows="2" cols="40"></TEXTAREA>
			</td>
		</tr>
		<tr>	
            <td>TERME HISTORIQUE</td>
			<td><TEXTAREA class="inputChamp" name="POS_VAL_RUB_H" rows="2" cols="40"></TEXTAREA></td>
		</tr>
        <tr>
			<td align="center" colspan='2'>
				<input type="button" class="bouton" value="Valider" id="valider_modif" onclick="onActionNodeSelected('modification');">
				<input type="button" class="bouton" value="Valider" id="valider_ajout" onclick="onActionNodeSelected('ajout');">
				<input type="button" class="bouton" value="Annuler" onclick="afficherBlocModification(false);">
			</td>
        </tr>
	</table>
</div>
</form>	
</body>
</html>
