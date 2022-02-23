
///////////CHARGEMENT DES VALIDATEURS ///////////////////
 let link_url =
    "/" +
    appName +
    "/interface/tpl/" +
    appName +
    "/TMS/valideurs/validateur.php";


   const loadvalideurs = () => {
    return new Promise((resolve, reject) => {
        $.ajax({
            url: link_url,
            type: "POST",
            data:{
                  employe:$('.emp_wk').val().toLowerCase(),
            },
            success: function (data) {
                resolve(data);
            },
            error: function (error) {
                reject(error);
            },
        });
    });
}
//initiateur_wk
var emp_wk =$('.emp_wk').val().toLowerCase();
var manager_wk =$('.mng_wk').val().toLowerCase();
 
loadvalideurs()
.then(data => {


	let results=data.data[0]; 
	 
	 manager_wk=results['manager']['email'].toLowerCase();
     $('.mng_wk').val(manager_wk);
 
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


 
	var val_modif = $('.action_hermes').val();
    var employe_wk =$('.emp_wk').val().toLowerCase();
    //var employe_wk="ibrahim.konate@ngser.com";
    var manager_wk =$('.mng_wk').val().toLowerCase();
    //var manager_wk="ibrahim.konate@ngser.com";
    
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

    //RECUPERATION DES MOTIF
    switch (typeDemande) {
      case "ABSENCE" : 
            typedmd="DEMANDE D' ABSENCE";
          break;
      case "MARIAGE DU TRAVAILLEUR" :
          typedmd="MARIAGE DU TRAVAILLEUR"; 
          break;
      case "MARIAGE DUN DE SES ENFANTS, DUN FRERE, DUNE SOEUR":
          typedmd="MARIAGE D'UN DE SES ENFANTS, D'UN FRERE, D'UNE SOEUR"; 
          break;
      case "DECES DU CONJOINT":
           typedmd="DECES DU CONJOINT"; 
          break;
      case "DECES DUN ENFANT, DU PERE, DE LA MERE DU TRAVAILLEUR":
           typedmd="DECES D'UN ENFANT, DU PERE, DE LA MERE DU TRAVAILLEUR";
          break;
      case "DECES DUN FRERE OU DUNE SOEUR":
          typedmd="DECES D'UN FRERE OU D'UNE SOEUR";
          break;
      case "DECES DUN BEAU-PERE OU DUNE BELLE-MERE":
          typedmd="DECES D'UN BEAU-PERE OU D'UNE BELLE-MERE";
           break;
      case "NAISSANCE DUN ENFANT":
            typedmd="NAISSANCE D'UN ENFANT";
          break;
      case "BAPTEME DUN ENFANT":
            typedmd="BAPTEME D'UN ENFANT";
          break;
      case "PREMIERE COMMUNION":
           typedmd="PREMIERE COMMUNION";
          break;
      case "DEMENAGEMENT":
           typedmd="DEMENAGEMENT";
          break;
  default:
          typedmd="DEMANDE D' ABSENCE";
  }

    
         //Message vers les valideurs
        var valideur =(validator,employe_wk,app)=> { 
            workflowmailing(p_interimaire,nomInterimaire,nomPrenomInitiateur,lk_t,objet,typedmd,numdmd,appN);
        }

      if (val_modif.slice(0,18) =='AA_TRANSDEVMNG_TMS') {
            workflowmailing(p_interimaire,nomInterimaire,nomPrenomInitiateur,lk_t,objet,typedmd,numdmd,appN);
        }

          if (val_modif.slice(0,18) =='AA_CLOSNODEVRH_TMS') {
            workflowmailing(p_interimaire,nomInterimaire,nomPrenomInitiateur,lk_t,objet,typedmd,numdmd,appN);
        }
       
    // REFUS 

        if( val_modif.slice(0,18) == 'AB_REFUSDEVMNG_TMS'){
            workflowmailing(p_interimaire,nomInterimaire,nomPrenomInitiateur,lk_t,objet,typedmd,numdmd,appN);
        }  
 

 
 
});  