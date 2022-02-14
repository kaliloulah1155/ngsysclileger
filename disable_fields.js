 if ($('.get_mode').val()=='MODIFICATION') {
   // $('.btn').hide();
	jQuery("input[type='text']").prop("active", true);
	jQuery("input[type='number']").prop("active", true);
	jQuery("select").prop("active", true);
	jQuery("input[type='email']").prop("active", true);
	jQuery("textarea").prop("active", true);
}else if($('.get_mode').val()=='CONSULTATION'){
   // $('.btn').hide();
    jQuery("input[type='text']").prop("disabled", true);
    jQuery("input[type='number']").prop("disabled", true);
    jQuery("select").prop("disabled", true);
    jQuery("input[type='email']").prop("disabled", true);
    jQuery("textarea").prop("disabled", true);
    jQuery("input[type='time']").prop("disabled", true); 
    jQuery("input[type='radio']").prop("disabled", true); 
    jQuery("input[type='checkbox']").prop("disabled", true);    
 
    // jQuery("table").find(tr).find(td).jQuery("select").prop("disabled", true);

    // $('.table tr').each(function() {
    //     var identifiant = $(this).find(td).prop("disabled", true);
    //     identifiant.prop("disabled",true);
    //     });
    
    // jQuery("table").jQuery("select").prop("disabled", true)
    // jQuery(".row").jQuery("table").jQuery("tbody").jQuery("tr").jQuery("td").jQuery("select").prop("disabled", true);
}