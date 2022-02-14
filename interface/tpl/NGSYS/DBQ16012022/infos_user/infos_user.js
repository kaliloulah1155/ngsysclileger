let appName = $(".appName").val();
    
var logger = $(".userinfo").val();

let link_url =
    "/" +
    appName +
    "/interface/tpl/" +
    appName +
    "/DBQ/infos_user/users_actions.php";

ajaxPersonnel()
    .then((results) => {
        $("#input_civ").val(results[0][0]);
        $("#input_bqe").val(results[0][1]);
        $("#input_rib").val(results[0][2]);

        //ancienne banque
        $("#input_anbqe").val(results[0][1]);
        $("#input_anrib").val(results[0][2]);
    })
    .catch((err) => console.log(err));

function ajaxPersonnel() {
    return new Promise((resolve, reject) => {
        $.ajax({
            url: link_url,
            type: "GET",
            dataType: "json",
            data: {
                logger: logger,
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