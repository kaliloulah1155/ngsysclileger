<!-- BEGIN BLOC_OLD_VALUE -->
<input type='hidden' name='{NAME_OLD_RUB}' value="{VALUE_OLD_RUB}">
<!-- END BLOC_OLD_VALUE -->
 
<table class='titrepage' role='presentation'>
<tr>
		<td class='titrepage text-center'><h5 class='titrepage'>{TITRE_ENTETE_PAGE}</h5>
			<!-- BEGIN BLOC_MODIFICATION_HERMES -->
			<!-- BEGIN BLOC_HERMES -->
			
			<!-- END BLOC_HERMES -->
			<!-- END BLOC_MODIFICATION_HERMES -->
		</td>
</tr>
<tr>
		<td>
			<SELECT name='POS_ACTION_HERMES' onChange='appel_desactivation()' class='action_hermes' style="height: 9vh;">
			<!-- BEGIN POS_LISTE_ACTIONS_HERMES -->
			<OPTION value="{POS_CODE_ACTION_HERMES}" {SELECTED_ACTION_HERMES}> {POS_LIBELLE_ACTION_HERMES}</OPTION>
			<!-- END POS_LISTE_ACTIONS_HERMES -->
			</SELECT>
		</td>
		<td>&nbsp;&nbsp;</td>
		<td>
			<input type='submit' class='bouton_sub btn' name='TYPE_ACTION' value="{LIBELLE_ACTION_HERMES}">
		</td>
		<td>&nbsp;&nbsp;</td>
	     <!-- <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td> -->
		<td class="titrepage">
			{BOUTON}
		</td>
</tr>
</table>
<br>
