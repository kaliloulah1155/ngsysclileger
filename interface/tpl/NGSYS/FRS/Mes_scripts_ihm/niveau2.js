
var appName =$('.appName').val();

 

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

var link_urldest_profil =
    "/"+
    appName+
    "/interface/tpl/"+
    appName+
    "/FRS/consult/dest_profil.php";

 
$('.montant').html(parseInt($('.totalprice').val()).formatMoney(0,'.',',')+" FCFA");


////////// GET ESTIMATION DE PROFIL ET DESTINATION //////////////////

var profil =$('.interprofil').val();
var destination =$('.interdestination').val();

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

get_dest_profil(profil,destination)
.then(data=>{
	var get_data=JSON.parse(data);
	$('.lib_destination').val(get_data.data[1].destination);
	$('.lib_profil').val(get_data.data[0].profil);

}).catch(err=>console.log(err));


////////////////////////////////////////////////////////////////

var tab_out_prix2=[];

function get_tot_tab (tab,total_init){
	tab.push(total_init)
	return tab;
}
  //////////////LOAD ROW FRAIS DESTINATION ////////////////

  var link_urlrow ="/"+
    appName+
    "/interface/tpl/"+
    appName+
    "/FRS/consult/row_frs.php";

      var load_code=$('.loadcode').val();

	  

      const row_tab = (code)=>{
		  return new Promise((resolve,reject)=>{
                $.ajax({
			            url: link_urlrow,
						data:{
							code_key:code,
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

	  row_tab(load_code)
	  .then(data=>{
		  $(".tableL").html(data);

		  //get all amount of table 
		  var amount_init=0;
		  var total_init=0;
		  $(".pu").each(function() {
			if (isNaN(parseInt($(this).val()))) {
				amount_init=0;
		   }else{
			   var amount_init=parseInt($(this).val())-0;
			   total_init +=amount_init;
		   }
		});
		get_total_tab(load_code);
 	 
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

	  }).catch(err=>console.log(err));
	  
  async function get_total_tab(load_code) {
			var  restab=await row_tab(load_code).then(data=>{
				//get all amount of table 
				var amount_init1=0;
				var total_init1=0;
				$(".pu").each(function() {
				  if (isNaN(parseInt($(this).val()))) {
					  amount_init1=0;
				 }else{
					 var amount_init1=parseInt($(this).val())-0;
					 total_init1 +=amount_init1;
				 }
			  });
			  return total_init1;
			});

			var  restinput=await row_tab(load_code).then(data=>{
				//get all amount of table 
				var amount_init2=0;
				var total_init2=0;
				$(".amount").each(function() {
				  if (isNaN(parseInt($(this).val()))) {
					  amount_init2=0;
				 }else{
					 var amount_init2=parseInt($(this).val())-0;
					 total_init2 +=amount_init2;
				 }
			  });
			  return total_init2;
			});

			 
			console.log(' restab ',restab); //total price tableau
			console.log('restinput ',restinput); //total price input


			function total_price(a,b){
				return parseInt(a)+parseInt(b);
			}
		 
		  var tab_prix1=parseInt(restinput);
	      var tab_prix2=parseInt(restab);
		 
		//  var somme=0;
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
	
		});
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
			 
		});
		
			


			////////////////////////
		    
		 




}


	 // get_total_tab(load_code);
	  


  ////////////////////////////////////////////////////////

	//DEBUT CALCUL MONTANT 
 
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
	    // $(document).on('click','.btn_check',function(){
		//      if($(this).is(':checked')==true){
		//          $('.btn_check_val').val(true);
		//      }if($(this).is(':checked')==false){
		//          $('.btn_check_val').val(false);
		//      }
		//  });




	// select2 
    function select2(){
    	$('.select2').select2({
            theme:'bootstrap4',
            tags:true,
            allowClear: true
        });
    }
    select2();


    //les autres besions 
   /// $('.autresBesions').hide();

    $('input[type="checkbox"]').click(function(){
	    if($(this).prop("checked") == true){
	      // alert("Checkbox est coché.");
	      $('.autresBesions').show();
	    }
	    else if($(this).prop("checked") == false){
	      // alert("Checkbox n'est pas coché.");
	      $('.autresBesions').hide();
	    }
	});



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

		  //console.log('remove price : '+removep);
	  
		  somme= parseInt(total_price(tab_prix1,tab_prix2))-parseInt(removep);

		  $('.totalprice').val(somme);

 
		  $('.montant').html(somme.formatMoney(0,'.',',')+" FCFA");
		  

		  /////////////

		  if(rowcount==2){
		  	$(this).hide();
		 }else{$(this).show();}
        $('.nvlligne tr:gt(0):last').remove();
	});


	//Debut ajouter de ligne a la table
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


    //  getBesoin()
    // .then(data=>{
    // 	addRowRl(data.besoins);
    // }).catch(err=>console.log(err));


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


