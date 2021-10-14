let appNamepdf = $(".appName").val();

    let link_urlpdf =
    "/" +
    appNamepdf +
    "/interface/tpl/" +
    appNamepdf +
    "/DFM/dfmpdf/dfmpdf_actions.php";

$(".print_vbtn").hide();
$(".print_btn").on("click", function() {
    let id = $(".numposeidon").val();
         $(".print_btn").hide();
     var loadcode = $(".loadcode").val();
    ajaxPdf(id,loadcode)
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

function ajaxPdf(id,loadcode) {
    return new Promise((resolve, reject) => {
        $.ajax({
            url: link_urlpdf,
            type: "GET",
            data: {
                numposeidon: id,
                code:loadcode
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