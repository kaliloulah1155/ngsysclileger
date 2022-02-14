let appN = $(".appName").val();


//DEBUT SCRIPT DE CONVERSION DES MONTANTS EN LETTRE

function ConvNumberLetter(Nombre) {
    var dblEnt, byDec;
    var bNegatif;
    var strCentimes = new String();


    if (Nombre < 0) {
        bNegatif = true;
        Nombre = Math.abs(Nombre);
    }
    dblEnt = parseInt(Nombre);
    byDec = parseInt((Nombre - dblEnt) * 100);

    if (byDec == 0) {
        if (dblEnt > 999999999999999) {
            return "#TropGrand";
        }
    } else {
        if (dblEnt > 9999999999999.99) {
            return "#TropGrand";
        }
    }

    if (Nombre == $('.montant_net').val()) {
        $('.montant_letter').val(ConvNumEnt(dblEnt));
    }

    if (Nombre == $('.ecole_duree').val()) {
        $('.mois_lettre').val(ConvNumEnt(dblEnt));
    }

    if (Nombre == $('.duree_essai').val()) {
        $('.mois_lettre_essai').val(ConvNumEnt(dblEnt));
    }

    if (Nombre == $('.horaire').val()) {
        $('.horaire_lettre').val(ConvNumEnt(dblEnt));
    }

    if (Nombre == $('.nbrejrs').val()) {
        $('.nbrejrs_lettre').val(ConvNumEnt(dblEnt));
    }


}

function ConvNumEnt(Nombre) {
    var byNum, iTmp, dblReste;
    var StrTmp = new String();
    var NumEnt;
    iTmp = Nombre - (parseInt(Nombre / 1000) * 1000);
    NumEnt = ConvNumCent(parseInt(iTmp));
    dblReste = parseInt(Nombre / 1000);
    iTmp = dblReste - (parseInt(dblReste / 1000) * 1000);
    StrTmp = ConvNumCent(parseInt(iTmp));
    switch (iTmp) {
        case 0:
            break;
        case 1:
            StrTmp = "mille ";
            break;
        default:
            StrTmp = StrTmp + " mille ";
    }
    NumEnt = StrTmp + NumEnt;

    dblReste = parseInt(dblReste / 1000);
    iTmp = dblReste - (parseInt(dblReste / 1000) * 1000);
    StrTmp = ConvNumCent(parseInt(iTmp));
    switch (iTmp) {
        case 0:
            break;
        case 1:
            StrTmp = StrTmp + " million ";
            break;
        default:
            StrTmp = StrTmp + " millions ";
    }
    NumEnt = StrTmp + NumEnt;
    dblReste = parseInt(dblReste / 1000);
    iTmp = dblReste - (parseInt(dblReste / 1000) * 1000);
    StrTmp = ConvNumCent(parseInt(iTmp));
    switch (iTmp) {
        case 0:
            break;
        case 1:
            StrTmp = StrTmp + " milliard ";
            break;
        default:
            StrTmp = StrTmp + " milliards ";
    }
    NumEnt = StrTmp + NumEnt;
    dblReste = parseInt(dblReste / 1000);
    iTmp = dblReste - (parseInt(dblReste / 1000) * 1000);
    StrTmp = ConvNumCent(parseInt(iTmp));
    switch (iTmp) {
        case 0:
            break;
        case 1:
            StrTmp = StrTmp + " billion ";
            break;
        default:
            StrTmp = StrTmp + " billions ";
    }
    NumEnt = StrTmp + NumEnt;

    return NumEnt;
}

function ConvNumDizaine(Nombre) {
    var TabUnit, TabDiz;
    var byUnit, byDiz;
    var strLiaison = new String();

    TabUnit = Array("", "un", "deux", "trois", "quatre", "cinq", "six", "sept",
        "huit", "neuf", "dix", "onze", "douze", "treize", "quatorze", "quinze",
        "seize", "dix sept", "dix huit", "dix neuf");
    TabDiz = Array("", "", "vingt", "trente", "quarante", "cinquante",
        "soixante", "soixante", "quatre vingt", "quatre vingt");

    byDiz = parseInt(Nombre / 10);
    byUnit = Nombre - (byDiz * 10);
    strLiaison = " ";
    if (byUnit == 1) strLiaison = " et ";
    switch (byDiz) {
        case 0:
            strLiaison = "";
            break;
        case 1:
            byUnit = byUnit + 10;
            strLiaison = "";
            break;
        case 7:
            byUnit = byUnit + 10;
            break;
        case 8:
            strLiaison = " ";
            break;
        case 9:
            byUnit = byUnit + 10;
            strLiaison = " ";
            break;
    }
    var NumDizaine = TabDiz[byDiz];
    if (byDiz == 8 && byUnit == 0) NumDizaine = NumDizaine + "s";
    if (TabUnit[byUnit] != "") {
        NumDizaine = NumDizaine + strLiaison + TabUnit[byUnit];
    } else {
        NumDizaine = NumDizaine;
    }
    return NumDizaine;
}

function ConvNumCent(Nombre) {
    var TabUnit;
    var byCent, byReste;
    var strReste = new String();
    var NumCent;
    TabUnit = Array("", "un", "deux", "trois", "quatre", "cinq", "six", "sept", "huit", "neuf", "dix");

    byCent = parseInt(Nombre / 100);
    byReste = Nombre - (byCent * 100);
    strReste = ConvNumDizaine(byReste)
    switch (byCent) {
        case 0:
            NumCent = strReste;
            break;
        case 1:
            if (byReste == 0)
                NumCent = "cent";
            else
                NumCent = "cent " + strReste;
            break;
        default:
            if (byReste == 0)
                NumCent = TabUnit[byCent] + " cents";
            else
                NumCent = TabUnit[byCent] + " cent " + strReste;
    }
    return NumCent;
}


$(document).on('change', '.montant_net', function() {
    ConvNumberLetter($(this).val());
});



//FIN SCRIPT DE CONVERSION DES MONTANTS EN LETTRE

function timeConverter(UNIX_timestamp) {
    var a = new Date(UNIX_timestamp * 1000);
    var months = ['Janvier', 'Fevrier', 'Mars', 'Avril', 'Mai', 'Juin', 'Juillet', 'A\u00f4ut', 'Septembre', 'Octobre', 'Novembre', 'D\u00e9cembre'];
    var year = a.getFullYear();
    //var month = months[a.getMonth()];
    var month = a.getMonth();
    var date = a.getDate();
    var hour = a.getHours();
    var min = a.getMinutes();
    var sec = a.getSeconds();
    var weekday = ['Dimanche', 'Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi'];
    //var dayGetName=weekday[a.getDay()];
    var dayGetName = a.getDay();
    hour1 = hour > 9 ? hour : '0' + hour;
    min1 = min > 9 ? min : '0' + min;
    sec1 = sec > 9 ? sec : '0' + sec;
    //var time = dayGetName + ' ' +date + ' ' + month + ' ' + year + ' \u00E0 ' + hour1 + ':' + min1 + ':' + sec1 ;


    d1 = date > 9 ? date : '0' + date;
    m1 = month > 9 ? month : '0' + month;



    var time = d1 + '/' + m1 + '/' + year;
    return time;
}

function addMonths(date, months) {
    var d = date.getDate();
    date.setMonth(date.getMonth() + +months);
    if (date.getDate() != d) {
        date.setDate(0);
    }
    return date;
}




////LOAD PERSONNNEL
let link1 =
    "/" +
    appN +
    "/interface/tpl/" +
    appN +
    "/COT/personnel/personnel_load.php";

let link2 =
    "/" +
    appN +
    "/interface/tpl/" +
    appN +
    "/COT/personnel/personnel_data.php";


var init_email = $('#POS_VAL_CTRL_MEL').val();

$(document).ready(function() {
    $.ajax({
        url: link1,
        type: "GET",
        data: {
            init_email: init_email
        },
        success: function(data) {

            $('.personnel').append(data);
        },
        error: function(error) {
            console.log(error);
        },
    });

    /* $('.select2').select2({
        placeholder:'Selectionnez un interimaire',
       // theme:'bootstrap',
        tags:true,
         allowClear: true,
      });  */

});


$(document).on('change', '.personnel', function() {

    //alert($(this).val());

    $.ajax({
        url: link2,
        type: "GET",
        data: {
            email: $(this).val()
        },
        success: function(response) {

            var responseNew = JSON.parse(response);

            $('.nom_pers').val(responseNew[0][0]);
            $('.prenoms_pers').val(responseNew[0][1]);
            $('.matricule_pers').val(responseNew[0][2]);
            $('.dateEnreg_pers').val(responseNew[0][3]);
            $('.civilite_pers').val(responseNew[0][4]);

            $('.fonct').val(responseNew[1]);

            $('.fonction').val(responseNew[1]);
        },
        error: function(error) {
            console.log(error);
        }
    });
});

///FIN

// CHARGEMENT DES FONCTIONS
let linkfonction =
    "/" +
    appN +
    "/interface/tpl/" +
    appN +
    "/COT/specifique/stage_ecole/fonction.php";
var rq_mail = $('.interselectperso').val();

function load_fonction() {

    $.ajax({
        url: linkfonction,
        type: "GET",
        data: {
            rq_mail: rq_mail
        },
        success: function(data) {


            $(".fonction").append(
                "<option value=''>Veuillez s&#233;lectionner</option>"
            );
            $('.fonction').append(data);
        },
        error: function(error) {
            console.log(error);
        },
    });
}



// CHARGEMENT DES DIPLOMES
let linkdiplome =
    "/" +
    appN +
    "/interface/tpl/" +
    appN +
    "/COT/specifique/stage_ecole/diplome.php";


function load_diplome() {

    $.ajax({
        url: linkdiplome,
        type: "GET",
        success: function(data) {


            $(".diplome").append(
                "<option value='0'>Veuillez s&#233;lectionner</option>"
            );

            $('.diplome').append(data);


        },
        error: function(error) {
            console.log(error);
        },
    });
}

//INSERTION LORSQUE C'EST UN NOUVEAU DIPLOME
let linkdiplomeInsert =
    "/" +
    appN +
    "/interface/tpl/" +
    appN +
    "/COT/specifique/stage_ecole/diplome_insert.php";



$(document).on('change', '.diplome', function() {

    //alert($(this).val());

    $.ajax({
        url: linkdiplomeInsert,
        type: "GET",
        data: {
            diplome: $(this).val()
        },
        success: function(response) {


            if (response == 1) {

                $(".diplome").empty();
                load_diplome();
            }


        },
        error: function(error) {
            console.log(error);
        }
    });


});

//CHARGEMENT DES FILIERES
let linkfiliere =
    "/" +
    appN +
    "/interface/tpl/" +
    appN +
    "/COT/specifique/stage_ecole/filiere.php";


function load_filiere() {
    $.ajax({
        url: linkfiliere,
        type: "GET",
        success: function(data) {


            $(".filiere").append(
                "<option value='0'>Veuillez s&#233;lectionner</option>"
            );

            $('.filiere').append(data);


        },
        error: function(error) {
            console.log(error);
        },
    });
}

//INSERTION LORSQUE C'EST UN NOUVELLE FILIERE
let linkdfiliereInsert =
    "/" +
    appN +
    "/interface/tpl/" +
    appN +
    "/COT/specifique/stage_ecole/filiere_insert.php";

$(document).on('change', '.filiere', function() {

    //alert($(this).val());
    $.ajax({
        url: linkdfiliereInsert,
        type: "GET",
        data: {
            filiere: $(this).val()
        },
        success: function(response) {
            if (response == 1) {

                $(".filiere").empty();
                load_filiere();
            }
        },
        error: function(error) {
            console.log(error);
        }
    });
});


//CHARGEMENT DES ENTREPRISES
let linkentreprise =
    "/" +
    appN +
    "/interface/tpl/" +
    appN +
    "/COT/specifique/stage_ecole/entreprise.php";


function load_entreprise() {
    $.ajax({
        url: linkentreprise,
        type: "GET",
        success: function(data) {


            $(".entreprise").append(
                "<option value='0'>Veuillez s&#233;lectionner</option>"
            );

            $('.entreprise').append(data);


        },
        error: function(error) {
            console.log(error);
        },
    });
}


//INSERTION LORSQUE C'EST UN NOUVELLE ENTREPRISE
let linkdentrepriseInsert =
    "/" +
    appN +
    "/interface/tpl/" +
    appN +
    "/COT/specifique/stage_ecole/entreprise_insert.php";

$(document).on('change', '.entreprise', function() {

    //alert($(this).val());
    $.ajax({
        url: linkdentrepriseInsert,
        type: "GET",
        data: {
            entreprise: $(this).val()
        },
        success: function(response) {
            if (response == 1) {

                $(".entreprise").empty();
                load_entreprise();
            }
        },
        error: function(error) {
            console.log(error);
        }
    });
});


//CHARGEMENT DES LEVEL
let linklevel =
    "/" +
    appN +
    "/interface/tpl/" +
    appN +
    "/COT/specifique/stage_ecole/level.php";


function load_level() {
    $.ajax({
        url: linklevel,
        type: "GET",
        success: function(data) {


            $(".level").append(
                "<option value='0'>Veuillez s&#233;lectionner</option>"
            );

            $('.level').append(data);


        },
        error: function(error) {
            console.log(error);
        },
    });
}

//INSERTION LEVEL
let linkdlevelInsert =
    "/" +
    appN +
    "/interface/tpl/" +
    appN +
    "/COT/specifique/stage_ecole/level_insert.php";

$(document).on('change', '.level', function() {

    //alert($(this).val());
    $.ajax({
        url: linkdlevelInsert,
        type: "GET",
        data: {
            level: $(this).val()
        },
        success: function(response) {
            if (response == 1) {

                $(".level").empty();
                load_level();
            }
        },
        error: function(error) {
            console.log(error);
        }
    });
});


$(document).on('change', '.horaire', function() {
    if ($('.horaire').val() != '') {

        ConvNumberLetter($('.horaire').val());
    }
});

$(document).on('change', '.nbrejrs', function() {
    if ($('.nbrejrs').val() != '') {

        ConvNumberLetter($('.nbrejrs').val());
    }
});

$(document).on('change', '.ecole_duree', function() {
    if ($('.ecole_duree').val() != '') {

        ConvNumberLetter($('.ecole_duree').val());
    }
});

//CALCUL DES DUREES DATE DE FIN
$(document).on('change', '.ecole_datedeb , .ecole_duree', function() {





    if ($('.ecole_datedeb').val() != '' && $('.ecole_duree').val() != '') {
        ConvNumberLetter($('.ecole_duree').val());

        dureemois = parseInt($('.ecole_duree').val());
        var datedeb_sp = ($('.ecole_datedeb').val()).split('/');

        var datedeb_sp_str = datedeb_sp[2] + '-' + datedeb_sp[1] + '-' + datedeb_sp[0];


        //console.log(datedeb_sp_str);

        var formattedDateStart = new Date(datedeb_sp_str); //date de debut
        var result_date_mois = addMonths(formattedDateStart, parseInt(dureemois) + 1); //calcul des durees en mois


        var d = result_date_mois.getDate();
        var m = result_date_mois.getMonth();
        m += 1; // JavaScript months are 0-11
        var y = result_date_mois.getFullYear();

        d1 = d > 9 ? d : '0' + d;
        m1 = m > 9 ? m : '0' + m;

        formatDeb = d1 + "/" + m1 + "/" + y;

        d1 = d > 9 ? d : '0' + d;
        m1 = m > 9 ? m : '0' + m;

        formatDeb = d1 + "/" + m1 + "/" + y;

        date1 = y + "-" + m1 + "-" + d1;

        //console.log(date1); //Date de fin contrat format: 2019-10-02

        timestpdeb = new Date(date1);
        tamp1 = parseInt(parseInt(timestpdeb.getTime()) / 1000);
        $('.ecole_datefin').val(timeConverter(tamp1));
    }

});


//CALCUL DES DUREES DATE DE FIN ESSAI
$(document).on('change', '.datedeb_essai , .duree_essai', function() {





    if ($('.datedeb_essai').val() != '' && $('.duree_essai').val() != '') {

        ConvNumberLetter($('.duree_essai').val());

        dureemois = parseInt($('.duree_essai').val());
        var datedeb_sp = ($('.datedeb_essai').val()).split('/');

        var datedeb_sp_str = datedeb_sp[2] + '-' + datedeb_sp[1] + '-' + datedeb_sp[0];


        //console.log(datedeb_sp_str);

        var formattedDateStart = new Date(datedeb_sp_str); //date de debut
        var result_date_mois = addMonths(formattedDateStart, parseInt(dureemois) + 1); //calcul des durees en mois


        var d = result_date_mois.getDate();
        var m = result_date_mois.getMonth();
        m += 1; // JavaScript months are 0-11
        var y = result_date_mois.getFullYear();

        d1 = d > 9 ? d : '0' + d;
        m1 = m > 9 ? m : '0' + m;

        formatDeb = d1 + "/" + m1 + "/" + y;

        d1 = d > 9 ? d : '0' + d;
        m1 = m > 9 ? m : '0' + m;

        formatDeb = d1 + "/" + m1 + "/" + y;

        date1 = y + "-" + m1 + "-" + d1;

        //console.log(date1); //Date de fin contrat format: 2019-10-02

        timestpdeb = new Date(date1);
        tamp1 = parseInt(parseInt(timestpdeb.getTime()) / 1000);
        $('.datefin_essai').val(timeConverter(tamp1));
    }

});



// CHARGEMENT DES DOMAINES
let linkdomaine =
    "/" +
    appN +
    "/interface/tpl/" +
    appN +
    "/COT/specifique/stage_pro/domaine.php";

function load_domaine() {
    $.ajax({
        url: linkdomaine,
        type: "GET",
        success: function(data) {
            $(".domaine").append(
                "<option value='0'>Veuillez s&#233;lectionner</option>"
            );
            $('.domaine').append(data);
        },
        error: function(error) {
            console.log(error);
        },
    });
}


//INSERTION LORSQUE C'EST UN NOUVEAU DOMAINE
let linkdomaineInsert =
    "/" +
    appN +
    "/interface/tpl/" +
    appN +
    "/COT/specifique/stage_pro/domaine_insert.php";



$(document).on('change', '.domaine', function() {

    $.ajax({
        url: linkdomaineInsert,
        type: "GET",
        data: {
            domaine: $(this).val()
        },
        success: function(response) {


            if (response == 1) {

                $(".domaine").empty();
                load_domaine();
            }


        },
        error: function(error) {
            console.log(error);
        }
    });


});


// CHARGEMENT DES CATEGORIES
let linkcategorie =
    "/" +
    appN +
    "/interface/tpl/" +
    appN +
    "/COT/specifique/cdd_essai/categorie.php";

function load_categorie() {
    $.ajax({
        url: linkcategorie,
        type: "GET",
        success: function(data) {
            $(".categorie").append(
                "<option value='0'>Veuillez s&#233;lectionner</option>"
            );
            $('.categorie').append(data);
        },
        error: function(error) {
            console.log(error);
        },
    });
}




load_filiere();
load_diplome();
load_entreprise();
load_level();
load_domaine();
load_categorie();

load_fonction();



//////////TREATMENT OF PRIME ////////////////////////



/***LOAD PRIME****/
let linkprime =
    "/" +
    appN +
    "/interface/tpl/" +
    appN +
    "/COT/specifique/prime/load_prime.php";

var init_prime = '';

function load_prime() {
    $.ajax({
        url: linkprime,
        type: "GET",
        data: {
            init_prime: init_prime
        },
        success: function(data) {
            $(".lib_prime").append(
                "<option value='0'>S&#233;lectionner le libell&#233; de la prime</option>"
            );
            $('.lib_prime').append(data);
        },
        error: function(error) {
            console.log(error);
        },
    });
}
load_prime();



/** insert prime libelle ***/

let linkprimeInsert =
    "/" +
    appN +
    "/interface/tpl/" +
    appN +
    "/COT/specifique/prime/insert_prime.php";



$(document).on('change', '.lib_prime', function() {
    //alert($(this).val());
    $.ajax({
        url: linkprimeInsert,
        type: "GET",
        data: {
            lib_prime: $(this).val()
        },
        success: function(response) {

            if (response == 1) {


                $(".lib_prime").empty();
                load_prime();
            }


        },
        error: function(error) {
            console.log(error);
        }
    });


});


/** Bouton ajouter une ligne  **/

let linkselectprime =
    "/" +
    appN +
    "/interface/tpl/" +
    appN +
    "/COT/specifique/prime/select_load_prime.php";

$(document).on('click', '#addRowEX', function(e) {
    //addRow();  

    $.ajax({
        url: linkselectprime,
        type: "GET",
        data: {
            init_prime: init_prime
        },
        success: function(data) {


            var $dataRows = $('.tableL');
            var tr = $dataRows.parent().parent();


            if (
                tr.find('.lib_prime:last').val() == "" ||
                tr.find('.montant_prime:last').val() == ""
            ) {
                $('#SuprimeLigs').hide();
                alert("Veuillez bien renseigner les informations");
            } else {
                addRow(data);
            }
        },
        error: function(error) {
            console.log(error);
        },
    });


    $("#SuprimeLigs").css("display", "block");


    e.preventDefault();
});

function addRow(data) {
    var newData = JSON.parse(data);
    var html = '';
    html += '<tr>';
    html += '<td style="width: 100px;border:none;">';
    html += '<select name="lib_prime[]"  class="form-control lib_prime" style="width: 100%;border: none;margin: 2px auto">';
    html += '<option value="0">S&#233;lectionner le libell&#233; de la prime</option>';
    var len = newData.length;
    for (var i = 0; i < len; i++) {
        html += '<option value="' + newData[i][0] + '">' + newData[i][0] + '</option>';
    }
    html += '</select>';

    html += '</td>' +
        '<td style="width: 5px;border:none;">' +
        '</td>' +
        '<td style="width: 100px;border:none;">' +
        '<input type="text" name="montant_prime[]" onkeypress="return testNum(event, this, 2);" min="0"  placeholder="Montant de la prime" style="width: 100%;border: none;margin: 2px auto" class="form-control montant_prime">' +
        '</td>' +
        '</tr>';

    $('.tableL').append(html);

    // Show all options
    $("option").prop("disabled", false);

    // Get an array of all current selections
    var selected = [];
    $(".lib_prime").each(function() {
        selected.push($(this).val());
    });

    // Remove all selected options, except the current showing one, from all lists
    $(".lib_prime").each(function() {
        for (var i = 0; i < selected.length; i++) {
            if (selected[i] != $(this).val()) {
                $(this).find("option[value='" + selected[i] + "']").prop("disabled", true);

                //$(this).find("option[value='" + selected[i] + "']").remove();
            }
        }
    });
    //// 
}


//////////////////// END PRIME //////////////////////

/// activation et existance d'un contrat

if ($('.exist_contrat').val() == 0) {
    $('.status_activ_cot').val("1"); //active
} else {
    $('.status_activ_cot').val("0"); //desactive
}

////// BOUTON ENREGISTRER PRIME ////////////////////////

$(document).on('click', '.btn_enreg', function(e) {

    var type_contrat = $('.type_contrat').val(); //typ_cot
    var status_activ_cot = $('.status_activ_cot').val(); // activation du contrat
    var personnel = ($('.personnel').val()).toUpperCase(); //email 
    var exist_contrat = $('.exist_contrat').val();

    var lib_prime = $("select[name='lib_prime[]']")
        .map(function() {
            return $(this).val();
        })
        .get(); //prime libelle

    var montant_prime = $("input[name='montant_prime[]']")
        .map(function() {
            return $(this).val();
        })
        .get();
    registerPrimeCot(lib_prime, montant_prime, type_contrat, status_activ_cot, personnel, exist_contrat);

    //e.preventDefault();
});


function registerPrimeCot(lib_prime, montant_prime, type_contrat, status_activ_cot, personnel, exist_contrat) {

    var link_url_cot_prime = "/" +
        appN +
        "/interface/tpl/" +
        appN +
        "/COT/specifique/prime/registered_prime.php";

    $.ajax({
        url: link_url_cot_prime,
        type: "GET",
        data: {
            lib_prime: lib_prime,
            montant_prime: montant_prime,
            type_contrat: type_contrat,
            status_activ_cot: status_activ_cot,
            personnel: personnel,
            exist_contrat: exist_contrat
        },
        success: function(data) {
            console.log(data);
        },
        error: function(error) {
            console.log(error);
        },
    });

}

////// FIN BOUTON ENREGISTRER PRIME ////////////////////////