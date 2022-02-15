$(document).on('click', '.bouton_sub', function(e) {


    if (confirm("Confirmez-vous le traitement de cette action ?")) {
        alert("VOTRE OPERATION S'EST DEROULEE AVEC SUCCES");

        $(".cform").submit();
    } else {

        e.preventDefault();
    }
});