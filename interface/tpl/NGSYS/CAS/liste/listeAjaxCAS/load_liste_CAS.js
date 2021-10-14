let appli = $('.appli').val();

let link_url =
    "/" +
    appli +
    "/interface/tpl/" +
    appli +
    "/CAS/liste/listeAjaxCAS/liste_cas.php";


function ajaxListeCAS() {
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

//Debut chargement Liste pour le personnel connecté (employé)
ajaxListeCAS()
    //Fin chargement Liste pour le personnel connecté (employé)