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

var initiateur_wk =$('.createur').val().toLowerCase();
var rh_wk =$('.rh_wk').val().toLowerCase();
var controleur_wk =$('.controleur_wk').val().toLowerCase();
var finance_wk =$('.finance_wk').val().toLowerCase();
var dga_wk =$('.dga_wk').val().toLowerCase();
var dg_wk =$('.dg_wk').val().toLowerCase();


loadvalideurs()
.then(data => {

	let results=data.data[0]; 
	 
	 rh_wk=results['rh']['email'].toLowerCase();
     controleur_wk=results['controleur']['email'].toLowerCase();
     finance_wk=results['finance']['email'].toLowerCase();
	 dga_wk =results['dga']['email'].toLowerCase();
	 dg_wk=results['dg']['email'].toLowerCase();
     $('.rh_wk').val(rh_wk);
     $('.controleur_wk').val(controleur_wk);
     $('.finance_wk').val(finance_wk);
     $('.dga_wk').val(dga_wk);
     $('.dg_wk').val(dg_wk);
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
		    "/PRT/pos_mail/pos_mailer.php";

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
   
    var initiator =$('.createur').val().toLowerCase(); 
    // var initiator="ibrahim.konate@ngser.com";
    var rh_wk =$('.rh_wk').val().toLowerCase();
    //var rh_wk="ibrahim.konate@ngser.com";
    var controleur_wk =$('.controleur_wk').val().toLowerCase();
    //var controleur_wk="ibrahim.konate@ngser.com";
    var finance_wk =$('.finance_wk').val().toLowerCase();
    //var finance_wk="ibrahim.konate@ngser.com";
    var dga_wk =$('.dga_wk').val().toLowerCase();
    //var dga_wk="ibrahim.konate@ngser.com";
    var dg_wk =$('.dg_wk').val().toLowerCase();
    //var dg_wk="ibrahim.konate@ngser.com";

    var numdmd = $('#numposeidon').val();


         //Message vers les valideurs
        var valideur =(validator,initiateur_wk,app)=> { 
             const valid= new WorkflowMailer(validator,"DOCUMENT n\u00b0"+numdmd,
                 `
                       TYPE : DEMANDE DE PRET <br/>
                       INFOS : VOUS AVEZ RECU UNE DEMANDE DE PRET POUR VALIDATION <br/>
                       DEMANDEUR :  ${initiateur_wk}
                       `/getLink()`
                    `
                 ,appN);
             return  valid.sender();
        }

        if (val_modif.slice(0,18) =='AA_TRSEMPLOYRH_PRT') {
             var initiateur = new WorkflowMailer(initiator,"DOCUMENT n\u00b0"+numdmd,
                    `
                       TYPE : DEMANDE DE PRET N&deg; ${numdmd} <br/>
                       INFOS : VOTRE DEMANDE EST CHEZ LA RH POUR VALIDATION
                       `/getLink()`
                    `
                ,appN);
             initiateur.sender();
             valideur(rh_wk,initiateur_wk,appN);

        }

      
        if (val_modif.slice(0,19) =='AA_TRSRHCONTROL_PRT') {
             
             var initiateur = new WorkflowMailer(initiator,"DOCUMENT n\u00b0"+numdmd,
                    `
                       TYPE : DEMANDE DE PRET N&deg; ${numdmd} <br/>
                       INFOS : VOTRE DEMANDE A ETE VALIDEE PAR LA RH
                       `/getLink()`
                    `
                ,appN);
             initiateur.sender();
               valideur(controleur_wk,initiateur_wk,appN);
        }

         
        if (val_modif.slice(0,20) =='AA_TRSCONTROLDGA_PRT') {
            
             var initiateur = new WorkflowMailer(initiator,"DOCUMENT n\u00b0"+numdmd,
                    `
                       TYPE : DEMANDE DE PRET N&deg; ${numdmd} <br/>
                       INFOS : VOTRE DEMANDE A ETE VALIDEE PAR LE CONTROLEUR DE GESTION
                       `/getLink()`
                    `
                ,appN);
             initiateur.sender();
               valideur(dga_wk,initiateur_wk,appN);
        }
        if (val_modif.slice(0,15) =='AA_TRSDGADG_PRT') {
            
             var initiateur = new WorkflowMailer(initiator,"DOCUMENT n\u00b0"+numdmd,
                    `
                       TYPE : DEMANDE DE PRET N&deg; ${numdmd} <br/>
                       INFOS : VOTRE DEMANDE A ETE VALIDEE PAR LE DGA
                       `/getLink()`
                    `
                ,appN);
             initiateur.sender();
               valideur(dg_wk,initiateur_wk,appN);
        }
        if (val_modif.slice(0,19) =='AA_TRSDGFINANCE_PRT') {
            
             var initiateur = new WorkflowMailer(initiator,"DOCUMENT n\u00b0"+numdmd,
                    `
                       TYPE : DEMANDE DE PRET N&deg; ${numdmd} <br/>
                       INFOS : VOTRE DEMANDE A ETE VALIDEE PAR LE DG
                       `/getLink()`
                    `
                ,appN);
             initiateur.sender();
               valideur(finance_wk,initiateur_wk,appN);
        }
  
       if (val_modif.slice(0,18) =='AA_CLOSFINANCE_PRT') {
             //console.log('valider');
             var initiateur = new WorkflowMailer(initiator,"DOCUMENT n\u00b0"+numdmd,
                    `
                       TYPE : DEMANDE DE PRET N&deg; ${numdmd} <br/>
                       INFOS : VOTRE DEMANDE A ETE VALIDEE
                       `/getLink()` 
                    `
                ,appN);
             initiateur.sender();
        } 
      

     //REFUS
 

     if(
             val_modif.slice(0,14) == 'AA_REFUSRH_PRT' ||
             val_modif.slice(0,19) == 'AA_REFUSCONTROL_PRT'  ||
             val_modif.slice(0,15) == 'AA_REFUSDGA_PRT' ||
             val_modif.slice(0,14) == 'AA_REFUSDG_PRT'  
            ){
          

            var initiateur = new WorkflowMailer(initiator,"DOCUMENT n\u00b0"+numdmd,
                    `
                       TYPE :  DEMANDE DE PRET N&deg; ${numdmd} <br/>
                       INFOS : VOTRE DEMANDE A ETE REFUSEE
                       `/getLink()`
                    `
                ,appN);
             initiateur.sender();
        } 


     
   
});
   