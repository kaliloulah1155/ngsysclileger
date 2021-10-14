<HTML>
<HEAD>
 
<TITLE>Numérotation des dossiers</TITLE>
	<link rel="stylesheet" type="text/css" href="/{NOM_APPLICATION}/include/style/style.css">
	<link rel="stylesheet" type="text/css" href="/{NOM_APPLICATION}/include/script/yui/assets/dpSyntaxHighlighter.css">
	<link rel="stylesheet" type="text/css" href="/{NOM_APPLICATION}/include/script/yui/build/button/assets/skins/sam/button.css" />
	<link rel="stylesheet" type="text/css" href="/{NOM_APPLICATION}/include/script/yui/build/fonts/fonts-min.css" />
	<link rel="stylesheet" type="text/css" href="/{NOM_APPLICATION}/include/script/yui/build/datatable/assets/skins/sam/datatable.css" />
	<script type="text/javascript" src="/{NOM_APPLICATION}/include/script/yui/build/yuiloader/yuiloader-min.js"></script>
	<script type="text/javascript" src="/{NOM_APPLICATION}/include/script/yui/build/dom/dom-min.js"></script>
	<script type="text/javascript" src="/{NOM_APPLICATION}/include/script/yui/build/event/event-min.js"></script>
	<script type="text/javascript" src="/{NOM_APPLICATION}/include/script/yui/build/dragdrop/dragdrop-min.js"></script>
	<script type="text/javascript" src="/{NOM_APPLICATION}/include/script/yui/build/element/element-beta-min.js"></script>
	<script type="text/javascript" src="/{NOM_APPLICATION}/include/script/yui/build/yahoo-dom-event/yahoo-dom-event.js"></script>
	<script type="text/javascript" src="/{NOM_APPLICATION}/include/script/yui/build/datasource/datasource-min.js"></script>
	<script type="text/javascript" src="/{NOM_APPLICATION}/include/script/yui/build/datatable/datatable-min.js"></script>
	
	<script type="text/javascript" src="/{NOM_APPLICATION}/include/script/yui/build/json/json-min.js"></script>
	
	<script type="text/javascript" src="/{NOM_APPLICATION}/include/script/numerotation/ymod-tableExtension.js"></script>
	<script type="text/javascript" src="/{NOM_APPLICATION}/include/script/numerotation/utils.js"></script>
	<script type="text/javascript" src="/{NOM_APPLICATION}/include/script/numerotation/numerotation.js"></script>
	<base target="_self">


<style type="text/css">

/* custom styles for this example */
.yui-skin-sam .yui-dt-liner { white-space:nowrap;} 



div.proxyPartie {
	position:absolute;
	width:600px;
	height:20px;
	border:solid 2px black;
	background:#FFFFFF;

}

</style>

<script type="text/javascript">
// Empêche le surlignage de la sélection
//if IE4+
document.onselectstart=new Function ("return false")

//if NS6
if (window.sidebar){
document.onmousedown=disableselect
document.onclick=reEnable
}
</script>


<script type="text/javascript">
		 
	var myColumnDefstmp = [
		{maxAutoWidth:"60", key:"0", resizeable:true, label:"NumInfo",hidden:true},
		{maxAutoWidth:"60", key:"1", resizeable:true, label:"Position",hidden:true},
		<!-- BEGIN COLUMNS_DEF -->  
				{maxAutoWidth:"{COLUMN_WIDTH}", key:"{KEY_NAME}",{COLUMN_FORMAT}, sortable:{COLUMN_SORTABLE}, resizeable:true, label:"{COLUMN_NAME}"}{SEPARATEUR_COLUMN}
		<!-- END COLUMNS_DEF -->  
		];
       
	 var   myfields = {
	        fields: [
	        	{key:"0"},
	        	{key:"1"},
	        	<!-- BEGIN FIELDS_DEF -->  
	        		{key: "{KEY_NAME}"}{SEPARATEUR_COLUMN}
	        	<!-- END FIELDS_DEF --> 				
	        ] 
	    }; 	
			      
	var myDatatmp = [ 	   
	<!-- BEGIN BLOCK_LIGNE -->
			{0:"{POS_NUM_DOC_DOSSIER}",
			 1:"{POSITION}",
		<!-- BEGIN LR_REPONSE -->	
			 {KEY_NAME2}:"{ZONE_LR}"{SEPARATEUR_FIELD}
		<!-- END LR_REPONSE -->
	}{SEPARATEUR_ROW}
	<!-- END BLOCK_LIGNE -->
	    ];   
        
</script>
</HEAD>

<BODY topmargin="0" leftmargin="0" class="yui-skin-sam">
<BR>
<H1 align = "center">{TITRE_PAGE}</h1>
<div id="multiDrag-proxy" style="visibility:hidden;">
<div  class="proxyPartie" style="top:3px;left:11px;z-index:1;">
</div>
<div class="proxyPartie" style="top:6px;left:6px;z-index:2;">
</div>
<div  class="proxyPartie" id="label" style="top:9px;left:1px;z-index:3;color:blue;">
</div>
</div>
<div align="center">
<table>
<tr>
	<td style="vertical-align:top;">
			<div class="yui-dt">
				<table >
				<thead>
			 	<tr class='titrecolonne' style="visibility:hidden;">
            		<th class='titrecolonne'>
	                    <div>                        
	                    </div>
	                    <div style="height: 24px;"/>
	                    </div>
            		</th>
            	</tr>
				</thead>
				<tbody class="yui-dt-data">
				<!-- BEGIN COLUMN_POSITION -->	
					<tr class='titrecolonne'><td>
						<div class="yui-dt-liner">
                       {POSITION}
						</div>
					</td></tr>
				<!--  END COLUMN_POSITION --> 			
				</tbody>	
				</table>
	</td>
	<td>
		<div id="table-numerotation">
		</div>
    </td>
</tr>
</table>
  	<input class="bouton" type="button" onClick="versNumerotation();" value="Numéroter">
  	<input class="bouton" type="button" onClick="document.location.href='{URL_CONSULTER_INDEX}?POS_NUM_DOC={POS_NUM_DOC}';" value="Annuler">
</div>
<!--
<div style="position:absolute;left=750px;top=10px;">
	<textarea rows="50" cols="50" id="infos" value=""></textarea>
</div>

<div style="position:absolute;left=600px;top=450px;">
  	<input type="button" id="clearButton" value="Clear">
</div>
-->

<form NAME=principal METHOD="POST" ACTION="{URL_ACTION}">

<input TYPE=hidden NAME="POS_NUM_DOC" VALUE="{POS_NUM_DOC}">
<input TYPE=hidden NAME="POS_TYPEDOC" VALUE="{POS_TYPEDOC}">
<input TYPE=hidden NAME="POS_ACTION_HERMES" VALUE="{POS_ACTION_HERMES}">
<input TYPE=hidden NAME="POS_JSON_STRING" VALUE="">

</form>

</BODY>
</HTML>
