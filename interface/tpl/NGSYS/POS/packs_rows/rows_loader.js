var loadcode = $('.loadcode').val();
var appnam = $('.appName').val();



/*****  load table relation exterieure***/

let link_rows_relexterne =
    "/" +
    appnam +
    "/interface/tpl/" +
    appnam +
    "/POS/packs_rows/rows_table_relexterne.php";


function load_table_relexterne(loadcode) {

    $.ajax({
        url: link_rows_relexterne,
        type: "GET",
        data: {
            loadcode: loadcode
        },
        success: function(resps) {

            $(".exterieures").html(resps);

            //console.log(resps);
        },
        error: function(err) {
            console.log(err);
        },
    });
}
$(".lib_relexterne").empty();
load_table_relexterne(loadcode);



/*****  load table qualite dominante***/

let link_rows_qualdom =
    "/" +
    appnam +
    "/interface/tpl/" +
    appnam +
    "/POS/packs_rows/rows_table_qualdom.php";


function load_table_qualdom(loadcode) {

    $.ajax({
        url: link_rows_qualdom,
        type: "GET",
        data: {
            loadcode: loadcode
        },
        success: function(resps) {

            $(".dominante").html(resps);

            //console.log(resps);
        },
        error: function(err) {
            console.log(err);
        },
    });
}
$(".lib_qualdom").empty();
load_table_qualdom(loadcode);


/*****  load table mission***/

let link_rows_mission =
    "/" +
    appnam +
    "/interface/tpl/" +
    appnam +
    "/POS/packs_rows/rows_table_mission.php";


function load_table_mission(loadcode) {

    $.ajax({
        url: link_rows_mission,
        type: "GET",
        data: {
            loadcode: loadcode
        },
        success: function(resps) {

            $(".mission").html(resps);

            //console.log(resps);
        },
        error: function(err) {
            console.log(err);
        },
    });
}
$(".lib_mission").empty();
load_table_mission(loadcode);


/*****  load table indicateur de performance***/

let link_rows_indperforma =
    "/" +
    appnam +
    "/interface/tpl/" +
    appnam +
    "/POS/packs_rows/rows_table_indperforma.php";


function load_table_indperforma(loadcode) {

    $.ajax({
        url: link_rows_indperforma,
        type: "GET",
        data: {
            loadcode: loadcode
        },
        success: function(resps) {

            $(".indicateur").html(resps);

            //console.log(resps);
        },
        error: function(err) {
            console.log(err);
        },
    });
}
$(".lib_indperforma").empty();
load_table_indperforma(loadcode);



/*****  load table Relations interieures***/
let link_rows_relintern =
    "/" +
    appnam +
    "/interface/tpl/" +
    appnam +
    "/POS/packs_rows/rows_table_relintern.php";


function load_table_relintern(loadcode) {

    $.ajax({
        url: link_rows_relintern,
        type: "GET",
        data: {
            loadcode: loadcode
        },
        success: function(resps) {

            $(".relation").html(resps);

            //console.log(resps);
        },
        error: function(err) {
            console.log(err);
        },
    });
}
$(".all_lib_depart").empty();
$(".all_lib_service").empty();
load_table_relintern(loadcode);


/*****  load table Activités du poste ***/
let link_rows_activite =
    "/" +
    appnam +
    "/interface/tpl/" +
    appnam +
    "/POS/packs_rows/rows_table_activite.php";


function load_table_activite(loadcode) {

    $.ajax({
        url: link_rows_activite,
        type: "GET",
        data: {
            loadcode: loadcode
        },
        success: function(resps) {

            $(".activite").html(resps);

            //console.log(resps);
        },
        error: function(err) {
            console.log(err);
        },
    });
}
$(".lib_pactivite").empty();
$(".lib_ptitre").empty();
load_table_activite(loadcode);