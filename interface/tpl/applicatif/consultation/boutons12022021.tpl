<!--Liste des actions possibles -->
<table role='presentation'>
<tr>
	<!-- Navigation -->
	<td>
		<a href="javascript:goToDocumentPrecedent();" title="Document précédent">
			<img src="/{NOM_APPLICATION}/images/icons/prev.png" alt="Document précédent">
		</a>
	</td>
	<td>
		<a href="javascript:goToDocumentSuivant();" title="Document suivant">
			<img src="/{NOM_APPLICATION}/images/icons/next.png" alt="Document suivant">
		</a>
	</td>
	<!-- BEGIN BLOC_MODIFICATION -->
	<td><input type='button' class='bouton' name="btn_vocabulaire" id="btn_vocabulaire" value="{VOCABULAIRE}" onClick="charger_vocabulaire()"></td>
	<!-- END BLOC_MODIFICATION -->
	<td><INPUT TYPE=BUTTON class='bouton' NAME="btn_fichier" VALUE="{LIBELLE_FICHIER}" onClick="{CODE_ACTION_FICHIER}"></td>
    <td><INPUT TYPE=BUTTON class='bouton' style="display: {DISPLAY_BTN_DOSSIER_PERE}" VALUE="{DOSSIERS_PERES}" onClick="{CODE_DOSSIERS_PERES}"></td>
	<!-- BEGIN BLOC_CONSULTATION -->
	<td><input type='button' class='bouton' name="ACCES_MODIF" value="{LIBELLE_MODIFICATION}" onClick="{CODE_ACTION_MODIFIER}"></td>
	<!-- END BLOC_CONSULTATION -->
	<td><input type=submit {ENABLED_BOUTON_ENREGISTRER} NAME="TYPE_ACTION" value="{LIBELLE_ACTION}"></td>
	<td><input type='button' class='bouton' NAME="FERMER" value="{LIBELLE_FERMER}" onClick="{CODE_ACTION_FERMER}"></td>
	</tr>
</table>     
