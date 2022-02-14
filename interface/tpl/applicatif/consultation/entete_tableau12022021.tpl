<form name='principal' ACTION='{URL_ATTENTE}' method='POST'>
<input type='hidden' name='URL' value='{CODE_ACTION}'>
 
<input type='hidden' name='POS_NUM_DOC' value='{POS_NUM_DOC}'>
<input type='hidden' name='POS_TYPEDOC' value='{POS_TYPEDOC}'>
<input type='hidden' name='MODE' value='{MODE}'>

<input type='hidden' name='POS_TYPEDOC_PERE' value='{POS_TYPEDOC_PERE}'> 
<input type='hidden' name='POS_VALEUR_TAB_RUB' value='{POS_VALEUR_TAB_RUB}'>
<input type='hidden' name='POS_CODE_RUB' value='{POS_CODE_RUB}'>
<input type='hidden' name='MODE_PRINCIPAL' value='{MODE_PRINCIPAL}'>
 
 
<!-- BEGIN BLOC_OLD_VALUE -->
<input type='hidden' name='{NAME_OLD_RUB}' value="{VALUE_OLD_RUB}">
<!-- END BLOC_OLD_VALUE -->
 
<table class='titrepage' role='presentation'>
<tr>
		<td class='titrepage' width='50%'><h1 class='titrepage'>{TITRE_ENTETE_PAGE}</h1>
			<!-- BEGIN BLOC_MODIFICATION_HERMES -->
			<!-- BEGIN BLOC_HERMES -->
			<SELECT name='POS_ACTION_HERMES' onChange='appel_desactivation()'>
			<!-- BEGIN POS_LISTE_ACTIONS_HERMES -->
			<OPTION value="{POS_CODE_ACTION_HERMES}" {SELECTED_ACTION_HERMES}> {POS_LIBELLE_ACTION_HERMES}</OPTION>
			<!-- END POS_LISTE_ACTIONS_HERMES -->
			</SELECT>
			<input type='submit' class='bouton_sub' name='TYPE_ACTION' value="{LIBELLE_ACTION_HERMES}">
			<!-- END BLOC_HERMES -->
			<!-- END BLOC_MODIFICATION_HERMES -->
		</td>
		<td class="titrepage">
			<table role='presentation'>
				<tr>
					<!-- BEGIN BLOC_CONSULTATION -->
					<td><input type='button' class='bouton' value='{LIBELLE_MODIFICATION}' onClick="{CODE_ACTION_MODIFIER}"></td>
					<!-- END BLOC_CONSULTATION -->
					<!-- BEGIN BLOC_SUBMIT -->
					<td><input type='submit' class='bouton_sub' name='TYPE_ACTION' value="{LIBELLE_ACTION}"></td>
					<!-- END BLOC_SUBMIT -->
					<td><input type='button' class='bouton' name='FERMER' value='{LIBELLE_FERMER}' onClick="{CODE_ACTION_FERMER}"></td>
				</tr>
			</table>
		</td>
</tr>
</table>
<br>