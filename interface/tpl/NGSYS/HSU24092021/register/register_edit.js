let appN = $('.appName').val();
let loadcode = $('.loadcode').val();



//LOAD ROWS  HSU
let link_url_rows =
    "/" +
    appN +
    "/interface/tpl/" +
    appN +
    "/HSU/register/rowshsu.php";


function load_rows_hsu() {

    $.ajax({
        url: link_url_rows,
        type: "POST",
        data: {
            loadcode: loadcode
        },
        success: function(resps) {

            $(".tableL").html(resps);
            // console.log(resps);
        },
        error: function(err) {
            console.log(err);
        },
    });
}

load_rows_hsu();

//FIN LOAD ROWS  HSU

//UPDATE ROWS DATA HSU

let linkedit =
    "/" +
    appN +
    "/interface/tpl/" +
    appN +
    "/HSU/register/edit.php";

$(document).on('click', '.bouton_sub', function(e) {

    var val_modif = $('.action_hermes').val();
    var action_modif = val_modif.slice(0, 10);
    if (action_modif == 'AA_MOD_HSU') {

        //recuperation des informations

        var loadcode = $(".loadcode")
            .map(function() {
                return $(this).val();
            })
            .get();

        var date_crea = $("input[name='date[]']")
            .map(function() {
                return $(this).val();
            })
            .get();
        var hdeb = $("input[name='heurein[]']")
            .map(function() {
                return $(this).val();
            })
            .get();
        var hfin = $("input[name='heureout[]']")
            .map(function() {
                return $(this).val();
            })
            .get();
        var nbrehreal = $("input[name='duree[]']")
            .map(function() {
                return $(this).val();
            })
            .get();
        var motif = $("textarea[name='tache[]']")
            .map(function() {
                return $(this).val();
            })
            .get();
        var montant = $("input[name='montant[]']")
            .map(function() {
                return $(this).val();
            })
            .get();

        var ferie = $("table.test input:checkbox").map(function() {
            return this.checked;
        }).toArray();


        //  console.log(loadcode, date_crea, hdeb, hfin, nbrehreal, motif, montant, ferie);
        ajaxEditHSU(
                loadcode,
                date_crea,
                hdeb,
                hfin,
                nbrehreal,
                motif,
                montant,
                ferie
            )
            .then((results) => {
                console.log(results);
                // $(".resul").html(results);
            })
            .catch((err) => console.log(err));

    }

    // e.preventDefault();

});



function ajaxEditHSU(
    loadcode,
    date_crea,
    hdeb,
    hfin,
    nbrehreal,
    motif,
    montant,
    ferie
) {
    return new Promise((resolve, reject) => {
        $.ajax({
            url: linkedit,
            type: "POST",
            data: {
                loadcode: loadcode,
                date_crea: date_crea,
                hdeb: hdeb,
                hfin: hfin,
                nbrehreal: nbrehreal,
                motif: motif,
                montant: montant,
                ferie: ferie
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

//FIN UPDATE ROWS DATA HSU