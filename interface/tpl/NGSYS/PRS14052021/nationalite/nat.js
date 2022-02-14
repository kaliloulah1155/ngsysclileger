let appNameN = "NGSYS";

let link_url =
    "/" +
    appNameN +
    "/interface/tpl/" +
    appNameN +
    "/PRS/nationalite/nation.php";


//Debut phase 1-Traitement des departements
ajaxNationalite()
    .then((results) => {

    	 
    	// console.log(results[0]);

        for (let i = 0; i < results.length; i++) {
            $("#nationalite").append(
                "<option value='" + results[i] + "'>" + results[i]+ "</option>"
            );
        }

    })
    .catch((err) => console.log(err));


 

    function ajaxNationalite() {
    return new Promise((resolve, reject) => {
        $.ajax({
            url: link_url,
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