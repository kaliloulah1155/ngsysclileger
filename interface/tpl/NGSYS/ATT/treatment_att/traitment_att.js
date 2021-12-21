let appName = $(".appName").val();
   
let logger = $(".userinfo").val();


var select_fiche = "";
var matricule = "";

let link_url =
    "/" +
    appName +
    "/interface/tpl/" +
    appName +
    "/ATT/treatment_att/att_actions.php";

let link_url_att_abs =
    "/" +
    appName +
    "/interface/tpl/" +
    appName +
    "/ATT/pdf/pdf_att_abs.php";

    let link_url_att_stage =
    "/" +
    appName +
    "/interface/tpl/" +
    appName +
    "/ATT/pdf/pdf_att_stage.php";

 let link_url_att_travail =
    "/" +
    appName +
    "/interface/tpl/" +
    appName +
    "/ATT/pdf/pdf_att_travail.php";

 let link_url_cert_travail =
    "/" +
    appName +
    "/interface/tpl/" +
    appName +
    "/ATT/pdf/pdf_cert_travail.php";

//console.log(appName, " - ", logger);

$(".matricule ,.select_fiche").on("change", function() {
    select_fiche = $('.select_fiche').val();
     matricule = $.trim($('.matricule').val());

    

    const today = new Date();
   
          y=today.getFullYear();
          m=today.getMonth();
          d=today.getDate();

          d1 = d > 9 ? d : '0'+d;
          m1 = m > 9 ? m : '0'+m;

          var datetoday= d1+'/'+m1+'/'+y;
    

      //TRAITEMENT PAR JAVASCRIPT
    if (select_fiche =="CERTIFICAT DE TRAVAIL") {

        var t = $('.table').DataTable();
        //thead
        //tbody
        $('.table > tbody').find('tr').remove();
        
         t.clear();

        t.row.add([
                "CERTIFICAT DE TRAVAIL",
                "10/10/2020",
               "<span class='content_hover1'><a class='btn_info' target='_blank' href ="+link_url_cert_travail+"?matricule="+matricule+" style='text-decoration: none;'><img class='img-fluid consulter_ligne' src='/NGSYSTEST/images/icons/lr_print.gif' width='17'  height='17' style='margin-left:0%;'></a></span>"
            ]);
        t.draw();
    }
   
    if (select_fiche =="ATTESTATION DE STAGE") {
        $('.table > tbody').find('tr').remove();
        var t = $('.table').DataTable();
         t.clear();

        t.row.add([
                "ATTESTATION DE STAGE",
                datetoday,
               "<span class='content_hover1'><a class='btn_info' target='_blank' href ="+link_url_att_stage+"?matricule="+matricule+" style='text-decoration: none;'><img class='img-fluid consulter_ligne' src='/NGSYSTEST/images/icons/lr_print.gif' width='17'  height='17' style='margin-left:0%;'></a></span>"
            ]);
        t.draw();

    }
    if (select_fiche == "ATTESTATION DE TRAVAIL") {
        
        $('.table > tbody').find('tr').remove();
     
        var t = $('.table').DataTable();
        t.clear();
        t.row.add([
                "ATTESTATION DE TRAVAIL",
                datetoday,
               "<span class='content_hover1'><a class='btn_info' target='_blank' href ="+link_url_att_travail+"?matricule="+matricule+" style='text-decoration: none;'><img class='img-fluid consulter_ligne' src='/NGSYSTEST/images/icons/lr_print.gif' width='17'  height='17' style='margin-left:0%;'></a></span>"
            ]);
        t.draw();
    }

    ///////////TRAITEMENT DU PROMESSE AJAX

     if (select_fiche =="ATTESTATION DE CONGE") {


         $('.table > tbody').find('tr').remove();
        var t = $('.table').DataTable();
         t.clear();
      
       /* t.row.add([
                "ATTESTATION DE CONGE",
                datetoday,
               "<span class='content_hover1'><a class='btn_info' href ='javascript: void(0);' style='text-decoration: none;'><img class='img-fluid consulter_ligne' src='/NGSYSTEST/images/icons/lr_print.gif' width='17'  height='17' style='margin-left:0%;'></a></span>"
            ]);
        t.draw();*/

        ///////////TRAITEMENT DU PROMESSE AJAX

        if(matricule){
            ajaxPersonnel()
            .then((results) => {


                 for (let i = 0; i < results.length; i++) {

                    //console.log(results[i][0], results[i][1] , results[i][2]);
 

                     const date_abs = results[i][1];
       
                    

                     t.row.add([
                      results[i][0],        
                      date_abs,
                     "<span class='content_hover1'><a class='btn_info btn_conge' target='_blank' href ="+link_url_att_abs+"?numposeidon="+results[i][3]+"&matricule="+matricule+"  style='text-decoration: none;'><img class='img-fluid consulter_ligne' src='/ngsys/images/icons/lr_consulter_ligne.png' width='17'  height='17' style='margin-left:0%;'></a></span>"
                    ]);

                 }
                 t.draw();



            })
            .catch((err) => console.log(err)   );

            }
    }

     
});

function ajaxPersonnel() {
    return new Promise((resolve, reject) => {
        $.ajax({
            url: link_url,
            type: "GET",
            dataType: "json",
            data: {
               // logger: logger,
                select_fiche: select_fiche,
                matricule: matricule,
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


function recupPosNum(nump){
   // alert(nump);
}
