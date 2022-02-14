 // CHARGEMENT DES DOMAINES
let linkdomaine =
    "/" +
    appN +
    "/interface/tpl/" +
    appN +
    "/COT/specifique/stage_pro/domaine.php";

     function load_domaine(){
     	 $.ajax({
                    url: linkdomaine,
                    type: "GET",
                    success: function(data) {
                    		 $(".domaine").append(
               						 "<option value='0'>Veuillez s&#233;lectionner</option>"
               						 );
                          $('.domaine').append(data);
                    },
                    error: function(error) {
                        console.log(error);
                    },
                }); 
     }


     //INSERTION LORSQUE C'EST UN NOUVEAU DOMAINE
 let linkdomaineInsert =
    "/" +
    appN +
    "/interface/tpl/" +
    appN +
    "/COT/specifique/stage_pro/domaine_insert.php";



   $(document).on('change','.domaine',function(){

    	     $.ajax({
      	    	url:linkdomaineInsert,
      	    	type:"GET",
      	    	data:{
      	    		domaine:$(this).val()
      	    	},
      	    	success:function(response){

      	    	 		
      	    	 		if(response==1){

      	    	 			$(".domaine").empty(); 
      	    	 			  load_domaine();
      	    	 		}

      	    		  
      	    	},
      	    	error:function(error){
      	    		console.log(error);
      	    	}
      	    });


    });



//CALCUL DES DUREES DATE DE FIN
$(document).on('change','.pro_datedeb , .pro_duree',function(){


	ConvNumberLetter($('.pro_duree').val()); 


	if($('.pro_datedeb').val() !=''){

	   dureemois=parseInt($('.pro_duree').val());
       var datedeb_sp=($('.pro_datedeb').val()).split('/');

       var datedeb_sp_str=datedeb_sp[2]+'-'+datedeb_sp[1]+'-'+datedeb_sp[0];


       //console.log(datedeb_sp_str);

         var formattedDateStart = new Date( datedeb_sp_str); //date de debut
         var result_date_mois = addMonths(formattedDateStart,parseInt(dureemois));


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

				$('.pro_datefin').val(timeConverter(tamp1) ) ;
		}	

});
