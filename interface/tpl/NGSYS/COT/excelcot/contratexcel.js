let appNameE = $(".appli").val();

//critere de recherche
var date_deb;
var date_fin;
var email;
var contrat;


// FICHIER EXCEL

let downloadexcel =
    "/" +
    appNameE +
    "/interface/tpl/" +
    appNameE +
    "/COT/excelcot/download_exc_cot.php";

$(document).on('click', '.btn_export', function(e) {


    date_deb = $('.date_deb').val();
    date_fin = $('.date_fin').val();
    email = $('.personnel').val();
    contrat = $('.contrat').val();


    var btnexport = $(this).val();
    var choice = $('.choice').val();
    window.open(downloadexcel + '?export=' + btnexport + '&choice=' + choice + '&date_deb=' + date_deb + '&date_fin=' + date_fin + '&email=' + email + '&contrat=' + contrat + '&profil=' + profil, "_blank ");

    e.preventDefault();
});
// FIN FICHIER EXCEL


// FICHIER PDF
let downloadpdf =
    "/" +
    appNameE +
    "/interface/tpl/" +
    appNameE +
    "/COT/excelcot/download_pdf_cot.php";

$(document).on('click', '.btn_pdf', function(e) {

    date_deb = $('.date_deb').val();
    date_fin = $('.date_fin').val();
    email = $('.personnel').val();
    contrat = $('.contrat').val();


    window.open(downloadpdf + '?date_deb=' + date_deb + '&date_fin=' + date_fin + '&email=' + email + '&contrat=' + contrat + '&profil=' + profil, "_blank ");

    e.preventDefault();
});
//FIN FICHIER PDF

////LOAD PERSONNNEL
let linkprs =
    "/" +
    appNameE +
    "/interface/tpl/" +
    appNameE +
    "/COT/liste/personnelcot/personnel_load_cot.php";


$.ajax({
    url: linkprs,
    type: "POST",
    data: {
        email: $('.user_email').val(),
        profil: profil
    },
    success: function(data) {

        if (profil == "ADMIN" || profil == "RH" || profil == "MANAGER_ADM" || profil == "DGA" || profil == "DG") {
            $('.personnel').append("<option value='' selected>Veuillez s&#233;lectionner</option>");
        }

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
    "/COT/search/search_cot.php";


$(document).on('click', '.btn_search', function(e) {

    date_deb = $('.date_deb').val();
    date_fin = $('.date_fin').val();
    email = $('.personnel').val();
    contrat = $('.contrat').val();



    // alert(email);

    //  alert(date_deb + '**' + date_fin + '**' + email);

    ajaxSearchCOT(date_deb, date_fin, email, contrat, profil);

    e.preventDefault();
});



function ajaxSearchCOT(date_deb, date_fin, email, contrat, profil) {
    $.ajax({
        url: link_url_s,
        type: "POST",
        data: {
            date_deb: date_deb,
            date_fin: date_fin,
            email: email,
            contrat: contrat,
            profil: profil
        },
        success: function(response) {
            var responseNew = JSON.parse(response);


            var j = 1;
            var t = $('.table').DataTable();
            t.clear();
            for (let i = 0; i < responseNew.length; i++) {

                var contratabrege = responseNew[i][2];
                let id = responseNew[i][4];
                let get_url = "";

                switch (contratabrege) {
                    case "CDD lie au projet":
                        get_url = link_urlcddprojet;
                        break;
                    case "CDD standard":
                        get_url = link_urlcddsimple;
                        break;
                    case "CDD avec essai":
                        get_url = link_urlcddessai;
                        break;
                    case "CDI avec essai":
                        get_url = link_urlcdiessai;
                        break;
                    case "CDI standard":
                        get_url = link_urlcdisimple;
                        break;
                    case "Consultant externe":
                        get_url = link_urlconsultant;
                        break;
                    case "Consultant interne":
                        get_url = link_urlconsultantint;
                        break;
                    case "Stage-ecole":
                        get_url = link_urlstageecole;
                        break;
                    case "Stage professionnel":
                        get_url = link_urlstagequalification;
                        break;
                    default:
                        alert("Votre contrat n'a pas été créé");
                        break;
                }



                t.row.add(
                    [
                        j++,
                        responseNew[i][0],
                        responseNew[i][1],
                        contratabrege,
                        responseNew[i][3],
                        "<a href='javascript:void(0)' style='margin-left:10%;border: 1px solid black;padding:3px' class='modifier' data-num=" + responseNew[i][4] + " style='padding: 3px;border: 1px solid black;cursor: pointer;'><i class='fa fa-eye'></i></a>" +
                        "<a href='" + get_url + "?numposeidon=" + id + "&email=" + responseNew[i][5] + " '         target='_blank'  class='rounded print_btn'   style='padding: 3px;border: 1px solid black;cursor: pointer;'><i class='fa fa-print'></i></a>" +
                        "<a href='javascript:void(0)' class='supprimer' data-numsup=" + id + " style='padding: 3px;border: 1px solid black;cursor: pointer;'><i class='fa fa-archive'></i></a>"
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