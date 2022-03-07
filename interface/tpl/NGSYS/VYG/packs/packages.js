// let appN = $('.appName').val();
console.log(appN);
let linkcompagnie =
    "/" +
    appN +
    "/interface/tpl/" +
    appN +
    "/VYG/packs/compagnie.php";

let linkcompagnieInsert =
    "/" +
    appN +
    "/interface/tpl/" +
    appN +
    "/VYG/packs/compagnie_insert.php";

let linkpays =
    "/" +
    appN +
    "/interface/tpl/" +
    appN +
    "/VYG/packs/pays.php";

// let linkpaysInsert =
//     "/" +
//     appN +
//     "/interface/tpl/" +
//     appN +
//     "/VYG/packs/pays_insert.php";


let linkville =
    "/" +
    appN +
    "/interface/tpl/" +
    appN +
    "/VYG/packs/ville.php";

let linkvilleInsert =
    "/" +
    appN +
    "/interface/tpl/" +
    appN +
    "/VYG/packs/ville_insert.php";


let linkclient =
    "/" +
    appN +
    "/interface/tpl/" +
    appN +
    "/VYG/packs/client.php";

let linkclientInsert =
    "/" +
    appN +
    "/interface/tpl/" +
    appN +
    "/VYG/packs/client_insert.php";

let linkprojet =
    "/" +
    appN +
    "/interface/tpl/" +
    appN +
    "/VYG/packs/projet.php";

let linkprojetInsert =
    "/" +
    appN +
    "/interface/tpl/" +
    appN +
    "/VYG/packs/projet_insert.php";



////LOAD PAYS
function load_pays() {

    var init_pays = $('.init_pays').val();

    $.ajax({
        url: linkpays,
        type: "GET",
        data: {
            // init_pays:init_pays
        },
        success: function(data) {
            $(".pays").append(
                "<option value=''>Veuillez selectionner</option>"
            );
            $('.pays').append(data);

        },
        error: function(error) {
            console.log(error);
        },
    });
}
load_pays();
//INSERTION LORSQUE C'EST UN NOUVEAU PAYS
//    $(document).on('change','.pays',function(){

//              $.ajax({
//                 url:linkpaysInsert,
//                 type:"GET",
//                 data:{
//                     pays:$(this).val()
//                 },
//                 success:function(response){

//                         if(response==1){

//                             $(".pays").empty(); 
//                             load_pays();
//                         }
//                 },
//                 error:function(error){
//                     console.log(error);
//                 }
//             });
//     });


////LOAD VILLE
function load_ville() {

    var init_ville = $('.init_ville').val();

    $.ajax({
        url: linkville,
        type: "GET",
        data: {
            init_ville: init_ville
        },
        success: function(data) {
            $(".ville").append(
                "<option value=''>Veuillez selectionner</option>"
            );
            $('.ville').append(data);

        },
        error: function(error) {
            console.log(error);
        },
    });
}
load_ville();
//INSERTION LORSQUE C'EST UN NOUVELLE VILLE
$(document).on('change', '.ville', function() {
    $.ajax({
        url: linkvilleInsert,
        type: "GET",
        data: {
            ville: $(this).val()
        },
        success: function(response) {
            if (response == 1) {
                $(".ville").empty();
                load_ville();
            }
        },
        error: function(error) {
            console.log(error);
        }
    });
});

////LOAD COMPAGNIE
function load_compagnie() {

    var init_compagnie = $('.init_compagnie').val();

    $.ajax({
        url: linkcompagnie,
        type: "GET",
        data: {
            init_compagnie: init_compagnie
        },
        success: function(data) {
            $(".compagnie").append(
                "<option value=''>Veuillez selectionner</option>"
            );
            $('.compagnie').append(data);

        },
        error: function(error) {
            console.log(error);
        },
    });
}
load_compagnie();

//INSERTION LORSQUE C'EST UN NOUVELLE COMPAGNIE


const replaceSpecialChars = (str) => {
    return str.normalize('NFD').replace(/[\u0300-\u036f]/g, '') // Remove accents
        //.replace(/([^\w]+|\s+)/g, '-') // Replace space and other characters by hyphen
        .replace(/\-\-+/g, '-') // Replaces multiple hyphens by one hyphen
        .replace(/(^-+|-+$)/, ''); // Remove extra hyphens from beginning or end of the string
}

function removeSpecials(str) {
    var lower = str.toLowerCase();
    var upper = str.toUpperCase();

    var res = "";
    for (var i = 0; i < lower.length; ++i) {
        if (lower[i] != upper[i] || lower[i].trim() === '')
            res += str[i];
    }
    return res;
}

$(document).on('change', '.compagnie', function() {
    $.ajax({
        url: linkcompagnieInsert,
        type: "GET",
        data: {
            compagnie:  removeSpecials(replaceSpecialChars($(this).val()))
        },
        success: function(response) {
            if (response == 1) {
                $(".compagnie").empty();
                load_compagnie();
            }
        },
        error: function(error) {
            console.log(error);
        }
    });
});



////LOAD CLIENT
function load_client() {

    var init_client = $('.init_client').val();

    $.ajax({
        url: linkclient,
        type: "GET",
        data: {
            init_client: init_client
        },
        success: function(data) {
            $(".client").append(
                "<option value=''>Veuillez selectionner</option>"
            );
            $('.client').append(data);

        },
        error: function(error) {
            console.log(error);
        },
    });
}
load_client();

//INSERTION LORSQUE C'EST UN NOUVELLE CLIENT
$(document).on('change', '.client', function() {
    $.ajax({
        url: linkclientInsert,
        type: "GET",
        data: {
            client: $(this).val()
        },
        success: function(response) {
            if (response == 1) {
                $(".client").empty();
                load_client();
            }
        },
        error: function(error) {
            console.log(error);
        }
    });
});



////LOAD PROJET
function load_projet() {

    var init_projet = $('.init_projet').val();

    $.ajax({
        url: linkprojet,
        type: "GET",
        data: {
            init_projet: init_projet
        },
        success: function(data) {
            $(".projet").append(
                "<option value=''>Veuillez selectionner</option>"
            );
            $('.projet').append(data);

        },
        error: function(error) {
            console.log(error);
        },
    });
}
load_projet();

//INSERTION LORSQUE C'EST UN NOUVELLE PROJET
$(document).on('change', '.projet', function() {
    $.ajax({
        url: linkprojetInsert,
        type: "GET",
        data: {
            projet: $(this).val()
        },
        success: function(response) {
            if (response == 1) {
                $(".projet").empty();
                load_projet();
            }
        },
        error: function(error) {
            console.log(error);
        }
    });
});



////////////////TABLEAU DE CALCUL DES FRAIS //////////////////////
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
// -------find element by row
function findRowNum(input) {
    $('tbody').delegate(input, 'keydown', function() {
        var tr = $(this).parent().parent();
        number(tr.find(input));
    });
}

function findRowNumOnly(input) {
    $('tbody').delegate(input, 'keydown', function() {
        var tr = $(this).parent().parent();
        numberOnly(tr.find(input));
    });
}
// -------fin find element by row


//---------number and dot
function number(input) {
    $(input).keypress(function(evt) {
        var theEvent = evt || window.event;
        var key = theEvent.keyCode || theEvent.which;
        key = String.fromCharCode(key);
        var regex = /[-\d\.]/;
        var objRegex = /^-?\d*[\.]?\d*$/;
        var val = $(evt.target).val();
        if (!regex.test(key) || !objRegex.test(val + key) ||
            !theEvent.keyCode == 46 || !theEvent.keyCode == 8) {
            theEvent.returnValue = false;
            if (theEvent.preventDefault) theEvent.preventDefault();
        }
    });
}
//--------fin number and dot

//---------number only
function numberOnly(input) {
    $(input).keypress(function(evt) {
        var e = event || evt;
        var charCode = e.which || e.keyCode;
        if (charCode > 31 && (charCode < 48 || charCode > 57))
            return false;
        return true;
    });
}
//--------fin number only

//----- call function number 
findRowNumOnly('.qte');
findRowNum('.pu');
//----- fin call function number





var somme1 = 0;
var somme2 = 0;
var somme = 0;

$('tbody').delegate('.pu1,.qte1', 'keyup', function() {
    var amount = 0;
    var tr = $(this).parent().parent();
    var qte = tr.find('.qte1').val();
    var pu = tr.find('.pu1').val();
    amount = (qte * pu);

    tr.find('.tot1').val(amount);

    stotal1();
});

function stotal1() {
    var total = 0;
    $('.tot1').each(function(i, e) {
        var amount = $(this).val() - 0;
        total += amount;
    })
    $('.stotal1').val(total.formatMoney(0, '.', ',') + " FCFA");

    somme1 = total;




    var a = parseInt(somme1);

    $('.sum_total').val(a.formatMoney(0, '.', ',') + " FCFA");
}


$('tbody').delegate('.pu2,.qte2', 'keyup', function() {
    var amount = 0;
    var tr = $(this).parent().parent();
    var qte = tr.find('.qte2').val();
    var pu = tr.find('.pu2').val();
    amount = (qte * pu);

    tr.find('.tot2').val(amount);

    stotal2();


});

function stotal2() {
    var total = 0;
    $('.tot2').each(function(i, e) {
        var amount = $(this).val() - 0;
        total += amount;
    })
    $('.stotal2').val(total.formatMoney(0, '.', ',') + " FCFA");

    somme2 = total;

    var a = parseInt(somme1) + parseInt(somme2);

    $('.sum_total').val(a.formatMoney(0, '.', ',') + " FCFA");
}