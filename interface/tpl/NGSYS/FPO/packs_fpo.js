let appN = $(".appName").val();


  ////LOAD PERSONNNEL

  let link1 =
    "/" +
    appN +
    "/interface/tpl/" +
    appN +
    "/FPO/personnel/personnel_load.php";

   let link2 =
    "/" +
    appN +
    "/interface/tpl/" +
    appN +
    "/FPO/personnel/personnel_data.php";

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
       });

     $(document).on('change','.personnel',function(){

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
                      $('.civilite_pers').val(responseNew[0][4]);  

                 },
                error:function(error){
                    console.log(error);
                }
            });
      });

 ////LOAD POSTE

  let linkpost =
    "/" +
    appN +
    "/interface/tpl/" +
    appN +
    "/FPO/poste/poste_load.php";

    let linkpostdata =
    "/" +
    appN +
    "/interface/tpl/" +
    appN +
    "/FPO/poste/poste_data.php";


    var init_poste=$('#POS_VAL_CTRL_IPO').val();
    function load_poste(){
    	$.ajax({
            url: linkpost,
            type: "GET",
             data:{
                init_poste:init_poste
            },
            success: function(data) {

                 $('.poste').append(data);
            },
            error: function(error) {
                console.log(error);
            },
        }); 
    }
    load_poste();
     $(document).on('change','.poste',function(){

            $.ajax({
                url:linkpostdata,
                type:"GET",
                data:{
                    poste:$(this).val()
                },
                success:function(response){

                     var responseNew = JSON.parse(response);
                     $('.code_pos').val(responseNew[0][0]);
                    
                 },
                error:function(error){
                    console.log(error);
                }
            });
      });

//LOAD DIPLOME 

let linkdiplome =
    "/" +
    appN +
    "/interface/tpl/" +
    appN +
    "/FPO/diplome/diplome.php";

var init_diplome=$('#POS_VAL_CTRL_DIP').val();

 function load_diplome(){

    $.ajax({
        url: linkdiplome,
        type: "GET",
        data:{
            init_diplome:init_diplome
        },
        success: function(data) {
                
 
              $('.diplome').append(data);


        },
        error: function(error) {
            console.log(error);
        },
    }); 
 }

 load_diplome();