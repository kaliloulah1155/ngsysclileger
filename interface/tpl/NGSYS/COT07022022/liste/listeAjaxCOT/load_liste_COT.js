let appli = $('.appli').val();
let user_email = $('.user_email').val();
let profil = $('.profil').val();

let link_url =
    "/" +
    appli +
    "/interface/tpl/" +
    appli +
    "/COT/liste/listeAjaxCOT/liste_cot.php";


/*
let link_urlpdf =
    "/" +
    appli +
    "/interface/tpl/" +
    appli +
    "/PRS/prspdf/prspdf_actions.php"; */


let link_urlcddprojet =
    "/" +
    appli +
    "/interface/tpl/" +
    appli +
    "/COT/traitementjs/cddprojet.php";

let link_urlcddsimple =
    "/" +
    appli +
    "/interface/tpl/" +
    appli +
    "/COT/traitementjs/cddsimple.php";

let link_urlcddessai =
    "/" +
    appli +
    "/interface/tpl/" +
    appli +
    "/COT/traitementjs/cddessai.php";

let link_urlcdiessai =
    "/" +
    appli +
    "/interface/tpl/" +
    appli +
    "/COT/traitementjs/cdiessai.php";
let link_urlcdisimple =
    "/" +
    appli +
    "/interface/tpl/" +
    appli +
    "/COT/traitementjs/cdisimple.php";

let link_urlconsultant =
    "/" +
    appli +
    "/interface/tpl/" +
    appli +
    "/COT/traitementjs/consultant.php";

let link_urlconsultantint =
    "/" +
    appli +
    "/interface/tpl/" +
    appli +
    "/COT/traitementjs/consultantint.php";

let link_urlstageecole =
    "/" +
    appli +
    "/interface/tpl/" +
    appli +
    "/COT/traitementjs/stageecole.php";

let link_urlstagequalification =
    "/" +
    appli +
    "/interface/tpl/" +
    appli +
    "/COT/traitementjs/stagequalification.php";

var email = ($('.user_email').val()).toUpperCase();


function ajaxListeCOT() {

    $.ajax({
        url: link_url,
        type: "POST",
        data: {
            user_email: user_email,
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

//Debut chargement Liste pour le personnel connecté (employé)
ajaxListeCOT()
    //Fin chargement Liste pour le personnel connecté (employé)