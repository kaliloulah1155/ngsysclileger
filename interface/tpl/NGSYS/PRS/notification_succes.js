// Notification sur le bouton enregistrer

$(document).ready(function(){

	$('#app').click(function(){

		        $('form').submit(function () {

 				    if ($.trim($('.nom, .prenom, .numP, .email, .lieuNais').val())!="") {
				        alert("Verification.");
				        return false;
				    }
				});


		        $(function() {
		            $( "#dialog-2" ).dialog({
		               autoOpen: true, 
		               modal: true,
                       resizable: true,
		               buttons: {
		                  OK: function() {
		                  	$(this).dialog("close");

		                  	alert('ok');
		                  }
		               },
		               title: "SUCCESS",
		               position: {
		                  my: "center",
   						  at: "center",
                          of: window,

		               }
		            });
		            // $("#app").click(function() {

		            //    $("#dialog-2").dialog("open");
		            // });
        		});





	        });	
});