var linkapp=$('.appName').val();

//var st_email=$(".personnel").val();

let linkst =
    "/" +
    linkapp +
    "/interface/tpl/" +
    linkapp +
    "/PAY/stagiaire/stagiaire.php";

let salaire_net_st = 0; //auto
let produit_st = 0;
let assurance_st = 0; //auto
let pret_st = 0; //auto
let avance_st = 0; 
let autres_st = 0; //saisie
let t_deduction_st = 0;
let slr_net_paye = 0;


if($('.interselectperso').val() !==''){
    salaire_net_st =$('.slrnet').val();
    produit_st = $('.produit').val(); //auto 
     assurance_st = $('.assurance').val(); //auto
     pret_st = $('.vpret').val(); //auto
     avance_st =  $('.avance').val();
     autres_st = $('.autre').val();
     t_deduction_st = $('.tdeduction').val();
     slr_net_paye = $('.netpaye').val();


   

}

function load_st_slr(dt_email){

      $.ajax({
            url: linkst,
            type: "POST",
             data:{
                st_email:dt_email
            },
            success: function(response) {

            
            	var responseNew = JSON.parse(response);

            	salaire_net_st=parseInt(responseNew[0][0]);
            	assurance_st=parseInt(responseNew[0][1]);
            	pret_st=parseInt(responseNew[1][0]*1);

            	if (isNaN(pret_st)) {
               			 pret_st=0;
           		 }else{
           		 	pret_st=parseInt(responseNew[1][0]*1);
           		 } 

 
                 if(isNaN(assurance_st)){
                     assurance_st=0;
                }
            	  
            	$('.slrnet').val(salaire_net_st);
            	$('.assurance').val(assurance_st);
            	$('.vpret').val(pret_st);


                avance_st=parseInt(avance_st);

                           
                t_deduction_st = parseInt( parseInt(assurance_st) + pret_st*1 + parseInt(avance_st) + parseInt(autres_st));
                slr_net_paye = parseInt(salaire_net_st) - parseInt(t_deduction_st);
                
                 //console.log(slr_net_paye*1);

                 if(isNaN(slr_net_paye)){
                    document.querySelector('.netpaye').value = 0;
                 }else{

                    $('.netpaye').val(slr_net_paye*1);
                }   

            	//console.log(pret_st);

            	 

            	//Add produit
                 
            },
            error: function(error) {
                console.log(error);
            },
        }); 
}


