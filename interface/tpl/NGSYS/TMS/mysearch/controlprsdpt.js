let appNameprs = $(".appName").val();

let link_urldpt =
    "/" +
    appNameprs +
    "/interface/tpl/" +
    appNameprs +
    "/PRS/departement/depart_actions.php";

let link_urlprs =
    "/" +
    appNameprs +
    "/interface/tpl/" +
    appNameprs +
    "/TMS/mysearch/controlprs.php";

var etat_depart = "";
var depart_c = $(".viewdepartement").val();

var prof_util = $(".user_profil").val();

switch (prof_util) {
    case "ADMIN":
        $(".search_prospect").show();
        break;
    case "RH":
        $(".search_prospect").show();
        break;
    case "MANAGER_ADM":
        $(".search_prospect").show();
        break;
    case "MANAGER_DCM":
        $(".search_prospect").show();
        break;
    case "MANAGER_DFC":
        $(".search_prospect").show();
        break;
    case "MANAGER_DTI":
        $(".search_prospect").show();
        break;
    case "MANAGER_DTT":
        $(".search_prospect").show();
        break;
    case "MANAGER_PROJET":
        $(".search_prospect").show();
        break;
    default:
        $(".search_prospect").hide();
}

//Debut phase 1-Traitement des departements
ajaxDepartement()
    .then((results) => {
        for (let i = 0; i < results.length; i++) {
            if (prof_util == "ADMIN" || prof_util == "RH") {
                $("#depart").append(
                    "<option value='" +
                    results[i][0] +
                    "' " +
                    (results[i][0] === depart_c ? 'selected="selected"' : "") +
                    " > " +
                    results[i][0] +
                    "</option>"
                );
            }
            if (
                prof_util == "MANAGER_ADM" ||
                prof_util == "MANAGER_DCM" ||
                prof_util == "MANAGER_DFC" ||
                prof_util == "MANAGER_DTI" ||
                prof_util == "MANAGER_DTT" ||
                prof_util == "MANAGER_PROJET"
            ) {
                if (results[i][0] === depart_c) {
                    $("#depart").append(
                        "<option value='" +
                        results[i][0] +
                        "' " +
                        (results[i][0] === depart_c ? 'selected="selected"' : "") +
                        " > " +
                        results[i][0] +
                        "</option>"
                    );
                }
            }
        }
    })
    .catch((err) => console.log(err));

function ajaxDepartement() {
    return new Promise((resolve, reject) => {
        $.ajax({
            url: link_urldpt,
            type: "POST",
            dataType: "json",
            // data: {
            //     key: "value",
            // },
            success: function(data) {
                resolve(data);
            },
            error: function(error) {
                reject(error);
            },
        });
    });
}
//Fin phase 1-Traitement des departements

//Debut phase 2-Traitement des personnels
$("#depart").on("change", function() {
    let depart = $(this).val();

    if (depart != "") {
        // console.log(depart);

        //Réinitilisation de la liste
        $('select[id="personnel"]').empty();
        //appel de la fonction promesse :traitement personnel

        ajaxPersonnel(depart)
            .then((results) => {
                $("#personnel").append(
                    "<option value='Veuillez choisir' selected> Veuillez choisir</option>"
                );
                for (let i = 0; i < results.length; i++) {
                    $("#personnel").append(
                        "<option value='" +
                        results[i][0] +
                        "'>" +
                        results[i][0] +
                        "</option>"
                    );
                }
            })
            .catch((err) => console.log(err));
    }
    //Réinitilisation de la liste
    else $('select[id="personnel"]').empty();
});

function ajaxPersonnel(depart) {
    return new Promise((resolve, reject) => {
        $.ajax({
            url: link_urlprs,
            type: "POST",
            dataType: "json",
            data: {
                departement: depart,
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

//Fin phase 2-Traitement des personnels

//Debut pour la vue de consultation on charge la liste des personnels au chargement de la page

let selectDepartement = depart_c;

if (selectDepartement != "") {
    // console.log(depart);

    //Réinitilisation de la liste
    $('select[id="personnel"]').empty();
    //appel de la fonction promesse :traitement personnel

    ajaxPersonnel(selectDepartement)
        .then((results) => {
            $("#personnel").append(
                "<option value='Veuillez choisir' selected> Veuillez choisir</option>"
            );
            for (let i = 0; i < results.length; i++) {
                $("#personnel").append(
                    "<option value='" + results[i][0] + "'>" + results[i][0] + "</option>"
                );
            }
        })
        .catch((err) => console.log(err));
}
//Réinitilisation de la liste
else $('select[id="personnel"]').empty();

//Fin pour la vue de consultation

let link_url_rowsprs =
    "/" +
    appNameprs +
    "/interface/tpl/" +
    appNameprs +
    "/TMS/requestAjax/rowstimesheet.php";

$(".btn_recherche").on("click", function() {
    var r_datepick = $(".getmydate").val();
    var depart = $("#depart").val();
    var personnel = $("#personnel").val();

    //console.log(r_datepick+" "+depart+" "+personnel);

    $.ajax({
        url: link_url_rowsprs,
        type: "GET",
        data: {
            dateclick: r_datepick,
            userinfo: personnel,
            departement: depart,
        },
        success: function(resps) {
            //$(".test").reload(" .test");

            $(".tableL").html(resps);
            $(".dureetotale").val($(".aj_duree").val());
            $(".tauxjournaliere").val($(".aj_journaliere").val());

            $(".btn_delete").hide();
            $(".btn_ferme").hide();
            $(".btn_reg").hide();
            $(".button_plus").hide();
        },
        error: function(err) {
            console.log(err);
        },
    });
});