let appN1 = $(".appName").val();

let link2 =
    "/" +
    appN1 +
    "/interface/tpl/" +
    appN1 +
    "/ABS/compteur/compt_insc.php";

    let annee=$('.annee').val();
    let createur=$('.createur').val();

   $(document).ready(function(){ 
             $.ajax({
                    url: link2,
                    type: "GET",
                     data: {
		                annee: annee,
		                createur: createur,
		            },
                    success: function(data) {

                         $('.increment').val(data); 
                    },
                    error: function(error) {
                        console.log(error);
                    },
                }); 
               

     });


 