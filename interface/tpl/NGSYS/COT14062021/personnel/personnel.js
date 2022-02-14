

let link1 =
    "/" +
    appN +
    "/interface/tpl/" +
    appN +
    "/COT/personnel/personnel_load.php";

let link2 =
    "/" +
    appN +
    "/interface/tpl/" +
    appN +
    "/COT/personnel/personnel_data.php";


    var init_email=$('#POS_VAL_CTRL_MEL').val();

      $(document).ready(function(){ 
             $.ajax({
                    url: link1,
                    type: "GET",
                     data:{
                        init_email:init_email
                    },
                    success: function(data) {

                         $('.personnel').append(data);
                    },
                    error: function(error) {
                        console.log(error);
                    },
                }); 
             
                /* $('.select2').select2({
                    placeholder:'Selectionnez un interimaire',
                   // theme:'bootstrap',
                    tags:true,
                     allowClear: true,
                  });  */ 

       });


      $(document).on('change','.personnel',function(){

      	   //alert($(this).val());

      	    $.ajax({
      	    	url:link2,
      	    	type:"GET",
      	    	data:{
      	    		email:$(this).val()
      	    	},
      	    	success:function(response){

      	    		 var responseNew = JSON.parse(response);

      	    		 $('.nom_pers').val(responseNew[0][0]);
      	    		 $('.prenoms_pers').val(responseNew[0][1]);
      	    		 $('.matricule_pers').val(responseNew[0][2]);  
      	    		 $('.dateEnreg_pers').val(responseNew[0][3]);  
      	    		 

      	    	 

      	    	},
      	    	error:function(error){
      	    		console.log(error);
      	    	}
      	    });



      });
