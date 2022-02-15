
var loadcode=$('.loadcode').val();



 // Action de modification    
$(document).on('click','.bouton_sub',function(e){

     var val_modif=$('.action_hermes').val();

    var action_modif = val_modif.slice(0, 10);

           
    if(action_modif=='AA_MOD_POS'){
    //RELATION EXTERIEURES
    var lib_relexterne = $("select[name='lib_relexterne[]']")
        .map(function() {
            return $(this).val();
        })
        .get(); 
	  relexterieure(loadcode,lib_relexterne); // insert into relexterieure


	 //RELATION INTERIEURES
	 var lib_depart = $("select[name='all_lib_depart[]']")
        .map(function() {
            return $(this).val();
        })
        .get(); 

        var lib_service = $("select[name='all_lib_service[]']")
        .map(function() {
            return $(this).val();
        })
        .get(); 
        relinterieure(loadcode,lib_depart,lib_service); // insert into relinterieure

       //ACTIVITE DU POSTE

       var lib_pactivite = $("select[name='lib_pactivite[]']")
        .map(function() {
            return $(this).val();
        })
        .get(); 

        var lib_ptitre = $("select[name='lib_ptitre[]']")
        .map(function() {
            return $(this).val();
        })
        .get(); 

       // console.log(lib_pactivite,lib_ptitre);
     activite_titre(loadcode,lib_pactivite,lib_ptitre); // insert into activite du poste

       //MISSION DU POSTE
        var lib_mission = $("select[name='lib_mission[]']")
        .map(function() {
            return $(this).val();
        })
        .get(); 

       // console.log(lib_mission);
       mission_reg(loadcode,lib_mission); // insert into mission




        //INDICATEUR DE PERFORMANCE DU POSTE
        var lib_indperforma = $("select[name='lib_indperforma[]']")
        .map(function() {
            return $(this).val();
        })
        .get(); 
       indicatperformance(loadcode,lib_indperforma); // insert into ind performance

       //QUALITE DOMINANTE DU POSTE
        var lib_qualdom = $("select[name='lib_qualdom[]']")
        .map(function() {
            return $(this).val();
        })
        .get(); 
       qualitedominante(loadcode,lib_qualdom); // insert into qualité dominante
 
    }
    //e.preventDefault();

});

let linkreg_relexterne =
    "/" +
    appName +
    "/interface/tpl/" +
    appName +
    "/POS/packages/register_relexterne.php";

function relexterieure(loadcode,lib_relexterne){
	$.ajax({
            url: linkreg_relexterne,
            type: "GET",
            data: {
                loadcode:loadcode,
                lib_relexterne:lib_relexterne
            },
            success: function(data) {
               //console.log(data);
            },
            error: function(error) {
                console.log(error);
            },
        });
}

let linkreg_relinterne =
    "/" +
    appName +
    "/interface/tpl/" +
    appName +
    "/POS/packages/register_relinterne.php";

   function relinterieure(loadcode,lib_depart,lib_service){
	$.ajax({
            url: linkreg_relinterne,
            type: "GET",
            data: {
                loadcode:loadcode,
                lib_depart:lib_depart,
                lib_service:lib_service
            },
            success: function(data) {
              // console.log(data);
            },
            error: function(error) {
                console.log(error);
            },
        });

	}


  let linkreg_acticvite =
    "/" +
    appName +
    "/interface/tpl/" +
    appName +
    "/POS/packages/register_activite.php";

  function activite_titre(loadcode,lib_pactivite,lib_ptitre){

  	   $.ajax({
            url: linkreg_acticvite,
            type: "GET",
            data: {
                loadcode:loadcode,
                lib_pactivite:lib_pactivite,
                lib_ptitre:lib_ptitre
            },
            success: function(data) {
               //console.log(data);
            },
            error: function(error) {
                console.log(error);
            },
        });

  }

  let linkreg_mission =
    "/" +
    appName +
    "/interface/tpl/" +
    appName +
    "/POS/packages/register_mission.php";

function mission_reg(loadcode,lib_mission){
	$.ajax({
            url: linkreg_mission,
            type: "GET",
            data: {
                loadcode:loadcode,
                lib_mission:lib_mission
            },
            success: function(data) {
              // console.log(data);
            },
            error: function(error) {
                console.log(error);
            },
        });
}


  let linkreg_indperforma =
    "/" +
    appName +
    "/interface/tpl/" +
    appName +
    "/POS/packages/register_indperforma.php";

function indicatperformance(loadcode,lib_indperforma){
	$.ajax({
            url: linkreg_indperforma,
            type: "GET",
            data: {
                loadcode:loadcode,
                lib_indperforma:lib_indperforma
            },
            success: function(data) {
              // console.log(data);
            },
            error: function(error) {
                console.log(error);
            },
        });

}


 let linkreg_qualdom =
    "/" +
    appName +
    "/interface/tpl/" +
    appName +
    "/POS/packages/register_qualdom.php";

function qualitedominante(loadcode,lib_qualdom){

	$.ajax({
            url: linkreg_qualdom,
            type: "GET",
            data: {
                loadcode:loadcode,
                lib_qualdom:lib_qualdom
            },
            success: function(data) {
              // console.log(data);
            },
            error: function(error) {
                console.log(error);
            },
        });


}