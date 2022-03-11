 //alert($('.etat_type').val());
 

///////////CHARGEMENT DES VALIDATEURS ///////////////////
 let link_url =
    "/" +
    appN +
    "/interface/tpl/" +
    appN +
    "/ABS/valideurs/validateur.php";


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

// Nom & Prenoms
var nom_inti = $('.viewnom').val().toLowerCase();
var pre_inti = $('.viewprenom').val().toLowerCase();



var initiateur_wk =$('.createur').val().toLowerCase();
var manager_wk =$('.manager_wk').val().toLowerCase();
var rh_wk =$('.rh_wk').val().toLowerCase();
var dga_wk =$('.dga_wk').val().toLowerCase();
var dg_wk =$('.dg_wk').val().toLowerCase();
var etat_fiche=$('.etat_fiche').val();
var etat_type=$('.etat_type').val();

var managerFullName=$('.managerFullName').val();
var rhFullname=$('.rhFullname').val();
var dgaFullName=$('.dgaFullName').val();
var dgFullName=$('.dgFullName').val();

// console.log(managerFullName);
loadvalideurs()
.then(data => {


	let results=data.data[0]; 
	//  Recuperation des mails
	 manager_wk      =    results['manager']['email'].toLowerCase();
	 rh_wk           =    results['rh']['email'].toLowerCase();
	 dga_wk          =    results['dga']['email'].toLowerCase();
	 dg_wk           =    results['dg']['email'].toLowerCase();
    //  Recuperation des fullNames
    //  managerFullName =    results['manager']['fullname'].toLowerCase();
	//  rhFullname      =    results['rh']['fullname'].toLowerCase();
	//  dgaFullName     =    results['dga']['fullname'].toLowerCase();
	//  dgFullName      =    results['dg']['fullname'].toLowerCase();


    //   console.log(results['manager']['fullname']);
      
     $('.manager_wk').val(manager_wk);
     $('.rh_wk').val(rh_wk);
     $('.dga_wk').val(dga_wk);
     $('.dg_wk').val(dg_wk);

     $('.managerFullName').val(results['manager']['fullname']);
     $('.rhFullname').val(results['rh']['fullname']);
     $('.dgaFullName').val(results['dga']['fullname']);
     $('.dgFullName').val(results['dg']['fullname']);


	// console.log(results['initiateur']['email']);
})
.catch(error=>console.log(error));

// Appel du lien du site ngser
let link_ngser="../../../LinkSiteWeb.php";
   function getLink(){
       
          $.ajax({
              url: link_ngser, 
              type: "GET",
              success: function(output) {
                      
                     $('.user_url').val(output);
                  }, 
              error: function (error) {
                   console.log(error);
              },
          });
  }

  //Appel
  getLink();

  //console.log(link_ngser);

 //Mail envoyé à l'interimaire 
let workflowmailing=(sendemail,destinateur,interimaire,lien,objet,motif,numero,dateDebut,dateFin,app)=>{
    $.ajax({
              url: "/"+app+"/configuration_w/pos_mail/interim_info_mailer.php",
              type: "POST",
               data:{
                  sendemail:sendemail,
                  destinateur:destinateur,
                  interimaire:interimaire, 
                  lien:lien,
                  objet:objet,
                  motif:motif,
                  numero:numero,
                  dateDebut:dateDebut,
                  dateFin:dateFin
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

// Mail d'info de demandeur 
 let workflowmailingInfo=(sendemail,destinateur,lien,objet,numero,app)=>{
    $.ajax({
              url: "/"+app+"/configuration_w/pos_mail/applicant_mailer.php",
              type: "POST",
               data:{
                  sendemail:sendemail,
                  destinateur:destinateur, 
                  lien:lien,
                  objet:objet, 
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


//Mail de cloture d'une demande
let workflowMailClotureDemande=(sendemail,destinateur,lien,objet,numero,app)=>{
    $.ajax({
              url: "/"+app+"/configuration_w/pos_mail/colture_mailer.php",
              type: "POST",
               data:{
                  sendemail:sendemail,
                  destinateur:destinateur, 
                  lien:lien,
                  objet:objet, 
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

// mail demande de validation au manager
let workflowInformManager=(sendemail,objet,demandeur,destinateur,lien,interimaire,dateDebut,dateFin,numero,autre,app)=>{
    $.ajax({
            //   url: "/"+app+"/configuration_w/pos_mail/manager_validation_mailer.php",
              url: "/"+app+"/configuration_w/pos_mail/manager_mailer.php",
              type: "POST",
               data:{
                    sendemail:sendemail,
                    objet:objet,
                    demandeur:demandeur,
                    destinateur:destinateur,
                    lien:lien, 
                    interimaire:interimaire,
                    dateDebut:dateDebut,
                    dateFin:dateFin,
                    numero:numero,
                    autre:autre
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

    
    ////////////// DEBUT LES VARIABLES DU CORPS DU MAIL ///////////
    //var initiator="ibrahim.konate@ngser.com";

    var manager_wk =$('.manager_wk').val().toLowerCase();
   // var manager_wk ="ibrahim.konate@ngser.com";
    var rh_wk =$('.rh_wk').val().toLowerCase();
    //var rh_wk ="ibrahim.konate@ngser.com";
   var dga_wk =$('.dga_wk').val().toLowerCase();
     //var dga_wk ="ibrahim.konate@ngser.com";

    var dg_wk =$('.dg_wk').val().toLowerCase();
    //var dg_wk ="ibrahim.konate@ngser.com"; 
    
   //Appel du lien 
    var lk_t =$('.user_url').val();
    
    
   // manager_wk=results['manager']['email'].toLowerCase();
    var manager_mail =$('.manager_wk').val().toLowerCase();
   // var manager_wk ="ibrahim.konate@ngser.com";

    var initiator =$('.createur').val().toLowerCase(); // mail de l'initateur
    var  mail_interimaire = $('.interim').val();
    var numdmd = $('#numposeidon').val();
    var typeDemande = $('.typeDemande').val().toLowerCase();
    var typedmd ='';
    var nomPrenomInterimaire = $('.personnel').val();
    var nomInitiateur= $('.viewnom').val();
    var  prenomInitiateur= $('.viewprenom').val();
    var objet ="demande d\'abscence";
    //nom et prenom de l'initateur
    var nomPrenomInitiateur= nomInitiateur+' '+prenomInitiateur;
    var dateDebut = $('.datedeb').val();
    var dateFin =  $('.datefin').val();
    //console.log(manager_mail);
    var james="james.akran@ngser.com";
    var ib = "ibrahim.konate@ngser.com";
    var monMail ="daouda.diarra@ngser.com";
    var nomManager= "JAMES AKRAN";
    var autre ="";

    var managerFullName=$('.managerFullName').val();
    var rhFullname=$('.rhFullname').val();
    var dgaFullName=$('.dgaFullName').val();
    var dgFullName=$('.dgFullName').val();
    
    // console.log(managerFullName);
     ////////////// FIN LES VARIABLES DU CORPS DU MAIL ///////////

    //  workflowMailClotureDemande(initiator,nomPrenomInitiateur,typedmd,lk_t,numdmd,appN);
    //  workflowInformManager(monMail,typedmd,lk_t,nomManager,nomPrenomInitiateur,nomPrenomInterimaire,dateDebut,dateFin,numdmd,autre,appN);
    //  workflowInformManager(monMail,typedmd,lk_t,nomManager,nomPrenomInitiateur,nomPrenomInterimaire,dateDebut,dateFin,numdmd,autre,appN);
    // workflowmailingValidateManager(nomManager,lk_t,typedmd,monMail,nomPrenomInitiateur,nomPrenomInterimaire,dateDebut,dateFin,numdmd,appN);
    //  workflowmailingInfo(initiator,nomPrenomInitiateur,lk_t,objet,numdmd,appN);
    //  workflowmailing(mail_interimaire,nomPrenomInterimaire,nomPrenomInitiateur,lk_t,objet,typedmd,numdmd,dateDebut,dateFin,appN);
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


          if(etat_type=='EMPLOYE'){
         if (val_modif.slice(0,14) =='AB_INTEMPL_ABS') {  
            workflowmailing(mail_interimaire,nomPrenomInterimaire,nomPrenomInitiateur,lk_t,objet,typedmd,numdmd,dateDebut,dateFin,appN); 
            workflowmailingInfo(initiator,nomPrenomInitiateur,lk_t,objet,numdmd,appN); 
        }
        if (val_modif.slice(0,20) =='AA_TRSEMPLOYEMNG_ABS') { 
            // nomManager=fullNameManage ok
            workflowInformManager(manager_mail,typedmd,nomPrenomInitiateur,managerFullName,lk_t,nomPrenomInterimaire,dateDebut,dateFin,numdmd,autre,appN);

        }

        if (val_modif.slice(0,15) =='AA_TRSMNGRH_ABS') {
            // nomManager=fullNameRH ok
            workflowInformManager(rh_wk,typedmd,nomPrenomInitiateur,rhFullname,lk_t,nomPrenomInterimaire,dateDebut,dateFin,numdmd,autre,appN);
        }
        
        if (val_modif.slice(0,15) =='AA_TRSRHADM_ABS') {
            // nomManager=fullNameDGA ok
            workflowInformManager(dga_wk,typedmd,nomPrenomInitiateur,dgaFullName,lk_t,nomPrenomInterimaire,dateDebut,dateFin,numdmd,autre,appN);
        }

        
        if (val_modif.slice(0,13) =='AZ_CLOSRA_ABS') {
            // nomManager=fullNameDG ok
            workflowInformManager(dg_wk,typedmd,nomPrenomInitiateur,dgFullName,lk_t,nomPrenomInterimaire,dateDebut,dateFin,numdmd,autre,appN);
        }

       if (val_modif.slice(0,13) =='AZ_CLOSDG_ABS') {
            workflowMailClotureDemande(initiator,nomPrenomInitiateur,typedmd,lk_t,numdmd,appN);
        } 
    }

    if(etat_type=='MANAGER'){

        if (val_modif.slice(0,19) =='AA_TRSMANAGERRH_ABS') {
            // nomPrenomInterimaire= fullNameManager ok
            workflowmailing(mail_interimaire,nomPrenomInterimaire,managerFullName,lk_t,objet,typedmd,numdmd,dateDebut,dateFin,appN);

        }

          if (val_modif.slice(0,15) =='AA_TRSRHDGA_ABS') {
            //nomManager = fullNameDGA ok
            workflowInformManager(dga_wk,typedmd,nomPrenomInitiateur,dgaFullName,lk_t,nomPrenomInterimaire,dateDebut,dateFin,numdmd,autre,appN);
        }

        
        if (val_modif.slice(0,13) =='AA_TRSDGADG_ABS') {
            //nomManager = fullNameDG ok
            workflowInformManager(dg_wk,typedmd,nomPrenomInitiateur,dgFullName,lk_t,nomPrenomInterimaire,dateDebut,dateFin,numdmd,autre,appN);
        }

       if (val_modif.slice(0,13) =='AA_CLOSDG_ABS') {   
            // nomPrenomInterimaire= fullNameManager
            workflowMailClotureDemande(manager_mail,nomPrenomInitiateur,typedmd,lk_t,numdmd,appN);
        } 

    }
    // REFUS 
        if( 
             val_modif.slice(0,14) == 'AZ_REFUSDG_ABS' ||
             val_modif.slice(0,14) == 'AB_REFUSRH_ABS'  ||
             val_modif.slice(0,15) == 'AB_REFUSDGA_ABS' ||
             val_modif.slice(0,14) == 'AB_REFUSDG_ABS' ||
             val_modif.slice(0,15) == 'AB_REFUSMNG_ABS' ||
             val_modif.slice(0,17) == 'AB_REFUSRHEMP_ABS' ||
             val_modif.slice(0,14) == 'AB_REFUSRA_ABS'
            ){
                
        } 
	
});