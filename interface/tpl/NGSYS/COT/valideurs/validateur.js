 //alert($('.etat_type').val());
 

///////////CHARGEMENT DES VALIDATEURS ///////////////////
 let link_url =
    "/" +
    appN +
    "/interface/tpl/" +
    appN +
    "/COT/valideurs/validateur.php";

 

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

//initiateur_wk
//var emp_wk =$('.emp_wk').val().toLowerCase();
var manager_wk =$('.mngadm_wk').val().toLowerCase();
var rh_wk =$('.rh_wk').val().toLowerCase();
var dga_wk =$('.dga_wk').val().toLowerCase();
var dg_wk =$('.dg_wk').val().toLowerCase();
var etat_fiche=$('.etat_fiche').val();
var etat_type=$('.etat_type').val();

var managerFullName=$('.managerFullName').val();
var rhFullname=$('.rhFullname').val();
var dgaFullName=$('.dgaFullName').val();
var dgFullName=$('.dgFullName').val();

loadvalideurs()
.then(data => {


	let results=data.data[0]; 
	 
	 manager_wk=results['manager']['email'].toLowerCase();
	 rh_wk=results['rh']['email'].toLowerCase();
	 dga_wk =results['dga']['email'].toLowerCase();
	 dg_wk=results['dg']['email'].toLowerCase();

     $('.mngadm_wk').val(manager_wk);
     $('.rh_wk').val(rh_wk);
     $('.dga_wk').val(dga_wk);
     $('.dg_wk').val(dg_wk);

     $('.managerFullName').val(results['manager']['fullname']);
     $('.rhFullname').val(results['rh']['fullname']);
     $('.dgaFullName').val(results['dga']['fullname']);
     $('.dgFullName').val(results['dg']['fullname']);

	console.log(results['manager']['fullname']);
})
.catch(error=>console.log(error));
 
//Appel du lien 
var lk_t =$('.user_url').val();
 
 //Mail de la DRH à l'employé 
 let workflowDrhEmploye=(sendemail,objet,destinateur,typeContrat,lien,numero,app)=>{
    $.ajax({
              url: "/"+app+"/configuration_w/pos_mail/contrat_emp_mail.php",
              type: "POST",
               data:{
                  sendemail:sendemail,
                  objet:objet,
                  destinateur:destinateur,
                  typeContrat:typeContrat,
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

 //Mail de la DRH à la direction administrative et juridique 
 let workflowRhDaj=(sendemail,objet,destinateur,typeContrat,nomPrenomRessource,lien,numero,app)=>{
    $.ajax({
              url: "/"+app+"/configuration_w/pos_mail/contrat_validate_raj_mail.php",
              type: "POST",
               data:{
                  sendemail:sendemail,
                  objet:objet,
                  destinateur:destinateur,
                  typeContrat:typeContrat,
                  nomPrenomRessource:nomPrenomRessource,
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

 //Mail de la direction administrative et juridique à au directeur general adjoint
 let workflowDajDga=(sendemail,objet,destinateur,typeContrat,nomPrenomRessource,lien,numero,app)=>{
    $.ajax({
              url: "/"+app+"/configuration_w/pos_mail/contrat_validate_dga_mail.php",
              type: "POST",
               data:{
                  sendemail:sendemail,
                  objet:objet,
                  destinateur:destinateur,
                  typeContrat:typeContrat,
                  nomPrenomRessource:nomPrenomRessource,
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

//Mail du directeur general adjoint au directeur general 
let workflowDgaDg=(sendemail,objet,destinateur,typeContrat,nomPrenomRessource,lien,numero,app)=>{
    $.ajax({
              url: "/"+app+"/configuration_w/pos_mail/contrat_validate_dg_mail.php",
              type: "POST",
               data:{
                  sendemail:sendemail,
                  objet:objet,
                  destinateur:destinateur,
                  typeContrat:typeContrat,
                  nomPrenomRessource:nomPrenomRessource,
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

//Mail de retour du DG à la RH
let workflowDgRh=(sendemail,objet,destinateur,typeContrat,nomPrenomRessource,lien,numero,app)=>{
    $.ajax({
              url: "/"+app+"/configuration_w/pos_mail/contrat_reponse_rh_mail.php",
              type: "POST",
               data:{
                  sendemail:sendemail,
                  objet:objet,
                  destinateur:destinateur,
                  typeContrat:typeContrat,
                  nomPrenomRessource:nomPrenomRessource,
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
// Mail de retour du DG à l'employé
let workflowDgEmpl=(sendemail,objet,destinateur,typeContrat,lien,numero,app)=>{
    $.ajax({
              url: "/"+app+"/configuration_w/pos_mail/contrat_reponse_rh_mail.php",
              type: "POST",
               data:{
                  sendemail:sendemail,
                  objet:objet,
                  destinateur:destinateur,
                  typeContrat:typeContrat, 
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
//  Mail de refus de l'employé à la RH
let workflowRefusEmpRh=(sendemail,objet,destinateur,nomPrenomRessource,typeContrat,lien,numero,app)=>{
    $.ajax({
              url: "/"+app+"/configuration_w/pos_mail/contrat_refus_emp_mail.php",
              type: "POST",
               data:{
                  sendemail:sendemail,
                  objet:objet,
                  destinateur:destinateur,
                  nomPrenomRessource:nomPrenomRessource,
                  typeContrat:typeContrat, 
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
// Mail de refus du departement administrative et juridique à la RH
let workflowRefusDajRh=(sendemail,objet,destinateur,fullNameManager,typeContrat,nomPrenomRessource,lien,numero,app)=>{
    $.ajax({
              url: "/"+app+"/configuration_w/pos_mail/contrat_refus_raj_mail.php",
              type: "POST",
               data:{
                  sendemail:sendemail,
                  objet:objet,
                  destinateur:destinateur,
                  fullNameManager:fullNameManager,
                  typeContrat:typeContrat,
                  nomPrenomRessource:nomPrenomRessource, 
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
// Mail de refus du directeur général adjoint à la RH
let workflowRefusDgaRh=(sendemail,objet,destinateur,fullNameDga,typeContrat,nomPrenomRessource,lien,numero,app)=>{
    $.ajax({
              url: "/"+app+"/configuration_w/pos_mail/contrat_refus_dga_mail.php",
              type: "POST",
               data:{
                  sendemail:sendemail,
                  objet:objet,
                  destinateur:destinateur,
                  fullNameDga:fullNameDga,
                  typeContrat:typeContrat,
                  nomPrenomRessource:nomPrenomRessource, 
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

// Mail de refus du directeur général à la RH
let workflowRefusDgRh=(sendemail,objet,destinateur,fullNameDg,typeContrat,nomPrenomRessource,lien,numero,app)=>{
    $.ajax({
              url: "/"+app+"/configuration_w/pos_mail/contrat_refus_dg_mail.php",
              type: "POST",
               data:{
                  sendemail:sendemail,
                  objet:objet,
                  destinateur:destinateur,
                  fullNameDg:fullNameDg,
                  typeContrat:typeContrat,
                  nomPrenomRessource:nomPrenomRessource, 
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


workflowRefusEmpRh("daouda.diarra@ngser","Contrat","FABIENNE KOFFI","CDI","DIARRA DAOUDA","ngsys.com","77","NGSYS");
$(document).on('click','.bouton_sub',function(){

        var val_modif = $('.action_hermes').val();
       

        ////////////// DEBUT LES VARIABLES DU CORPS DU MAIL ///////////
         //Appel du lien 
        var lk_t =$('.user_url').val();
        var val_modif = $('.action_hermes').val();
        var employe_wk =$('.emp_wk').val().toLowerCase();
        //var employe_wk="ibrahim.konate@ngser.com";
        var manager_wk =$('.mngadm_wk').val().toLowerCase();
        //var manager_wk="ibrahim.konate@ngser.com";
        var rh_wk =$('.rh_wk').val().toLowerCase();
        // var rh_wk ="ibrahim.konate@ngser.com";
        var dga_wk =$('.dga_wk').val().toLowerCase();
        //var dga_wk ="ibrahim.konate@ngser.com";
        var dg_wk =$('.dg_wk').val().toLowerCase();
        //var dg_wk ="ibrahim.konate@ngser.com";
        var personnel =$('.personnel').val().toLowerCase(); //mail de l'employer
        var selectPers =$('.selectPers').val().toLowerCase(); // fullNameEmploye
        var interselectperso =$('.interselectperso').val().toLowerCase(); // fullNameEmploye
        var interselectcontrat =$('.interselectcontrat').val().toLowerCase();
        var fullNamep = $('.fullNamep').val().toLowerCase();
        var numdmd = $('#numposeidon').val(); 

        var managerFullName=$('.managerFullName').val();
        var rhFullname=$('.rhFullname').val();
        var dgaFullName=$('.dgaFullName').val();
        var dgFullName=$('.dgFullName').val();
         
        var objet ="Contrat";
        // Debut Extraction du fullName de l'employe
        // var personnel;
        // var nameMatch = personnel.match(/^([^@]*)@/);
        // var fullName = nameMatch ? nameMatch[1] : null;
        // Fin extraction du fullName de l'employe
        // console.log(fullname);
        var monMail ="daouda.diarra@ngser.com";

        // Debut Extraction du fullName du manager administrative et juridique

            // var manager_wk;
            // var nameMatch = manager_wk.match(/^([^@]*)@/);
            // var fullNameMaj = nameMatch ? nameMatch[1] : null;
                
        // Fin Extraction du fullName du manager administrative et juridique

        ////////////// FIN LES VARIABLES DU CORPS DU MAIL ///////////
        
        
        // workflowDgaDg(monMail,objet,dgFullName,interselectcontrat,fullNamep,lk_t,numdmd,appN);
        //  workflowDajDga(monMail,objet,dgaFullName,interselectcontrat,fullNamep,lk_t,numdmd,appN);
        //  workflowRhDaj(monMail,objet,managerFullName,interselectcontrat,fullNamep,lk_t,numdmd,appN);
        // workflowDrhEmploye(personnel,objet,fullNamep,interselectcontrat,lk_t,numdmd,appN);

        if (val_modif.slice(0,17) =='AF_ENVEMPLOYE_COT') { 
            workflowDrhEmploye(personnel,objet,fullNamep,interselectcontrat,lk_t,numdmd,appN);
        }

        if (val_modif.slice(0,22) =='AB_TRSEMPLOYJURIST_COT') { 
            workflowRhDaj(manager_wk,objet,managerFullName,interselectcontrat,fullNamep,lk_t,numdmd,appN);
        }

         if (val_modif.slice(0,19) =='AB_TRSJURISTDGA_COT') { 
            workflowDajDga(dga_wk,objet,dgaFullName,interselectcontrat,fullNamep,lk_t,numdmd,appN);
        }
         if (val_modif.slice(0,15) =='AB_TRSDGADG_COT') { 
            workflowDgaDg(dg_wk,objet,dgFullName,interselectcontrat,fullNamep,lk_t,numdmd,appN);
        }

        if (val_modif.slice(0,13) =='AB_CLOSDG_COT') {
            workflowDgRh(rh_wk,objet,rhFullname,interselectcontrat,fullNamep,lk_t,numdmd,appN);
            workflowDgEmpl(personnel,objet,fullNamep,interselectcontrat,lk_t,numdmd,appN); 
        }
 
    // REFUS 

        if( val_modif.slice(0,19) == 'AB_TRSEMPLOYERH_COT'){
            workflowRefusEmpRh(rh_wk,objet,rhFullname,interselectcontrat,fullNamep,lk_t,numdmd,appN);
        }  

        if( val_modif.slice(0,18) == 'AB_TRSJURISTRH_COT'){ 
            workflowRefusDajRh(rh_wk,objet,rhFullname,managerFullName,interselectcontrat,fullNamep,lk_t,numdmd,appN);
        }   
        if( val_modif.slice(0,15) == 'AB_TRSDGARH_COT'){  
            workflowRefusDgaRh(rh_wk,objet,rhFullname,dgaFullName,interselectcontrat,fullNamep,lk_t,numdmd,appN);
        }

        if( val_modif.slice(0,15) == 'AB_TRSDGARH_COT'){ 
            workflowRefusDgaRh(rh_wk,objet,rhFullname,dgaFullName,interselectcontrat,fullNamep,lk_t,numdmd,appN);
        }

        if( val_modif.slice(0,14) == 'AB_TRSDGRH_COT'){ 
            workflowRefusDgRh(rh_wk,objet,rhFullname,dgFullName,interselectcontrat,fullNamep,lk_t,numdmd,appN);
        }

 
});