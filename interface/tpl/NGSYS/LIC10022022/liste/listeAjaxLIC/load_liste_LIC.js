let appli = $('.appli').val();

let link_url =
    "/" +
    appli +
    "/interface/tpl/" +
    appli +
    "/LIC/liste/listeAjaxLIC/liste_lic.php";

//-------number format 
Number.prototype.formatMoney = function(decPlaces, thouSeparator, decSeparator) {
    var n = this,
        decPlaces = isNaN(decPlaces = Math.abs(decPlaces)) ? 2 : decPlaces,
        decSeparator = decSeparator == undefined ? "." : decSeparator,
        thouSeparator = thouSeparator == undefined ? "." : thouSeparator,
        sign = n < 0 ? "_" : "",
        i = parseInt(n = Math.abs(+n || 0).toFixed(decPlaces)) + "",
        j = (j = i.length) > 3 ? j % 3 : 0;

    return sign + (j ? i.substr(0, j) + thouSeparator : "") +
        i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + thouSeparator) +
        (decPlaces ? decSeparator + Math.abs(n - i).toFixed(decPlaces).slice(2) : "");
};
//------ fin number format



function ajaxListeLIC() {
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
                        (parseInt(responseNew[i][3])).formatMoney(0, '.', ',') + " FCFA",
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
ajaxListeLIC()
    //Fin chargement Liste pour le personnel connecté (employé)