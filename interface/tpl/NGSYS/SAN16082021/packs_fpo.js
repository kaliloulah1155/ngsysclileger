let appN1 = $(".appName1").val();
////LOAD POSTE
let linkpostdata =
    "/" +
    appN1 +
    "/interface/tpl/" +
    appN1 +
    "/SAN/poste/poste_load.php";


let email = "";
$(document).on('change', '.personnel', function() {
    email = $(this).val();

    $('.poste').val('');
    ajaxPoste(email)
        .then((results) => {

            $('.poste').val(results[0][0]);

            /*for (let i = 0; i < results.length; i++) {   
                $("#service").append(

                    "<option value='"+results[i][0] +"' "+(results[i][0]==initservice  ? 'selected="selected"' : '')+"    >" +
                    results[i][0] +
                    "</option>"
                );
            } */



        })
        .catch((err) => console.log(err));

});



function ajaxPoste(email) {
    return new Promise((resolve, reject) => {
        $.ajax({
            url: linkpostdata,
            type: "POST",
            dataType: "json",
            data: {
                email: email,
            },
            success: function(data) {
                resolve(data);
            },
            error: function(error) {
                reject(error);
            },
        });
    });
}



////LOAD POSTE
let linknature =
    "/" +
    appN1 +
    "/interface/tpl/" +
    appN1 +
    "/SAN/nature/nature.php";


function load_nature() {

    var init_nature = $('.init_nature').val();

    $.ajax({
        url: linknature,
        type: "GET",
        data: {
            init_nature: init_nature
        },
        success: function(data) {
            $(".nature").append(
                "<option value='0'>Veuillez selectionner</option>"
            );
            $('.nature').append(data);

        },
        error: function(error) {
            console.log(error);
        },
    });
}
load_nature();


//INSERTION LORSQUE C'EST UN NOUVEAU DIPLOME
let linknatureInsert =
    "/" +
    appN1 +
    "/interface/tpl/" +
    appN1 +
    "/SAN/nature/nature_insert.php";



$(document).on('change', '.nature', function() {

    //alert($(this).val());

    $.ajax({
        url: linknatureInsert,
        type: "GET",
        data: {
            nature: $(this).val()
        },
        success: function(response) {

            if (response == 1) {

                $(".nature").empty();
                load_nature();
            }


        },
        error: function(error) {
            console.log(error);
        }
    });


});