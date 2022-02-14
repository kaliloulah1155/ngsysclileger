let appName = $(".appName").val();

let link_url_prs =
    "/" +
    appName +
    "/interface/tpl/" +
    appName +
    "/DFM/packs/load_personnel.php";


let link_url_addprs =
    "/" +
    appName +
    "/interface/tpl/" +
    appName +
    "/DFM/packs/add_personnel.php";

    var init_personnel='';
    function load_personnel(){
         $.ajax({
                    url: link_url_prs,
                    type: "POST",
                     data:{
                        init_personnel:init_personnel
                    },
                    success: function(data) {
                          $(".lib_personnel").append(
                                     "<option value='0'>Veuillez s&#233;lectionner</option>"
                                     );
                         $('.lib_personnel').append(data);
                    },
                    error: function(error) {
                        console.log(error);
                    },
                }); 
     }
    load_personnel();




    /******Bouton ajouter ****/


     $(document).on('click','#ligneNvlls',function(e){
                //addRowExts();
                $.ajax({
                    url: link_url_addprs,
                    type: "GET",
                     
                    success: function(data) {


                        var $dataRows =$('.estimation');
                         var tr=$dataRows.parent().parent();


                         if(
                              tr.find('.lib_personnel:last').val()=="" 
                         ){
                                $('#suprimeNvlls').hide();
                              alert("Veuillez bien renseigner les informations") ;
                          }else{
                           $("#suprimeNvlls").css("display","block");
                           add_load_personnel(data);

                          } 
                    },
                    error: function(error) {
                        console.log(error);
                    },
                }); 

                 e.preventDefault(); 
    });


    

     var init_addpersonnel='';
    function add_load_personnel(data){
     
                   var newData = JSON.parse(data);
                     
                            //console.log(newData[i][0],newData[i][1],newData[i][2]);
                          var html = '';
                        html += '<tr>';
                           html += '<td style="width: 30px; border: 1px solid">';
                               html += '<select name="personnel[]" class="form-control lib_personnel" style="width: 100%;border: none;margin: 2px auto">';
                                html += '<option value="">Veuillez s&#233;lectionner</option>';
                            var len = newData.length;
                            for (var i = 0; i< len; i++) {
                                if(newData[i][0]!=null){
                                     html += '<option value="' +newData[i][0] + '">' + newData[i][1]+' '+newData[i][2]+'</option>';
                                }
                            }
                                 html += '</select>';

                       html +='<td style="width: 45px; border: 1px solid">';
                            html +='<input name="civilite[]" type="text" class="form-control civilite" style="width: 100%;background: transparent;">';
                        html +='</td>';
                        html +='<td style="width: 45px; border: 1px solid">';
                            html +='<input name="datenaiss[]" type="text" class="form-control datenaiss" style="width: 100%;background: transparent;">';
                        html +='</td>';
                        html +='<td style="width: 45px; border: 1px solid">';
                            html +='<input name="nationalite[]" type="text" class="form-control nationalite" style="width: 100%;background: transparent;">';
                        html +='</td>';
                        html +='<td style="width: 45px; border: 1px solid">';
                            html +='<input name="fonction[]" type="text" class="form-control fonction" style="width: 100%;background: transparent;">';
                        html +='</td>';
                        html +='<td style="width: 45px; border: 1px solid">';
                            html +='<input name="categorie[]" type="text" class="form-control categorie" style="width: 100%;background: transparent;">';
                        html +='</td>';
                        html +='<td style="width: 45px; border: 1px solid">';
                            html +='<input name="dtembauche[]" type="text" class="form-control dtembauche" style="width: 100%;background: transparent;">';
                        html +='</td>';
                        html +='<td style="width: 45px; border: 1px solid">';
                            html +='<input name="cnps[]" type="text" class="form-control cnps" style="width: 100%;background: transparent;">';
                        html +='</td>';
                        html +='<td style="width: 45px; border: 1px solid">';
                            html +='<input name="position[]" type="text" class="form-control position" style="width: 100%;background: transparent;">';
                        html +='</td>';
                        html +='</tr>';

                            $('.estimation').append(html);

                            // Show all options
                              $("option").prop("disabled", false);

                               // Get an array of all current selections
                              var selected = [];
                              $(".lib_personnel").each(function () {
                                  selected.push($(this).val());
                              });

                              // Remove all selected options, except the current showing one, from all lists
                              $(".lib_personnel").each(function () {
                                  for (var i = 0; i < selected.length; i++) {
                                      if (selected[i] != $(this).val()) {
                                          $(this).find("option[value='" + selected[i] + "']").prop("disabled", true);

                                          //$(this).find("option[value='" + selected[i] + "']").remove();
                                      }
                                  }
                              });
                              //// 
                   
          
     }
 
 let link_url_infoprs =
    "/" +
    appName +
    "/interface/tpl/" +
    appName +
    "/DFM/packs/get_pers_info.php";

    $('tbody').delegate('.lib_personnel','change',function(){
      var tr=$(this).parent().parent();
      var email=tr.find('.lib_personnel').val();
     // var pu=tr.find('.pu1').val();

      //tr.find('.tot1').val(amount);

     // alert(email);

         $.ajax({
                    url: link_url_infoprs,
                    type: "POST",
                    data:{
                        email:email
                    },
                    success: function(data) {

                      var newData = JSON.parse(data);

                      //console.log(newData['civ']);

                      
                        tr.find('.civilite').val(newData['civ']);
                        tr.find('.datenaiss').val(newData['dtenaiss']);

                        tr.find('.nationalite').val(newData['nationalite']);
                        tr.find('.nationalite').prop('title', newData['nationalite']);

                        tr.find('.fonction').val(newData['fonction']);
                        tr.find('.fonction').prop('title', newData['fonction']);

                        tr.find('.dtembauche').val(newData['date_embauche']);

                        tr.find('.categorie').val(newData['categorie']);

                         tr.find('.cnps').val(newData['cnps']);
                         tr.find('.cnps').prop('title', newData['cnps']);

                         tr.find('.position').val(newData['position']);
                         tr.find('.position').prop('title', newData['position']); 


                        

                         

                           // console.log(newData[1]);
                    },
                    error: function(error) {
                        console.log(error);
                    },
                }); 


     // alert(email) ;

    });


    
        
   //*** AA_MOD_DFM***/
$(document).on('click','.bouton_sub',function(e){

    var val_modif=$('.action_hermes').val();

    var action_modif = val_modif.slice(0, 10);

           
    if(action_modif=='AA_MOD_DFM'){

        var code=$('.loadcode').val();
    //DATA FROM DEMANDE DE FORMATION

    var personnel = $("select[name='personnel[]']")
        .map(function() {
            return $(this).val();
        })
        .get();

    var civilite = $("input[name='civilite[]']")
        .map(function() {
            return $(this).val();
        })
        .get();
    var datenaiss = $("input[name='datenaiss[]']")
        .map(function() {
            return $(this).val();
        })
        .get();
     var nationalite = $("input[name='nationalite[]']")
        .map(function() {
            return $(this).val();
        })
        .get();
    var fonction = $("input[name='fonction[]']")
        .map(function() {
            return $(this).val();
        })
        .get();
     var categorie = $("input[name='categorie[]']")
        .map(function() {
            return $(this).val();
        })
        .get();
     var dtembauche = $("input[name='dtembauche[]']")
        .map(function() {
            return $(this).val();
        })
        .get();
    var cnps = $("input[name='cnps[]']")
        .map(function() {
            return $(this).val();
        })
        .get();
    var position = $("input[name='position[]']")
        .map(function() {
            return $(this).val();
        })
        .get();


//console.log(personnel,civilite,datenaiss,nationalite,fonction,categorie,dtembauche,cnps,position) ;
       reg_dfm(code,personnel,civilite,datenaiss,nationalite,fonction,categorie,dtembauche,cnps,position);
    }
       // e.preventDefault();
});

 let link_url_reg =
    "/" +
    appName +
    "/interface/tpl/" +
    appName +
    "/DFM/packs/register_dfm.php";


function reg_dfm(loadcode,personnel,civilite,
        datenaiss,nationalite,fonction,categorie,
        dtembauche,cnps,position){
    $.ajax({
            url: link_url_reg,
            type: "POST",
            data: {
                loadcode:loadcode,
                personnel:personnel,
                civilite:civilite,
                datenaiss:datenaiss,
                nationalite:nationalite,
                fonction:fonction,
                categorie:categorie,
                dtembauche:dtembauche,
                cnps:cnps,
                position:position
            },
            success: function(data) {
               console.log(data);
            },
            error: function(error) {
                console.log(error);
            },
        });
}


 

//CHARGEMENT DES ENTREPRISES
let linkentreprise =
    "/" +
    appName +
    "/interface/tpl/" +
    appName +
    "/DFM/packs/entreprise.php";

     var init_entreprise=$('.interselectentreprise').val();
     function load_entreprise(){
         $.ajax({
                    url: linkentreprise,
                    type: "POST",
                    data:{
                        init_entreprise:init_entreprise
                    },
                    success: function(data) {
                            

                             $(".entreprise").append(
                                     "<option value='0'>Veuillez s&#233;lectionner</option>"
                                     );

                          $('.entreprise').append(data);


                    },
                    error: function(error) {
                        console.log(error);
                    },
                }); 
     }

load_entreprise();

 ////checkbox
$(document).on('click','.cbk1',function(){
     if($('.cbk1').is(':checked')==true){
         $('.cbk1').val('OUI');
     }if($('.cbk1').is(':checked')==false){
         $('.cbk1').val('NON');
     }
 });

$(document).on('click','.cbk2',function(){
     if($('.cbk2').is(':checked')==true){
         $('.cbk2').val('OUI');
     }if($('.cbk2').is(':checked')==false){
         $('.cbk2').val('NON');
     }
});



