 //alert($('.etat_type').val());
 //let appN = $(".appName").val();
///////////CHARGEMENT DES VALIDATEURS ///////////////////
 let link_url =
    "/" +
    appN +
    "/interface/tpl/" +
    appN +
    "/PAY/valideurs/validateur.php";


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
var manager_wk =$('.mngadm_wk').val().toLowerCase();
var controleur_wk =$('.controleur_wk').val().toLowerCase();
var finance_wk =$('.finance_wk').val().toLowerCase();
//var rh_wk =$('.rh_wk').val().toLowerCase();
var dga_wk =$('.dga_wk').val().toLowerCase();
var dg_wk =$('.dg_wk').val().toLowerCase();


loadvalideurs()
.then(data => {


	let results=data.data[0]; 
	 
	// rh_wk=results['rh']['email'].toLowerCase();
     manager_wk=results['manager']['email'].toLowerCase();
     controleur_wk=results['controleur']['email'].toLowerCase();
     finance_wk=results['finance']['email'].toLowerCase();
	 dga_wk =results['dga']['email'].toLowerCase();
	 dg_wk=results['dg']['email'].toLowerCase();
     //$('.rh_wk').val(rh_wk);
     $('.mngadm_wk').val(manager_wk);
     $('.dga_wk').val(dga_wk);
     $('.dg_wk').val(dg_wk);
     $('.controleur_wk').val(controleur_wk);
     $('.finance_wk').val(finance_wk);
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
		    "/PAY/pos_mail/pos_mailer.php";

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
    //var initiator="ibrahim.konate@ngser.com";

     var manager_wk =$('.mngadm_wk').val().toLowerCase();
    //var manager_wk="ibrahim.konate@ngser.com";

     var controleur_wk =$('.controleur_wk').val().toLowerCase();
     //var controleur_wk="ibrahim.konate@ngser.com";

    //var rh_wk =$('.rh_wk').val().toLowerCase();
    //var rh_wk="ibrahim.konate@ngser.com";

    var dga_wk =$('.dga_wk').val().toLowerCase();
    //var dga_wk="ibrahim.konate@ngser.com";

    var dg_wk =$('.dg_wk').val().toLowerCase();
    //var dg_wk="ibrahim.konate@ngser.com";

    var finance_wk =$('.finance_wk').val().toLowerCase();
    //var finance_wk="ibrahim.konate@ngser.com";

    var numdmd = $('#numposeidon').val();


         //Message vers les valideurs
        var valideur =(validator,initiateur_wk,app)=> { 
             const valid= new WorkflowMailer(validator,"DOCUMENT n\u00b0"+numdmd,
                 `
                       TYPE : PAIE <br/>
                       INFOS : VOUS AVEZ RECU LA FICHE DE PAIE POUR VALIDATION <br/>
                       INITIATEUR :  ${initiateur_wk}
                       `/getLink()`
                    `
                 ,appN);
             return  valid.sender();
        }

        if (val_modif.slice(0,16) =='AA_TRSMNGADM_PAY') {
            //console.log('ok trs rh');
             var initiateur = new WorkflowMailer(initiator,"DOCUMENT n\u00b0"+numdmd,
                    `
                       TYPE : FICHE DE PAIE N&deg; ${numdmd} <br/>
                       INFOS : LA FICHE DE PAIE EST CHEZ LE MANAGER ADMIN POUR VALIDATION
                       `/getLink()` 
                    `
                ,appN);
             initiateur.sender();
             valideur(manager_wk,initiateur_wk,appN);

        }

  
        if (val_modif.slice(0,20) =='AA_TRSCONTROLEUR_PAY') {
             //console.log('ok trs dga');
             var initiateur = new WorkflowMailer(initiator,"DOCUMENT n\u00b0"+numdmd,
                    `
                       TYPE : FICHE DE PAIE N&deg; ${numdmd} <br/>
                       INFOS : LA FICHE DE PAIE A ETE VALIDEE PAR LE MANAGER ADMIN
                       `/getLink()`
                    `
                ,appN);
             initiateur.sender();
               valideur(controleur_wk,initiateur_wk,appN);
        }
    
       
        if (val_modif.slice(0,17) =='AA_TRSFINANCE_PAY') {
             //console.log('ok trs dg');
             var initiateur = new WorkflowMailer(initiator,"DOCUMENT n\u00b0"+numdmd,
                    `
                       TYPE : FICHE DE PAIE N&deg; ${numdmd} <br/>
                       INFOS : LA FICHE DE PAIE A ETE VALIDEE PAR LE CONTROLEUR DE GESTION
                       `/getLink()` 
                    `
                ,appN);
             initiateur.sender();
               valideur(finance_wk,initiateur_wk,appN);
        }
        if (val_modif.slice(0,20) =='AA_TRSFINANCEDGA_PAY') {
             //console.log('ok trs dg');
             var initiateur = new WorkflowMailer(initiator,"DOCUMENT n\u00b0"+numdmd,
                    `
                       TYPE : FICHE DE PAIE N&deg; ${numdmd} <br/>
                       INFOS : LA FICHE DE PAIE A ETE VALIDEE PAR LA FINANCE
                       `/getLink()`
                    `
                ,appN);
             initiateur.sender();
               valideur(dga_wk,initiateur_wk,appN);
        }
        if (val_modif.slice(0,15) =='AA_TRSDGADG_PAY') {
             //console.log('ok trs dg');
             var initiateur = new WorkflowMailer(initiator,"DOCUMENT n\u00b0"+numdmd,
                    `
                       TYPE : FICHE DE PAIE N&deg; ${numdmd} <br/>
                       INFOS : LA FICHE DE PAIE A ETE VALIDEE PAR LE DGA
                       `/getLink()`
                    `
                ,appN);
             initiateur.sender();
               valideur(dg_wk,initiateur_wk,appN);
        }
        
        
       if (val_modif.slice(0,12) =='AA_CLOSDG_PAY') {
             //console.log('valider');
             var initiateur = new WorkflowMailer(initiator,"DOCUMENT n\u00b0"+numdmd,
                    `
                       TYPE : FICHE DE PAIE N&deg; ${numdmd} <br/>
                       INFOS : LA FICHE DE PAIE A ETE VALIDEE
                       `/getLink()` 
                    `
                ,appN);
             initiateur.sender();
 
        }  
  
    // REFUS 

     if(
             val_modif.slice(0,14) == 'AB_REFUSDG_PAY' ||
             val_modif.slice(0,15) == 'AB_REFUSDGA_PAY'  ||
             val_modif.slice(0,19) == 'AB_REFUSFINANCE_PAY'||
             val_modif.slice(0,19) == 'AB_REFUSCONTROL_PAY'||
             val_modif.slice(0,18) == 'AB_REFUSMNGADM_PAY'
               
        ){

            var initiateur = new WorkflowMailer(initiator,"DOCUMENT n\u00b0"+numdmd,
                    `
                       TYPE : FICHE DE PAIE N&deg; ${numdmd} <br/>
                       INFOS : LA FICHE DE PAIE A ETE REFUSEE
                       `/getLink()`
                    `
                ,appN);
             initiateur.sender();
        } 
	
});
   
 
   