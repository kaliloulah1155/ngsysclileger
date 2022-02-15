let appli = $('.appli').val();

let link_url =
    "/" +
    appli +
    "/interface/tpl/" +
    appli +
    "/PRS/liste/listeAjaxPRS/liste_prs.php";


let link_urlpdf =
    "/" +
    appli +
    "/interface/tpl/" +
    appli +
    "/PRS/prspdf/prspdf_actions.php";







function ajaxListePRS() {
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
                        responseNew[i][4],
                        responseNew[i][5],
                        "<a href='javascript:void(0)' class='modifier' data-num=" + responseNew[i][6] + " style='padding: 3px;border: 1px solid black;cursor: pointer;'><i class='fa fa-eye'></i></a>" +
                        "<a href='" + link_urlpdf + "?numposeidon=" + responseNew[i][6] + " ' target='_blank'  class='rounded print_btn'   style='padding: 3px;border: 1px solid black;cursor: pointer;'><i class='fa fa-print'></i></a>" +
                        "<a href='javascript:void(0)' class='supprimer' data-numsup=" + responseNew[i][6] + " style='padding: 3px;border: 1px solid black;cursor: pointer;'><i class='fa fa-archive'></i></a>"
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
ajaxListePRS()
    //Fin chargement Liste pour le personnel connecté (employé)