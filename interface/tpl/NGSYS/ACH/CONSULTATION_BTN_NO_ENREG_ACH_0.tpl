<!--Liste des actions possibles -->
<style>
	ul>li{
		margin-right:20px;
	}
	
	ul>li>.responsive-btn{
		border: none;
		max-height:32px;
		width:100px;
		border-radius:5px;
	}
	
	#btn_vocab{
		border: none;
		background: url("/images/icons/btn_vocab.png") no-repeat 0 0;
	}
	
	#btn_fichiers{
		border: none;
		background: url("/images/icons/btn_pieces_jointes.png") no-repeat 0 0;
	}
	
	#btn_dossier_pere{
		border: none;
		background: url("/images/icons/btn_dossier_pere.png") no-repeat 0 0;
	}
	
	#btn_mode_modification{
		border: none;
		background: url("/images/icons/btn_mode_modification.png") no-repeat 0 0;
	}
	
	#btn_enregistrer{
		border: none;
		background: url("/images/icons/btn_enregistrer.png") no-repeat 0 0;
	}
	
	#btn_numeriser{
		border: none;
		background: url("/images/icons/btn_numeriser.png") no-repeat 0 0;
	}
	
	#btn_fermer{
		border: none;
		background: url("/images/icons/btn_fermer.png") no-repeat 0 0;
	}
	
	
</style>

<nav style="" class="navbar navbar-dark bg-dark text-center" role="navigation">
	<button title="Clicquez ici pour voir le sous menu" type="button" class="btn navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse-1">
		<span><i class="fa fa-bars fa-2x"></i></span> 
	</button>
	
	<div  class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
		<A style="color:white;" class="btn" title="Document précedant dans la liste" role="button" HREF="javascript:goToDocumentPrecedent();" ><IMG SRC="/images/icons/prev.png" border=0></A>
		<A style="color:white;" class="btn" title="Document suivant dans la liste" role="button" HREF="javascript:goToDocumentSuivant();" ><IMG SRC="/images/icons/next.png" border=0></A>
	</div>
	
	<div  class="col-xs-12 col-sm-12 col-md-1 col-lg-1"></div>
	
	<div   class="collapse navbar-collapse col-xs-12 col-sm-6 col-md-9 col-lg-9" id="navbar-collapse-1">
		<ul class="nav navbar-nav level0 nav-tabs">
			<!-- BEGIN BLOC_MODIFICATION -->
			<li > <input TYPE="button" title="Suggestion de valeurs du champ selectionné" id="btn_vocab" class='bouton responsive-btn' VALUE="" onClick="charger_vocabulaire()"></input></li>
			<!-- END BLOC_MODIFICATION -->
			<li > <input TYPE="button" title="Gestion des pièces jointes " id="btn_fichiers" class='bouton responsive-btn' VALUE="" onClick="{CODE_ACTION_FICHIER}"></input></li>
			<li > <input TYPE="button" title="Voir le dossier de cette fiche" id="btn_dossier_pere" class='bouton responsive-btn' VALUE="" onClick="{CODE_DOSSIERS_PERES}"></input></li>
			<!-- BEGIN BLOC_CONSULTATION -->
			<li > <input TYPE="button" title="Passer en mode modificatin" id="btn_mode_modification" class='bouton responsive-btn' VALUE="" NAME="ACCES_MODIF"  onClick="{CODE_ACTION_MODIFIER}"></input></li>
			<!-- END BLOC_CONSULTATION -->
			<li > <INPUT TYPE=submit title="Enregistrer la fiche" id="btn_enregistrer" class='bouton responsive-btn' NAME="TYPE_ACTION" VALUE=""></li>
			<li > <input TYPE="button"  title="Numérisation" id="btn_numeriser" class="bouton responsive-btn"  VALUE="" onClick="javascript:AfficherNumeriser({POS_NUM_DOC});"></input></li>
			<li > <input TYPE="button" title="Fermer la fiche en cours" id="btn_fermer"  class='bouton responsive-btn' NAME="FERMER" VALUE="" onClick="{CODE_ACTION_FERMER}"></input></li>
		</ul>
	</div>
</nav>
