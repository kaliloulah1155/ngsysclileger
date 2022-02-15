let appNameE = $(".appli").val();

//critere de recherche
var date_deb;
var date_fin;



let downloadexcel =
    "/" +
    appNameE +
    "/interface/tpl/" +
    appNameE +
    "/CAS/excelcas/download_exc_cas.php";

$(document).on('click', '.btn_export', function(e) {


    date_deb = $('.date_deb').val();
    date_fin = $('.date_fin').val();


    var btnexport = $(this).val();
    var choice = $('.choice').val();
    window.open(downloadexcel + '?export=' + btnexport + '&choice=' + choice + '&date_deb=' + date_deb + '&date_fin=' + date_fin, "_blank ");

    e.preventDefault();
});



let downloadpdf =
    "/" +
    appNameE +
    "/interface/tpl/" +
    appNameE +
    "/CAS/excelcas/download_pdf_cas.php";


$(document).on('click', '.btn_pdf', function(e) {

    date_deb = $('.date_deb').val();
    date_fin = $('.date_fin').val();

    window.open(downloadpdf + '?date_deb=' + date_deb + '&date_fin=' + date_fin, "_blank ");

    e.preventDefault();
});



//SEARCH
let link_url_s =
    "/" +
    appNameE +
    "/interface/tpl/" +
    appNameE +
    "/CAS/search/search_cas.php";


$(document).on('click', '.btn_search', function(e) {

    date_deb = $('.date_deb').val();
    date_fin = $('.date_fin').val();

    //  alert(date_deb + '**' + date_fin + '**' + email);

    ajaxSearchPRS(date_deb, date_fin);

    e.preventDefault();
});

function ajaxSearchPRS(date_deb, date_fin) {
    $.ajax({
        url: link_url_s,
        type: "POST",
        data: {
            date_deb: date_deb,
            date_fin: date_fin
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
                        "<a href='javascript:void(0)' style='margin-left:40%;border: 1px solid black;padding:3px' class='modifier' data-num=" + responseNew[i][2] + " style='padding: 3px;border: 1px solid black;cursor: pointer'><i class='fa fa-eye'></i></a> &nbsp;" +

                        "<a href='javascript:void(0)' class='supprimer' data-numsup=" + responseNew[i][2] + " style='padding: 3px;border: 1px solid black;cursor: pointer;'><i class='fa fa-archive'></i></a>"
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