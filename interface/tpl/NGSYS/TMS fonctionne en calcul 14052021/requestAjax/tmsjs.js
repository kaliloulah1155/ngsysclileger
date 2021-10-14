let appName = $(".appName").val();

let link_url =
    "/" +
    appName +
    "/interface/tpl/" +
    appName +
    "/TMS/requestAjax/timesheet.php";

var userinfo = $(".userinfo").val();   // a modifier par recherche;
var nom = $(".nom").val();
var prenom = $(".prenom").val();
var fonction = $(".fonction").val();
var departement = $(".departement").val(); // a modifier par recherche;

$(".viewnom").val(nom);
$(".viewprenom").val(prenom);
$(".viewfonction").val(fonction);
$(".viewdepartement").val(departement);
//fin données de l'utilisateur connecté



//Debut bouton enregistrer
$(".btn_reg").on("click", function(e) {
    var datechck = $(".datechck").val();
    var dureetotale = $(".dureetotale").val();
    var tauxjournaliere = $(".tauxjournaliere").val();

    var activites = $("input[name='activite[]']")
        .map(function() {
            return $(this).val();
        })
        .get();

    var taches = $("textarea[name='tache[]']")
        .map(function() {
            return $(this).val();
        })
        .get();

    var heureins = $("input[name='heurein[]']")
        .map(function() {
            return $(this).val();
        })
        .get();

    var heureouts = $("input[name='heureout[]']")
        .map(function() {
            return $(this).val();
        })
        .get();

    var durees = $("input[name='duree[]']")
        .map(function() {
            return $(this).val();
        })
        .get();

    var taux = $("select[name='taux[]']")
        .map(function() {
            return $(this).val();
        })
        .get();
    var resultats = $("input[name='resultat[]']")
        .map(function() {
            return $(this).val();
        })
        .get();

    ajaxResponse(
            activites,
            taches,
            heureins,
            heureouts,
            durees,
            taux,
            resultats,
            datechck,
            userinfo,
            nom,
            prenom,
            fonction,
            departement,
            dureetotale,
            tauxjournaliere
        )
        .then((results) => {
            $(".res").html(results);

             $(".res")
                .delay(3000)
                .fadeIn("normal", function() {
                    $(this).delay(2500).fadeOut();
                }); 

            activites.clear();
            taches.clear();
            heureins.clear();
            heureouts.clear();
            durees.clear();
            taux.clear();
            resultats.clear();
        })
        .catch((err) => console.log(err));

    //register form
    //$(".cform").submit();
    e.preventDefault();
});

//Fin bouton enregistrer

function ajaxResponse(
    activites,
    taches,
    heureins,
    heureouts,
    durees,
    taux,
    resultats,
    datechck,
    userinfo,
    nom,
    prenom,
    fonction,
    departement,
    dureetotale,
    tauxjournaliere
) {
    return new Promise((resolve, reject) => {
        $.ajax({
            url: link_url,
            type: "GET",
            data: {
                activites: activites,
                taches: taches,
                heureins: heureins,
                heureouts: heureouts,
                durees: durees,
                taux: taux,
                resultats: resultats,
                datechck: datechck,
                userinfo: userinfo,
                nom: nom,
                prenom: prenom,
                fonction: fonction,
                departement: departement,
                dureetotale: dureetotale,
                tauxjournaliere: tauxjournaliere,
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

/// TRAITEMENT DES DONNEES TABLEAUX

let link_url_rows =
    "/" +
    appName +
    "/interface/tpl/" +
    appName +
    "/TMS/requestAjax/rowstimesheet.php";

$("input[type=hidden]").bind("change", function() {
    alert($(this).val());
});


function testdatecheck() {
    var dateclick = $(".datechck").val();
    ///alert(dateclick + " / " + userinfo + " " + link_url_rows);
    $.ajax({
        url: link_url_rows,
        type: "GET",
        data: {
            dateclick: dateclick,
            userinfo: userinfo,
            departement:departement,
        },
        success: function(resps) {
            //$(".test").reload(" .test");

            $(".tableL").html(resps);
            $(".dureetotale").val($(".aj_duree").val());
            $(".tauxjournaliere").val($(".aj_journaliere").val());
            // console.log($(".aj_duree").val());

            //$(".tableL").append(resps);
            //console.log(resps);
        },
        error: function(err) {
            console.log(err);
        },
    });
}


//Debut du traitement rechercher


//Fin du traitement rechercher