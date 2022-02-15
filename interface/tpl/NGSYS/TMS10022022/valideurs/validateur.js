
///////////CHARGEMENT DES VALIDATEURS ///////////////////
 let link_url =
    "/" +
    appName +
    "/interface/tpl/" +
    appName +
    "/TMS/valideurs/validateur.php";


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
var manager_wk =$('.mng_wk').val().toLowerCase();
 
loadvalideurs()
.then(data => {


	let results=data.data[0]; 
	 
	 manager_wk=results['manager']['email'].toLowerCase();
     $('.mng_wk').val(manager_wk);
 
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
		    "/TMS/pos_mail/pos_mailer.php";

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
    var employe_wk =$('.emp_wk').val().toLowerCase();
    //var employe_wk="ibrahim.konate@ngser.com";
    var manager_wk =$('.mng_wk').val().toLowerCase();
    //var manager_wk="ibrahim.konate@ngser.com";
    
    var numdmd = $('#numposeidon').val();

    
         //Message vers les valideurs
        var valideur =(validator,employe_wk,app)=> { 
             const valid= new WorkflowMailer(validator,"DOCUMENT n\u00b0"+numdmd,
                 `
                       TYPE :  TIMESHEET <br/>
                       INFOS : VOUS AVEZ RECU UN TIMESHEET POUR VALIDATION <br/>
                       EMPLOYE(E) :  ${employe_wk}
                         ${lk_t}
                `
                 ,appName);
             return  valid.sender();
        }

      if (val_modif.slice(0,18) =='AA_TRANSDEVMNG_TMS') {
            //console.log('ok trs employer');
             var initiateur = new WorkflowMailer(employe_wk,"DOCUMENT n\u00b0"+numdmd,
                    `
                       TYPE :  TIMESHEET N&deg; ${numdmd} <br/>
                       INFOS : VOUS AVEZ ENVOYE VOTRE TIMESHEET A VOTRE MANAGER POUR VALIDATION
                         ${lk_t}
                    `
                ,appName);
             initiateur.sender(); 
             valideur(manager_wk,employe_wk,appName);
        }

          if (val_modif.slice(0,18) =='AA_CLOSNODEVRH_TMS') {
             //console.log('ok trs rh');
             var initiateur = new WorkflowMailer(employe_wk,"DOCUMENT n\u00b0"+numdmd,
                    `
                       TYPE :  TIMESHEET N&deg; ${numdmd} <br/>
                       INFOS :  VOTRE TIMESHEET A ETE VALIDE PAR VOTRE MANAGER,
                         ${lk_t}
                    `
                ,appName);
             initiateur.sender();
              // valideur(manager_wk,employe_wk,appName);
        }
       
    // REFUS 

        if( val_modif.slice(0,18) == 'AB_REFUSDEVMNG_TMS'){
            var recep = new WorkflowMailer(employe_wk,"DOCUMENT n\u00b0"+numdmd,
                    `
                       TYPE :  TIMESHEET N&deg; ${numdmd} <br/>
                       INFOS : VOTRE TIMESHEET A ETE REFUSE PAR VOTRE MANAGER
                         ${lk_t}
                    `
                ,appName);
             recep.sender();
        }  
 

 
 
});  