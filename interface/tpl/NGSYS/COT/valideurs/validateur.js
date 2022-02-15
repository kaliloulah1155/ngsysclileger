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
//initiateur_wk
var emp_wk =$('.emp_wk').val().toLowerCase();
var manager_wk =$('.mngadm_wk').val().toLowerCase();
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

     $('.mngadm_wk').val(manager_wk);
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

 //Envoi de mail via workflow
class WorkflowMailer{
   
   constructor(email,titre,contenu,app){

       this.email=email;
       this.titre=titre;
       this.contenu=contenu;

       this.link2="/" +
		    app +
		    "/interface/tpl/" +
		    app +
		    "/COT/pos_mail/pos_mailer.php";

       this.sender=()=>{   
 
        $.ajax({
              url: this.link2,
              type: "POST",
               data:{
                  sendemail:this.email,
                  titre:this.titre,
                  contenu:this.contenu,
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

   }
}


$(document).on('click','.bouton_sub',function(){


	/*var initiateur = new WorkflowMailer("ibrahim.konate@ngser.com","POSEIDON EMPLOYE","<b>TEST POSEIDON EMPLOYE </b>",appN);
	initiateur.sender();

	var manager = new WorkflowMailer("ibrahim.konate@ngser.com","POSEIDON MANAGER","<b>TEST POSEIDON MANAGER </b>",appN);
	manager.sender(); */
	
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

    var numdmd = $('#numposeidon').val();


         //Message vers les valideurs
        var valideur =(validator,employe_wk,app)=> { 
             const valid= new WorkflowMailer(validator,"DOCUMENT n\u00b0"+numdmd,
                 `
                       TYPE :  CONTRAT <br/>
                       INFOS : VOUS AVEZ RECU UN CONTRAT POUR VALIDATION <br/>
                       EMPLOYE(E) :  ${employe_wk}
                       `/getLink()`
                `
                 ,appN);
             return  valid.sender();
        }


      if (val_modif.slice(0,17) =='AF_ENVEMPLOYE_COT') {
            //console.log('ok trs employer');
             var initiateur = new WorkflowMailer(employe_wk,"DOCUMENT n\u00b0"+numdmd,
                    `
                       TYPE :  CONTRAT N&deg; ${numdmd} <br/>
                       INFOS : VOUS AVEZ RECU UN CONTRAT POUR VALIDATION
                       `/getLink()`
                    `
                ,appN);
             initiateur.sender(); 
            // valideur(manager_wk,initiateur_wk,appN);
        }

        if (val_modif.slice(0,22) =='AB_TRSEMPLOYJURIST_COT') {
             //console.log('ok trs rh');
             var initiateur = new WorkflowMailer(employe_wk,"DOCUMENT n\u00b0"+numdmd,
                    `
                       TYPE :  CONTRAT N&deg; ${numdmd} <br/>
                       INFOS :  VOUS AVEZ VALIDE VOTRE CONTRAT,
                       `/getLink()`
                    `
                ,appN);
             initiateur.sender();
               valideur(manager_wk,employe_wk,appN);
        }

         if (val_modif.slice(0,19) =='AB_TRSJURISTDGA_COT') {
             //console.log('ok trs dga');
             var initiateur = new WorkflowMailer(employe_wk,"DOCUMENT n\u00b0"+numdmd,
                    `
                       TYPE :  CONTRAT N&deg; ${numdmd} <br/>
                       INFOS :  VOTRE CONTRAT A ATE VALIDE PAR LE MANAGER ADMIN,
                       `/getLink()`
                    `
                ,appN);
             initiateur.sender();
               valideur(dga_wk,employe_wk,appN);
        }
         if (val_modif.slice(0,15) =='AB_TRSDGADG_COT') {
             //console.log('ok trs dga');
             var initiateur = new WorkflowMailer(employe_wk,"DOCUMENT n\u00b0"+numdmd,
                    `
                       TYPE :  CONTRAT N&deg; ${numdmd} <br/>
                       INFOS :  VOTRE CONTRAT A ATE VALIDE PAR LE DGA,
                       `/getLink()`
                    `
                ,appN);
             initiateur.sender();
               valideur(dg_wk,employe_wk,appN);
        }

        if (val_modif.slice(0,13) =='AB_CLOSDG_COT') {
             //console.log('ok trs dg');
             var initiateur = new WorkflowMailer(employe_wk,"DOCUMENT n\u00b0"+numdmd,
                    `
                       TYPE :  CONTRAT N&deg; ${numdmd} <br/>
                       INFOS :  VOTRE CONTRAT A ATE VALIDE PAR LE DG ET CLOS,
                       `/getLink()`
                    `
                ,appN);
             initiateur.sender();
             //  valideur(dg_wk,employe_wk,appN);
        }


 

    // REFUS 

        if( val_modif.slice(0,19) == 'AB_TRSEMPLOYERH_COT'){
            var recep = new WorkflowMailer(employe_wk,"DOCUMENT n\u00b0"+numdmd,
                    `
                       TYPE :  CONTRAT N&deg; ${numdmd} <br/>
                       INFOS : LE CONTRAT A ETE REFUSE PAR L'EMPLOYE
                       `/getLink()`
                    `
                ,appN);
             recep.sender();
        }  

        if( val_modif.slice(0,18) == 'AB_TRSJURISTRH_COT'){
            var recep = new WorkflowMailer(employe_wk,"DOCUMENT n\u00b0"+numdmd,
                    `
                       TYPE :  CONTRAT N&deg; ${numdmd} <br/>
                       INFOS : VOTRE CONTRAT A ETE REFUSE PAR LE MANAGER ADMIN
                       `/getLink()`
                    `
                ,appN);
             recep.sender();
        }
        if( val_modif.slice(0,15) == 'AB_TRSDGARH_COT'){
            var recep = new WorkflowMailer(employe_wk,"DOCUMENT n\u00b0"+numdmd,
                    `
                       TYPE :  CONTRAT N&deg; ${numdmd} <br/>
                       INFOS : VOTRE CONTRAT A ETE REFUSE PAR LE DGA
                       `/getLink()`
                    `
                ,appN);
             recep.sender();
        }

        if( val_modif.slice(0,15) == 'AB_TRSDGARH_COT'){
            var recep = new WorkflowMailer(employe_wk,"DOCUMENT n\u00b0"+numdmd,
                    `
                       TYPE :  CONTRAT N&deg; ${numdmd} <br/>
                       INFOS : VOTRE CONTRAT A ETE REFUSE PAR LE DGA
                       `/getLink()`
                    `
                ,appN);
             recep.sender();
        }

        if( val_modif.slice(0,14) == 'AB_TRSDGRH_COT'){
            var recep = new WorkflowMailer(employe_wk,"DOCUMENT n\u00b0"+numdmd,
                    `
                       TYPE :  CONTRAT N&deg; ${numdmd} <br/>
                       INFOS : VOTRE CONTRAT A ETE REFUSE PAR LE DGA
                       `/getLink()`
                    `
                ,appN);
             recep.sender();
        }




    /*
	var val_modif = $('.action_hermes').val();
    var action_modif = val_modif.slice(0, 10);
    if (action_modif == 'AA_MOD_COT') {}*/
	//console.log(manager_wk);
	
});