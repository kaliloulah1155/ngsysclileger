<form class="configureform" id='{PORTLET_INSTANCE_ID}_form'> 

<table>
<!-- BEGIN BLOC_INPUTS -->
	<tr>
		<td class="labelChamp">{ENTRY_LABEL}</td>
		<td class="inputChamp"> <input type="{ENTRY_TYPE}" id="{ENTRY_ID}_input"/> </td>
	</tr>
<!-- END BLOC_INPUTS -->
</table>
<div>
	<input class="bouton_sub" type="button" value="{LABEL_VALIDER}" onclick="Yglob.PosYUIPortletFactory.submitForm('{PORTLET_INSTANCE_ID}');"/> 
	<input class="bouton" type="button" value="{LABEL_ANNULER}" onclick="Yglob.PosYUIPortletFactory.cancelForm('{PORTLET_INSTANCE_ID}');"/>
</div>
</form>
