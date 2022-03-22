 //alert($('.etat_type').val());
 //let appN = $(".appName").val();
///////////CHARGEMENT DES VALIDATEURS ///////////////////
 let link_url =
    "/" +
    appN +
    "/interface/tpl/" +
    appN +
    "/PAY/valideurs/validateur.php";


   const loadvalideurs = () => {
    return new Promise((resolve, reject) => {
        $.ajax({
            url: link_url,
            data:{
                  employe:$('.createur').val().toLowerCase(),
            },
            type: "POST",
            success: function (data) {
                resolve(data);
            },
            error: function (error) {
                reject(error);
            },
        });
    });
}

// Appel du lien du site ngser
let link_ngser="../../../LinkSiteWeb.php";
function getLink(){
    
       $.ajax({
           url: link_ngser, 
           type: "POST",
           success: function(output) {
                  console.log(output);
               }, 
           error: function (error) {
                console.log(error);
           },
       });
}

var initiateur_wk =$('.createur').val().toLowerCase();
var manager_wk =$('.mngadm_wk').val().toLowerCase();
var controleur_wk =$('.controleur_wk').val().toLowerCase();
var finance_wk =$('.finance_wk').val().toLowerCase();
//var rh_wk =$('.rh_wk').val().toLowerCase();
var dga_wk =$('.dga_wk').val().toLowerCase();
var dg_wk =$('.dg_wk').val().toLowerCase();


loadvalideurs()
.then(data => {


	let results=data.data[0]; 
	 
	// rh_wk=results['rh']['email'].toLowerCase();
     manager_wk=results['manager']['email'].toLowerCase();
     controleur_wk=results['controleur']['email'].toLowerCase();
     finance_wk=results['finance']['email'].toLowerCase();
	 dga_wk =results['dga']['email'].toLowerCase();
	 dg_wk=results['dg']['email'].toLowerCase();
     //$('.rh_wk').val(rh_wk);
     $('.mngadm_wk').val(manager_wk);
     $('.dga_wk').val(dga_wk);
     $('.dg_wk').val(dg_wk);
     $('.controleur_wk').val(controleur_wk);
     $('.finance_wk').val(finance_wk);
})
.catch(error=>console.log(error));


//Appel
getLink()  
//Appel du lien 
var lk_t =$('.user_url').val();

 
 

$(document).on('click','.bouton_sub',function(){

 
	var val_modif = $('.action_hermes').val();

   
    var initiator =$('.createur').val().toLowerCase();
    //var initiator="ibrahim.konate@ngser.com";

     var manager_wk =$('.mngadm_wk').val().toLowerCase();
    //var manager_wk="ibrahim.konate@ngser.com";

     var controleur_wk =$('.controleur_wk').val().toLowerCase();
     //var controleur_wk="ibrahim.konate@ngser.com";

    //var rh_wk =$('.rh_wk').val().toLowerCase();
    //var rh_wk="ibrahim.konate@ngser.com";

    var dga_wk =$('.dga_wk').val().toLowerCase();
    //var dga_wk="ibrahim.konate@ngser.com";

    var dg_wk =$('.dg_wk').val().toLowerCase();
    //var dg_wk="ibrahim.konate@ngser.com";

    var finance_wk =$('.finance_wk').val().toLowerCase();
    //var finance_wk="ibrahim.konate@ngser.com";

     ///////////// DEBUT LES VARIABLES DU CORPS DU MAIL ///////////
    
     var numdmd = $('#numposeidon').val();
     var typeDemande = $('.typeDemande').val().toLowerCase();
     var typedmd ='';
     var nomInterimaire = $('.personnel').val();
     var nomInitiateur= $('.viewnom').val();
     var  prenomInitiateur= $('.viewprenom').val();
     var objet ="demande d\'abscence";
     //nom et prenom de l'initateur
     var nomPrenomInitiateur= nomInitiateur+' '+prenomInitiateur;
         
     ////////////// FIN LES VARIABLES DU CORPS DU MAIL ///////////

      


         //Message vers les valideurs
        var valideur =(validator,initiateur_wk,app)=> { 
            
        }

        if (val_modif.slice(0,16) =='AA_TRSMNGADM_PAY') {   

        }

  
        if (val_modif.slice(0,20) =='AA_TRSCONTROLEUR_PAY') {
            
        }
    
       
        if (val_modif.slice(0,17) =='AA_TRSFINANCE_PAY') {
            
        }
        if (val_modif.slice(0,20) =='AA_TRSFINANCEDGA_PAY') {
            
        }
        if (val_modif.slice(0,15) =='AA_TRSDGADG_PAY') {
            
        }
        
        
       if (val_modif.slice(0,12) =='AA_CLOSDG_PAY') {
            ; 
 
        }  
  
    // REFUS 

     if(
             val_modif.slice(0,14) == 'AB_REFUSDG_PAY' ||
             val_modif.slice(0,15) == 'AB_REFUSDGA_PAY'  ||
             val_modif.slice(0,19) == 'AB_REFUSFINANCE_PAY'||
             val_modif.slice(0,19) == 'AB_REFUSCONTROL_PAY'||
             val_modif.slice(0,18) == 'AB_REFUSMNGADM_PAY'
               
        ){

        } 
	
});
   
 
   