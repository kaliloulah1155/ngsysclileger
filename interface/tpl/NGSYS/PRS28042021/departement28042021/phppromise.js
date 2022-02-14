let appName = $(".appName").val();

let link_url1 =
    "/" +
    appName +
    "/interface/tpl/" +
    appName +
    "/PRS/departement/depart_actions.php";
let link_url2 =
    "/" +
    appName +
    "/interface/tpl/" +
    appName +
    "/PRS/departement/service_actions.php";

//Debut phase 1-Traitement des departements
ajaxDepartement()
    .then((results) => {
        for (let i = 0; i < results.length; i++) {
            $("#depart").append(
                "<option value='" + results[i][0] + "'>" + results[i][0] + "</option>"
            );
        }
    })
    .catch((err) => console.log(err));

function ajaxDepartement() {
    return new Promise((resolve, reject) => {
        $.ajax({
            url: link_url1,
            type: "POST",
            dataType: "json",
            // data: {
            //     key: "value",
            // },
            success: function(data) {
                resolve(data);
            },
            error: function(error) {
                reject(error);
            },
        });
    });
}
//Fin phase 1-Traitement des departements

//Debut phase 2-Traitement des services
$("#depart").on("change", function() {
    let depart = $(this).val();

    if (depart != "") {
        // console.log(depart);

        //Réinitilisation de la liste
        $('select[id="service"]').empty();
        //appel de la fonction promesse :traitement service

        ajaxService(depart)
            .then((results) => {
                for (let i = 0; i < results.length; i++) {
                    $("#service").append(
                        "<option value='" +
                        results[i][0] +
                        "'>" +
                        results[i][0] +
                        "</option>"
                    );
                }
            })
            .catch((err) => console.log(err));
    }
    //Réinitilisation de la liste
    else $('select[id="service"]').empty();
});

function ajaxService(depart) {
    return new Promise((resolve, reject) => {
        $.ajax({
            url: link_url2,
            type: "POST",
            dataType: "json",
            data: {
                departement: depart,
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

//Fin phase 2-Traitement des services

//Debut pour la vue de consultation on charge la liste des services au chargement de la page

let selectDepartement = $(".departement").val();

if (selectDepartement != "") {
    // console.log(depart);

    //Réinitilisation de la liste
    $('select[id="service"]').empty();
    //appel de la fonction promesse :traitement service

    ajaxService(selectDepartement)
        .then((results) => {
            for (let i = 0; i < results.length; i++) {
                $("#service").append(
                    "<option value='" + results[i][0] + "'>" + results[i][0] + "</option>"
                );
            }
        })
        .catch((err) => console.log(err));
}
//Réinitilisation de la liste
else $('select[id="service"]').empty();

//Fin pour la vue de consultation