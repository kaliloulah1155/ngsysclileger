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

loadvalideurs()
.then(data => {


	let results=data.data[0]; 
	 
	 manager_wk=results['manager']['email'].toLowerCase();
	 rh_wk=results['rh']['email'].toLowerCase();
	 dga_wk =results['dga']['email'].toLowerCase();
	 dg_wk=results['dg']['email'].toLowerCase();
      
     $('.manager_wk').val(manager_wk);
     $('.rh_wk').val(rh_wk);
     $('.dga_wk').val(dga_wk);
     $('.dg_wk').val(dg_wk);

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
   // var manager_wk ="ibrahim.konate@ngser.com";
    var rh_wk =$('.rh_wk').val().toLowerCase();
    //var rh_wk ="ibrahim.konate@ngser.com";
   var dga_wk =$('.dga_wk').val().toLowerCase();
     //var dga_wk ="ibrahim.konate@ngser.com";

    var dg_wk =$('.dg_wk').val().toLowerCase();
    //var dg_wk ="ibrahim.konate@ngser.com";

    var  p_interimaire = $('.interim').val();
    
   //Appel du lien 
    var lk_t =$('.user_url').val();

    ////////////// DEBUT LES VARIABLES DU CORPS DU MAIL ///////////

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


          if(etat_type=='EMPLOYE'){
         if (val_modif.slice(0,14) =='AB_INTEMPL_ABS') { 
            workflowmailing(p_interimaire,nomInterimaire,nomPrenomInitiateur,lk_t,objet,typedmd,numdmd,appN); 
        }
        if (val_modif.slice(0,20) =='AA_TRSEMPLOYEMNG_ABS') {
            workflowmailing(p_interimaire,nomInterimaire,nomPrenomInitiateur,lk_t,objet,typedmd,numdmd,appN);
        }

        if (val_modif.slice(0,15) =='AA_TRSMNGRH_ABS') {
            workflowmailing(p_interimaire,nomInterimaire,nomPrenomInitiateur,lk_t,objet,typedmd,numdmd,appN);
        }
        
        if (val_modif.slice(0,15) =='AA_TRSRHADM_ABS') {
            workflowmailing(p_interimaire,nomInterimaire,nomPrenomInitiateur,lk_t,objet,typedmd,numdmd,appN);
        }

        
        if (val_modif.slice(0,13) =='AZ_CLOSRA_ABS') {
            workflowmailing(p_interimaire,nomInterimaire,nomPrenomInitiateur,lk_t,objet,typedmd,numdmd,appN);
        }

       if (val_modif.slice(0,13) =='AZ_CLOSDG_ABS') {
        workflowmailing(p_interimaire,nomInterimaire,nomPrenomInitiateur,lk_t,objet,typedmd,numdmd,appN);
        } 
    }

    if(etat_type=='MANAGER'){

        if (val_modif.slice(0,19) =='AA_TRSMANAGERRH_ABS') {
            workflowmailing(p_interimaire,nomInterimaire,nomPrenomInitiateur,lk_t,objet,typedmd,numdmd,appN);
        }

          if (val_modif.slice(0,15) =='AA_TRSRHDGA_ABS') {
            workflowmailing(p_interimaire,nomInterimaire,nomPrenomInitiateur,lk_t,objet,typedmd,numdmd,appN);
        }

        
        if (val_modif.slice(0,13) =='AA_TRSDGADG_ABS') {
            workflowmailing(p_interimaire,nomInterimaire,nomPrenomInitiateur,lk_t,objet,typedmd,numdmd,appN);
        }

       if (val_modif.slice(0,13) =='AA_CLOSDG_ABS') {   
            workflowmailing(p_interimaire,nomInterimaire,nomPrenomInitiateur,lk_t,objet,typedmd,numdmd,appN);
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
                workflowmailing(p_interimaire,nomInterimaire,nomPrenomInitiateur,lk_t,objet,typedmd,numdmd,appN);
        } 
	
});