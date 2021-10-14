
 // CHARGEMENT DES DIPLOMES
let linkdiplome =
    "/" +
    appName +
    "/interface/tpl/" +
    appName +
    "/POS/packages/diplome.php";

let linkdiplome2 =
    "/" +
    appName +
    "/interface/tpl/" +
    appName +
    "/POS/packages/diplome2.php";


var init_diplome1 =$('.init_diplome1').val();

var init_diplome2 =$('.init_diplome2').val();


 function load_diplome(){

    $.ajax({
        url: linkdiplome,
        type: "GET",
        data:{
            init_diplome1:init_diplome1
        },
        success: function(data) {
                 $(".diplome1").append(
                         "<option value='0'>Veuillez selectionner le dipl&#244;me</option>"
                         );
              $('.diplome1').append(data);

        },      
        error: function(error) {
            console.log(error);
        },
    }); 
 }
load_diplome();

function load_diplome2(){

    $.ajax({
        url: linkdiplome2,
        type: "GET",
        data:{
            init_diplome2:init_diplome2
        },
        success: function(data) {
                 $(".diplome2").append(
                         "<option value='0'>Veuillez selectionner le dipl&#244;me</option>"
                         );
              $('.diplome2').append(data);

        },      
        error: function(error) {
            console.log(error);
        },
    }); 
 }
load_diplome2();


 //INSERTION LORSQUE C'EST UN NOUVEAU DIPLOME
 let linkdiplomeInsert =
    "/" +
    appName +
    "/interface/tpl/" +
    appName +
    "/POS/packages/diplome_insert.php";



   $(document).on('change','.diplome1,.diplome2',function(){

             //alert($(this).val());

             $.ajax({
                url:linkdiplomeInsert,
                type:"GET",
                data:{
                    diplome:$(this).val()
                },
                success:function(response){

                        if(response==1){

                            $(".diplome1,.diplome2").empty(); 
                              load_diplome();
                              load_diplome2();
                        }

                      
                },
                error:function(error){
                    console.log(error);
                }
            });


    });
 
////////////////////////////////////////////////////////////////////////////////////
 /////////////////////TRAITEMENT DES CHECKBOX /////////////////////////////

//vue de consultation
if($('.cbk1').val()=="OUI"){
     $('.cbk1').prop('checked', true);
}else{
     $('.cbk1').prop('checked', false);
}

if($('.cbk2').val()=="OUI"){
     $('.cbk2').prop('checked', true);
}
if($('.cbk3').val()=="OUI"){
     $('.cbk3').prop('checked', true);
}

if($('.cbk4').val()=="OUI"){
     $('.cbk4').prop('checked', true);
}
   
if($('.cbk5').val()=="OUI"){
     $('.cbk5').prop('checked', true);
}
if($('.cbk6').val()=="OUI"){
     $('.cbk6').prop('checked', true);
}
if($('.cbk7').val()=="OUI"){
     $('.cbk7').prop('checked', true);
}
if($('.cbk8').val()=="OUI"){
     $('.cbk8').prop('checked', true);
}
if($('.cbk9').val()=="OUI"){
     $('.cbk9').prop('checked', true);
}
if($('.cbk10').val()=="OUI"){
     $('.cbk10').prop('checked', true);
}
if($('.cbk11').val()=="OUI"){
     $('.cbk11').prop('checked', true);
}
if($('.cbk12').val()=="OUI"){
     $('.cbk12').prop('checked', true);
}
 var numposeidon=$('.numposeidon').val();

 let linkcbk =
    "/" +
    appName +
    "/interface/tpl/" +
    appName +
    "/POS/checkbox/checkboxcbk.php";
     function load_cbk(numposeidon,statuscbk,rank){
         $.ajax({
                    url: linkcbk,
                    type: "GET",
                     data:{   
                        numposeidon:numposeidon,
                         statuscbk:statuscbk,
                         rank:rank
                    },
                    success: function(data) {
                        
                    },
                    error: function(error) {
                        console.log(error);
                    },
                }); 
     }
 
$(document).on('click','.cbk1',function(){
     if($('.cbk1').is(':checked')==true){
         $('.cbk1').val('OUI');

         load_cbk(numposeidon,'OUI',1);

     }if($('.cbk1').is(':checked')==false){
         $('.cbk1').val('NON');

            load_cbk(numposeidon,'NON',1);
     }
 });

$(document).on('click','.cbk2',function(){
     if($('.cbk2').is(':checked')==true){
         $('.cbk2').val('OUI');
         load_cbk(numposeidon,'OUI',2);
     }if($('.cbk2').is(':checked')==false){
         $('.cbk2').val('NON');
         load_cbk(numposeidon,'NON',2);
     }
});

$(document).on('click','.cbk3',function(){
     if($('.cbk3').is(':checked')==true){
         $('.cbk3').val('OUI');
         load_cbk(numposeidon,'OUI',3);
     }if($('.cbk3').is(':checked')==false){
         $('.cbk3').val('NON');
          load_cbk(numposeidon,'NON',3);
     }

});

$(document).on('click','.cbk4',function(){
     if($('.cbk4').is(':checked')==true){
         $('.cbk4').val('OUI');
         load_cbk(numposeidon,'OUI',4);
     }if($('.cbk4').is(':checked')==false){
         $('.cbk4').val('NON');
          load_cbk(numposeidon,'NON',4);
     }
});

$(document).on('click','.cbk5',function(){
     if($('.cbk5').is(':checked')==true){
         $('.cbk5').val('OUI');
         load_cbk(numposeidon,'OUI',5);
     }if($('.cbk5').is(':checked')==false){
         $('.cbk5').val('NON');
          load_cbk(numposeidon,'NON',5);
     }
});

$(document).on('click','.cbk6',function(){

     if($('.cbk6').is(':checked')==true){
         $('.cbk6').val('OUI');
         load_cbk(numposeidon,'OUI',6);
     }if($('.cbk6').is(':checked')==false){
         $('.cbk6').val('NON');
          load_cbk(numposeidon,'NON',6);
     }
});
$(document).on('click','.cbk7',function(){
     if($('.cbk7').is(':checked')==true){
         $('.cbk7').val('OUI');
         load_cbk(numposeidon,'OUI',7);
     }if($('.cbk7').is(':checked')==false){
         $('.cbk7').val('NON');
         load_cbk(numposeidon,'NON',7);
     }
});
$(document).on('click','.cbk8',function(){
     if($('.cbk8').is(':checked')==true){
         $('.cbk8').val('OUI');
         load_cbk(numposeidon,'OUI',8);
     }if($('.cbk8').is(':checked')==false){
         $('.cbk8').val('NON');
         load_cbk(numposeidon,'NON',8);
     }
});
$(document).on('click','.cbk9',function(){

     if($('.cbk9').is(':checked')==true){
         $('.cbk9').val('OUI');
         load_cbk(numposeidon,'OUI',9);
     }if($('.cbk9').is(':checked')==false){
         $('.cbk9').val('NON');
         load_cbk(numposeidon,'NON',9);
     }
});
$(document).on('click','.cbk10',function(){

     if($('.cbk10').is(':checked')==true){
         $('.cbk10').val('OUI');
         load_cbk(numposeidon,'OUI',10);
     }if($('.cbk10').is(':checked')==false){
         $('.cbk10').val('NON');
         load_cbk(numposeidon,'NON',10);
     }
});

$(document).on('click','.cbk11',function(){

     if($('.cbk11').is(':checked')==true){
         $('.cbk11').val('OUI');
          load_cbk(numposeidon,'OUI',11);
     }if($('.cbk11').is(':checked')==false){
         $('.cbk11').val('NON');
         load_cbk(numposeidon,'NON',11);
     }
});
$(document).on('click','.cbk12',function(){
     if($('.cbk12').is(':checked')==true){
         $('.cbk12').val('OUI');
          load_cbk(numposeidon,'OUI',12);
     }if($('.cbk12').is(':checked')==false){
         $('.cbk12').val('NON');
         load_cbk(numposeidon,'NON',12);
     }
});

 


//////////////////////////////////////////////////////////////////////////////////////


//////////BEGIN TREATMENT : RELATIONS EXTERIEURES ////////////////////////

      /***LOAD REL EXTER****/
let linkrelextern =
    "/" +
    appName +
    "/interface/tpl/" +
    appName +
    "/POS/packages/load_relextern.php";

     var init_relextern='';
    function load_relextern(){
         $.ajax({
                    url: linkrelextern,
                    type: "GET",
                     data:{   
                        init_relextern:init_relextern
                    },
                    success: function(data) {
                          $(".relexterne").append(
                                     "<option value=''>Veuillez s&#233;lectionner</option>"
                                     );
                         $('.relexterne').append(data);
                    },
                    error: function(error) {
                        console.log(error);
                    },
                }); 
     }
    load_relextern();
     /** insert REL EXTER ***/
let linkrelexternInsert =
    "/" +
    appName +
    "/interface/tpl/" +
    appName +
   "/POS/packages/insert_relextern.php";

    $(document).on('change','.relexterne',function(){
             //alert($(this).val());
             $.ajax({
                url:linkrelexternInsert,
                type:"GET",
                data:{
                    lib_relextern:$(this).val()
                },
                success:function(response){

                        if(response==1){

                           
                            $(".relexterne").empty(); 
                              load_relextern();
                        }

                      
                },
                error:function(error){
                    console.log(error);
                }
            });
    });


     /******Bouton ajouter ****/

    let linkaddrelextern =
    "/" +
    appName +
    "/interface/tpl/" +
    appName +
   "/POS/packages/add_load_relextern.php";

     $(document).on('click','#ligne_exterieures',function(e){
                //addRowExts();
               

                $.ajax({
                    url: linkaddrelextern,
                    type: "GET",
                     data:{
                        init_relextern:init_relextern
                    },
                    success: function(data) {


                        var $dataRows =$('.exterieures');
                         var tr=$dataRows.parent().parent();


                         if(
                              tr.find('.relexterne:last').val()=="" 
                         ){
                                $('#SuprimExts').hide();
                              alert("Veuillez bien renseigner les informations") ;
                          }else{
                            $("#SuprimExts").css("display","block");
                           addRow_relextern(data);

                          } 
                    },
                    error: function(error) {
                        console.log(error);
                    },
                }); 

                 e.preventDefault(); 
    });


   function  addRow_relextern(data){ 
         var newData = JSON.parse(data);
                           var html = '';
                           html += '<tr>';
                           html += '<td style="width: 100px;border:none;">';
                               html += '<select name="lib_relexterne[]" class="form-control relexterne" style="width: 100%;border: none;margin: 2px auto">';
                                html += '<option value="">S&#233;lectionner le libell&#233;</option>';
                            var len = newData.length;
                            for (var i = 0; i< len; i++) {
                                html += '<option value="' +newData[i][0] + '">' + newData[i][0]+ '</option>';
                            }
                                 html += '</select>'+
                            '</tr>';

                            $('.exterieures').append(html);

                             // Show all options
                              $("option").prop("disabled", false);

                               // Get an array of all current selections
                              var selected = [];
                              $(".relexterne").each(function () {
                                  selected.push($(this).val());
                              });

                              // Remove all selected options, except the current showing one, from all lists
                              $(".relexterne").each(function () {
                                  for (var i = 0; i < selected.length; i++) {
                                      if (selected[i] != $(this).val()) {
                                          $(this).find("option[value='" + selected[i] + "']").prop("disabled", true);

                                          //$(this).find("option[value='" + selected[i] + "']").remove();
                                      }
                                  }
                              });
                              //// 
    }

//////////END TREATMENT : RELATIONS EXTERIEURES ////////////////////////


//////////BEGIN TREATMENT : QUALITES DOMINANTES ////////////////////////

     /***LOAD QUAL DOMINANTE****/
let linkqualdom =
    "/" +
    appName +
    "/interface/tpl/" +
    appName +
    "/POS/packages/load_qualdom.php";

     var init_qualdom='';
    function load_qualdom(){
         $.ajax({
                    url: linkqualdom,
                    type: "GET",
                     data:{   
                        init_qualdom:init_qualdom
                    },
                    success: function(data) {
                          $(".lib_qualdom").append(
                                     "<option value=''>Veuillez s&#233;lectionner</option>"
                                     );
                         $('.lib_qualdom').append(data);
                    },
                    error: function(error) {
                        console.log(error);
                    },
                }); 
     }
    load_qualdom();

    /** insert QUAL DOMINANTE***/
let linkqualdomInsert =
    "/" +
    appName +
    "/interface/tpl/" +
    appName +
   "/POS/packages/insert_qualdom.php";

    $(document).on('change','.lib_qualdom',function(){
             //alert($(this).val());
             $.ajax({
                url:linkqualdomInsert,
                type:"GET",
                data:{
                    lib_qualdom:$(this).val()
                },
                success:function(response){

                        if(response==1){

                           
                            $(".lib_qualdom").empty(); 
                              load_qualdom();
                        }

                      
                },
                error:function(error){
                    console.log(error);
                }
            });


    });


      /******Bouton ajouter ****/

    let linkaddqualdom =
    "/" +
    appName +
    "/interface/tpl/" +
    appName +
   "/POS/packages/add_load_qualdom.php";
    $(document).on('click','#ligne_Dim',function(e){
                //addRowExts();
                $.ajax({
                    url: linkaddqualdom,
                    type: "GET",
                     data:{
                        init_qualdom:init_qualdom
                    },
                    success: function(data) {


                        var $dataRows =$('.dominante');
                         var tr=$dataRows.parent().parent();


                         if(
                              tr.find('.lib_qualdom:last').val()=="" 
                         ){
                                $('#SuprimDom').hide();
                              alert("Veuillez bien renseigner les informations") ;
                          }else{
                            $("#SuprimDom").css("display","block");
                           addRow_qualdom(data);

                          } 
                    },
                    error: function(error) {
                        console.log(error);
                    },
                }); 

                 e.preventDefault(); 
    });


      function  addRow_qualdom(data){ 
         var newData = JSON.parse(data);
                           var html = '';
                           html += '<tr>';
                           html += '<td style="width: 100px;border:none;">';
                               html += '<select name="lib_qualdom[]" class="form-control lib_qualdom" style="width: 100%;border: none;margin: 2px auto">';
                                html += '<option value="">S&#233;lectionner le libell&#233; </option>';
                            var len = newData.length;
                            for (var i = 0; i< len; i++) {
                                html += '<option value="' +newData[i][0] + '">' + newData[i][0]+ '</option>';
                            }
                                 html += '</select>'+
                            '</tr>';

                            $('.dominante').append(html);

                             // Show all options
                              $("option").prop("disabled", false);
                               // Get an array of all current selections
                              var selected = [];
                              $(".lib_qualdom").each(function () {
                                  selected.push($(this).val());
                              });
                              // Remove all selected options, except the current showing one, from all lists
                              $(".lib_qualdom").each(function () {
                                  for (var i = 0; i < selected.length; i++) {
                                      if (selected[i] != $(this).val()) {
                                          $(this).find("option[value='" + selected[i] + "']").prop("disabled", true);
                                          //$(this).find("option[value='" + selected[i] + "']").remove();
                                      }
                                  }
                              });
                              //// 
    }


//////////END TREATMENT : QUALITES DOMINANTES ////////////////////////

//////////BEGIN TREATMENT : RELATION INTERIEURE ////////////////////////
        /**** load all departements ****/

        let link_url_alldepart =
        "/" +
        appName +
        "/interface/tpl/" +
        appName +
        "/POS/departement/depart_actions.php";

        function load_all_depart(){
             all_ajaxDepartement().then((results) => {
                         //departement
                        var allinitdepartement =$('.allinitdepartement').val();
                         for (let i = 0; i < results.length; i++) {
                            $(".all_depart").append(
                                "<option value='" + results[i][0] + "' "+(results[i][0]==allinitdepartement  ? 'selected="selected"' : '')+"    >" + results[i][0] + "</option>"
                            );
                        }
                 
                    })
                    .catch((err) => console.log(err));
        }
        load_all_depart();
  function all_ajaxDepartement() {
            return new Promise((resolve, reject) => {
                $.ajax({
                    url: link_url_alldepart,
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
        /*******************************/

         /**** load all services ****/
        let link_url_allservice =
        "/" +
        appName +
        "/interface/tpl/" +
        appName +
        "/POS/departement/all_service_actions.php";

          function load_all_service(){
             all_ajaxService().then((results) => {
                         //departement
                        var allinitservice =$('.allinitservice').val();
                         for (let i = 0; i < results.length; i++) {
                            $(".all_service").append(
                                "<option value='" + results[i][0] + "' "+(results[i][0]==allinitservice  ? 'selected="selected"' : '')+"    >" + results[i][0] + "</option>"
                            );
                        }
                 
                    })
                    .catch((err) => console.log(err));
        }
        load_all_service();

         function all_ajaxService() {
            return new Promise((resolve, reject) => {
                $.ajax({
                    url: link_url_allservice,
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
         /***************************/


         /****bouton ajouter*****/

         $(document).on('click','#ligne_Relat',function(e){   
                //addRowRl();
                //$("#SuprimeRel").css("display","block");


                 $.ajax({
                    url: link_url_alldepart,
                    type: "POST",
                    dataType: "json",
                    success: function(data_departs) {



                         $.ajax({
                            url: link_url_allservice,
                            type: "POST",
                            dataType: "json",
                            success: function(data_services) {

                                    // console.log(data_departs,data_services);
                                  //traitement des ajouts//

                                  var $dataRows =$('.relation');

                                   var tr=$dataRows.parent().parent();
                                     if(
                                          tr.find('.all_depart:last').val()=="" 
                                     ){
                                            $('#SuprimeRel').hide();
                                          alert("Veuillez bien renseigner les informations") ;
                                      }else{
                                        $("#SuprimeRel").css("display","block");
                                          addRow_depart_service(data_departs,data_services);

                                      }

                                  /////////////////////////

                                
                             },
                              error: function(error_services) {
                                console.log(error_services);
                             },

                            }); 
                    },
                    error: function(error_departs) {
                        console.log(error_departs);
                    },
                }); 

            
                e.preventDefault(); 
        });

         /**********************/


         function addRow_depart_service(data_departs,data_services){


             var d_newData = data_departs;
             var s_newData = data_services;
                           var html = '';
                           html += '<tr>';
                           html += '<td class="col-sm-6">';
                               html += '<select name="all_lib_depart[]" class="form-control all_depart" style="width: 100%;border: none;margin: 2px auto">';
                                html += '<option value="">Veuillez selectionner le d&#233;partement</option>';
                            var len = d_newData.length;
                            for (var i = 0; i< len; i++) {
                                html += '<option value="' +d_newData[i][0] + '">' + d_newData[i][0]+ '</option>';
                            }
                                 html += '</select>';
                            html += '</td>';

                             html += '<td class="col-sm-6">';
                               html += '<select name="all_lib_service[]" class="form-control all_service" style="width: 100%;border: none;margin: 2px auto">';
                                html += '<option value="">Veuillez selectionner le service</option>';
                            var slen = s_newData.length;
                            for (var k = 0; k< slen; k++) {
                                html += '<option value="' +s_newData[k][0] + '">' + s_newData[k][0]+ '</option>';
                            }
                                 html += '</select>';
                            html += '</td>';

                        html += '</tr>';

                            $('.relation').append(html);


                             // departements
                              $("option").prop("disabled", false);
                               // Get an array of all current selections
                              var d_selected = [];
                              $(".all_depart").each(function () {
                                  d_selected.push($(this).val());
                              });
                              // Remove all selected options, except the current showing one, from all lists
                              $(".all_depart").each(function () {
                                  for (var i = 0; i < d_selected.length; i++) {
                                      if (d_selected[i] != $(this).val()) {
                                          $(this).find("option[value='" + d_selected[i] + "']").prop("disabled", true);
                                          //$(this).find("option[value='" + selected[i] + "']").remove();
                                      }
                                  }
                              });

                         // services

                           // Get an array of all current selections
                              var s_selected = [];
                              $(".all_service").each(function () {
                                  s_selected.push($(this).val());
                              });
                              // Remove all selected options, except the current showing one, from all lists
                              $(".all_service").each(function () {
                                  for (var k = 0; k < s_selected.length; k++) {
                                      if (s_selected[k] != $(this).val()) {
                                          $(this).find("option[value='" + s_selected[k] + "']").prop("disabled", true);
                                          //$(this).find("option[value='" + selected[i] + "']").remove();
                                      }
                                  }
                              });

         }
//////////END TREATMENT : RELATION INTERIEURE ////////////////////////


//////////BEGIN TREATMENT : ACTIVITE DU POSTE ////////////////////////

      /** load activite **/
    let linkpactivite =
    "/" +
    appName +
    "/interface/tpl/" +
    appName +
    "/POS/packages/load_pactivite.php";

     var init_pactivite='';
    function load_pactivite(){
         $.ajax({
                    url: linkpactivite,
                    type: "GET",
                     data:{   
                        init_pactivite:init_pactivite
                    },
                    success: function(data) {
                          $(".lib_pactivite").append(
                                     "<option value=''>Veuillez s&#233;lectionner le libell&#233;</option>"
                                     );
                         $('.lib_pactivite').append(data);
                    },
                    error: function(error) {
                        console.log(error);
                    },
                }); 
     }
    load_pactivite();

    /** insert PACTIVITE ***/
let linkpactiviteInsert =
    "/" +
    appName +
    "/interface/tpl/" +
    appName +
   "/POS/packages/insert_pactivite.php";

    $(document).on('change','.lib_pactivite',function(){
            


           $.ajax({
                url:linkpactiviteInsert,
                type:"GET",
                data:{
                    lib_pactivite:$(this).val()
                },
                success:function(response){
                        if(response==1){

                            $(".lib_pactivite").empty(); 
                              load_pactivite();
                        }
                      
                },
                error:function(error){
                    console.log(error);
                }
            });

            
    });




      /** load titre **/

      let linkptitre =
    "/" +
    appName +
    "/interface/tpl/" +
    appName +
    "/POS/packages/load_ptitre.php";

     var init_ptitre='';
    function load_ptitre(){
         $.ajax({
                    url: linkptitre,
                    type: "GET",
                     data:{   
                        init_ptitre:init_ptitre
                    },
                    success: function(data) {
                          $(".lib_ptitre").append(
                                     "<option value=''>Veuillez s&#233;lectionner le titre</option>"
                                     );
                         $('.lib_ptitre').append(data);
                    },
                    error: function(error) {
                        console.log(error);
                    },
                }); 
     }
    load_ptitre();

    /** insert PTITRE ***/
let linkptitreInsert =
    "/" +
    appName +
    "/interface/tpl/" +
    appName +
   "/POS/packages/insert_ptitre.php";

    $(document).on('change','.lib_ptitre',function(){
            
           $.ajax({
                url:linkptitreInsert,
                type:"GET",
                data:{
                    lib_ptitre:$(this).val()
                },
                success:function(response){
                        if(response==1){

                            $(".lib_ptitre").empty(); 
                              load_ptitre();
                        }
                },
                error:function(error){
                    console.log(error);
                }
            });
    });


 let link_url_allpactivite =
        "/" +
        appName +
        "/interface/tpl/" +
        appName +
        "/POS/packages/all_pactivite_actions.php";

let link_url_allptitre =
        "/" +
        appName +
        "/interface/tpl/" +
        appName +
        "/POS/packages/all_ptitre_actions.php";

$(document).on('click',"#ligne_Act",function(e){   

    
               // addRowAct();
                //$("#SuprimeAct").css("display","block");


                  $.ajax({
                    url: link_url_allpactivite,
                    type: "POST",
                    dataType: "json",
                    success: function(data_activites) {



                         $.ajax({
                            url: link_url_allptitre,
                            type: "POST",
                            dataType: "json",
                            success: function(data_titres) {

                                    console.log(data_activites,data_titres);
                                  //traitement des ajouts//

                                  var $dataRows =$('.activite');

                                   var tr=$dataRows.parent().parent();
                                     if(
                                          tr.find('.lib_pactivite:last').val()=="" || 
                                          tr.find('.lib_ptitre:last').val()=="" 
                                     ){
                                            $('#SuprimeAct').hide();
                                          alert("Veuillez bien renseigner les informations") ;
                                      }else{
                                        $("#SuprimeAct").css("display","block");
                                         addRow_pactivite_ptitre(data_activites,data_titres);

                                      }
                                  /////////////////////////
                                
                             },
                              error: function(error_titres) {
                                console.log(error_titres);
                             },

                            }); 
                    },
                    error: function(error_activites) {
                        console.log(error_activites);
                    },
                }); 


    e.preventDefault();
});
 function addRow_pactivite_ptitre(data_activites,data_titres){


             var ac_newData = data_activites;
             var tt_newData = data_titres;
                           var html = '';
                           html += '<tr>';
                           html += '<td class="col-sm-6">';
                               html += '<select name="lib_pactivite[]" class="form-control lib_pactivite" style="width: 100%;border: none;margin: 2px auto">';
                                html += '<option value="">Veuillez selectionner le libelld&#233;</option>';
                            var len = ac_newData.length;
                            for (var i = 0; i< len; i++) {
                                html += '<option value="' +ac_newData[i][0] + '">' + ac_newData[i][0]+ '</option>';
                            }
                                 html += '</select>';
                            html += '</td>';

                             html += '<td class="col-sm-6">';
                               html += '<select name="lib_ptitre[]" class="form-control lib_ptitre" style="width: 100%;border: none;margin: 2px auto">';
                                html += '<option value="">Veuillez selectionner le titre</option>';
                            var ttlen = tt_newData.length;
                            for (var k = 0; k< ttlen; k++) {
                                html += '<option value="' +tt_newData[k][0] + '">' + tt_newData[k][0]+ '</option>';
                            }
                                 html += '</select>';
                            html += '</td>';

                        html += '</tr>';

                            $('.activite').append(html);


                             // activites
                              $("option").prop("disabled", false);
                               // Get an array of all current selections
                              var ac_selected = [];
                              $(".lib_pactivite").each(function () {
                                  ac_selected.push($(this).val());
                              });
                              // Remove all selected options, except the current showing one, from all lists
                              $(".lib_pactivite").each(function () {
                                  for (var i = 0; i < ac_selected.length; i++) {
                                      if (ac_selected[i] != $(this).val()) {
                                          $(this).find("option[value='" + ac_selected[i] + "']").prop("disabled", true);
                                          //$(this).find("option[value='" + selected[i] + "']").remove();
                                      }
                                  }
                              });
         }



//////////END TREATMENT : ACTIVITE DU POSTE ////////////////////////

//////////BEGIN TREATMENT : MISSION DU POSTE ////////////////////////

  /***LOAD MISSION****/
let linkmission =
    "/" +
    appName +
    "/interface/tpl/" +
    appName +
    "/POS/packages/load_mission.php";

     var init_mission='';
    function load_mission(){
         $.ajax({
                    url: linkmission,
                    type: "GET",
                     data:{   
                        init_mission:init_mission
                    },
                    success: function(data) {
                          $(".lib_mission").append(
                                     "<option value=''>Veuillez s&#233;lectionner</option>"
                                     );
                         $('.lib_mission').append(data);
                    },
                    error: function(error) {
                        console.log(error);
                    },
                }); 
     }
    load_mission();

    /** insert MISSION***/
let linkmissionInsert =
    "/" +
    appName +
    "/interface/tpl/" +
    appName +
   "/POS/packages/insert_mission.php";

    $(document).on('change','.lib_mission',function(){
             //alert($(this).val());
             $.ajax({
                url:linkmissionInsert,
                type:"GET",
                data:{
                    lib_mission:$(this).val()
                },
                success:function(response){

                        if(response==1){

                           
                            $(".lib_mission").empty(); 
                              load_mission();
                        }

                      
                },
                error:function(error){
                    console.log(error);
                }
            });
    });


      /******Bouton ajouter MISSION ****/

    let linkaddmission =
    "/" +
    appName +
    "/interface/tpl/" +
    appName +
   "/POS/packages/add_load_mission.php";
    $(document).on('click','#ligne_mision',function(e){
                //addRowExts();
                $.ajax({
                    url: linkaddmission,
                    type: "GET",
                     data:{
                        init_mission:init_mission
                    },
                    success: function(data) {


                        var $dataRows =$('.mission');
                         var tr=$dataRows.parent().parent();


                         if(
                              tr.find('.lib_mission:last').val()=="" 
                         ){
                                $('#SuprimMis').hide();
                              alert("Veuillez bien renseigner les informations") ;
                          }else{
                            $("#SuprimMis").css("display","block");
                           addRow_mission(data);

                          } 
                    },
                    error: function(error) {
                        console.log(error);
                    },
                }); 

                 e.preventDefault(); 
    });


      function  addRow_mission(data){ 
         var newData = JSON.parse(data);
                           var html = '';
                           html += '<tr>';
                           html += '<td style="width: 100px;border:none;">';
                               html += '<select name="lib_mission[]" class="form-control lib_mission" style="width: 100%;border: none;margin: 2px auto">';
                                html += '<option value="">S&#233;lectionner le libell&#233; </option>';
                            var len = newData.length;
                            for (var i = 0; i< len; i++) {
                                html += '<option value="' +newData[i][0] + '">' + newData[i][0]+ '</option>';
                            }
                                 html += '</select>'+
                            '</tr>';

                            $('.mission').append(html);

                             // Show all options
                              $("option").prop("disabled", false);
                               // Get an array of all current selections
                              var selected = [];
                              $(".lib_mission").each(function () {
                                  selected.push($(this).val());
                              });
                              // Remove all selected options, except the current showing one, from all lists
                              $(".lib_mission").each(function () {
                                  for (var i = 0; i < selected.length; i++) {
                                      if (selected[i] != $(this).val()) {
                                          $(this).find("option[value='" + selected[i] + "']").prop("disabled", true);
                                          //$(this).find("option[value='" + selected[i] + "']").remove();
                                      }
                                  }
                              });
                              //// 
    }


//////////END TREATMENT : MISSION DU POSTE ////////////////////////


//////////BEGIN TREATMENT : INDICATEUR DE PERFORMANCE DU POSTE ////////////////////////


 /***LOAD IND PERFORMANCE****/
let linkindperforma =
    "/" +
    appName +
    "/interface/tpl/" +
    appName +
    "/POS/packages/load_indperforma.php";
     var init_indperforma='';
    function load_indperforma(){
         $.ajax({
                    url: linkindperforma,
                    type: "GET",
                     data:{   
                        init_indperforma:init_indperforma
                    },
                    success: function(data) {
                          $(".lib_indperforma").append(
                                     "<option value=''>Veuillez s&#233;lectionner</option>"
                                     );
                         $('.lib_indperforma').append(data);
                    },
                    error: function(error) {
                        console.log(error);
                    },
                }); 
     }
    load_indperforma();

    /** insert IND PERFORMANCE***/
let linkindperformaInsert =
    "/" +
    appName +
    "/interface/tpl/" +
    appName +
   "/POS/packages/insert_indperforma.php";

    $(document).on('change','.lib_indperforma',function(){
             //alert($(this).val());
             $.ajax({
                url:linkindperformaInsert,
                type:"GET",
                data:{
                    lib_indperforma:$(this).val()
                },
                success:function(response){

                        if(response==1){

                           
                            $(".lib_indperforma").empty(); 
                              load_indperforma();
                        }

                      
                },
                error:function(error){
                    console.log(error);
                }
            });
    });


 /******Bouton ajouter IND PERFORMA ****/

    let linkaddindperforma =
    "/" +
    appName +
    "/interface/tpl/" +
    appName +
   "/POS/packages/add_load_indperforma.php";
    $(document).on('click','#ligne_indicateur',function(e){
                //addRowExts();
                $.ajax({
                    url: linkaddindperforma,
                    type: "GET",
                     data:{
                        init_indperforma:init_indperforma
                    },
                    success: function(data) {


                        var $dataRows =$('.indicateur');
                         var tr=$dataRows.parent().parent();


                         if(
                              tr.find('.lib_indperforma:last').val()=="" 
                         ){
                                $('#SuprimInd').hide();
                              alert("Veuillez bien renseigner les informations") ;
                          }else{
                            $("#SuprimInd").css("display","block");
                           addRow_indperforma(data);

                          } 
                    },
                    error: function(error) {
                        console.log(error);
                    },
                }); 

                 e.preventDefault(); 
    });


      function  addRow_indperforma(data){ 
         var newData = JSON.parse(data);
                           var html = '';
                           html += '<tr>';
                           html += '<td style="width: 100px;border:none;">';
                               html += '<select name="lib_indperforma[]" class="form-control lib_indperforma" style="width: 100%;border: none;margin: 2px auto">';
                                html += '<option value="">S&#233;lectionner le libell&#233; </option>';
                            var len = newData.length;
                            for (var i = 0; i< len; i++) {
                                html += '<option value="' +newData[i][0] + '">' + newData[i][0]+ '</option>';
                            }
                                 html += '</select>'+
                            '</tr>';

                            $('.indicateur').append(html);

                             // Show all options
                              $("option").prop("disabled", false);
                               // Get an array of all current selections
                              var selected = [];
                              $(".lib_indperforma").each(function () {
                                  selected.push($(this).val());
                              });
                              // Remove all selected options, except the current showing one, from all lists
                              $(".lib_indperforma").each(function () {
                                  for (var i = 0; i < selected.length; i++) {
                                      if (selected[i] != $(this).val()) {
                                          $(this).find("option[value='" + selected[i] + "']").prop("disabled", true);
                                          //$(this).find("option[value='" + selected[i] + "']").remove();
                                      }
                                  }
                              });
                              //// 
    }

//////////END TREATMENT : INDICATEUR DE PERFORMANCE DU POSTE ////////////////////////