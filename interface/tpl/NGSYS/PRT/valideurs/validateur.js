 //alert($('.etat_type').val());
 //let appN = $(".appName").val();
///////////CHARGEMENT DES VALIDATEURS ///////////////////
 let link_url_val =
    "/" +
    appN +
    "/interface/tpl/" +
    appN +
    "/PRT/valideurs/validateur.php";


   const loadvalideurs = () => {
    return new Promise((resolve, reject) => {
        $.ajax({
            url: link_url_val,
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
//console.log(getLink());

 

var initiator =$('.createur').val().toLowerCase(); 
var manager_wk =$('.manager_wk').val(); 
var controleur_wk =$('.controleur_wk').val(); 
var rh_wk =$('.rh_wk').val(); 
var dga_wk =$('.dga_wk').val(); 
var dg_wk =$('.dg_wk').val(); 
var finance_wk =$('.finance_wk').val();

var managerFullName=$('.managerFullName').val();
var rhFullname=$('.rhFullname').val();
var dgaFullName=$('.dgaFullName').val();
var dgFullName=$('.dgFullName').val(); 
var controleurFullname=$('.controleurFullname').val();
var financeFullName=$('.financeFullName').val();

loadvalideurs()
.then(data => {

let results=data.data[0]; 
 
 rh_wk=results['rh']['email'].toLowerCase(); 
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
 
 $('.rhFullname').val(results['rh']['fullname']);
 $('.dgaFullName').val(results['dga']['fullname']);
 $('.dgFullName').val(results['dg']['fullname']);
 $('.controleurFullname').val(results['controleur']['fullname']);
 $('.financeFullName').val(results['finance']['fullname']);

})
.catch(error=>console.log(error));


//Appel du lien 
var lk_t =$('.user_url').val();

//alert(lk_t);

console.log(dga_wk);

//Demande de pret d'un employé envoyé à la RH 
let workflowPRTEmployeRh=(sendemail,objet,destinateur,nomPrenomDemandeur,lien,numero,app)=>{
    $.ajax({
              url: "/"+app+"/configuration_w/pos_mail/prt_employe_rh.php",
              type: "POST",
               data:{
                  sendemail:sendemail, 
                  objet:objet,
                  destinateur:destinateur,
                  nomPrenomDemandeur:nomPrenomDemandeur,
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
// Demande de pret d'envoyé envoyé par la RH àu CG
let workflowPRTERhCG=(sendemail,objet,destinateur,nomPrenomDemandeur,lien,numero,app)=>{
    $.ajax({
              url: "/"+app+"/configuration_w/pos_mail/prt_rh_cg.php",
              type: "POST",
               data:{
                  sendemail:sendemail, 
                  objet:objet,
                  destinateur:destinateur,
                  nomPrenomDemandeur:nomPrenomDemandeur,
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
// Demande de pret d'envoyé envoyé par le CG au DGA
let workflowPRTECgDga=(sendemail,objet,destinateur,nomPrenomDemandeur,lien,numero,app)=>{
    $.ajax({
              url: "/"+app+"/configuration_w/pos_mail/prt_cg_dga.php",
              type: "POST",
               data:{
                  sendemail:sendemail, 
                  objet:objet,
                  destinateur:destinateur,
                  nomPrenomDemandeur:nomPrenomDemandeur,
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

// Demande de pret d'envoyé envoyé par le DGA au DG
let workflowPRTEDgaDg=(sendemail,objet,destinateur,nomPrenomDemandeur,lien,numero,app)=>{
    $.ajax({
              url: "/"+app+"/configuration_w/pos_mail/prt_dga_dg.php",
              type: "POST",
               data:{
                  sendemail:sendemail, 
                  objet:objet,
                  destinateur:destinateur,
                  nomPrenomDemandeur:nomPrenomDemandeur,
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
// Demande de pret d'envoyé envoyé par le DG à la finance
let workflowPRTEDgFinance=(sendemail,objet,destinateur,nomPrenomDemandeur,lien,numero,app)=>{
    $.ajax({
              url: "/"+app+"/configuration_w/pos_mail/prt_dg_finance.php",
              type: "POST",
               data:{
                  sendemail:sendemail, 
                  objet:objet,
                  destinateur:destinateur,
                  nomPrenomDemandeur:nomPrenomDemandeur,
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

// Mail de Validation de la demande envoyé à l'employé par la direction général
let workflowPRTEDgEmploye=(sendemail,objet,destinateur,lien,numero,app)=>{
    $.ajax({
              url: "/"+app+"/configuration_w/pos_mail/prt_dg_employe.php",
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

// Mail rejet de la demande envoyé à l'employé par la direction général
let workflowPRTERefusDgEmploye=(sendemail,objet,destinateur,lien,numero,app)=>{
    $.ajax({
              url: "/"+app+"/configuration_w/pos_mail/prt_refus_dg_employe.php",
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
// workflowPRTEmployeRh("daouda.diarra@ngser.com","objet","destinateur","nomPrenomDemandeur","lien","numero","NGSYS");
 
$(document).on('click','.bouton_sub',function(){

 
	var val_modif = $('.action_hermes').val();
   
    

    ///////////// DEBUT LES VARIABLES DU CORPS DU MAIL ///////////
    var managerFullName=$('.managerFullName').val();
    var rhFullname=$('.rhFullname').val();
    var dgaFullName=$('.dgaFullName').val();
    var dgFullName=$('.dgFullName').val(); 
    var controleurFullname=$('.controleurFullname').val();
    var financeFullName=$('.financeFullName').val(); 
    var lk_t =$('.user_url').val();
    var numdmd = $('#numposeidon').val(); 
    var nomInterimaire = $('.personnel').val();
    var nomDemandeur= $('.viewnom').val();
    var  prenomDemandeur= $('.viewprenom').val();
    var objet ="demande de pret";
    //nom et prenom de l'initateur
    var nomPrenomInitiateur= nomDemandeur+' '+prenomDemandeur;
    var monMail="daouda.diarra@ngser.com"; 
    var app ="NGSYS"; 
    var initiator =$('.createur').val().toLowerCase(); 
    var manager_wk =$('.manager_wk').val(); 
    var controleur_wk =$('.controleur_wk').val(); 
    var rh_wk =$('.rh_wk').val(); 
    var dga_wk =$('.dga_wk').val(); 
    var dg_wk =$('.dg_wk').val(); 
    var finance_wk =$('.finance_wk').val();
    
    ////////////// FIN LES VARIABLES DU CORPS DU MAIL ///////////

        // workflowPRTERefusDgEmploye(monMail,objet,nomPrenomInitiateur,lk_t,numdmd,app);
        // workflowPRTEDgEmploye(monMail,objet,nomPrenomInitiateur,lk_t,numdmd,app);
        // workflowPRTEDgFinance(monMail,objet,financeFullName,nomPrenomInitiateur,lk_t,numdmd,app);
        // workflowPRTEDgaDg(monMail,objet,dgFullName,nomPrenomInitiateur,lk_t,numdmd,app);
        // workflowPRTECgDga(monMail,objet,dgaFullName,nomPrenomInitiateur,lk_t,numdmd,app);
        // workflowPRTERhCG(monMail,objet,controleurFullname,nomPrenomInitiateur,lk_t,numdmd,app);
        // workflowPRTEmployeRh(monMail,objet,rhFullname,nomPrenomInitiateur,lk_t,numdmd,app);

         //Message vers les valideurs
        var valideur =(validator,initiateur_wk,app)=> { 
            
        }

        if (val_modif.slice(0,18) =='AA_TRSEMPLOYRH_PRT') {
            // Envoyé à la RH
            workflowPRTEmployeRh(rh_wk,objet,rhFullname,nomPrenomInitiateur,lk_t,numdmd,app);
        }

      
        if (val_modif.slice(0,19) =='AA_TRSRHCONTROL_PRT') {
            // Envoyé au controle de gestion 
            workflowPRTERhCG(controleur_wk,objet,controleurFullname,nomPrenomInitiateur,lk_t,numdmd,app);
        }

         
        if (val_modif.slice(0,20) =='AA_TRSCONTROLDGA_PRT') {
            // Envoyé au DGA
            workflowPRTECgDga(dga_wk,objet,dgaFullName,nomPrenomInitiateur,lk_t,numdmd,app);
        }
        if (val_modif.slice(0,15) =='AA_TRSDGADG_PRT') {
            // Envoyé au DG
            workflowPRTEDgaDg(dg_wk,objet,dgFullName,nomPrenomInitiateur,lk_t,numdmd,app);
        }
        if (val_modif.slice(0,19) =='AA_TRSDGFINANCE_PRT') {
            //  Envoyé à la finance
            workflowPRTEDgFinance(finance_wk,objet,financeFullName,nomPrenomInitiateur,lk_t,numdmd,app);
        }
  
       if (val_modif.slice(0,18) =='AA_CLOSFINANCE_PRT') {
            // Envoyé à l'initiateur de la demande
            workflowPRTEDgEmploye(initiator,objet,nomPrenomInitiateur,lk_t,numdmd,app);
        } 
      

     //REFUS

     if(
        val_modif.slice(0,14) == 'AA_REFUSRH_PRT' ||
        val_modif.slice(0,19) == 'AA_REFUSCONTROL_PRT'  ||
        val_modif.slice(0,15) == 'AA_REFUSDGA_PRT' ||
        val_modif.slice(0,14) == 'AA_REFUSDG_PRT'  
        ){
            // Envoyé à l'initiateur de la demande
            workflowPRTERefusDgEmploye(initiator,objet,nomPrenomInitiateur,lk_t,numdmd,app);
             
        } 


     
   
});
   