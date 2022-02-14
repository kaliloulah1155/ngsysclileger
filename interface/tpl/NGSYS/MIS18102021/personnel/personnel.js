let appN = $(".appName").val();

let link1 =
    "/" +
    appN +
    "/interface/tpl/" +
    appN +
    "/MIS/personnel/personnel.php";

          var init_personnel=$('.init_personnel').val();

         
             $.ajax({
                    url: link1,
                    type: "GET",
                    data:{
                        init_personnel:init_personnel
                    },
                    success: function(data) {

                         $('.personnel').append(data);
                    },
                    error: function(error) {
                        console.log(error);
                    },
                }); 


let link2 =
    "/" +
    appN +
    "/interface/tpl/" +
    appN +
    "/MIS/personnel/load_personnel.php";

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
                },
                error:function(error){
                    console.log(error);
                }
            });
      });
             
  


 

 

