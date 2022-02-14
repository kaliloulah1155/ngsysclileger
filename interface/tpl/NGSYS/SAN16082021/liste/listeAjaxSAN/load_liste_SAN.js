let appli = $('.appli').val();

let link_url =
    "/" +
    appli +
    "/interface/tpl/" +
    appli +
    "/SAN/liste/listeAjaxSAN/liste_san.php";

function ajaxListeSAN() {

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

//Debut chargement Liste pour le personnel connecté (employé)
ajaxListeSAN()
    //Fin chargement Liste pour le personnel connecté (employé)