//alert(appN);


// CHARGEMENT DES DIPLOMES
let linkdiplome =
    "/" +
    appN +
    "/interface/tpl/" +
    appN +
    "/COT/specifique/stage_ecole/diplome.php";


    


     function load_diplome(){
     	 $.ajax({
                    url: linkdiplome,
                    type: "GET",
                    success: function(data) {
                    		

                    		 $(".diplome").append(
               						 "<option value='0'>Veuillez s&#233;lectionner</option>"
               						 );

                          $('.diplome').append(data);


                    },
                    error: function(error) {
                        console.log(error);
                    },
                }); 
     }

//INSERTION LORSQUE C'EST UN NOUVEAU DIPLOME
 let linkdiplomeInsert =
    "/" +
    appN +
    "/interface/tpl/" +
    appN +
    "/COT/specifique/stage_ecole/diplome_insert.php";



   $(document).on('change','.diplome',function(){

    	     //alert($(this).val());

    	     $.ajax({
      	    	url:linkdiplomeInsert,
      	    	type:"GET",
      	    	data:{
      	    		diplome:$(this).val()
      	    	},
      	    	success:function(response){

      	    	 		
      	    	 		if(response==1){

      	    	 			$(".diplome").empty(); 
      	    	 			  load_diplome();
      	    	 		}

      	    		  
      	    	},
      	    	error:function(error){
      	    		console.log(error);
      	    	}
      	    });


    });



//CHARGEMENT DES FILIERES
let linkfiliere =
    "/" +
    appN +
    "/interface/tpl/" +
    appN +
    "/COT/specifique/stage_ecole/filiere.php";


     function load_filiere(){
     	 $.ajax({
                    url: linkfiliere,
                    type: "GET",
                    success: function(data) {
                    		

                    		 $(".filiere").append(
               						 "<option value='0'>Veuillez s&#233;lectionner</option>"
               						 );

                          $('.filiere').append(data);


                    },
                    error: function(error) {
                        console.log(error);
                    },
                }); 
     }




//INSERTION LORSQUE C'EST UN NOUVELLE FILIERE
 let linkdfiliereInsert =
    "/" +
    appN +
    "/interface/tpl/" +
    appN +
    "/COT/specifique/stage_ecole/filiere_insert.php";

   $(document).on('change','.filiere',function(){

    	     //alert($(this).val());
    	     $.ajax({
      	    	url:linkdfiliereInsert,
      	    	type:"GET",
      	    	data:{
      	    		filiere:$(this).val()
      	    	},
      	    	success:function(response){
      	    	 		if(response==1){

      	    	 			$(".filiere").empty(); 
      	    	 			  load_filiere();
      	    	 		}
      	    	},
      	    	error:function(error){
      	    		console.log(error);
      	    	}
      	    });
    });


//CALCUL DES DUREES DATE DE FIN
$(document).on('change','.ecole_datedeb , .ecole_duree',function(){


	ConvNumberLetter($('.ecole_duree').val()); 


	if($('.ecole_datedeb').val() !=''){

	   dureemois=parseInt($('.ecole_duree').val());
       var datedeb_sp=($('.ecole_datedeb').val()).split('/');

       var datedeb_sp_str=datedeb_sp[2]+'-'+datedeb_sp[1]+'-'+datedeb_sp[0];


       //console.log(datedeb_sp_str);

         var formattedDateStart = new Date( datedeb_sp_str); //date de debut
         var result_date_mois = addMonths(formattedDateStart,parseInt(dureemois)+1);   //calcul des durees en mois


			 var d = result_date_mois.getDate();
			 var m =  result_date_mois.getMonth();
			 m += 1;  // JavaScript months are 0-11
			 var y = result_date_mois.getFullYear();

			  d1 = d > 9 ? d : '0'+d;
              m1 = m > 9 ? m : '0'+m;

			  formatDeb= d1 + "/" + m1 + "/" + y;

			  d1 = d > 9 ? d : '0'+d;
              m1 = m > 9 ? m : '0'+m;

			  formatDeb= d1 + "/" + m1 + "/" + y;

			date1=y+"-" +m1+"-"+ d1;  

			//console.log(date1); //Date de fin contrat format: 2019-10-02

			timestpdeb=new Date(date1);
            tamp1=parseInt( parseInt(timestpdeb.getTime())/1000 );

				$('.ecole_datefin').val(timeConverter(tamp1) ) ;
		}	

});





