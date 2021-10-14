
let appName = $(".appName").val();

 ////LOAD PERSONNNEL
let link1 =
    "/" +
    appName +
    "/interface/tpl/" +
    appName +
    "/REG/personnel/personnel_load.php";

  $(document).ready(function(){ 
             $.ajax({
                    url: link1,
                    type: "POST",
                    success: function(data) {

                         $('.personnel').append(data);
                    },
                    error: function(error) {
                        console.log(error);
                    },
                }); 
              
       });
                  





                       
  let link2 =
    "/" +
    appName +
    "/interface/tpl/" +
    appName +
    "/REG/personnel/update_reg.php";


$(document).on('click','.btn_enreg1',function(e){
   
   //recuperation des informations d'un bouton radio
   var caution=$("input:radio[name=caution]").filter(":checked").val();
   var nourriture=$("input:radio[name=nourriture]").filter(":checked").val();
   var logement=$("input:radio[name=logement]").filter(":checked").val();
   var remun_cg=$(".remun_cg").val();
   var horaire=$(".horaire").val();
   var autreindemn=$(".autreindemn").val();
   var personnel=$(".personnel").val();
   
   
      	up_reg(personnel,autreindemn,horaire,remun_cg,caution,nourriture,logement);
	e.preventDefault();
});

 function up_reg(personnel,autreindemn,horaire,remun_cg,caution,nourriture,logement){
 	$.ajax({
        url: link2,
        type: "POST",
        data:{
        	personnel:personnel,
        	autreindemn:autreindemn,
        	horaire:horaire,
        	remun_cg:remun_cg,
        	caution:caution,
        	nourriture:nourriture,
        	logement:logement
        },
        success: function(data) {
        	console.log(data);

            if(data==1){

                $('.res').text("Donn\u00e9es enregistr\u00e9es avec succ\u00e8s");
                    
                $('.res').css('background','green');
                 $('.res').css('color','white'); 
                 $('.res').css('font-weight','bold');
            }
            if(data==0){
                $('.res').text("Echec d'enregistrement des donn\u00e9es");
                $('.res').css('background','red');
                 $('.res').css('color','white');
                 $('.res').css('font-weight','bold');
            }


            $(".res")
                .delay(3000)
                .fadeIn("normal", function() {
                    $(this).delay(2500).fadeOut();
                }); 

            
        },
        error: function(error) {
            console.log(error);

            $('.res').text('Ressource introuvable');
        },
    }); 
 }

