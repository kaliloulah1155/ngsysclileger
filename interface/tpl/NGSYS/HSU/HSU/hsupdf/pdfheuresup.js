let appNamepdf = $(".appName").val();

let link_urlpdf =
    "/" +
    appNamepdf +
    "/interface/tpl/" +
    appNamepdf +
    "/HSU/hsupdf/hsupdf_actions.php";

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