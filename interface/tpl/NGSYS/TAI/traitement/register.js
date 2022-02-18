
var appName = $('.appName').val();

let link_urlreg =
    "/" +
    appName +
    "/interface/tpl/" +
    appName +
    "/TAI/traitement/registered.php";
    
const registered = (contrat, month, year) => {
    return new Promise((resolve, reject) => {
        $.ajax({
            url: link_urlreg,
            type: "POST",
            data: {
                contrat: contrat,
                month: month,
                year: year
            },
            success: function (data) {
                resolve(data);
            },
            error: function (error) {
                reject(error);
            },
        });
    });
}





$(document).on('click', '.reg_btn', function (e) {

    var contrat = $('.contrat').val(); //type de contrat

    var tab_date = ($('.datefin1').val()).split(' ');
    var mois = tab_date[0];  // mois
    var year = tab_date[1]; // année 

    var map_date = new Map();
    map_date.set('Janvier', '01');
    map_date.set('Fevrier', '02');
    map_date.set('Mars', '03');
    map_date.set('Avril', '04');
    map_date.set('Mai', '05');
    map_date.set('Juin', '06');
    map_date.set('Juillet', '07');
    map_date.set('Ao\u00fbt', '08');
    map_date.set('Septembre', '09');
    map_date.set('Octobre', '10');
    map_date.set('Novembre', '11');
    map_date.set('D\u00e9cembre', '12');


    $('.lib_mois').text($('.datefin1').val());
     var dt_edit=`01/${map_date.get(mois)}/${year}`;
    // console.log(`${contrat} :: 01/${map_date.get(mois)}/${year}`);
     $('.date_edit').val(dt_edit);

    

        registered(contrat, map_date.get(mois), year)
            .then(data => {

                let donnees=data.paies;
                //console.log(donnees);

                get_contrat('.select');


                var dmde = $('.select').children("option:selected").val();

                // $('.table_1 > tbody').find('tr').remove();
                // $('.table_2 > tbody').find('tr').remove();
                // destroy datatable
                $(".table_1").dataTable().fnDestroy();
                $(".table_2").dataTable().fnDestroy();
                $(".table_3").dataTable().fnDestroy();

                if(dmde == "Consultant interne" || dmde == "Consultant externe" ){
                                //CONSULTANT
                            $('.table_2 > tbody').find('tr').remove();
                            var t = $('.table_2').DataTable();
                            t.clear();
                
                            for (var i = 0; i < donnees.length; i++) {
                                t.row.add(
                                    [
                                        donnees[i]['matricule'],
                                        donnees[i]['entreprise'],
                                        donnees[i]['nom_complet'],  
                                        parseInt(donnees[i]['hono_net']).formatMoney(0,'.',',')+" F CFA",
                                        parseInt(donnees[i]['assurance']).formatMoney(0,'.',',')+" F CFA",
                                        parseInt(donnees[i]['hono_net_pay']).formatMoney(0,'.',',')+" F CFA",
                                        donnees[i]['rib'],
                                        donnees[i]['banque'],
                                    ]
                                );
                            }
                            t.draw();
                    
                }
            
                if(dmde == "CDD avec essai" || dmde == "CDD lie au projet" || dmde == "CDD standard"  || dmde == "CDI avec essai" || dmde == "CDI standard"){
                        $('.table_1 > tbody').find('tr').remove();
                        var t = $('.table_1').DataTable();
                        t.clear();
            
                        for (var i = 0; i < donnees.length; i++) {
                            t.row.add(
                                [
                                    donnees[i]['matricule'],
                                    donnees[i]['entreprise'],
                                    donnees[i]['nom_complet'],  
                                    parseInt(donnees[i]['sal_net']).formatMoney(0,'.',',')+" F CFA",
                                    parseInt(donnees[i]['assurance']).formatMoney(0,'.',',')+" F CFA",
                                    parseInt(donnees[i]['sal_net_pay']).formatMoney(0,'.',',')+" F CFA",
                                    donnees[i]['rib'],
                                    donnees[i]['banque'],
                                ]
                            );
                        }
                        t.draw();
                }
                   
                if(dmde == "Stage-ecole" || dmde == "Stage professionnel"){

                    $('.table_3 > tbody').find('tr').remove();
                    var t = $('.table_3').DataTable();
                    t.clear();
        
                    for (var i = 0; i < donnees.length; i++) {
                        t.row.add(
                            [
                                donnees[i]['matricule'],
                                donnees[i]['entreprise'],
                                donnees[i]['nom_complet'],  
                                parseInt(donnees[i]['sal_net']).formatMoney(0,'.',',')+" F CFA",
                                parseInt(donnees[i]['assurance']).formatMoney(0,'.',',')+" F CFA",
                                parseInt(donnees[i]['sal_net_pay']).formatMoney(0,'.',',')+" F CFA",
                                donnees[i]['rib'],
                                donnees[i]['banque'],
                            ]
                        );
                    }
                    t.draw();
                    
                }

              
                

            }).catch(err => console.log(err));
     
    e.preventDefault();
})



// $("select.select").change(function(){
    

//  });

function get_contrat( idcontrat){
    var dmde = $(idcontrat).children("option:selected").val();

    if(dmde == "Consultant interne" || dmde == "Consultant externe" ){
        $('#consultant').show();
        $('#salarie,#stagiaire').hide();
        $('#btnEnretgiste').prop("disabled",false);
    }

    if(dmde == "CDD avec essai" || dmde == "CDD lie au projet" || dmde == "CDD standard"  || dmde == "CDI avec essai" || dmde == "CDI standard"){
        $('#salarie').show();
        $('#consultant,#stagiaire').hide();
        $('#btnEnretgiste').prop("disabled",false);
    }

    if(dmde == "Stage-ecole" || dmde == "Stage professionnel"){
        $('#stagiaire').show();
        $('#salarie,#consultant').hide();
        $('#btnEnretgiste').prop("disabled",false);
    }
 }



    