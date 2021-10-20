
let appName =$('.appName').val();


let link_urldest =
    "/"+
    appName+
    "/interface/tpl/"+
    appName+
    "/FRS/Mes_scripts_ihm/destination.php";

let link_urlprof =
    "/"+
    appName+
    "/interface/tpl/"+
    appName+
    "/FRS/Mes_scripts_ihm/profil.php";


 let link_urlbesoin =
    "/"+
    appName+
    "/interface/tpl/"+
    appName+
    "/FRS/Mes_scripts_ihm/besoin.php";



	//DEBUT CALCUL MONTANT 

	function total_price(a,b){
		return parseInt(a)+parseInt(b);
	}
 
 var tab_prix1=0;
 var tab_prix2=0;
 var somme=0;

$(document).on('keyup keydown','.amount',function(e) {
    
	var total1=0;
	var amount1=0;
	$('.amount').each(function(i,e){
		if (isNaN(parseInt($(this).val()))) {
 			amount1=0;
		}else{
			var amount1=parseInt($(this).val())-0;
			total1 +=amount1;
		}
	});
    tab_prix1=[];
	tab_prix1.push(total1);
	somme=parseInt(total_price(tab_prix1,tab_prix2));
	$('.totalprice').val(somme);

	$('.montant').html(somme.formatMoney(0,'.',',')+" FCFA");

 	//console.log(' tab_prix1 : ',tab_prix1[0]);
});

var $dataRows =$('.tableL');
var tr=$dataRows.parent().parent();
$(document).on('keyup keydown','.pu',function(e) {
   
    var total2=0;
	var amount2=0;
	$('.pu').each(function(i,e){
		if (isNaN(parseInt($(this).val()))) {
 			pu2=0;
		}else{
			var pu2=parseInt($(this).val())-0;
			total2 +=pu2;
		}
	});
    tab_prix2=[];
	tab_prix2.push(total2);

	somme=total_price(tab_prix1,tab_prix2);

	$('.totalprice').val(somme);

	$('.montant').html(somme.formatMoney(0,'.',',')+" FCFA");
	//console.log(' tab_prix2 : ',tab_prix2[0]);
});


	/////////////////////



    //DEBUT DESTINATION
	    const getdestination =()=>{
          return new Promise((resolve,reject)=>{
                $.ajax({
			            url: link_urldest,
			            type: "POST",
			           
			            success: function(data) {
			                resolve(data);
			            },
			            error: function(error) {
			                reject(error);
			            },
			        });
          });
	    }

          

	    getdestination()
	    .then(data=>{
	    	let donnees_dest=data.destinations;
	    	var html = '';
 		   		 html += '<option value="">Veuillez s&#233;lectionner</option>';
		    		for (var i = 0; i < data.destinations.length; i++) {
	        	html += '<option value="' + donnees_dest[i]['id'] + '"  '+(donnees_dest[i]['id']==$('.interdestination').val() ? "selected" : "")+'       >' +donnees_dest[i]['valeur'] + '</option>';
					 	}
 		     $('.destination').append(html);
 
	    }).catch(err=>console.log(err));

	    //FIN DESTINATION



		
////////// GET ESTIMATION DE PROFIL ET DESTINATION //////////////////

var link_urldest_profil =
    "/"+
    appName+
    "/interface/tpl/"+
    appName+
    "/FRS/consult/dest_profil.php";


const get_dest_profil =(profil,destination)=>{
	return new Promise((resolve,reject)=>{
		  $.ajax({
				  url: link_urldest_profil,
				  data:{
					profil:profil,
					destination:destination
				  },
				  type: "POST",
				  success: function(data) {
					  resolve(data);
				  },
				  error: function(error) {
					  reject(error);
				  },
			  });
	});
}

$(document).on('change',' .destination , .profil',function(){

	var prof =$('.profil').val();
	var dest =$('.destination').val();

	get_dest_profil(prof,dest)
		.then(data=>{
			var get_data=JSON.parse(data);
			$('.lib_destination').val(get_data.data[1].destination);
			$('.lib_profil').val(get_data.data[0].profil);

		}).catch(err=>console.log(err));
});


////////////////////////////////////////////////////////////////


	    //DEBUT PROFIL

	    const getprofil =()=>{
          return new Promise((resolve,reject)=>{
                $.ajax({
			            url: link_urlprof,
			            type: "POST",
			            success: function(data) {
			                resolve(data);
			            },
			            error: function(error) {
			                reject(error);
			            },
			        });
          });
	    }

	    getprofil()
	    .then(data=>{
	    	let donnees_profil=data.profils;
	    	var html = '';
 		   		 html += '<option value="">Veuillez s&#233;lectionner</option>';
		    		for (var i = 0; i < data.profils.length; i++) {
	        	html += '<option value="' + donnees_profil[i]['id'] + '"  '+(donnees_profil[i]['id']==$('.interprofil').val() ? "selected" : "")+'       >' +donnees_profil[i]['valeur'] + '</option>';
					 	}
 		     $('.profil').append(html);
	    }).catch(err=>console.log(err));

	    //FIN PROFIL




	    //checked
	    $(document).on('click','.btn_check',function(){
		     if($(this).is(':checked')==true){
		         $('.btn_check_val').val(true);
		     }if($(this).is(':checked')==false){
		         $('.btn_check_val').val(false);
		     }
		 });




	// select2 
    function select2(){
    	$('.select2').select2({
            theme:'bootstrap4',
            tags:true,
            allowClear: true
        });
    }
    select2();



	// Script pour supprimer une ligne
    $(document).on('click','.Suprim',function(){
		  let rowcount=$('.tableligne > .nvlligne').children().length;

		  ///recalcul les pu
		  var total2=0;
		  var amount2=0;
		  $('.pu').each(function(i,e){
			  if (isNaN(parseInt($(this).val()))) {
				   pu2=0;
			  }else{
				  var pu2=parseInt($(this).val())-0;
				  total2 +=pu2;
			  }
		  });
		  tab_prix2=[];
		  tab_prix2.push(total2);

		  var removep=parseInt(tr.find(".pu:last").val());

		  console.log('remove price : '+removep);
	  
		  somme= parseInt(total_price(tab_prix1,tab_prix2))-parseInt(removep);

		  $('.totalprice').val(somme);

 
		  $('.montant').html(somme.formatMoney(0,'.',',')+" FCFA");
		  

		  /////////////

		  if(rowcount==2){
		  	$(this).hide();
		 }else{$(this).show();}
        $('.nvlligne tr:gt(0):last').remove();
	});


	//Ajouter une ligne a la table
	$(".Suprim").hide(); // masquer le bouton de supression
	$(".addRowRl").click(function(){   
		 getBesoin()
		    .then(data=>{
		    	addRowRl(data.besoins);
		    }).catch(err=>console.log(err));
		$(".Suprim").show(); 
    });


    //DEBUT ADD BESOIN

    const getBesoin=()=>{
    	return new Promise((resolve,reject)=>{
    		$.ajax({
	            url: link_urlbesoin,
	            type: "POST",
	            success: function(data) {
 	                resolve(data);
	            },
	            error: function(error) {
	                reject(error);
	            },
	        });

    	});
    }


     getBesoin()
    .then(data=>{
    	addRowRl(data.besoins);
    }).catch(err=>console.log(err));


 	function  addRowRl(donnees_besn){ 

		var newData = donnees_besn;

        var newDataLength=newData.length;
   
			 
			var Nouvell_ligne ='';
	  
	  	Nouvell_ligne +='<tr>';
			Nouvell_ligne +='<td style="width: 90px;border:none;">';
				Nouvell_ligne +='<select name="besoins[]" class="form-control besoin select2" style="width: 95%">';
					Nouvell_ligne +='<option>Veuillez selectionnez</option>';
					for (var i = 0; i < newDataLength; i++) {
				        	Nouvell_ligne += '<option value="' + newData[i]['id'] + '"    >' +newData[i]['valeur'] + '</option>';
					}
				    
					
				Nouvell_ligne += '</select>';
			Nouvell_ligne +='</td>';
			Nouvell_ligne +='<td style="width: 70px;border:none;">';
				Nouvell_ligne +='<input type="text" name="pu[]" placeholder="Prix unitaire" class="form-control pu">';
			Nouvell_ligne +='</td>';
		Nouvell_ligne +='</tr>';


      	$('.nvlligne').append(Nouvell_ligne);
      	select2();

      	 // Show all options
		    $("option").prop("disabled", false);

		    // Get an array of all current selections
		    var selected = [];
		    $(".besoin").each(function() {
		        selected.push($(this).val());
		    });
		    // Remove all selected options, except the current showing one, from all lists
		    $(".besoin").each(function() {
		        for (var i = 0; i < selected.length; i++) {
		            if (selected[i] != $(this).val()) {
		                $(this).find("option[value='" + selected[i] + "']").prop("disabled", true);

		                //$(this).find("option[value='" + selected[i] + "']").remove();
		            }
		        }
		    });

	}


 //FIN ADD BESOIN


