let appNamepdf = $(".appName").val();

let link_urlcddprojet =
    "/" +
    appNamepdf +
    "/interface/tpl/" +
    appNamepdf +
    "/COT/traitementjs/cddprojet.php";

let link_urlcddsimple =
    "/" +
    appNamepdf +
    "/interface/tpl/" +
    appNamepdf +
    "/COT/traitementjs/cddsimple.php";

let link_urlcddessai =
    "/" +
    appNamepdf +
    "/interface/tpl/" +
    appNamepdf +
    "/COT/traitementjs/cddessai.php";

let link_urlcdiessai =
    "/" +
    appNamepdf +
    "/interface/tpl/" +
    appNamepdf +
    "/COT/traitementjs/cdiessai.php";
let link_urlcdisimple =
    "/" +
    appNamepdf +
    "/interface/tpl/" +
    appNamepdf +
    "/COT/traitementjs/cdisimple.php";

let link_urlconsultantext =
    "/" +
    appNamepdf +
    "/interface/tpl/" +
    appNamepdf +
    "/COT/traitementjs/consultant.php";

let link_urlconsultantint =
    "/" +
    appNamepdf +
    "/interface/tpl/" +
    appNamepdf +
    "/COT/traitementjs/consultantint.php";

let link_urlstageecole =
    "/" +
    appNamepdf +
    "/interface/tpl/" +
    appNamepdf +
    "/COT/traitementjs/stageecole.php";

let link_urlstagequalification =
    "/" +
    appNamepdf +
    "/interface/tpl/" +
    appNamepdf +
    "/COT/traitementjs/stagequalification.php";

$(".print_btn").on("click", function() {
    //get value from simple event of select
    var contratabrege = $(".contratabrege").val();
    let id = $("#numposeidon").val();
    let get_url = "";

    //alert(contratabrege);
    //affect value of existing data
    $(".print_btn").attr("data-contrat", contratabrege);

    //get value from data-value href after changing script
    let vcontrat = $(".print_btn").data("contrat");

    switch (vcontrat) {
        case "CDD PROJET":
            get_url = link_urlcddprojet;
            break;
        case "CDD SIMPLE":
            get_url = link_urlcddsimple;
            break;
        case "CDD ESSAI":
            get_url = link_urlcddessai;
            break;
        case "CDI ESSAI":
            get_url = link_urlcdiessai;
            break;
        case "CDI SIMPLE":
            get_url = link_urlcdisimple;
            break;
        case "CONSULTANT EXTERNE":
            get_url = link_urlconsultantext;
            break;
        case "CONSULTANT INTERNE":
            get_url = link_urlconsultantint;
            break;
        case "STAGE ECOLE":
            get_url = link_urlstageecole;
            break;
        case "STAGE QUALIFICATION":
            get_url = link_urlstagequalification;
            break;
        default:
            alert("Veuillez choisir le type de contrat et enregister");
            break;
    }

    //alert(id + "****" + get_url);

    //call ajax function
    ajaxPdf(id, get_url)
        .then((results) => {
            let newUrlink = xhr.responseURL;
            let oldUrl = $(".print_vbtn").attr("href");
     
            let newUrl = oldUrl.replace("javascript:void(0)", newUrlink);

            // $(".print_btn").text("visualiser");
            $(".print_vbtn").attr("target", "_blank").attr("href", newUrl);
            $(".print_vbtn").show();
        })
        .catch((err) => console.log(err));
});

var xhr = new XMLHttpRequest();

function ajaxPdf(id, url) {
    return new Promise((resolve, reject) => {
        $.ajax({
            url: url,
            type: "GET",
            data: {
                numposeidon: id,
            },
            xhr: function() {
                return xhr;
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