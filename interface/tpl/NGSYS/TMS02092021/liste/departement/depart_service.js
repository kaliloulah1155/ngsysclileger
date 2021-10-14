let link_url1 =
    "/" +
    appli +
    "/interface/tpl/" +
    appli +
    "/TMS/liste/departement/depart_actions.php";
let link_url2 =
    "/" +
    appli +       
    "/interface/tpl/" +
    appli +
    "/TMS/liste/departement/service_actions.php";


let link_url3 =
    "/" +
    appli +       
    "/interface/tpl/" +
    appli +
    "/TMS/liste/departement/personnel_actions.php";

//Debut phase 1-Traitement des departements
  ajaxDepartement().then((results) => {

         //departement
          for (let i = 0; i < results.length; i++) {
            $("#depart").append(
                "<option value='" + results[i][0] + "'    >" + results[i][0] + "</option>"
            );
        }
    })
    .catch((err) => console.log(err));

function ajaxDepartement() {
    return new Promise((resolve, reject) => {
        $.ajax({
            url: link_url1,
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
//Fin phase 1-Traitement des departements

let depart ='';
let service ='';
//Debut phase 2-Traitement des services
$(document).on("change","#depart", function() {
    depart = $(this).val();

    if (depart != "") {
        // console.log(depart);

        //Réinitilisation de la liste
        $('select[id="service"]').empty();
         $('select[id="personnel"]').empty();
        //appel de la fonction promesse :traitement service

      
      //LOAD SERVICE
      ajaxService(depart)
            .then((results) => {
               
                $("#service").append("<option value=''>Veuillez s&#233;lectionner</option>" );

                for (let i = 0; i < results.length; i++) {

                    $("#service").append(

                        "<option value='"+results[i][0] +"'     >" +
                        results[i][0] +
                        "</option>"
                    );
                }
            })
            .catch((err) => console.log(err));

          
            //LOAD PERSONNEL   
          service='';
         $.ajax({
            url: link_url3,
            type: "POST",
            dataType: "json",
            data: {
                departement: depart,
                service: service,
            },
            success: function(data) {
               // console.log(data);

                 $("#personnel").append("<option value=''>Veuillez s&#233;lectionner</option>" );

                for (let i = 0; i < data.length; i++) {

                    $("#personnel").append(

                        "<option value='"+data[i][0] +"'   >" +
                        data[i][1] +' '+data[i][2]+
                        "</option>"
                    );
                 }


            },
            error: function(error) {
                console.log(error);
            },
        });       

          



    }
    //Réinitilisation de la liste
    else $('select[id="service"]').empty();



    
        


});

function ajaxService(depart) {
    return new Promise((resolve, reject) => {
        $.ajax({
            url: link_url2,
            type: "POST",
            dataType: "json",
            data: {
                departement: depart,
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

//Fin phase 2-Traitement des services


//Debut phase 3-Traitement des personnels
 

$(document).on("change","#service", function() {
      service = $(this).val();

        $.ajax({
            url: link_url3,
            type: "POST",
            dataType: "json",
            data: {
                departement: depart,
                service: service,
            },
            success: function(data) {
                 $('select[id="personnel"]').empty();
               // console.log(data);
                $("#personnel").append("<option value=''>Veuillez s&#233;lectionner</option>" );

                for (let i = 0; i < data.length; i++) {

                    $("#personnel").append(

                        "<option value='"+data[i][0] +"'   >" +
                        data[i][1] +' '+data[i][2]+
                        "</option>"
                    );
                 }
            },
            error: function(error) {
                console.log(error);
            },
        });     

 });