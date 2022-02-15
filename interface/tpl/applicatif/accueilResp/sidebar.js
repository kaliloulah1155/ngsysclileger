
$(document).ready(function(){



var posXDebutDrag = 0;
var posYDebutDrag = 0;
function getObjFromEvent(evt)
{
    var obj;
    if (evt.srcElement)
        obj = evt.srcElement;
    else
    {
        var node = evt.target;
        while(node.nodeType != node.ELEMENT_NODE)
            node = node.parentNode;
        obj = node;
    }
    return obj;
}
// construit les images qui serviront au drag and drop
var ddobj = document.createElement("img");
ddobj.className = "dd-demo";
ddobj.src = "../../../../images/dragdrop/croix.gif";
ddobj.id = "dd-demo-0";
ddobj.style.display = "none";
document.body.appendChild(ddobj);
(function() {
    var dd, dd2, dd3;
    YAHOO.util.Event.onDOMReady(function() {

        // ajoute la "couche" drag and drop sur les images cr�e ci-dessus 
        dd = new YAHOO.util.DD("dd-demo-0");
        dd.useShim = true;
        //dd.resizeFrame = false; 
        dd.on('startDragEvent', 
            function(ev) {
                //console.log('startDragEvent');    
            }, dd, true);
        
        dd.on('mouseDownEvent', 
            function(ev) {
            
                var objDrag = getObjFromEvent(ev);
                var idDrag = objDrag.id;
                var isControl = event.ctrlKey;
                // console.log('mouseDownEvent');
                posXDebutDrag = document.getElementById(idDrag).offsetLeft;
                posYDebutDrag = document.getElementById(idDrag).offsetTop;
                
                document.getElementById(idDrag).style.cursor = "default";
            }, dd, true);

        dd.on('endDragEvent', 
            function(ev) {
            
                var objDrag = getObjFromEvent(ev.e);
                objDrag.style.display = "none";
                var isControl = ev.e.ctrlKey;
                var iNumDoc = document.getElementById("dd-demo-0").posNumDoc;
                if (ev.e.clientX < document.getElementById('arborescence').clientWidth)
                {
                    if (parent.center.getNbDocChecked() > 0)
                    {
                        iNumDoc = parent.center.getListeNumInfo(false);
                        insererDansDossier(ev.e.clientY, iNumDoc, true);
                    }
                    else
                    {
                        insererDansDossier(ev.e.clientY, iNumDoc, false);
                    }
                }
                document.getElementById(idDrag).style.left = posXDebutDrag + "px";
                document.getElementById(idDrag).style.top = posYDebutDrag + "px";

            }, dd, true);
        
        dd.on('dragEvent', 
            function(ev) {
                if (ev.e.clientX < document.getElementById('arborescence').clientWidth) {
                    afficherDrop(ev.e.clientY);
                }
            }, dd, true);
    });
})();

// Cette fonction permet de remplacer une chaine par une autre dans une chaine.
function replaceSubstring(inputString, fromString, toString) 
{
   // Goes through the inputString and replaces every occurrence of fromString with toString
   return inputString; // Send the updated string back to the user
} // Ends the "replaceSubstring" function


function replaceAll(str, search, repl) { 
  while (str.indexOf(search) != -1) 
     str = str.replace(search, repl); 
    return str; 
}
function AfficheDossier(numDos, titreDos, iNumEntry)
{
    var bRetour = true;
    //si on a une fiche d'index ouverte on la ferme
    if(this.name == "frm_arbo_question")
    {
        bRetour = parent.testOpenDocument(false);
    }
    if (bRetour)
    {
        var titreDos = replaceAll(titreDos, "+", "%2B");
        url =sUrlAttente + "?TYPE_RECHERCHE=CONTENU_DOS";
        url+="&POS_NUMDOS="+numDos;
        // encodeURI : encodage UTF-8
        url+="&POS_TITREDOS="+escape(titreDos);
        url+="&URL="  + sUrlResultat;
        url+="&POS_INDICE_DOS_ARBO=" + iNumEntry;
    
        parent.basculerEcran('center');
        parent.center.location.href = url;
    }
}

function AfficheDossierBal(szTitreBalSsCote, bPublic)
{
    var url =sUrlAttente + "?TYPE_RECHERCHE=RECHERCHE_BAL";
    url+="&POS_QUEST_NOM="+escape(szTitreBalSsCote);
    url+="&POS_QUEST_PUBLIC="+bPublic;
    url+="&URL=" + sUrlResultat;
    parent.basculerEcran('center');
    parent.center.location.href=url;
}
function AfficheDossierBib(szTitreBibSsCote, bPublic)
{
    var url = sUrlAttente + "?TYPE_RECHERCHE=RECHERCHE_BIB";
    url+="&POS_QUEST_NOM="+escape(szTitreBibSsCote);
    url+="&POS_QUEST_PUBLIC="+bPublic;
    url+="&URL=" + sUrlResultat;

    parent.basculerEcran('center');
    parent.center.location.href=url;
}

function AfficheQuestion(iNumQuest)
{
    var url = sUrlAttente + "?INUMQUEST="+iNumQuest;
    url+="&URL=" + sUrlResultat;
    parent.basculerEcran('center');
    parent.center.location.href=url;
}

function AfficheQuestionFtx(iNumQuest)
{
    var url = sUrlRechercheFtx + "?INUMQUEST="+iNumQuest;
    parent.basculerEcran('center'); 
    parent.center.location.href=url;
}
var iNumEntryInsertion = -1;
function afficherDrop(position) {
    
    debug("position afficherDrop" + position);
    var m = $("#treeDiv1").jstree(true)._model.data;
    var idElementTrouve = chercherDossierMenuParPosition(position);

    if (iNumEntryInsertion != -1)
        $("#treeDiv1").jstree(true).set_type(m[iNumEntryInsertion], "default");
    
    if (idElementTrouve !== -1)   
    {
        debug("Insertion dans dossier " + m[idElementTrouve].text);
        iNumEntryInsertion = idElementTrouve;
        $("#treeDiv1").jstree(true).set_type(m[idElementTrouve], "FolderAjout");
    }
}
function InitInsertion(node)
{
    var iAncienIndice = document.principal.POS_INDICE_DOSSIER_POUR_AJOUT.value;
    var m = $("#treeDiv1").jstree(true)._model.data;
    if (iAncienIndice.length != 0)
        $("#treeDiv1").jstree(true).set_type(m[iAncienIndice], "default");

    document.principal.POS_NUM_DOSSIER_POUR_AJOUT.value = node.data.numdos;
    document.principal.POS_TITRE_DOSSIER_PERE.value = node.text;
    document.principal.POS_INDICE_DOSSIER_POUR_AJOUT.value = node.id;
    $("#treeDiv1").jstree(true).set_type(node, "FolderAjout");
    var lstframes = document.getElementsByTagName("iframe");
    for (var i=0;i<lstframes.length;i++) {
        if(lstframes[i].id && lstframes[i].id.indexOf("ifr_posdoc_creation_") == 0
         && lstframes[i].contentDocument.getElementById('btn_creerdansdossier'))
            lstframes[i].contentDocument.getElementById('btn_creerdansdossier').disabled = false;    
    }
}

function StopInsertion(node)
{
    var iAncienIndice = document.principal.POS_INDICE_DOSSIER_POUR_AJOUT.value;
    var m = $("#treeDiv1").jstree(true)._model.data;
    if (iAncienIndice.length != 0)
        $("#treeDiv1").jstree(true).set_type(m[iAncienIndice], "default");

    document.principal.POS_NUM_DOSSIER_POUR_AJOUT.value = "";
    document.principal.POS_TITRE_DOSSIER_PERE.value = "";
    document.principal.POS_INDICE_DOSSIER_POUR_AJOUT.value = "";
    var lstframes = document.getElementsByTagName("iframe");
    for (var i=0;i<lstframes.length;i++) {
        if(lstframes[i].id && lstframes[i].id.indexOf("ifr_posdoc_creation_") == 0
         && lstframes[i].contentDocument.getElementById('btn_creerdansdossier'))
            lstframes[i].contentDocument.getElementById('btn_creerdansdossier').disabled = true;    
    }
}

function chercherDossierMenuParPosition(position) {
    
    var idElementTrouve = -1;
    var xy = YAHOO.util.Dom.getXY('arborescence');
    position = (position - xy[1]);
    var m = $("#treeDiv1").jstree(true)._model.data;
    
    var nodeRoot = m["#"];
    var children = nodeRoot.children_d;
    
    for(var i=0;i<children.length;i++) {
        var childId = children[i];
        var childNode = m[childId];
        
        if (childNode.data.action == "Folder") {
            var objLi = $('#' + childId);
            if (objLi.length) {
                var pos = objLi.position();
                var positionTopElt = pos.top;
                if (position > (positionTopElt - 15) && position <= (positionTopElt + 15))
                {
                   idElementTrouve = childNode.id;
                   break;
                }
            }
        }
    }
    return idElementTrouve;
}

function insererDansDossier(position, iNumDoc, bMultiple) {
    
    debug("position insererDansDossier::" + position);
    var idElementTrouve = chercherDossierMenuParPosition(position);
    
    if (idElementTrouve === -1)
    {
       alert(msgErrArboNoDossSelect);
    }
    else
    {
        var m = $("#treeDiv1").jstree(true)._model.data;
        var szNomDossier = $("<div/>").html(m[idElementTrouve].text).text();
        var iNumDossier = m[idElementTrouve].data.numdos;
        var sMsgConfirm = msgConfirmInsertDosDrag1 + iNumDoc + " "+ msgConfirmInsertDosDrag2 +" '" + szNomDossier + "' ?";
        if (bMultiple)
            sMsgConfirm = msgConfirmInsertDosCheckbox + " '" + szNomDossier + "' ?";
        if (confirm(sMsgConfirm))
        {
           InitInsertion(m[idElementTrouve]);
           center.onInsereDos("POS_LISTE_NUM_DOC=" + iNumDoc);
        }
        
        if (iNumEntryInsertion != -1)
            $("#treeDiv1").jstree(true).set_type(m[iNumEntryInsertion], "default");
        
        iNumEntryInsertion = -1;
        document.principal.POS_NUM_DOSSIER_POUR_AJOUT.value = "";
        document.principal.POS_TITRE_DOSSIER_PERE.value = "";
        document.principal.POS_INDICE_DOSSIER_POUR_AJOUT.value = "";
    }
}

function debug(msg) {
    console.log(msg);
}

function reloadBal() {
    parent.centerbal.reloadBal();
}

function getQuestionSessionNode() 
{
    return getNodeByAction("Question");
}

function getNodeByAction(action) 
{
    var m = $("#treeDiv1").jstree(true)._model.data;
    var node = null;
  
    for(var i in m) {
        if(i !== '#' && m[i].data && m[i].data.action === action) {
            node = m[i];
            break;
        }
    }
    return node;
}

function getSzImage(szTypeQuestion)
{
    switch(szTypeQuestion)
    {
        case "RECHERCHE_POS_NUM_DOC":
            return "RechNUM";
            break;
    
        case "RECHERCHE_CLE":
            return "RechKH";
            break;
        
        case "RECHERCHE_SIMPLE":
            return "RechFIC";
            break;
        
        case "RECHERCHE_ELABOREE":
            return "RechELA";
            break;
        
        case "RECHERCHE_EXCALIBUR":
        case "RECHERCHE_FTX_LOC":
            return "RechEXC";
            break;
        
        case "RECHERCHE_COMBINE":
            return "RechCOMB";
            break;
        
        default :
            return "RechFIC";
            break;
    }
}
 
function updateMenu(tabSzTitreNumDocFils) 
{
    var listNode = $("#treeDiv1").jstree(true).get_selected(true);
    var currentSelectedNode = null;
    if (listNode != null && listNode.length == 1)
        currentSelectedNode = listNode[0];

    var m = $("#treeDiv1").jstree(true)._model.data; 

    if (currentSelectedNode != null)
    {
        // on teste si le noeud est cree dans notre hastable qui contient tous les num infos.             
        for(i=0; i<tabSzTitreNumDocFils.length; i++)
        {
            // tabSzTitreNumDocFils[]="titredos|-|numdoc"    
            var arraySzInfoFils = tabSzTitreNumDocFils[i].split("\|-\|");
            var titreDos = arraySzInfoFils[0];
            var numDos = arraySzInfoFils[1];
            
            var nodeId =  findDossierInSelectedNode(numDos);
            if( nodeId === -1) {
                $('#treeDiv1').jstree().create_node(currentSelectedNode.id, {"text" : titreDos, 
                        "type": "Folder",
                        "children" : true, 
                        "data" : {"action": "Folder", "numdos": numDos}
                        }, 
                    "last", function(){}, true);
            }
            else
            {
                if (m[nodeId].text != titreDos) {
                    $("#treeDiv1").jstree('rename_node', m[nodeId] , titreDos);
                }
            }
        }
     }
}  

// cette renvoie true si le père de l'entrée eID est numPere
function getIfGoodParentFolder(eID, numPere)
{
    str = "[(]'"+numPere+"'";
    
    eID = theMenu.entry[eID].parent;
    
    if (theMenu.entry[eID].url != null && theMenu.entry[eID].url.search(str) != -1)
        return true;
    else
        return false;
}

// cette foction gère le retrait du dossier et la suppression d'un doc
// si numPere = 0 => on est en suppression
function updateMenuRemoveFils(numFils, numPere, eID) 
{
    //if(arguments.length == 2)
    //  eID = theMenu.firstEntry;
    // retrait d'un dossier d'un dossier : le dossier pere doit etre en cours de selection
    var bDeleteDossier = !(numPere > 0) ? true: false;
    var nodeDossierId = findDossierInSelectedNode(numFils);
    if (nodeDossierId !== -1) {
        $('#treeDiv1').jstree('delete_node', nodeDossierId);
    }
    
    // suppression d'un dossier : il faut parcourir toute l'arborescence pour supprimer
    // le dossier
    if (bDeleteDossier) {
        // TODO
    }
}

function updateMenuRemoveBib(szNomQuestionBib, bPublic)
{
    var parentNode = (bPublic == '1') ? getNodeByAction("Bibliotheque_PUB") : getNodeByAction("Bibliotheque_PRIV");
    var m = $("#treeDiv1").jstree(true)._model.data;
    if (parentNode != null) {
        for (var i = 0; i < parentNode.children.length; i++) {

            var node = m[parentNode.children[i]];
            if (node.data.TitreQuestion == szNomQuestionBib) {
                // suppression du dossier et des sous dossiers si besoin
                // fonctionne aussi si l'element ou un des enfants est selectionne 
                $('#treeDiv1').jstree('delete_node', node.id);
                break;
            }
        }        
    }
}

function updateMenuAddBib(szNomQuestionBib, bPublic)
{
    var parentNode = (bPublic == '1') ? getNodeByAction("Bibliotheque_PUB") : getNodeByAction("Bibliotheque_PRIV");
    $('#treeDiv1').jstree().create_node(parentNode.id, {"text" : szNomQuestionBib, 
        "type" : "QuestBib", "data" : { "action" : "QuestBib", "TitreQuestion": szNomQuestionBib, "publique" : bPublic}}, "last", 
        function(){});
}

function selectQuestionMenu(szCode, szTypeQuestion)
{
    var node = null;
    var parentNode = null;
    if (szTypeQuestion == "QUESTION_PUBLIQUE")
        parentNode = getNodeByAction("Bibliotheque_PUB");
    else if (szTypeQuestion == "QUESTION_PRIVEE")
        parentNode = getNodeByAction("Bibliotheque_PRIV");
    else
        parentNode = getNodeByAction("BalGenerale"); 

        // children_d
    if (parentNode != null) {
        var m = $("#treeDiv1").jstree(true)._model.data;
        var listChild = (szTypeQuestion == "QUESTION_BAL") ? parentNode.children_d : parentNode.children; 
        var node = null;
      
        for(var i=0;i<listChild.length;i++) {
            if((szTypeQuestion == "QUESTION_BAL" && m[listChild[i]].data.CodeBal === szCode) || 
                (szTypeQuestion != "QUESTION_BAL" && m[listChild[i]].data.TitreQuestion === szCode)) {
                node = m[listChild[i]];
                break;
            }
        }
        if (node != null) {
            refreshOnSelect = false;
            $('#treeDiv1').jstree('select_node', node);
        }
    }
}

  //intialisation du local storage  

    localStorage.clear();
function majBal(szCodeBal, iNbRep)
{
    
    var parentNode = getNodeByAction("BalGenerale"); 
    if (parentNode != null) {
        var m = $("#treeDiv1").jstree(true)._model.data;
        var listChild = parentNode.children_d; 
        var node = null;
      
        for(var i=0;i<listChild.length;i++) {
            if(m[listChild[i]].data.CodeBal === szCodeBal) {
                node = m[listChild[i]];
                break;
            }
        }
        var text = "";
        if (node != null) {
            
             // le nombre de reponse a déja ete affiché
            if (node.text.charAt(0) == '(')
            {
                var pos = node.text.indexOf(") ");
                text = "(" + iNbRep + ") " + node.text.substr(pos + ") ".length);
            }
            else
                text = "(" + iNbRep + ") " + node.text;
            $("#treeDiv1").jstree('rename_node', node , text);
            $("#treeDiv1").jstree(true).set_type(node, (iNbRep == 0) ? "BalVide" : "Bal");
        }
    }

    
   //display response  :: QUESTIONS + Nombre de traitement 
   // console.log('Code = ',szCodeBal,' Reponse',iNbRep);
    //local storage
    localStorage.setItem(szCodeBal,iNbRep);

        
}


 

 
/*
function update() {
  $.get("response.php", function(data) {
    $("#some_div").html(data);
    window.setTimeout(update, 10000);
  });
}*/

function getSelectedTreeNode() {

    var listNode = $("#treeDiv1").jstree(true).get_selected(true);
    var currentSelectedNode = null;
    if (listNode != null && listNode.length == 1)
        currentSelectedNode = listNode[0];
    
    return currentSelectedNode;   
}

function findDossierInSelectedNode(iNumDossier)
{
    var iNumEntryDossier = -1;
    var currentSelectedNode = getSelectedTreeNode();
    var instance = $("#treeDiv1").jstree(true);
    var m = instance._model.data; 

    if (currentSelectedNode != null)
    {
        for (var i = 0; i < currentSelectedNode.children.length; i++) {

            var path = $('#treeDiv1').jstree(true).get_path(currentSelectedNode.children[i],"/");
            var node = m[currentSelectedNode.children[i]];
            if (node.data.numdos == iNumDossier) {
                iNumEntryDossier = currentSelectedNode.children[i];
                break;
            }
        }
    }
    return iNumEntryDossier;
}

function ouvrirDossierDansMenu(iNumDossier)
{
    var nodeDossier = findDossierInSelectedNode(iNumDossier);
    if (nodeDossier !== -1) {
        $('#treeDiv1').jstree('select_node', nodeDossier);
    }
}

function selectNode(nodeid)
{
    $('#treeDiv1').jstree('select_node', nodeid);
}

function getFlatTree()
{
    var szFlatTree = "";
    var node = getSelectedTreeNode();
    var bLastNode = true;
    var instance = $("#treeDiv1").jstree(true);
    var m = instance._model.data; 
    while (node != null)
    {
        if (node.data.action == "Folder" || node.data.action == "Rech" || 
                        node.data.action == "QuestBib" || node.data.action == "Bal")
        {
            var ico = 'folderopen.png';
            if (node.data.action == "Rech")
                ico = 'recher.png';
            else if (node.data.action == "QuestBib")
                ico = 'list_bib.png';
            else if (node.data.action == "Bal")
                ico = 'bal.png';
            var text = (node.data.action == "Bal") ? node.data.LibelleBal : node.text;       
            var s = "<a title='"+ text +"' id='href_"+node.id+"' href=\"javascript:void parent.selectNode('"+node.id+"');\">";
            // for search, nb rep is already included in text
            if (bLastNode && node.data.action != "Rech") {
                text = "(zzz_nbrep)&nbsp;" + text;
            }
            s += "<img src='../../../../images/icons/"+ico+"' alt=''> <span>"+ text + "</span></a>";
            bLastNode = false;
        }
        else
            break;
        
        szFlatTree = (szFlatTree.length == 0) ? s : s + "&nbsp;>&nbsp;" + szFlatTree;
        node = (node.parents.length > 1) ? m[node.parents[0]]: null;
    }
    return szFlatTree;
}

function getXmlHttpRequestObject() {    

    if (window.XMLHttpRequest) {
    
        return new XMLHttpRequest();
    } else if(window.ActiveXObject) {
        return new ActiveXObject("Microsoft.XMLHTTP");
    }
}
var searchReq = getXmlHttpRequestObject();
function getListeFils(iNumDos)
{
    var tabFils = new Array();
    //tabFils[i++] = "D�partement AE|-|11911";
        
    if (searchReq.readyState == 4 || searchReq.readyState == 0)
    {
        var szRequete = "../ajax/get_fils_dossier.php?";
        if(CST_TYPE_APPLI == 2)
            szRequete = "../../../../servlet/interface/session/principal/ajax.GetFilsDossier?"; 
            
        szRequete += "POS_NUMDOS=" + iNumDos;
        searchReq.open("GET", szRequete, false);
        searchReq.send(null);
        if (searchReq.readyState == 4 || searchReq.readyState == 0)
        {
            var objListeFils = eval('(' + searchReq.responseText + ')');
            if (objListeFils.code_retour == 1)
                tabFils = objListeFils.liste_fils;
            else
                alert(objListeFils.msg_erreur); 
        }
    }
    return tabFils;
}

/**
 *  Supprime toute selection pour eviter que les dossiers s'ajoute sur une mauvaise entree
 *  Cas du panier
 */
function setSelectedArboNone()
{
    var listNode = $("#treeDiv1").jstree(true).get_selected(true);
    var currentSelectedNode = null;
    if (listNode != null && listNode.length > 0) {
        $("#treeDiv1").jstree(true).deselect_node( [ listNode[0].id ] )
    }
}

function updateMenuAddQuestion(titreQuestionSansQuote, iNumQuest, iNbReponses, szTypeQuestion) 
{
    var node = getQuestionSessionNode();
    var typeRecherche = getSzImage(szTypeQuestion);
    var action = (szTypeQuestion == "RECHERCHE_EXCALIBUR") ? "RechFtx" : "Rech";
    $('#treeDiv1').jstree().create_node(node.id, {"text" : titreQuestionSansQuote, 
        "state":{"selected":true,"opened":true}, "type": typeRecherche, "data" : {"action": action, "NumQuest": iNumQuest}}, "last", 
        function(){
            var listNode = $("#treeDiv1").jstree(true).get_selected(true);
            var currentSelectedNode = null;
            if (listNode != null && listNode.length > 1) {
                $("#treeDiv1").jstree(true).deselect_node( [ listNode[0].id ] )
            }
    });
}
function customMenu(node) {
    // The default set of all items
    var items = {};
    if (node.data.action == "Folder") {
            if (node.type != "FolderAjout") {
            items["insertionItem"] = {
                label: labelInsertionDos,
                icon : "arbo-folderajout",
                action: function (dataMenu) {
                
                    var inst = $.jstree.reference(dataMenu.reference),
                        node = inst.get_node(dataMenu.reference);
                    InitInsertion(node);
                }
             };
        }
        else {
            items["stopItem"] = {
                label: labelStopInsertionDos,
                icon : "arbo-folderajout-inactif",
                action: function (dataMenu) {
                    var inst = $.jstree.reference(dataMenu.reference),
                        node = inst.get_node(dataMenu.reference);
                    StopInsertion(node);
                }
            };
        }
    }
    else if (node.data.action == "BalGenerale") {
        items["actualiserItem"] = {
            label: "Actualiser",
            icon : "arbo-bal-actualise",
            action: function (dataMenu) {
                reloadBal();
            }
         };
    }
    return items;
}

var refreshOnSelect = true;
function treeInit() {
    
    //instantiate the tree:
    $('#treeDiv1').jstree({
        "plugins" : ["contextmenu", "types"],
        "types" : {
          "Root" : {
            "icon" : "arbo-root"
          },
          "FolderAjout" : {
            "icon" : "arbo-folderajout"
          },
          "BalGenerale" : {
            "icon" : "arbo-balgenerale"
          },
          "BalVide" : {
            "icon" : "arbo-balvide"
          },
          "Bal" : {
            "icon" : "arbo-bal"
          },
          "Bibliotheque" : {
            "icon" : "arbo-bibliotheque"
          },
          "Bibliotheque_PUB" : {
            "icon" : "arbo-bibliotheque-pub"
          },
          "Bibliotheque_PRIV" : {
            "icon" : "arbo-bibliotheque-priv"
          }
        },
      contextmenu: {items: customMenu,
                    select_node:false
                    },
      
      'core' : {
        'check_callback': true,
        'themes': {
                "name": "proton"
        },
        'multiple': false,
        'data' : function (node, cb) {
          
          if(node.id === "#") {
              cb([{"text" : "", "type" : "Root", "state": {"opened": "TRUE"}, "data" : { "action" : "Root"}, "children" : childrenInitTree}]);
          }
          else {
            var m = $("#treeDiv1").jstree(true)._model.data;
            var children = [];
            
            if (node.children.length > 0) {
                for(var i=0;i<node.children.length;i++)
                    children.push(m[node.children[i]]);    
            }
            else {
                if (node.data.action == "Folder") {
                    var listeFils = getListeFils(node.data.numdos);
                    for(var i=0;i<listeFils.length;i++) {
                        children[i] = {"text": listeFils[i].libelle, "type" : "Folder", 
                                "data" : { "action" : "Folder", "numdos" : listeFils[i].num},
                                children: true};
                    }
                }
            }
            cb(children);
          }
        }
        }
    });

    $('#treeDiv1').on("select_node.jstree", 
        function (e, data) {
        
            var countSelected = data.selected.length;
            if (countSelected > 1) {
                data.instance.deselect_node( [ data.selected[0] ] );
            }
            
            if (!refreshOnSelect) {
                refreshOnSelect = true;
            } else {
                //alert("node_id: " + data.node.id + data.node.type);
                var actionOnClick = data.node.data.action;
                if (actionOnClick == "Folder") {
                    AfficheDossier(data.node.data.numdos, data.node.text, data.node.id);
                }
                else if (actionOnClick == "RechHIS") {
                    parent.basculerEcran('center');
                    parent.center.location.href = sUrlAfficheHisto;
                }
                else if (actionOnClick == "Question") {
                    parent.basculerEcran('center');
                    parent.center.location.href = sUrlAfficheHistoQuest;
                }
                else if (actionOnClick == "Bal") {
                    AfficheDossierBal(data.node.data.CodeBal, data.node.data.publique);
                }
                else if (actionOnClick == "QuestBib") {
                    AfficheDossierBib(data.node.data.TitreQuestion, data.node.data.publique);
                }
                else if (actionOnClick == "RechFtx") {
                    AfficheQuestionFtx(data.node.data.NumQuest);
                }
                else if (actionOnClick == "Rech") {
                    AfficheQuestion(data.node.data.NumQuest);
                }
            }
    });
    
    $('#treeDiv1').on("open_node.jstree", 
        function (e, data) {
        
            return;
    });
}

function treeReInit() {
    $('#treeDiv1').jstree('destroy');
    treeInit();
}








    $('.btnAdmins, .btnRcrs, .btnFncs, .btnMarks, .btnComls, .btnGests, .btnInfors, .btnTelecs, .navbarlog_1, .navbarlog_4, .p2_gestion1, .p2_gestion2, .p1_admin').hide();

    var prof_util = $('.prof_util').val();
    switch (prof_util) {
        case "ADMIN":
            $('.btnAdmins, .btnRcrs, .btnFncs, .btnMarks, .btnComls, .btnGests, .btnInfors, .btnTelecs, .navbarlog_1, .navbarlog_4, .p2_gestion1, .p2_gestion2, .p1_admin').show();
            break;

        case "DIRECTEUR_GENERAL":
            $('.btnAdmins, .btnRcrs, .btnFncs, .btnMarks, .btnComls, .btnGests, .btnInfors, .btnTelecs').show();
            $('#listRcrs0').hide();
            break;
        
        case "DGA":
            $('.btnAdmins, .btnRcrs, .btnFncs, .btnMarks, .btnComls, .btnGests, .btnInfors, .btnTelecs').show();
            $('#listRcrs0').hide();
            break;
        
        case "AFF_JURIDIQUE":
            $('.btnAdmins, .btnRcrs').show();
            $('#ass,#con,#prs,#pay,#fpo,#lic,#pos,#reg,#hsu,#mis,#listRcrs0,#listRcrs3').hide();
            break;

        case "CGEST_TRESOR":
            $('.btnRcrs, .btnFncs').show();
            $('#ass,#con,#prs,#pay,#fpo,#lic,#pos,#reg,#hsu,#mis,#listRcrs0,#listRcrs3').hide();
            break;

        case "COMMERCIAL":
            $('.btnRcrs, .btnComls').show();
            $('#ass,#con,#prs,#pay,#fpo,#lic,#pos,#reg,#hsu,#mis,#listRcrs0,#listRcrs3').hide();
            break;

        case "COMPTA_FISC":
            $('.btnRcrs, .btnFncs').show();
            $('#ass,#con,#prs,#pay,#fpo,#lic,#pos,#reg,#hsu,#mis,#listRcrs0,#listRcrs3').hide();
            break;

        case "EMPLOYE":
            $('.btnRcrs').show();
            $('#listRcrs1,#listRcrs2,#listRcrs3').hide();
            break;
            
        case "FINANCE":
            $('.btnRcrs,.btnFncs').show();
            $('#ass,#con,#prs,#pay,#fpo,#lic,#pos,#reg,#hsu,#mis,#listRcrs0,#listRcrs3').hide();
            break;

        case "CONTROLEUR":
            $('.btnRcrs,.btnFncs').show();
            $('#ass,#con,#prs,#pay,#fpo,#lic,#pos,#reg,#hsu,#mis,#listRcrs0,#listRcrs3').hide();
            break;
        
        case "JURIDIQUE":
            $('.btnRcrs,.btnAdmins').show();
            $('#ass,#con,#prs,#pay,#fpo,#lic,#pos,#reg,#hsu,#mis,#listRcrs0,#listRcrs3').hide();
            break;

        case "MANAGER_ADM":
            $('.btnRcrs,.btnAdmins,#dfm').show();
            $('#ass,#con,#prs,#pay,#fpo,#lic,#pos,#reg,#hsu,#mis,#listRcrs0,#listRcrs3').hide();
            break;

        case "MANAGER_DCM":
            $('.btnRcrs,.btnComls,.btnMarks,#dfm').show();
            $('#ass,#con,#prs,#pay,#fpo,#lic,#pos,#reg,#hsu,#mis,#listRcrs0,#listRcrs3').hide();
            break;
        
        case "MANAGER_DFC":
            $('.btnRcrs,.btnFncs,#dfm').show();
            $('#ass,#con,#prs,#pay,#fpo,#lic,#pos,#reg,#hsu,#mis,#listRcrs0,#listRcrs3').hide();
            break;

        case "MANAGER_DTI":
            $('.btnRcrs,.btnInfors,#dfm').show();
            $('#ass,#con,#prs,#pay,#fpo,#lic,#pos,#reg,#hsu,#mis,#listRcrs0,#listRcrs3').hide();
            break;
        
        case "MANAGER_DTT":
            $('.btnRcrs,.btnTelecs,#dfm').show();
            $('#ass,#con,#prs,#pay,#fpo,#lic,#pos,#reg,#hsu,#mis,#listRcrs0,#listRcrs3').hide();
            break;

        case "MANAGER_PROJET":
            $('.btnRcrs,.btnGests,#san,#dfm').show();
            $('#ass,#con,#prs,#pay,#fpo,#lic,#pos,#reg,#hsu,#mis,#listRcrs0,#listRcrs3').hide();
            break;
        
        case "MARKETING":
            $('.btnRcrs,.btnMarks').show();
            $('#ass,#con,#prs,#pay,#fpo,#lic,#pos,#reg,#hsu,#mis,#listRcrs0,#listRcrs3').hide();
            break;

        case "MOYENS_GENERAUX":
            $('.btnRcrs,.btnAdmins').show();
            $('#ass,#con,#prs,#pay,#fpo,#lic,#pos,#reg,#hsu,#mis,#listRcrs0,#listRcrs3').hide();
            break;
        
        case "PROJET":
            $('.btnRcrs,.btnGests').show();
            $('#ass,#con,#prs,#pay,#fpo,#lic,#pos,#reg,#hsu,#mis,#listRcrs0,#listRcrs3').hide();
            break;
        
        case "QHSE":
            $('.btnRcrs,.btnAdmins').show();
            $('#ass,#con,#prs,#pay,#fpo,#lic,#pos,#reg,#hsu,#mis,#listRcrs0,#listRcrs3').hide();
            break;
        
        case "RECH_DEV":
            $('.btnRcrs,.btnInfors').show();
            $('#ass,#con,#prs,#pay,#fpo,#lic,#pos,#reg,#hsu,#mis,#listRcrs0,#listRcrs3').hide();
            break;
        
        case "RH":
            $('.btnRcrs').show();
            $('#listRcrs0').hide();
            break;
        
        case "SUPP_MAINT":
            $('.btnRcrs,.btnInfors').show();
            $('#ass,#con,#prs,#pay,#fpo,#lic,#pos,#reg,#hsu,#mis,#listRcrs0,#listRcrs3').hide();
            break;

        case "SYS_INFO":
            $('.btnRcrs,.btnInfors').show();
            $('#ass,#con,#prs,#pay,#fpo,#lic,#pos,#reg,#hsu,#mis,#listRcrs0,#listRcrs3').hide();
            break;

        case "TELECOM":
            $('.btnRcrs,.btnTelecs').show();
            $('#ass,#con,#prs,#pay,#fpo,#lic,#pos,#reg,#hsu,#mis,#listRcrs0,#listRcrs3').hide();
            break;
        
        default:
            $('.btnAdmins, .btnRcrs, .btnFncs, .btnMarks, .btnComls, .btnGests, .btnInfors, .btnTelecs').hide();
    }       
// });

// $(document).ready(function(){ 
            
        //script d'admin etb deconnexion !!!!!
        $('.text_white').on('click', function(){
            $('.user_name').toggleClass('open');
        });
        
        //ADMINISTRATION
        $('.btnAdmins').click(function() {
           $('.toggleAdmins').toggleClass("slow");
           $('#nav-listAdmins').toggle("slow"-5000);
           $('#nav-listRcrs').hide();
           $('#nav-listFncs').hide();
           $('#nav-listMarks').hide();
           $('#nav-listComls').hide();
           $('#nav-listGests').hide();
           $('#nav-listInfors').hide();
           $('#nav-listTelecs').hide();
         });    
        $('.toggleAdmins1').click(function() {
           $('.toggleAdmins1').toggleClass("slow");
           $('#nav-linkAdmins1').toggle("slow" -5000);
           $('#nav-linkAdmins2').hide();
           $('#nav-linkAdmins3').hide();
         });
         $('.toggleAdmins2').click(function() {
           $('.toggleAdmins2').toggleClass("slow");
           $('#nav-linkAdmins2').toggle("slow" -5000);
           $('#nav-linkAdmins1').hide();
           $('#nav-linkAdmins3').hide();
         });
          $('.toggleAdmins3').click(function() {
           $('.toggleAdmins3').toggleClass("slow");
           $('#nav-linkAdmins3').toggle("slow" -5000);
           $('#nav-linkAdmins1').hide();
           $('#nav-linkAdmins2').hide();
         });
        
        //RESSOURCES HUMAINES
        $('.btnRcrs').click(function() {
           $('.toggleRcrs').toggleClass("slow");
           $('#nav-listRcrs').toggle("slow" -5000);
           $('#nav-listAdmins').hide();
           $('#nav-listFncs').hide();
           $('#nav-listMarks').hide();
           $('#nav-listComls').hide();
           $('#nav-listGests').hide();
           $('#nav-listInfors').hide();
           $('#nav-listTelecs').hide();
         }); 
         $('.toggleRcrs0').click(function() {
            $('.toggleRcrs0').toggleClass("slow");
            $('#nav-linkRcrs0').toggle("slow" -5000);
            $('#nav-linkRcrs1').hide();
            $('#nav-linkRcrs2').hide();
            $('#nav-linkRcrs3').hide();
         });   
        $('.toggleRcrs1').click(function() {
            $('.toggleRcrs1').toggleClass("slow");
            $('#nav-linkRcrs1').toggle("slow" -5000);
            $('#nav-linkRcrs0').hide();
            $('#nav-linkRcrs2').hide();
            $('#nav-linkRcrs3').hide();
         });
         $('.toggleRcrs2').click(function() {
            $('.toggle2').toggleClass("slow");
            $('#nav-linkRcrs2').toggle("slow" -5000);
            $('#nav-linkRcrs0').hide();
            $('#nav-linkRcrs1').hide();
            $('#nav-linkRcrs3').hide();
         });
          $('.toggleRcrs3').click(function() {
           $('.toggleRcrs3').toggleClass("slow");
           $('#nav-linkRcrs3').toggle("slow" -5000);
           $('#nav-linkRcrs0').hide();
           $('#nav-linkRcrs1').hide();
           $('#nav-linkRcrs2').hide();
         });

        //FINANC & COMPTABILITE
        $('.btnFncs').click(function() {
           $('.toggleFncs').toggleClass("slide");
           $('#nav-listFncs').toggle("slide", -5000);
           $('#nav-listAdmins').hide();
           $('#nav-listRcrs').hide();
           $('#nav-listMarks').hide();
           $('#nav-listComls').hide();
           $('#nav-listGests').hide();
           $('#nav-listInfors').hide();
           $('#nav-listTelecs').hide();
         });    
        $('.toggleFncs1').click(function() {
           $('.toggleFncs1').toggleClass("slow");
           $('#nav-linkFncs1').toggle("slow" -5000);
           $('#nav-linkFncs2').hide();
           $('#nav-linkFncs3').hide();
         });
         $('.toggleFncs2').click(function() {
           $('.toggleFncs2').toggleClass("slow");
           $('#nav-linkFncs2').toggle("slow" -5000);
           $('#nav-linkFncs1').hide();
           $('#nav-linkFncs3').hide()
         });
          $('.toggleFncs3').click(function() {
            $('.toggleFncs3').toggleClass("slow");
           $('#nav-linkFncs3').toggle("slow" -5000);
           $('#nav-linkFncs1').hide();
           $('#nav-linkFncs2').hide()
         });

          //MARKETING
        $('.btnMarks').click(function() {
            $('.toggleMarks').toggleClass("slow");
           $('#nav-listMarks').toggle("slow" -5000);
           $('#nav-listAdmins').hide();
           $('#nav-listRcrs').hide();
           $('#nav-listFncs').hide();
           $('#nav-listComls').hide();
           $('#nav-listGests').hide();
           $('#nav-listInfors').hide();
           $('#nav-listTelecs').hide();
         });    
       $('.toggleMarks1').click(function() {
            $('.toggleMarks1').toggleClass("slow");
           $('#nav-linkMarks1').toggle("slow" -5000);
           $('#nav-linkMarks2').hide();
           $('#nav-linkMarks3').hide();
         });
         $('.toggleMarks2').click(function() {
            $('.toggleMarks2').toggleClass("slow");
           $('#nav-linkMarks2').toggle("slow" -5000);
           $('#nav-linkMarks1').hide();
           $('#nav-linkMarks3').hide();
         });
          $('.toggleMarks3').click(function() {
            $('.toggleMarks3').toggleClass("slow");
           $('#nav-linkMarks3').toggle("slow" -5000);
           $('#nav-linkMarks1').hide();
           $('#nav-linkMarks2').hide();
         });

           //COMMERCIAL
        $('.btnComls').click(function() {
            $('.toggleComls').toggleClass("slow");
           $('#nav-listComls').toggle("slow" -5000);
           $('#nav-listAdmins').hide();
           $('#nav-listRcrs').hide();
           $('#nav-listFncs').hide();
           $('#nav-listMarks').hide();
           $('#nav-listGests').hide();
           $('#nav-listInfors').hide();
           $('#nav-listTelecs').hide();
         });    
        $('.toggleComls1').click(function() {
            $('.toggleComls1').toggleClass("slow");
           $('#nav-linkComls1').toggle("slow" -5000);
           $('#nav-linkComls2').hide();
           $('#nav-linkComls3').hide();
         });
         $('.toggleComls2').click(function() {
            $('.toggleComls2').toggleClass("slow");
           $('#nav-linkComls2').toggle("slow" -5000);
           $('#nav-linkComls1').hide();
           $('#nav-linkComls3').hide();
         });
          $('.toggleComls3').click(function() {
            $('.toggleComls3').toggleClass("slow");
           $('#nav-linkComls3').toggle("slow" -5000);
           $('#nav-linkComls1').hide();
           $('#nav-linkComls2').hide();
         });

        //GESTION DE PROJETS
        $('.btnGests').click(function() {
            $('.toggleGests').toggleClass("slow");
           $('#nav-listGests').toggle("slow" -5000);
           $('#nav-listAdmins').hide();
           $('#nav-listRcrs').hide();
           $('#nav-listFncs').hide();
           $('#nav-listMarks').hide();
           $('#nav-listComls').hide();
           $('#nav-listInfors').hide();
           $('#nav-listTelecs').hide();
         });    
        $('.toggleGests1').click(function() {
            $('.toggleGests1').toggleClass("slow");
           $('#nav-linkGests1').toggle("slow" -5000);
           $('#nav-linkGests2').hide();
           $('#nav-linkGests3').hide();
         });
         $('.toggleGests2').click(function() {
            $('.toggleGests2').toggleClass("slow");
           $('#nav-linkGests2').toggle("slow" -5000);
           $('#nav-linkGests1').hide();
           $('#nav-linkGests3').hide();
         });
          $('.toggleGests3').click(function() {
            $('.toggleGests3').toggleClass("slow");
           $('#nav-linkGests3').toggle("slow" -5000);
           $('#nav-linkGests1').hide();
           $('#nav-linkGests2').hide();
         });

         //TECHNIQUE INFORMATIQUE
        $('.btnInfors').click(function() {
            $('.toggleInfors').toggleClass("slow");
           $('#nav-listInfors').toggle("slow" -5000);
           $('#nav-listAdmins').hide();
           $('#nav-listRcrs').hide();
           $('#nav-listFncs').hide();
           $('#nav-listMarks').hide();
           $('#nav-listComls').hide();
           $('#nav-listGests').hide();
           $('#nav-listTelecs').hide();
         });    
        $('.toggleInfors1').click(function() {
            $('.toggleInfors1').toggleClass("slow");
           $('#nav-linkInfors1').toggle("slow" -5000);
           $('#nav-linkInfors2').hide();
            $('#nav-linkInfors3').hide();
         });
         $('.toggleInfors2').click(function() {
            $('.toggleInfors2').toggleClass("slow");
           $('#nav-linkInfors2').toggle("slow" -5000);
           $('#nav-linkInfors1').hide();
            $('#nav-linkInfors3').hide();
         });
          $('.toggleInfors3').click(function() {
            $('.toggleInfors3').toggleClass("slow");
           $('#nav-linkInfors3').toggle("slow" -5000);
           $('#nav-linkInfors1').hide();
            $('#nav-linkInfors2').hide();
         });

         //TECHNIQUE TELECOM
        $('.btnTelecs').click(function() {
            $('.toggleTelecs').toggleClass("slow");
           $('#nav-listTelecs').toggle("slow" -5000);
           $('#nav-listAdmins').hide();
           $('#nav-listRcrs').hide();
           $('#nav-listFncs').hide();
           $('#nav-listMarks').hide();
           $('#nav-listComls').hide();
           $('#nav-listGests').hide();
           $('#nav-listInfors').hide();
         });       
        $('.toggleTelecs1').click(function() {
            $('.toggleTelecs1').toggleClass("slow");
           $('#nav-linkTelecs1').toggle("slow" -5000);
           $('#nav-linkTelecs2').hide();
           $('#nav-linkTelecs3').hide();
         });
         $('.toggleTelecs2').click(function() {
            $('.toggleTelecs2').toggleClass("slow");
           $('#nav-linkTelecs2').toggle("slow" -5000);
           $('#nav-linkTelecs1').hide();
           $('#nav-linkTelecs3').hide();
         });
          $('.toggleTelecs3').click(function() {
            $('.toggleTelecs3').toggleClass("slow");
           $('#nav-linkTelecs3').toggle("slow" -5000);
           $('#nav-linkTelecs1').hide();
           $('#nav-linkTelecs2').hide();
         });
    });