//alert($('.etat_type').val());

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
    var manager_wk =$('.manager_wk').val().toLowerCase();
    var controleur_wk =$('.controleur_wk').val().toLowerCase();
    var finance_wk =$('.finance_wk').val().toLowerCase();
    var rh_wk =$('.rh_wk').val().toLowerCase();
    var dga_wk =$('.dga_wk').val().toLowerCase();
    var dg_wk =$('.dg_wk').val().toLowerCase();
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

     $('.managerFullName').val(results['manager']['fullname']);
     $('.rhFullname').val(results['rh']['fullname']);
     $('.dgaFullName').val(results['dga']['fullname']);
     $('.dgFullName').val(results['dg']['fullname']);
     $('.controleurFullname').val(results['controleur']['fullname']);
     $('.financeFullName').val(results['finance']['fullname']);

})
.catch(error=>console.log(error));

//Appel du lien 
var lk_t =$('.user_url').val();  

//Mail de demande de mission d'un collaborateur envoyé son manager 
let workflowMISEmployeManager=(sendemail,objet,nomPrenomDemandeur,destinateur,lien,numero,app)=>{
    $.ajax({
        url: "/"+app+"/configuration_w/pos_mail/mis_empl_manager.php",
        type: "POST",
         data:{
                    sendemail:sendemail,
                    objet:objet,
                    nomPrenomDemandeur:nomPrenomDemandeur,
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

// Mail de demande de mission du collaborateur envoyé au Controle de Gestion par le Manager
let workflowMISManagerCG=(sendemail,objet,NomPrenomManager,nomPrenomDemandeur,destinateur,lien,numero,app)=>{
    $.ajax({
        url: "/"+app+"/configuration_w/pos_mail/mis_manager_cg.php",
        type: "POST",
         data:{
                sendemail:sendemail,
                objet:objet,
                NomPrenomManager:NomPrenomManager,
                nomPrenomDemandeur:nomPrenomDemandeur,
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
// Mail de demande de misson du collaborateur envoyé à la RH par le Controle de Gestion
let workflowMISCGRh=(sendemail,objet,nomPrenomDemandeur,destinateur,lien,numero,app)=>{
    $.ajax({
        url: "/"+app+"/configuration_w/pos_mail/mis_cg_rh.php",
        type: "POST",
         data:{
                sendemail:sendemail,
                objet:objet, 
                nomPrenomDemandeur:nomPrenomDemandeur,
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
// Mail de demande de misson du collaborateur envoyé au DGA par la RH 
let workflowMISRhDga=(sendemail,objet,nomPrenomDemandeur,destinateur,lien,numero,app)=>{
    $.ajax({
        url: "/"+app+"/configuration_w/pos_mail/mis_rh_dga.php",
        type: "POST",
         data:{
                sendemail:sendemail,
                objet:objet, 
                nomPrenomDemandeur:nomPrenomDemandeur,
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
// Mail de demande de misson du collaborateur envoyé au DG par le DGA 
let workflowMISDgaDg=(sendemail,objet,nomPrenomDemandeur,destinateur,lien,numero,app)=>{
    $.ajax({
        url: "/"+app+"/configuration_w/pos_mail/mis_dga_dg.php",
        type: "POST",
         data:{
                sendemail:sendemail,
                objet:objet, 
                nomPrenomDemandeur:nomPrenomDemandeur,
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

// Mail de demande de misson du collaborateur envoyé à la finance par le DG
let workflowMISDgFinance=(sendemail,objet,nomPrenomDemandeur,destinateur,lien,numero,app)=>{
    $.ajax({
        url: "/"+app+"/configuration_w/pos_mail/mis_dga_dg.php",
        type: "POST",
         data:{
                sendemail:sendemail,
                objet:objet, 
                nomPrenomDemandeur:nomPrenomDemandeur,
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
 
// Mail de validation de la direction envoyé à l'employé
let workflowMISFinanceEmploye=(sendemail,objet,destinateur,lien,numero,app)=>{
    $.ajax({
        url: "/"+app+"/configuration_w/pos_mail/mis_finance_employe.php",
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

// Mail de validation de la direction envoyé à l'employé
let workflowMISRefusDmdEmploye=(sendemail,objet,destinateur,lien,numero,app)=>{
    $.ajax({
        url: "/"+app+"/configuration_w/pos_mail/mis_refus_dmd_employe.php",
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

// Mail de demande de mission d'un Manager envoyé à  la RH
let workflowMISManagerRh=(sendemail,objet,nomPrenomDemandeur,destinateur,lien,numero,app)=>{
    $.ajax({
        url: "/"+app+"/configuration_w/pos_mail/mis_manager_rh.php",
        type: "POST",
         data:{
                    sendemail:sendemail,
                    objet:objet,
                    nomPrenomDemandeur:nomPrenomDemandeur,
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


//workflowMISManagerRh("daouda.diarra@ngser.com","objet","nomPrenomDemandeur","rh","lk_t","numdmd","NGSYS");
 
$(document).on('click','.bouton_sub',function(){
  

    ///////////// DEBUT LES VARIABLES DU CORPS DU MAIL ///////////
    var lk_t =$('.user_url').val();
    var monMail="daouda.diarra@ngser.com"; 
    var nomDemandeur= $('.viewnom').val();
    var prenomDemandeur= $('.viewprenom').val();
    var objet ="demande de mission"; 
    var nomPrenomDemandeur = nomDemandeur+' '+prenomDemandeur; 
    var numdmd = $('#numposeidon').val();  
    var app ="NGSYS";
    var managerFullName=$('.managerFullName').val();
    var rhFullname=$('.rhFullname').val();
    var dgaFullName=$('.dgaFullName').val();
    var dgFullName=$('.dgFullName').val(); 
    var controleurFullname=$('.controleurFullname').val();
    var financeFullName=$('.financeFullName').val();
    var initiateur_wk =$('.createur').val().toLowerCase();
    var manager_wk =$('.manager_wk').val().toLowerCase();
    var controleur_wk =$('.controleur_wk').val().toLowerCase();
    var finance_wk =$('.finance_wk').val().toLowerCase();
    var rh_wk =$('.rh_wk').val().toLowerCase();
    var dga_wk =$('.dga_wk').val().toLowerCase();
    var dg_wk =$('.dg_wk').val().toLowerCase();
    var val_modif = $('.action_hermes').val();
    
    //  workflowMISManagerRh("daouda.diarra@ngser.com","objet","nomPrenomDemandeur","rh","lk_t","numdmd","NGSYS"); 
     ////////////// FIN LES VARIABLES DU CORPS DU MAIL ///////////

    //  workflowMISRefusDmdEmploye(monMail,objet,nomPrenomDemandeur,lk_t,numdmd,app); ok
    //  workflowMISFinanceEmploye(monMail,objet,nomPrenomDemandeur,lk_t,numdmd,app);ok
    //  workflowMISDgFinance(monMail,objet,nomPrenomDemandeur,financeFullName,lk_t,numdmd,app); OK
    //  workflowMISDgaDg(monMail,objet,nomPrenomDemandeur,dgFullName,lk_t,numdmd,app); ok
    //  workflowMISRhDga(monMail,objet,nomPrenomDemandeur,dgaFullName,lk_t,numdmd,app); ok
    //  workflowMISCGRh(monMail,objet,nomPrenomDemandeur,rhFullname,lk_t,numdmd,app); ok
    //  workflowMISManagerCG(monMail,objet,managerFullName,nomPrenomDemandeur,controleurFullname,lk_t,numdmd,app); ok
    //  workflowMISEmployeManager(monMail,objet,nomPrenomDemandeur,managerFullName,lk_t,numdmd,app); ok
    //  workflowMISManagerRh(monMail,objet,nomPrenomDemandeur,rhFullname,lk_t,numdmd,app); cas de la demande fait par un manager ok

         //Message vers les valideurs
        var valideur =(validator,initiateur_wk,app)=> { 
            
        }

        if (val_modif.slice(0,16) =='AA_TRSEMPMNG_MIS') {
            // Envoyé au manager
            workflowMISEmployeManager(manager_wk,objet,nomPrenomDemandeur,managerFullName,lk_t,numdmd,app);
        }

  
        if (val_modif.slice(0,18) =='AA_TRSMNGCONTR_MIS') {
            // Envoyé au controle de gestion
            workflowMISManagerCG(controleur_wk,objet,managerFullName,nomPrenomDemandeur,controleurFullname,lk_t,numdmd,app);
        }
    
       
        if (val_modif.slice(0,16) =='AA_TRSGESTRH_MIS') {
            // Envoyé à la rh  cas employé et manager
            workflowMISCGRh(rh_wk,objet,nomPrenomDemandeur,rhFullname,lk_t,numdmd,app)
            workflowMISManagerRh(rh_wk,objet,nomPrenomDemandeur,rhFullname,lk_t,numdmd,app);
        }
        if (val_modif.slice(0,15) =='AA_TRSRHMNG_MIS') {
             
        }
        if (val_modif.slice(0,19) =='AA_TRSMNGCONTROL_MIS') {
             
        }
         if (val_modif.slice(0,20) =='AA_TRSCONTROLDGA_MIS') {
            //  Envoie au DGA 
            workflowMISRhDga(dga_wk,objet,nomPrenomDemandeur,dgaFullName,lk_t,numdmd,app);
        }

        if (val_modif.slice(0,15) =='AA_TRSDGADG_MIS') {
            // Envoie au DG 
            workflowMISDgaDg(dg_wk,objet,nomPrenomDemandeur,dgFullName,lk_t,numdmd,app);
        }

        if (val_modif.slice(0,14) =='AA_TRSDGRH_MIS') {
              
        }

        if (val_modif.slice(0,19) =='AA_TRSRHFINANCE_MIS') {
            // Envoie à la finance  
            workflowMISDgFinance(finance_wk,objet,nomPrenomDemandeur,financeFullName,lk_t,numdmd,app);
        }
  
       if (val_modif.slice(0,19) =='AA_TRSFINANCEMP_MIS') {
            //  Retour de validation envoyé à l'initiateur 
            workflowMISFinanceEmploye(initiateur_wk,objet,nomPrenomDemandeur,lk_t,numdmd,app);
 
        }  
  
    // REFUS 

     if(
             val_modif.slice(0,16) == 'AA_REFUSGEST_MIS' ||
             val_modif.slice(0,14) == 'AA_REFUSRH_MIS'  ||
             val_modif.slice(0,15) == 'AA_REFUSDGA_MIS' 
               
        ){ 
            // Mail envoyé à l'initiateur en cas de refus
            workflowMISRefusDmdEmploye(initiateur_wk,objet,nomPrenomDemandeur,lk_t,numdmd,app);
        } 
    
 
	
});
   

   