<form name='principal' ACTION='{URL_ATTENTE}' method='POST'>
<input type='hidden' name='URL' value='{CODE_ACTION}'>
<input type='hidden' name='POS_NUM_DOC' value='{POS_NUM_DOC}'>
<input type='hidden' name='POS_TYPEDOC' value='{POS_TYPEDOC}'>
<input type='hidden' name='MODE' value='{MODE}'>
 
 
<!-- BEGIN BLOC_OLD_VALUE -->
<input type='hidden' name='{NAME_OLD_RUB}' value="{VALUE_OLD_RUB}">
<!-- END BLOC_OLD_VALUE -->
 
<table class='titrepage' role='presentation' style="margin-top:-40px">
<tr>
		<td class='titrepage' width='50%'><h1 class='titrepage' style="font-size:3rem">{TITRE_ENTETE_PAGE} </h1>
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
			{BOUTON}
		</td>
</tr>
</table>
<br>
