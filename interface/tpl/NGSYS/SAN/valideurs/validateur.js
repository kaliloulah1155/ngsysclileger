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

var initiateur_wk =$('.createur').val().toLowerCase();
var rh_wk =$('.rh_wk').val().toLowerCase();
var manager_wk =$('.manager_wk').val().toLowerCase();
var dga_wk =$('.dga_wk').val().toLowerCase();
var dg_wk =$('.dg_wk').val().toLowerCase();


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
//Appel du lien 
var lk_t =$('.user_url').val();
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
		    "/SAN/pos_mail/pos_mailer.php";

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

 
	var val_modif = $('.action_hermes').val();
     //var initiator="ibrahim.konate@ngser.com";
    var initiator =$('.createur').val().toLowerCase();

    var manager_wk =$('.manager_wk').val().toLowerCase();
    //var manager_wk="ibrahim.konate@ngser.com";
   var rh_wk =$('.rh_wk').val().toLowerCase();
   // var rh_wk="ibrahim.konate@ngser.com";
    var dga_wk =$('.dga_wk').val().toLowerCase();
    //var dga_wk="ibrahim.konate@ngser.com";
    var dg_wk =$('.dg_wk').val().toLowerCase();
    //var dg_wk="ibrahim.konate@ngser.com";

    var numdmd = $('.numposeidon').val();


         //Message vers les valideurs
        var valideur =(validator,initiateur_wk,app)=> { 
             const valid= new WorkflowMailer(validator,"DOCUMENT n\u00b0"+numdmd,
                 `
                       TYPE : DEMANDE DE SANCTION <br/>
                       INFOS : VOUS AVEZ RECU UNE DEMANDE DE SANCTION POUR VALIDATION <br/>
                       DEMANDEUR :  ${initiateur_wk}
                        ${lk_t}
                    `
                 ,appN);
             return  valid.sender();
        }

        if (val_modif.slice(0,15) =='AA_TRSMNGRH_SAN') {
            //console.log('ok trs rh');
             var initiateur = new WorkflowMailer(initiator,"DOCUMENT n\u00b0"+numdmd,
                    `
                       TYPE : DEMANDE DE SANCTION N&deg; ${numdmd} <br/>
                       INFOS : VOTRE DEMANDE EST CHEZ LA RH POUR VALIDATION
                        ${lk_t}
                    `
                ,appN);
             initiateur.sender();
             valideur(rh_wk,initiateur_wk,appN);

        }

     
        if (val_modif.slice(0,20) =='AA_TRSMNGEMPLOYE_SAN') {
             //console.log('ok trs adm');

             var initiateur = new WorkflowMailer(initiator,"DOCUMENT n\u00b0"+numdmd,
                    `
                       TYPE : DEMANDE DE SANCTION N&deg; ${numdmd} <br/>
                       INFOS : VOTRE DEMANDE A ETE VALIDEE PAR LA RH
                        ${lk_t}
                    `
                ,appN);
             initiateur.sender();
               valideur(manager_wk,initiateur_wk,appN);
        }
      
        if (val_modif.slice(0,12) =='AA_RHDGA_SAN') {
             //console.log('ok trs dga');
             var initiateur = new WorkflowMailer(initiator,"DOCUMENT n\u00b0"+numdmd,
                    `
                       TYPE : DEMANDE DE SANCTION N&deg; ${numdmd} <br/>
                       INFOS : VOTRE DEMANDE A ETE VALIDEE PAR LE MANAGER ADMIN
                        ${lk_t}
                    `
                ,appN);
             initiateur.sender();
               valideur(dga_wk,initiateur_wk,appN);
        }

       
        if (val_modif.slice(0,12) =='AA_DGADG_SAN') {
             //console.log('ok trs dg');
             var initiateur = new WorkflowMailer(initiator,"DOCUMENT n\u00b0"+numdmd,
                    `
                       TYPE : DEMANDE DE SANCTION N&deg; ${numdmd} <br/>
                       INFOS : VOTRE DEMANDE A ETE VALIDEE PAR LE DGA
                        ${lk_t}
                    `
                ,appN);
             initiateur.sender();
               valideur(dg_wk,initiateur_wk,appN);
        }   
  
       if (val_modif.slice(0,13) =='AA_CLOSDG_SAN') {
             //console.log('valider');
             var initiateur = new WorkflowMailer(initiator,"DOCUMENT n\u00b0"+numdmd,
                    `
                       TYPE : DEMANDE DE SANCTION N&deg; ${numdmd} <br/>
                       INFOS : VOTRE DEMANDE A ETE VALIDEE 
                        ${lk_t}
                    `
                ,appN);
             initiateur.sender();


                //Notification de la personne ayant fait objet de sanction
              var sanctionne = new WorkflowMailer($('.init_personnel').val(),"DOCUMENT n\u00b0"+numdmd,
                    `
                       TYPE :  SANCTION N&deg; ${numdmd} <br/>
                       INFOS : VOUS AVEZ ETE SANCTIONNE PAR L'ADMINISTRATION
                        ${lk_t}
                    `
                ,appN);
             sanctionne.sender();
 
        } 
  
    // REFUS 

     if(
             val_modif.slice(0,14) == 'AB_REFUSRH_SAN' ||
             val_modif.slice(0,14) == 'AB_REFUSDG_SAN'  ||
             val_modif.slice(0,15) == 'AB_REFUSDGA_SAN' ||
             val_modif.slice(0,14) == 'AB_REFUSADM_SAN'  
            ){
          
            var initiateur = new WorkflowMailer(initiator,"DOCUMENT n\u00b0"+numdmd,
                    `
                       TYPE :  DEMANDE DE SANCTION N&deg; ${numdmd} <br/>
                       INFOS : VOTRE DEMANDE A ETE REFUSEE
                        ${lk_t}
                    `
                ,appN);
             initiateur.sender();


               //Notification de la personne ayant fait objet de sanction
              var sanctionne = new WorkflowMailer($('.init_personnel').val(),"DOCUMENT n\u00b0"+numdmd,
                    `
                       TYPE :  SANCTION N&deg; ${numdmd} <br/>
                       INFOS : VOUS N'AVEZ PAS ETE SANCTIONNE PAR L'ADMINISTRATION
                        ${lk_t}
                    `
                ,appN);
             sanctionne.sender();
        } 
 
 
	
});
  