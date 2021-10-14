let appli = $('.appli').val();
let user_email = $('.user_email').val();
let profil = $('.profil').val();

let link_url =
    "/" +
    appli +
    "/interface/tpl/" +
    appli +
    "/TMS/liste/listeAjax/load_liste_TMS.php";



var link_urlpdf =
    "/" +
    appli +
    "/interface/tpl/" +
    appli +
    "/TMS/liste/pdf/tms_pdf.php";



var profil_util = profil.substring(0, 7);


var fonction = "ANALYSTE PROGRAMMEUR";

//a revoir le traitement
var departement = "TECHNIQUE INFORMATIQUE";
// var service="RECHERCHE INFORMATIQUE";





//console.log(appli,user_email,profil);



function ajaxListeTMS(user_email, profil_util, departement) {
    // var dateclick = $(".datechck").val();
    ///alert(dateclick + " / " + userinfo + " " + link_url_rows);
    $.ajax({
        url: link_url,
        type: "GET",
        data: {
            user_email: user_email,
            profil_util: profil_util,
            departement: departement
        },
        success: function(response) {

            var responseNew = JSON.parse(response);

            var j = 1;
            var t = $('.table').DataTable();
            t.clear();

            for (let i = 0; i < responseNew.length; i++) {


                var date_tms = new Date(responseNew[i][3]);
                var d = date_tms.getDate();
                var m = (date_tms.getMonth() + 1);
                d1 = d > 9 ? d : '0' + d;
                m1 = m > 9 ? m : '0' + m;
                var dateTMS = d1 + '/' + m1 + '/' + date_tms.getFullYear();
                t.row.add([
                    j++,
                    responseNew[i][0],
                    responseNew[i][1],
                    fonction,
                    responseNew[i][2],
                    dateTMS,
                    "<div class='icon_btn'>" +
                    "<button class='rounded modifier' data-num=" + responseNew[i][4] + " >" +
                    "<i class='fa fa-eye'></i>" +
                    "</button>" +
                    "<a href='" + link_urlpdf + "?numposeidon=" + responseNew[i][4] + "&dtenreg=" + responseNew[i][3] + "&usrmail=" + responseNew[i][5] + " ' target='_blank'  class='rounded print_btn'     >" +
                    "<i class='fa fa-print'></i>" +
                    "</a>" +
                    "<button class='rounded supprimer' data-numsup=" + responseNew[i][4] + " data-usremail=" + user_email + " data-regdate=" + responseNew[i][3] + "   >" +
                    "<i class='fa fa-archive'></i>" +
                    "</button>" +
                    "</div>"
                ]);

            }




            t.draw();

        },
        error: function(err) {
            console.log(err);
        },
    });
}

//Debut chargement Liste pour le personnel connecté (employé)
ajaxListeTMS(user_email, profil_util, departement);
//Fin chargement Liste pour le personnel connecté (employé)