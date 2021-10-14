
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


    //les autres besions 
    $('.autresBesions').hide();

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


