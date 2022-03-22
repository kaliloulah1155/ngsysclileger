 //alert($('.etat_type').val());
 let appN = $(".appName").val();
///////////CHARGEMENT DES VALIDATEURS ///////////////////
 let link_url =
    "/" +
    appN +
    "/interface/tpl/" +
    appN +
    "/DFM/valideurs/validateur.php";

  
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
var manager_wk =$('.manager_wk').val().toLowerCase();
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
    
	// console.log(results['initiateur']['email']);
})
.catch(error=>console.log(error));

//Appel du lien 
var lk_t =$('.user_url').val();

//Mail de demande de formation du manager envoyé à la RH  
let workflowManagerRh=(sendemail,objet,destinateur,intinule,departement,lien,numero,appN)=>{
    $.ajax({
            url: "/"+appN+"/configuration_w/pos_mail/dfm_manager_rh.php", 
            type: "POST",
            data:{
                  sendemail:sendemail,
                  objet:objet,
                  destinateur:destinateur,
                  intinule:intinule,
                  departement:departement,
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


//Mail de la RH au Directeur Administratif et Juridique 
let workflowRhDaj=(sendemail,objet,destinateur,intinule,departement,lien,numero,appN)=>{
    $.ajax({
            url: "/"+appN+"/configuration_w/pos_mail/dfm_rh_daj.php", 
            type: "POST",
            data:{
                  sendemail:sendemail,
                  objet:objet,
                  destinateur:destinateur,
                  intinule:intinule,
                  departement:departement,
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

//Mail Département Administratif et Juridique au Directeur Général Adjoint
let workflowDajDga=(sendemail,objet,destinateur,intinule,departement,lien,numero,appN)=>{
    $.ajax({
            url: "/"+appN+"/configuration_w/pos_mail/dfm_daj_dga.php", 
            type: "POST",
            data:{
                  sendemail:sendemail,
                  objet:objet,
                  destinateur:destinateur,
                  intinule:intinule,
                  departement:departement,
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

//Mail du Directeur Général Adjoint au Directeur Général
let workflowDgaDg=(sendemail,objet,destinateur,intinule,departement,lien,numero,appN)=>{
    $.ajax({
            url: "/"+appN+"/configuration_w/pos_mail/dfm_dga_dg.php", 
            type: "POST",
            data:{
                  sendemail:sendemail,
                  objet:objet,
                  destinateur:destinateur,
                  intinule:intinule,
                  departement:departement,
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

//Mail du Directeur Général au Manager du departement qui à fait la demande
let workflowDgManager=(sendemail,objet,destinateur,intinule,lien,numero,appN)=>{
    $.ajax({
            url: "/"+appN+"/configuration_w/pos_mail/dfm_dg_manager.php", 
            type: "POST",
            data:{
                  sendemail:sendemail,
                  objet:objet,
                  destinateur:destinateur,
                  intinule:intinule, 
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
// Mail de refus de la demande de la direction au Manager qui à fait la demande
let workflowRefusManager=(sendemail,objet,destinateur,intinule,lien,numero,appN)=>{
    $.ajax({
            url: "/"+appN+"/configuration_w/pos_mail/dfm_refus_manager.php", 
            type: "POST",
            data:{
                  sendemail:sendemail,
                  objet:objet,
                  destinateur:destinateur,
                  intinule:intinule, 
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

// workflowManagerRh("daouda.diarra@ngser.com","Demande de formation","FABIENNE KOFFI","Poseidon","JAMES AKRAN","www.ngys.ngser","6543","NGYS");
 
$(document).on('click','.bouton_sub',function(){ 

     ///////////// DEBUT LES VARIABLES DU CORPS DU MAIL ///////////
    var  managerFullName=$('.managerFullName').val();
    var lk_t =$('.user_url').val();
    var  rhFullname=$('.rhFullname').val();
    var  dgaFullName=$('.dgaFullName').val();
    var  dgFullName=$('.dgFullName').val();
    var  numdmd = $('.numposeidon').val();   
    var nomManager= $('.nom').val();
    var prenomManager= $('.prenom').val();
    var objet ="Demande de formation";
    var departement = $('.departement').val();
    console.log(departement);
    var intinule= $('.intitule').val();
    //nom et prenom de l'initateur
    var monMail="daouda.diarra@ngser.com";
    var nomPrenomManager= nomManager+' '+prenomManager;
    var initiateur_wk =$('.createur').val().toLowerCase();
    var rh_wk =$('.rh_wk').val().toLowerCase();
    var manager_wk =$('.manager_wk').val().toLowerCase();
    var dga_wk =$('.dga_wk').val().toLowerCase();
    var dg_wk =$('.dg_wk').val().toLowerCase(); 
    
     ////////////// FIN LES VARIABLES DU CORPS DU MAIL ///////////

    
    //  workflowManagerRh(monMail,objet,rhFullname,intinule,departement,lk_t,numdmd,appN);
    //  workflowRhDaj(monMail,objet,managerFullName,intinule,departement,lk_t,numdmd,appN);
    //  workflowDajDga(monMail,objet,dgaFullName,intinule,departement,lk_t,numdmd,appN);
    //  workflowDgaDg(monMail,objet,dgFullName,intinule,departement,lk_t,numdmd,appN);
    //  workflowDgManager(initiateur_wk,objet,nomPrenomManager,intinule,lk_t,numdmd,appN);
    //  workflowRefusManager(monMail,objet,nomPrenomManager,intinule,lk_t,numdmd,appN);

         //Message vers les valideurs
        var valideur =(validator,initiateur_wk,app)=> { 
              
        }

        if (val_modif.slice(0,15) =='AA_TRSMNGRH_DFM') { 
            workflowManagerRh(rh_wk,objet,rhFullname,intinule,departement,lk_t,numdmd,appN);
        }

     
        if (val_modif.slice(0,14) =='AA_TRSRHRA_DFM') {
            workflowRhDaj(manager_wk,objet,managerFullName,intinule,departement,lk_t,numdmd,appN)
        }
      
        if (val_modif.slice(0,15) =='AA_TRSRADGA_DFM') {
            workflowDajDga(dga_wk,objet,dgaFullName,intinule,departement,lk_t,numdmd,appN);
        }

       
        if (val_modif.slice(0,15) =='AA_TRSDGADG_DFM') {
            workflowDgaDg(dg_wk,objet,dgFullName,intinule,departement,lk_t,numdmd,appN);
        }
  
       if (val_modif.slice(0,13) =='AA_CLOSDG_DFM') {
            workflowDgManager(initiateur_wk,objet,nomPrenomManager,intinule,lk_t,numdmd,appN);    
        } 
  
    // REFUS 
 
        if(
             val_modif.slice(0,14) == 'AB_REFUSRA_DFM' ||
             val_modif.slice(0,15) == 'AB_REFUSDGA_DFM'  ||
             val_modif.slice(0,14) == 'AB_REFUSDG_DFM'  
            ){ 
            workflowRefusManager(initiateur_wk,objet,nomPrenomManager,intinule,lk_t,numdmd,appN);
        } 

  
 
	
});
 