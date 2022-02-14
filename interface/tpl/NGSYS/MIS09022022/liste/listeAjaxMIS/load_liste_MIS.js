let appli = $('.appli').val();

let link_url =
    "/" +
    appli +
    "/interface/tpl/" +
    appli +
    "/MIS/liste/listeAjaxMIS/liste_mis.php";


let link_urlpdf =
    "/" +
    appli +
    "/interface/tpl/" +
    appli +
    "/MIS/mispdf/missionpdf_actions.php";







function ajaxListeMIS() {
    // var dateclick = $(".datechck").val();
    ///alert(dateclick + " / " + userinfo + " " + link_url_rows);
    $.ajax({
        url: link_url,
        type: "POST",
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
                        "<a href='javascript:void(0)' title='Consulter le document' class='modifier' data-num=" + responseNew[i][4] + " style='padding: 3px;margin: 5px;border: 1px solid black;cursor: pointer;'><i class='fa fa-eye'></i></a>" +
                        "<a href='" + link_urlpdf + "?numposeidon=" + responseNew[i][4] + " ' target='_blank'  class='print_btn' style='padding: 3px;margin: 5px;border: 1px solid black;cursor: pointer;'><i class='fa fa-print'></i></a>" +
                        "<a href='javascript:void(0)' class='supprimer' data-numsup=" + responseNew[i][4] + " style='padding: 3px;margin: 5px;border: 1px solid black;cursor: pointer;'><i class='fa fa-archive'></i></a>"
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
ajaxListeMIS()
    //Fin chargement Liste pour le personnel connecté (employé)