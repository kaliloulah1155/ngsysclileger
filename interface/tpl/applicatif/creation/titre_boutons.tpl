<input type='hidden' name='URL' value='{CODE_ACTION}'>
<input type='hidden' name='POS_TYPEDOC' value='{POS_TYPEDOC}'>
<input type='hidden' name='LISTE_RUB_VERROUILLEES' value='{LISTE_RUB_VERROUILLEES}'>
<input type='hidden' name='RUB_ERREUR' value='{RUB_ERREUR}'>
<input type='hidden' name='NUM_PERE_INSERT_DOS' value=''>
<input type='hidden' name="POS_CONF_HAB" value="{POS_CONF_HAB}">
<input type='hidden' name="POS_CONF_LIBELLE_HAB" value="{POS_CONF_LIBELLE_HAB}">
<input type='hidden' name="POS_CONF_NIV" value="{POS_CONF_NIV}">
<input type='hidden' name="POS_CLOISON" value="{POS_CLOISON}">
<!-- BEGIN BLOC_LISTE_RUB_TAB -->
<input type='hidden' name="POS_VAL_RUB_{CODE_RUB_TAB}" value="{VALEUR_RUB_TAB}">
<!-- END BLOC_LISTE_RUB_TAB -->
<table class='titrepage' width='100%'>
	<tr>
		<td class='titrepage' width='50%'><h1 class='titrepage'>{TITRE_ENTETE_PAGE}</h1></td>
		<td class='titrepage'>   
			<table>
				<tr>
					<td><input type='submit' class='bouton_sub' value="{LIBELLE_ACTION}"></td>
                    <td><input type='button' class='bouton creerdansdossier' id='btn_creerdansdossier' onClick="javascript:onCreerInsererDossier();" value="{LIBELLE_CREER_DOSSIER}"></td>
					<td><input type='button' class='bouton' name="btn_vocabulaire" id="btn_vocabulaire" value='{VOCABULAIRE}' onClick="{FCT_JS_VOC_GEN}"></td>
					<td><input type='button' class='bouton' value='{LIBELLE_FERMER}' onClick="{CODE_ACTION_FERMER}"></td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<br>