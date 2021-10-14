let appN = $(".appName").val();

let link1 =
    "/" +
    appN +
    "/interface/tpl/" +
    appN +
    "/DEM/select2/select.php";


    

      $(document).ready(function(){ 
             $.ajax({
                    url: link1,
                    type: "GET",
                    success: function(data) {

                         $('.personnel').append(data);
                    },
                    error: function(error) {
                        console.log(error);
                    },
                }); 
             
                 $('.select2').select2({
                    placeholder:'Selectionnez un interimaire',
                   // theme:'bootstrap',
                    tags:true,
                     allowClear: true,
                  });   

           });

  


 

 

