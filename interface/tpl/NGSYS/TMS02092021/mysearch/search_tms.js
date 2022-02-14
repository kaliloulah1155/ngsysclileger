let appli_s = $('.appli').val();
let user_email_s = $('.user_email').val();
let profil_s = $('.profil').val();


//critere de recherche
let date_search;
let personnel;
let service_s;
let departement_s;

let link_url_s =
    "/" +
    appli_s +
    "/interface/tpl/" +
    appli_s +
    "/TMS/mysearch/search_tms.php";

/*          
$(document).on('input','.date_search',function(){
	 date_search=$(this).val();
});

$(document).on('input','.personnel',function(){
	 personnel=$(this).val();
});

$(document).on('input','.service',function(){
	 service_s=$(this).val();
});

$(document).on('input','.departement',function(){
	 departement_s=$(this).val();
});
*/
$(document).on('click', '.btn_search', function(e) {

    departement_s = '';
    service_s = '';
    personnel = '';
    date_search = '';

    departement_s = $('.selectDeps').val();
    service_s = $('.selectServs').val();
    personnel = $('.personnel').val();
    date_search = $('.date_search').val();


    // console.log(departement_s,service_s,personnel,date_search);

    ajaxSearchTMS(user_email_s, date_search, personnel, service_s, departement_s);

    e.preventDefault();
});


function ajaxSearchTMS(user_email_s, date_search, personnel, service_s, departement_s) {
    // var dateclick = $(".datechck").val();
    ///alert(dateclick + " / " + userinfo + " " + link_url_rows);
    $.ajax({
        url: link_url_s,
        type: "GET",
        data: {
            user_email_s: user_email_s,
            date_search: date_search,
            nom_pre: personnel,
            service_s: service_s,
            departement_s: departement_s,
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
                    "<a href='" + link_urlpdf + "?numposeidon=" + responseNew[i][4] + "&dtenreg=" + responseNew[i][3] + "&usrmail=" + user_email + " ' target='_blank'  class='rounded print_btn'     >" +
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

//Fin chargement Liste pour le personnel connecté (employé)