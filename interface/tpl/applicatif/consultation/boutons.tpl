<!--Liste des actions possibles -->
<table role='presentation'>
  
<tr>
   
	<!-- Navigation -->
	<td>
		<a href="javascript:goToDocumentPrecedent();" title="Document précédent"><IMG src="/{NOM_APPLICATION}/images/icons/prev1.png" alt="Document précédent"></a>
	</td>
	<td>&nbsp;&nbsp;</td>
	<td>
		<a href="javascript:goToDocumentSuivant();" title="Document suivant"><IMG src="/{NOM_APPLICATION}/images/icons/next1.png" alt="Document suivant"></a>
	</td>
	<!-- BEGIN BLOC_MODIFICATION -->
	<td>&nbsp;&nbsp;</td>
	<!-- <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td> -->
	<td><input type='button' class='bouton' name="btn_vocabulaire" id="btn_vocabulaire" value="{VOCABULAIRE}" onClick="charger_vocabulaire()"></td>
	<!-- END BLOC_MODIFICATION -->
	<td>&nbsp;&nbsp;</td>
	<td><input type=button class='bouton' name="btn_fichier" value="{LIBELLE_FICHIER}" onClick="{CODE_ACTION_FICHIER}"></td>
    <td><input type=button class='bouton' style="display: {DISPLAY_BTN_DOSSIER_PERE}" value="{DOSSIERS_PERES}" onClick="{CODE_DOSSIERS_PERES}"></td>
	<!-- BEGIN BLOC_CONSULTATION -->
	<td>&nbsp;&nbsp;</td>
	<td><input type='button' class='bouton' name="ACCES_MODIF" value="{LIBELLE_MODIFICATION}" onClick="{CODE_ACTION_MODIFIER}"></td>
	<!-- END BLOC_CONSULTATION -->
	<td>&nbsp;&nbsp;</td>
	<!--<td><input type=submit {ENABLED_BOUTON_ENREGISTRER} name="TYPE_ACTION" value="{LIBELLE_ACTION}"></td>
	<td>&nbsp;&nbsp;</td>-->
	<td>
		<input type='button' class='bouton' name="FERMER" value="{LIBELLE_FERMER}" onClick="{CODE_ACTION_FERMER}">
	</td>
	</tr>
</table>