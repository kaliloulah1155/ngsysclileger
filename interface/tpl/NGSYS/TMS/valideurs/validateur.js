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
            type: "POST",
            data:{
                  employe:$('.emp_wk').val(),
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
var emp_wk =$('.emp_wk').val();
var manager_wk =$('.mng_wk').val();
  
var managerFullName=$('.managerFullName').val();
var rhFullname=$('.rhFullname').val();
var dgaFullName=$('.dgaFullName').val();
var dgFullName=$('.dgFullName').val(); 
loadvalideurs()

.then(data => { 
	let results=data.data[0];  
	 manager_wk=results['manager']['email'].toLowerCase();
     $('.mng_wk').val(manager_wk);

     $('.managerFullName').val(results['manager']['fullname']);
     $('.rhFullname').val(results['rh']['fullname']);
     $('.dgaFullName').val(results['dga']['fullname']);
     $('.dgFullName').val(results['dg']['fullname']);
 
})
.catch(error=>console.log(error));


//Appel du lien 
var lk_t =$('.user_url').val(); 

//Envoie du timesheet au manager par l'employe
let workflowEmployeManager=(sendemail,objet,destinateur,nomPrenomEmploye,lien,numero,app)=>{
    $.ajax({
              url: "/"+app+"/configuration_w/pos_mail/tms_employe_manager.php",
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

//Envoie du timesheet cconfirmation de l'envoie à l'employé
let workflowManagerEmploye=(sendemail,objet,destinateur,lien,numero,app)=>{
    $.ajax({
              url: "/"+app+"/configuration_w/pos_mail/tms_manager_employe.php",
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
 
//Rejet du timesheet de l'employé
let workflowRefus=(sendemail,objet,destinateur,lien,numero,app)=>{
    $.ajax({
              url: "/"+app+"/configuration_w/pos_mail/tms_manager_employe.php",
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

$(document).on('click','.bouton_sub',function(){


  ///////////// DEBUT LES VARIABLES DU CORPS DU MAIL ///////////
	var val_modif = $('.action_hermes').val();
    var employe_wk =$('.emp_wk').val().toLowerCase(); 
    var manager_wk =$('.mng_wk').val().toLowerCase(); 
    var lk_t =$('.user_url').val();  
    var numdmd = $('#numposeidon').val(); 
    var nomInterimaire = $('.personnel').val();
    var nomEmploye= $('.nom').val();
    var  prenomEmploye= $('.prenom').val();
    var objet ="Timesheet";
    var monMail ="daouda.diarra@ngser.com";
    var nomPrenomEmploye= nomEmploye+' '+prenomEmploye;
    var managerFullName=$('.managerFullName').val();
    var rhFullname=$('.rhFullname').val();
    var dgaFullName=$('.dgaFullName').val();
    var dgFullName=$('.dgFullName').val();
    var departement =  $('.viewdepartement').val();   
    var app="NGSYS";
   ////////////// FIN LES VARIABLES DU CORPS DU MAIL ///////////

        // workflowRefus(emp_wk,objet,nomPrenomEmploye,lk_t,numdmd,app);
        // workflowManagerEmploye(emp_wk,objet,nomPrenomEmploye,lk_t,numdmd,app);
        // workflowEmployeManager(monMail,objet,managerFullName,nomPrenomEmploye,lk_t,numdmd,app);
    
         //Message vers les valideurs
        var valideur =(validator,employe_wk,app)=> { 
             
        }

        if (val_modif.slice(0,18) =='AA_TRANSDEVMNG_TMS') {
            //  Envoyé à son manager
            workflowEmployeManager(manager_wk,objet,managerFullName,nomPrenomEmploye,lk_t,numdmd,app);    
        }

        if (val_modif.slice(0,18) =='AA_CLOSNODEVRH_TMS') {
            // Confirmation de l'envoie retourné à l'employé
            workflowManagerEmploye(emp_wk,objet,nomPrenomEmploye,lk_t,numdmd,app);
        }
       
        // REFUS  
        if( val_modif.slice(0,18) == 'AB_REFUSDEVMNG_TMS'){
            // Refus du timesheet envoyé à l'employe
            workflowRefus(emp_wk,objet,nomPrenomEmploye,lk_t,numdmd,app); 
        }  
 

 
 
});  