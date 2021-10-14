let appNameE = $(".appli").val();

//critere de recherche
var date_deb;
var date_fin;
var email;


let downloadexcel =
    "/" +
    appNameE +
    "/interface/tpl/" +
    appNameE +
    "/SAN/excelsan/download_exc_san.php";

$(document).on('click', '.btn_export', function(e) {


    date_deb = $('.date_deb').val();
    date_fin = $('.date_fin').val();
    email = $('.personnel').val();


    var btnexport = $(this).val();
    var choice = $('.choice').val();
    window.open(downloadexcel + '?export=' + btnexport + '&choice=' + choice + '&date_deb=' + date_deb + '&date_fin=' + date_fin + '&email=' + email, "_blank ");

    e.preventDefault();
});



let downloadpdf =
    "/" +
    appNameE +
    "/interface/tpl/" +
    appNameE +
    "/SAN/excelsan/download_pdf_san.php";


$(document).on('click', '.btn_pdf', function(e) {

    date_deb = $('.date_deb').val();
    date_fin = $('.date_fin').val();
    email = $('.personnel').val();

    window.open(downloadpdf + '?date_deb=' + date_deb + '&date_fin=' + date_fin + '&email=' + email, "_blank ");

    e.preventDefault();
});


////LOAD PERSONNNEL
let linkprs =
    "/" +
    appNameE +
    "/interface/tpl/" +
    appNameE +
    "/SAN/liste/personnel/personnel_load.php";


$.ajax({
    url: linkprs,
    type: "GET",
    success: function(data) {
        $('.personnel').append(data);
    },
    error: function(error) {
        console.log(error);
    }
});

//SEARCH
let link_url_s =
    "/" +
    appNameE +
    "/interface/tpl/" +
    appNameE +
    "/SAN/search/search_san.php";


$(document).on('click', '.btn_search', function(e) {

    date_deb = $('.date_deb').val();
    date_fin = $('.date_fin').val();
    email = $('.personnel').val();



    // alert(date_deb + '**' + date_fin + '**' + email);

    ajaxSearchSAN(date_deb, date_fin, email);

    e.preventDefault();
});

function ajaxSearchSAN(date_deb, date_fin, email) {
    $.ajax({
        url: link_url_s,
        type: "POST",
        data: {
            date_deb: date_deb,
            date_fin: date_fin,
            email: email
        },
        success: function(response) {
            var responseNew = JSON.parse(response);

            var j = 1;
            var t = $('.table').DataTable();
            t.clear();

            for (let i = 0; i < responseNew.length; i++) {
                t.row.add(
                    [
                        j++,
                        responseNew[i][0],
                        responseNew[i][1],
                        responseNew[i][2],
                        responseNew[i][3],
                        responseNew[i][4],
                        "<a href='javascript:void(0)' style='margin-left:20%;border: 1px solid black;padding:3px' class='modifier' data-num=" + responseNew[i][5] + " style='padding: 3px;border: 1px solid black;cursor: pointer'><i class='fa fa-eye'></i></a> &nbsp;" +
                        "<a href='javascript:void(0)' class='supprimer' data-numsup=" + responseNew[i][5] + " style='padding: 3px;border: 1px solid black;cursor: pointer;'><i class='fa fa-archive'></i></a>"
                    ]
                );
            }
            t.draw();
        },
        error: function(err) {
            console.log(err);
        },
    });
}