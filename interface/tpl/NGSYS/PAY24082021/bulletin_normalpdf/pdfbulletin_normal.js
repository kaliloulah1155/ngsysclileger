let appNamepdf = $(".appName").val();

    let link_urlpdfbln =
    "/" +
    appNamepdf +
    "/interface/tpl/" +
    appNamepdf +
    "/PAY/bulletin_normalpdf/blnpdf_actions.php";

    let link_urlpdfblc =
    "/" +
    appNamepdf +
    "/interface/tpl/" +
    appNamepdf +
    "/PAY/bulletin_normalpdf/blcpdf_actions.php";

    let link_urlpdfbcg =
    "/" +
    appNamepdf +
    "/interface/tpl/" +
    appNamepdf +
    "/PAY/bulletin_normalpdf/bcgpdf_actions.php";

    //get value from data-value href after changing script
    let vcontrat = $('.typcontrat').val();
     
    var email=($('.interselectperso').val()).toUpperCase();

  

     if(
    vcontrat=="Stage-ecole" ||
    vcontrat=="Stage professionnel"

    ){

        $('.botton_pris').hide();
      
    }else{
             $('.botton_pris').show();
    }

    

$(".print_vbtn").hide();
$(".print_btn").on("click", function() {
    let id = $("#numposeidon").val();
    let get_url = "";
         $(".print_btn").hide();



   

    if(
        vcontrat=="CDD avec essai" ||
        vcontrat=="CDD lie au projet" ||
        vcontrat=="CDD standard" ||
        vcontrat=="CDI avec essai" ||
        vcontrat=="CDI standard"

    ){
        if($('.entreprise').val()=='HUAWEI'){
         get_url = link_urlpdfbcg;
        }else{
           get_url = link_urlpdfbln;
        }

    }

    if(
        vcontrat=="Consultant interne" ||
        vcontrat=="Consultant externe"

    ){
            get_url = link_urlpdfblc; 
    }
            

    ajaxPdf(id,get_url,email)
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

function ajaxPdf(id,get_url,email) {
    return new Promise((resolve, reject) => {
        $.ajax({
            url: get_url,
            type: "GET",
            data: {
                numposeidon: id,
                email:email
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