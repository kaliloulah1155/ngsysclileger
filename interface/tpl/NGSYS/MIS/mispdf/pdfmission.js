let appNamepdf = $(".appName").val();

let link_urlpdf =
    "/" +
    appNamepdf +
    "/interface/tpl/" +
    appNamepdf +
    "/MIS/mispdf/missionpdf_actions.php";

let link_urlfrspdf =
    "/" +
    appNamepdf +
    "/interface/tpl/" +
    appNamepdf +
    "/MIS/mispdf/pdfFrs.php";

////ORDRE DE MISSION ////

$(".print_vbtn").hide();
$(".print_btn").on("click", function() {
    let id = $("#numposeidon").val();
         $(".print_btn").hide();
    ajaxPdf(id)
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

function ajaxPdf(id) {
    return new Promise((resolve, reject) => {
        $.ajax({
            url: link_urlpdf,
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
///////////////////////////////////////////////

//////////// FRAIS DE MISSION /////////////////////////



$(".print_vbtn_frs").hide();
$(".print_btn_frs").on("click", function() {
    let id_frs = $("#numposeidon").val();
         $(".print_btn_frs").hide();

         ajaxPdffrs(id_frs)
        .then((results) => {
            let newUrlink_frs = xhr_frs.responseURL;
            let oldUrl_frs = $(".print_vbtn_frs").attr("href");

            let newUrl_frs = oldUrl_frs.replace("javascript:void(0)", newUrlink_frs);

            // $(".print_btn").text("visualiser");
            $(".print_vbtn_frs").attr("target", "_blank").attr("href", newUrl_frs);
            $(".print_vbtn_frs").show();

        })
        .catch((err) => console.log(err));
});

var xhr_frs = new XMLHttpRequest();

function ajaxPdffrs(id) {
    return new Promise((resolve, reject) => {
        $.ajax({
            url: link_urlfrspdf,
            type: "GET",
            data: {
                numposeidon: id,
            },
            xhr: function() {
                return xhr_frs;
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

////////////////////////////////////////////////////////