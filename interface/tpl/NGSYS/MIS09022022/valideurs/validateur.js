 //alert($('.etat_type').val());
 //let appN = $(".appName").val();
///////////CHARGEMENT DES VALIDATEURS ///////////////////
 let link_url =
    "/" +
    appN +
    "/interface/tpl/" +
    appN +
    "/MIS/valideurs/validateur.php";


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
var manager_wk =$('.manager_wk').val().toLowerCase();
var controleur_wk =$('.controleur_wk').val().toLowerCase();
var finance_wk =$('.finance_wk').val().toLowerCase();
var rh_wk =$('.rh_wk').val().toLowerCase();
var dga_wk =$('.dga_wk').val().toLowerCase();
var dg_wk =$('.dg_wk').val().toLowerCase();


loadvalideurs()
.then(data => {


	let results=data.data[0]; 
	 
	 rh_wk=results['rh']['email'].toLowerCase();
     manager_wk=results['manager']['email'].toLowerCase();
     controleur_wk=results['controleur']['email'].toLowerCase();
     finance_wk=results['finance']['email'].toLowerCase();
	 dga_wk =results['dga']['email'].toLowerCase();
	 dg_wk=results['dg']['email'].toLowerCase();
     $('.rh_wk').val(rh_wk);
     $('.manager_wk').val(manager_wk);
     $('.dga_wk').val(dga_wk);
     $('.dg_wk').val(dg_wk);
     $('.controleur_wk').val(controleur_wk);
     $('.finance_wk').val(finance_wk);
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

   
    var initiator =$('.createur').val().toLowerCase();
    //var initiator="ibrahim.konate@ngser.com";

     var manager_wk =$('.manager_wk').val().toLowerCase();
    //var manager_wk="ibrahim.konate@ngser.com";

     var controleur_wk =$('.controleur_wk').val().toLowerCase();
     //var controleur_wk="ibrahim.konate@ngser.com";

    var rh_wk =$('.rh_wk').val().toLowerCase();
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
        var valideur =(validator,initiateur_wk,app)=> { 
            workflowmailing(p_interimaire,nomInterimaire,nomPrenomInitiateur,lk_t,objet,typedmd,numdmd,appN);
        }

        if (val_modif.slice(0,16) =='AA_TRSEMPMNG_MIS') {
            workflowmailing(p_interimaire,nomInterimaire,nomPrenomInitiateur,lk_t,objet,typedmd,numdmd,appN); 
        }

  
        if (val_modif.slice(0,18) =='AA_TRSMNGCONTR_MIS') {
            workflowmailing(p_interimaire,nomInterimaire,nomPrenomInitiateur,lk_t,objet,typedmd,numdmd,appN);
        }
    
       
        if (val_modif.slice(0,16) =='AA_TRSGESTRH_MIS') {
            workflowmailing(p_interimaire,nomInterimaire,nomPrenomInitiateur,lk_t,objet,typedmd,numdmd,appN);
        }
        if (val_modif.slice(0,15) =='AA_TRSRHMNG_MIS') {
            workflowmailing(p_interimaire,nomInterimaire,nomPrenomInitiateur,lk_t,objet,typedmd,numdmd,appN);
        }
        if (val_modif.slice(0,19) =='AA_TRSMNGCONTROL_MIS') {
            workflowmailing(p_interimaire,nomInterimaire,nomPrenomInitiateur,lk_t,objet,typedmd,numdmd,appN);
        }
         if (val_modif.slice(0,20) =='AA_TRSCONTROLDGA_MIS') {
            workflowmailing(p_interimaire,nomInterimaire,nomPrenomInitiateur,lk_t,objet,typedmd,numdmd,appN);
        }

        if (val_modif.slice(0,15) =='AA_TRSDGADG_MIS') {
            workflowmailing(p_interimaire,nomInterimaire,nomPrenomInitiateur,lk_t,objet,typedmd,numdmd,appN);
        }

        if (val_modif.slice(0,14) =='AA_TRSDGRH_MIS') {
            workflowmailing(p_interimaire,nomInterimaire,nomPrenomInitiateur,lk_t,objet,typedmd,numdmd,appN);
        }

        if (val_modif.slice(0,19) =='AA_TRSRHFINANCE_MIS') {
            workflowmailing(p_interimaire,nomInterimaire,nomPrenomInitiateur,lk_t,objet,typedmd,numdmd,appN);
        }
  
       if (val_modif.slice(0,19) =='AA_TRSFINANCEMP_MIS') {
        workflowmailing(p_interimaire,nomInterimaire,nomPrenomInitiateur,lk_t,objet,typedmd,numdmd,appN);
 
        }  
  
    // REFUS 

     if(
             val_modif.slice(0,16) == 'AA_REFUSGEST_MIS' ||
             val_modif.slice(0,14) == 'AA_REFUSRH_MIS'  ||
             val_modif.slice(0,15) == 'AA_REFUSDGA_MIS' 
               
        ){ 
            workflowmailing(p_interimaire,nomInterimaire,nomPrenomInitiateur,lk_t,objet,typedmd,numdmd,appN);
        } 
    
 
	
});
   

   