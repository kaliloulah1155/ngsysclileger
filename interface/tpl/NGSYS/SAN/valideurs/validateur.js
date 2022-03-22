 //alert($('.etat_type').val());
 
///////////CHARGEMENT DES VALIDATEURS ///////////////////
 let link_url =
    "/" +
    appN +
    "/interface/tpl/" +
    appN +
    "/SAN/valideurs/validateur.php";


   const loadvalideurs = () => {
    return new Promise((resolve, reject) => {
        $.ajax({
            url: link_url,
            data:{
                  employe:$('.createur').val(),
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
var initiateur_wk =$('.createur').val();
var rh_wk =$('.rh_wk').val();
var manager_wk =$('.manager_wk').val();
var dga_wk =$('.dga_wk').val();
var dg_wk =$('.dg_wk').val();
var managerFullName=$('.managerFullName').val();
var rhFullname=$('.rhFullname').val();
var dgaFullName=$('.dgaFullName').val();
var dgFullName=$('.dgFullName').val(); 

loadvalideurs()
.then(data => {


	let results=data.data[0]; 
	 
	 rh_wk=results['rh']['email'].toLowerCase();
     manager_wk=results['manager']['email'].toLowerCase();
	 dga_wk =results['dga']['email'].toLowerCase();
	 dg_wk=results['dg']['email'].toLowerCase();

     $('.manager_wk').val(manager_wk);
     $('.rh_wk').val(rh_wk);
     $('.dga_wk').val(dga_wk);
     $('.dg_wk').val(dg_wk);

     $('.managerFullName').val(results['manager']['fullname']);
     $('.rhFullname').val(results['rh']['fullname']);
     $('.dgaFullName').val(results['dga']['fullname']);
     $('.dgFullName').val(results['dg']['fullname']);

	//  console.log(results['dg']['email']);
})
.catch(error=>console.log(error));


//Appel du lien 
var lk_t =$('.user_url').val();

//Notification de sanction d'un employé initié par son manager et envoyé à la RH
let workfloSANManagerRh=(sendemail,objet,destinateur,nomPrenomEmploye,lien,numero,app)=>{
    $.ajax({
              url: "/"+app+"/configuration_w/pos_mail/san_manager_rh.php",
              type: "POST",
               data:{
                  sendemail:sendemail,
                  objet:objet, 
                  destinateur:destinateur, 
                  nomPrenomEmploye:nomPrenomEmploye,
                  lien:lien, 
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

//Notification de sanction d'un employé initié par la RH au departement administrative et juridique
let workfloSANRhDaj=(sendemail,objet,destinateur,nomPrenomEmploye,lien,numero,app)=>{
    $.ajax({
              url: "/"+app+"/configuration_w/pos_mail/san_rh_daj.php",
              type: "POST",
               data:{
                  sendemail:sendemail,
                  objet:objet, 
                  destinateur:destinateur, 
                  nomPrenomEmploye:nomPrenomEmploye,
                  lien:lien, 
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

//Notification de sanction d'un employé initié par le departement administrative et juridique au DGA
let workfloSANDajDga=(sendemail,objet,destinateur,nomPrenomEmploye,lien,numero,app)=>{
    $.ajax({
              url: "/"+app+"/configuration_w/pos_mail/san_daj_dga.php",
              type: "POST",
               data:{
                  sendemail:sendemail,
                  objet:objet, 
                  destinateur:destinateur, 
                  nomPrenomEmploye:nomPrenomEmploye,
                  lien:lien, 
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

//Notification de sanction d'un employé initié par le DGA au DG
let workfloSANDgaDg=(sendemail,objet,destinateur,nomPrenomEmploye,lien,numero,app)=>{
    $.ajax({
              url: "/"+app+"/configuration_w/pos_mail/san_dga_dg.php",
              type: "POST",
               data:{
                  sendemail:sendemail,
                  objet:objet, 
                  destinateur:destinateur, 
                  nomPrenomEmploye:nomPrenomEmploye,
                  lien:lien, 
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

//Notification de sanction envoyé à l'employé  par la direction general
let workfloSANDgEmploye=(sendemail,objet,destinateur,lien,numero,app)=>{
    $.ajax({
              url: "/"+app+"/configuration_w/pos_mail/san_dg_employe.php",
              type: "POST",
               data:{
                  sendemail:sendemail,
                  objet:objet, 
                  destinateur:destinateur,  
                  lien:lien, 
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
 
//Notification de sanction refuser
let workfloSANRefus=(sendemail,objet,destinateur,nomPrenomEmploye,lien,numero,app)=>{
    $.ajax({
              url: "/"+app+"/configuration_w/pos_mail/san_refus.php",
              type: "POST",
               data:{
                  sendemail:sendemail,
                  objet:objet, 
                  destinateur:destinateur,  
                  nomPrenomEmploye:nomPrenomEmploye,
                  lien:lien, 
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

    ///////////// DEBUT LES VARIABLES DU CORPS DU MAIL ///////////*

    var lk_t =$('.user_url').val(); 
	var val_modif = $('.action_hermes').val(); 
    var initiator =$('.createur').val().toLowerCase();
    var mailEmploye =$('.personnel').val().toLowerCase();  
    var manager_wk =$('.manager_wk').val().toLowerCase(); 
    var rh_wk =$('.rh_wk').val().toLowerCase(); 
    var dga_wk =$('.dga_wk').val().toLowerCase(); 
    var dg_wk =$('.dg_wk').val().toLowerCase();  
    var numdmd = $('#numposeidon').val();  
    var nomEmploye= $('.nom_pers').val();
    var prenomEmploye= $('.prenoms_pers').val();
    var nomPrenomEmploye= nomEmploye+' '+prenomEmploye;
    // var nomPrenomEmploye = $('.init_personnel').val().toLowerCase();
    var nomInitiateur= $('.viewfonction').val();
    var prenomInitiateur= $('.viewdepartement').val();
    var objet ="Sanction";
    var monMail="daouda.diarra@ngser.com"; 
    var nomPrenomManager= nomInitiateur+' '+prenomInitiateur;
    var managerFullName=$('.managerFullName').val();
    var rhFullname=$('.rhFullname').val();
    var dgaFullName=$('.dgaFullName').val();
    var dgFullName=$('.dgFullName').val();     
    var app ="NGSYS";
    ////////////// FIN LES VARIABLES DU CORPS DU MAIL ///////////

    // workfloSANRefus(monMail,objet,dgFullName,nomPrenomEmploye,lk_t,numdmd,app);
    // workfloSANDgEmploye(monMail,objet,nomPrenomEmploye,lk_t,numdmd,app);
    // workfloSANDgaDg(monMail,objet,dgFullName,nomPrenomEmploye,lk_t,numdmd,app);
    // workfloSANDajDga(monMail,objet,dgaFullName,nomPrenomEmploye,lk_t,numdmd,app);
    // workfloSANRhDaj(monMail,objet,managerFullName,nomPrenomEmploye,lk_t,numdmd,app);
    // workfloSANManagerRh(monMail,objet,rhFullname,nomPrenomEmploye,lk_t,numdmd,app);

         //Message vers les valideurs
        var valideur =(validator,initiateur_wk,app)=> { 
            
        }

        if (val_modif.slice(0,15) =='AA_TRSMNGRH_SAN') {
            // Envoyé à la RH
            workfloSANManagerRh(rh_wk,objet,rhFullname,nomPrenomEmploye,lk_t,numdmd,app);
        }

     
        if (val_modif.slice(0,20) =='AA_TRSMNGEMPLOYE_SAN') {
            // Envoyé au DAJ
            workfloSANRhDaj(manager_wk,objet,managerFullName,nomPrenomEmploye,lk_t,numdmd,app);
        }
      
        if (val_modif.slice(0,12) =='AA_RHDGA_SAN') {
            // Envoyé au DGA
            workfloSANDajDga(dga_wk,objet,dgaFullName,nomPrenomEmploye,lk_t,numdmd,app);
        }

       
        if (val_modif.slice(0,12) =='AA_DGADG_SAN') {
            // Envoyé au DG
            workfloSANDgaDg(dg_wk,objet,dgFullName,nomPrenomEmploye,lk_t,numdmd,app);
        }   
  
       if (val_modif.slice(0,13) =='AA_CLOSDG_SAN') { 
        workfloSANDgEmploye(mailEmploye,objet,nomPrenomEmploye,lk_t,numdmd,app);
        } 
  
    // REFUS 

     if(
             val_modif.slice(0,14) == 'AB_REFUSRH_SAN' ||
             val_modif.slice(0,14) == 'AB_REFUSDG_SAN'  ||
             val_modif.slice(0,15) == 'AB_REFUSDGA_SAN' ||
             val_modif.slice(0,14) == 'AB_REFUSADM_SAN'  
            ){
            // NB: Destiné à qui ? 
            // workfloSANRefus(monMail,objet,dgFullName,nomPrenomEmploye,lk_t,numdmd,app);
               
        } 
 
 
	
});
  