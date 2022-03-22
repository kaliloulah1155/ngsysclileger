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

var initiateur_wk =$('.createur').val().toLowerCase();
var rh_wk =$('.rh_wk').val().toLowerCase();
var dga_wk =$('.dga_wk').val().toLowerCase();
var dg_wk =$('.dg_wk').val().toLowerCase();

var managerFullName=$('.managerFullName').val();
var rhFullname=$('.rhFullname').val();
var dgaFullName=$('.dgaFullName').val();
var dgFullName=$('.dgFullName').val();


loadvalideurs()
.then(data => {


	let results=data.data[0]; 
	 
	 rh_wk=results['rh']['email'].toLowerCase();
	 dga_wk =results['dga']['email'].toLowerCase();
	 dg_wk=results['dg']['email'].toLowerCase();
     $('.rh_wk').val(rh_wk);
     $('.dga_wk').val(dga_wk);
     $('.dg_wk').val(dg_wk);

     $('.managerFullName').val(results['manager']['fullname']);
     $('.rhFullname').val(results['rh']['fullname']);
     $('.dgaFullName').val(results['dga']['fullname']);
     $('.dgFullName').val(results['dg']['fullname']);
})
.catch(error=>console.log(error));

//Appel du lien 
var lk_t =$('.user_url').val();

// console.log(lk_t);
 
// Mail de l'employé à la RH  
let workflowDBQEmplRh=(sendemail,objet,nomPrenomEmploye,destinateur,banque,rib,lien,numero,app)=>{
    $.ajax({
            url: "/"+app+"/configuration_w/pos_mail/dbq_emp_rh.php",
            // url: "/"+app+"interface/tpl/"+app+"/DBQ/pos_mail/mail_emp_rh.php",
            
            type: "POST",
            data:{
                sendemail:sendemail,
                objet:objet,
                nomPrenomEmploye:nomPrenomEmploye,
                destinateur:destinateur, 
                banque:banque,
                rib:rib,
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
};

// Mail de la RH au DGA 
let workflowDBQRhDga=(sendemail,objet,nomPrenomEmploye,destinateur,banque,rib,lien,numero,app)=>{
    $.ajax({
            url: "/"+app+"/configuration_w/pos_mail/dbq_rh_dga.php",
            // url: "/"+app+"interface/tpl/"+app+"/DBQ/pos_mail/mail_emp_rh.php",
            
            type: "POST",
            data:{
                sendemail:sendemail,
                objet:objet,
                nomPrenomEmploye:nomPrenomEmploye,
                destinateur:destinateur, 
                banque:banque,
                rib:rib,
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
};
// Mail du DGA au DG 
let workflowDBQDgaDg=(sendemail,objet,nomPrenomEmploye,destinateur,banque,rib,lien,numero,app)=>{
    $.ajax({
            url: "/"+app+"/configuration_w/pos_mail/dbq_dga_dg.php",
            // url: "/"+app+"interface/tpl/"+app+"/DBQ/pos_mail/mail_emp_rh.php",
            
            type: "POST",
            data:{
                sendemail:sendemail,
                objet:objet,
                nomPrenomEmploye:nomPrenomEmploye,
                destinateur:destinateur, 
                banque:banque,
                rib:rib,
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
};
// Mail de validation de la direction général à l'employé 
let workflowDBQDgEmpl=(sendemail,objet,destinateur,banque,rib,lien,numero,app)=>{
    $.ajax({
            url: "/"+app+"/configuration_w/pos_mail/dbq_dga_empl.php",
            // url: "/"+app+"interface/tpl/"+app+"/DBQ/pos_mail/mail_emp_rh.php",
            
            type: "POST",
            data:{
                sendemail:sendemail,
                objet:objet, 
                destinateur:destinateur, 
                banque:banque,
                rib:rib,
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
};

// workflowDBQEmplRh("daouda.diarra@ngser.com","objet","nomPrenomEmploye","rhFullname","nomBanque","nouveauRib","lk_t","nomBanque","NGSYS"); 


$(document).on('click','.bouton_sub',function(){


    ///////////// DEBUT LES VARIABLES DU CORPS DU MAIL ///////////
        var  monMail ="daouda.diarra@ngser.com";
        var  james= "james.akran@ngser.com";
        var  objet ="Domiciliation bancaire";
        var  nomEmploye= $('.viewnom').val();
        var  prenomEmploye= $('.viewprenom').val();  
        var  nomPrenomEmploye= nomEmploye+' '+prenomEmploye;
        var  managerFullName=$('.managerFullName').val();
        var  rhFullname=$('.rhFullname').val();
        var  dgaFullName=$('.dgaFullName').val();
        var  dgFullName=$('.dgFullName').val();
        var  nomBanque = $('.nomBanque').val();
        var  nouveauRib = $('.nouveauRib').val();
        var  numdmd = $('#numposeidon').val();
        var lk_t =$('.user_url').val();
        var rh_wk =$('.rh_wk').val().toLowerCase();
        var dga_wk =$('.dga_wk').val().toLowerCase();
        var dg_wk =$('.dg_wk').val().toLowerCase();
        var personnel =$('.personnel').val().toLowerCase();
        var initiateur_wk =$('.createur').val().toLowerCase();
    ////////////// FIN LES VARIABLES DU CORPS DU MAIL ///////////

      

        // workflowDBQEmplRh("daouda.diarra@ngser.com","objet","nomPrenomEmploye","rhFullname","nomBanque","nouveauRib","lk_t","nomBanque","NGSYS");

        // workflowDBQEmplRh(monMail,objet,nomPrenomEmploye,rhFullname,nomBanque,nouveauRib,lk_t,numdmd,appN); // ok inserer mail rh
        // workflowDBQRhDga(monMail,objet,nomPrenomEmploye,dgaFullName,nomBanque,nouveauRib,lk_t,numdmd,appN); //ok inserer mail dga
        // workflowDBQDgaDg(monMail,objet,nomPrenomEmploye,dgFullName,nomBanque,nouveauRib,lk_t,numdmd,appN); //ok inserer mail dg
        // workflowDBQDgEmpl(monMail,objet,nomPrenomEmploye,nomBanque,nouveauRib,lk_t,numdmd,appN)
            
        if (val_modif.slice(0,18) =='AA_TRSEMPLOYRH_DBQ') {
            workflowDBQEmplRh(rh_wk,objet,nomPrenomEmploye,rhFullname,nomBanque,nouveauRib,lk_t,numdmd,appN);
        }

      
        if (val_modif.slice(0,15) =='AA_TRSRHDGA_DBQ') {
            workflowDBQRhDga(dga_wk,objet,nomPrenomEmploye,dgaFullName,nomBanque,nouveauRib,lk_t,numdmd,appN);
        }

       
        if (val_modif.slice(0,15) =='AA_TRSDGADG_DBQ') {
            workflowDBQDgaDg(dg_wk,objet,nomPrenomEmploye,dgFullName,nomBanque,nouveauRib,lk_t,numdmd,appN);
        }
  
       if (val_modif.slice(0,13) =='AA_CLOSDG_DBQ') {
            workflowDBQDgEmpl(initiateur_wk,objet,nomPrenomEmploye,nomBanque,nouveauRib,lk_t,numdmd,appN)
 
        } 
  
    // REFUS 
    
 
	
});
   