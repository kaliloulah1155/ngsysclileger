//let appNameN = "NGSYS";

let appNameN = $(".appName").val();

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

                "<option value='" + results[i] + "'>" + results[i].toLowerCase().replace(/\b[a-z]/g, function(letter) {return letter.toUpperCase();})+ "</option>"
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