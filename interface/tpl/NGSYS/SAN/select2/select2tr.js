let appN = $(".appName").val();

let link1 =
    "/" +
    appN +
    "/interface/tpl/" +
    appN +
    "/SAN/select2/select.php";

var init_personnel = $('.init_personnel').val();


$.ajax({
    url: link1,
    type: "GET",
    data: {
        init_personnel: init_personnel
    },
    success: function(data) {

        $('.personnel').append(data);
    },
    error: function(error) {
        console.log(error);
    },
});

$('.select2').select2({
    placeholder: 'Selectionnez un interimaire',
    // theme:'bootstrap',
    tags: true,
    allowClear: true,
});



let link2 =
    "/" +
    appN +
    "/interface/tpl/" +
    appN +
    "/SAN/select2/personnel_data.php";


$(document).on('change', '.personnel', function() {



    $('.nom_pers').val('');
    $('.prenoms_pers').val('');

    $.ajax({
        url: link2,
        type: "POST",
        data: {
            email: $(this).val()
        },
        success: function(response) {

            var responseNew = JSON.parse(response);

            //$('.nom_pers').val(responseNew[0][0]);
            //$('.prenoms_pers').val(responseNew[0][1]);
        },
        error: function(error) {
            console.log(error);
        }
    });



});