let appN = $('.appName').val();
let loadcode = $('.loadcode').val();

let linkadd =
    "/" +
    appN +
    "/interface/tpl/" +
    appN +
    "/HSU/register/add.php";

$(document).on('click', '.btn_enreg', function(e) {

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


    //console.log(loadcode, date_crea, hdeb, hfin, nbrehreal, motif, montant, ferie);


    ajaxRegisterHSU(
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


    // e.preventDefault();

});



function ajaxRegisterHSU(
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
            url: linkadd,
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