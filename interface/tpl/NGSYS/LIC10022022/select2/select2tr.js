let appN = $(".appName").val();

let link1 =
    "/" +
    appN +
    "/interface/tpl/" +
    appN +
    "/SAN/select2/select.php";

let link2 =
    "/" +
    appN +
    "/interface/tpl/" +
    appN +
    "/LIC/select2/personnel_data.php";





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




$(document).on('change', '.personnel', function() {

    //  alert($(this).val());

    $('.viewnom').val('');
    $('.viewprenom').val('');

    $('.viewfonction').val('');
    $('.viewanciennete').val('');

    $.ajax({
        url: link2,
        type: "POST",
        data: {
            email: $(this).val()
        },
        success: function(response) {

            var responseNew = JSON.parse(response);

            $('.viewnom').val(responseNew[0][0]);
            $('.viewprenom').val(responseNew[0][1]);

            $('.viewfonction').val(responseNew[1]);
            $('.viewanciennete').val(responseNew[2]);
        },
        error: function(error) {
            console.log(error);
        }
    });



});