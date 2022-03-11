 //alert($('.etat_type').val());
 let appN = $(".appName").val();
///////////CHARGEMENT DES VALIDATEURS ///////////////////
 let link_url =
    "/" +
    appN +
    "/interface/tpl/" +
    appN +
    "/DBQ/valideurs/validateur.php";


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

var initiateur_wk =$('.createur').val().toLowerCase();
var rh_wk =$('.rh_wk').val().toLowerCase();
var dga_wk =$('.dga_wk').val().toLowerCase();
var dg_wk =$('.dg_wk').val().toLowerCase();


loadvalideurs()
.then(data => {


	let results=data.data[0]; 
	 
	 rh_wk=results['rh']['email'].toLowerCase();
	 dga_wk =results['dga']['email'].toLowerCase();
	 dg_wk=results['dg']['email'].toLowerCase();
     $('.rh_wk').val(rh_wk);
     $('.dga_wk').val(dga_wk);
     $('.dg_wk').val(dg_wk);
})
.catch(error=>console.log(error));

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

//Appel
getLink()  

//Appel du lien 
var lk_t =$('.user_url').val();

 //Envoi de mail via workflow 
 let workflowmailing=(sendemail,destinataire,destinateur,lien,objet,motif,numero,app)=>{
    $.ajax({
              url: "/"+app+"/configuration_w/pos_mail/pos_mailer.php",
              type: "POST",
               data:{
                  sendemail:sendemail,
                  destinataire:destinataire,
                  destinateur:destinateur,
                  lien:lien,
                  objet:objet,
                  motif:motif,
                  numero:numero
              },
              success: function(data) {
                   if(data['status']="success"){
                        console.log("Mail envoi avec success");
                   }else{
                        console.log("Echec d'envoi de mail");
                   }
              },
              error: function(error) {
                  console.log(error);   
              },
          });
}
 
 
$(document).on('click','.bouton_sub',function(){
    
    ///////////// DEBUT LES VARIABLES DU CORPS DU MAIL ///////////
 
	var val_modif = $('.action_hermes').val();
    //var initiator="ibrahim.konate@ngser.com";
    var initiator =$('.createur').val().toLowerCase();
    var rh_wk =$('.rh_wk').val().toLowerCase();
    //var rh_wk="ibrahim.konate@ngser.com";
    var dga_wk =$('.dga_wk').val().toLowerCase();
    //var dga_wk="ibrahim.konate@ngser.com";
    var dg_wk =$('.dg_wk').val().toLowerCase();
    //var dg_wk="ibrahim.konate@ngser.com";

    
    
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

        if (val_modif.slice(0,18) =='AA_TRSEMPLOYRH_DBQ') {
             
        }

      
        if (val_modif.slice(0,15) =='AA_TRSRHDGA_DBQ') {
             
        }

       
        if (val_modif.slice(0,15) =='AA_TRSDGADG_DBQ') {
             
        }
  
       if (val_modif.slice(0,13) =='AA_CLOSDG_DBQ') {
              
 
        } 
  
    // REFUS 
    
 
	
});
   