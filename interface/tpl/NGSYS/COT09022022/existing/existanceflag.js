let appF = $(".appName").val();

let linkf =
    "/" +
    appF +
    "/interface/tpl/" +
    appF +
    "/COT/existing/existanceflag.php";

    let flag;


 $(document).on('change','.personnel',function(){
      $('.emp_wk').val($(this).val());
 	 
 	 $.ajax({
        url: linkf,
        type: "GET",
         data:{
            init_email:$(this).val()
        },
        success: function(data) {

        		//console.log(data);
                if(data==1){
                     $('.status_activ_cot').val(0);
                }else{
                    $('.status_activ_cot').val(1);
                }
             $('.exist_contrat').val(data);
        },
        error: function(error) {
            console.log(error);
        },
    }); 

 });

 