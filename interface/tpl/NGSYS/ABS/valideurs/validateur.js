 //alert($('.etat_type').val());
 

///////////CHARGEMENT DES VALIDATEURS ///////////////////
 let link_url =
    "/" +
    appN +
    "/interface/tpl/" +
    appN +
    "/ABS/valideurs/validateur.php";


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
var manager_wk =$('.manager_wk').val().toLowerCase();
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

     $('.manager_wk').val(manager_wk);
     $('.rh_wk').val(rh_wk);
     $('.dga_wk').val(dga_wk);
     $('.dg_wk').val(dg_wk);

	// console.log(results['initiateur']['email']);
})
.catch(error=>console.log(error));

 

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
		    "/ABS/pos_mail/pos_mailer.php";

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

    
    var initiator =$('.createur').val().toLowerCase();
    //var initiator="ibrahim.konate@ngser.com";

    var manager_wk =$('.manager_wk').val().toLowerCase();
    //var manager_wk ="ibrahim.konate@ngser.com";
    var rh_wk =$('.rh_wk').val().toLowerCase();
    //var rh_wk ="ibrahim.konate@ngser.com";
   var dga_wk =$('.dga_wk').val().toLowerCase();
     //var dga_wk ="ibrahim.konate@ngser.com";

    var dg_wk =$('.dg_wk').val().toLowerCase();
    //var dg_wk ="ibrahim.konate@ngser.com";

    var  p_interimaire = $('.interim').val();
    

 
    var numdmd = $('#numposeidon').val();


         //Message vers les valideurs
        var valideur =(validator,initiateur_wk,app)=> { 
             const valid= new WorkflowMailer(validator,"DEMANDE n\u00b0"+numdmd,
                 `
                       TYPE :  DEMANDE D'ABSENCE <br/>
                       INFOS : VOUS AVEZ RECU UNE DEMANDE POUR VALIDATION <br/>
                       DEMANDEUR :  ${initiateur_wk}
                    `
                 ,appN);
             return  valid.sender();
        }
    
  
    if(etat_type=='EMPLOYE'){
        if (val_modif.slice(0,20) =='AA_TRSEMPLOYEMNG_ABS') {
            //console.log('ok trs manager');
             var initiateur = new WorkflowMailer(initiator,"DEMANDE n\u00b0"+numdmd,
                    `
                       TYPE :  DEMANDE N&deg; ${numdmd} <br/>
                       INFOS : VOTRE DEMANDE EST CHEZ LE MANAGER POUR VALIDATION
                    `
                ,appN);
             initiateur.sender();
             valideur(manager_wk,initiateur_wk,appN);

             //ENVOI DE MAIL A L'INTERIMAIRE 
             var interimaire = new WorkflowMailer(p_interimaire,"DEMANDE n\u00b0"+numdmd,
                    `
                       TYPE :  DEMANDE N&deg; ${numdmd} <br/>
                       INFOS : VOUS AVEZ ETE DESIGN&Eacute;(E) COMME INTERIMAIRE <br/>
                       INITIATEUR :  ${initiateur_wk} 
                    `
                ,appN);
             interimaire.sender();



        }

        if (val_modif.slice(0,15) =='AA_TRSMNGRH_ABS') {
             //console.log('ok trs rh');

             var initiateur = new WorkflowMailer(initiator,"DEMANDE n\u00b0"+numdmd,
                    `
                       TYPE :  DEMANDE N&deg; ${numdmd} <br/>
                       INFOS : VOTRE DEMANDE A ETE VALIDER PAR VOTRE MANAGER
                    `
                ,appN);
             initiateur.sender();
               valideur(rh_wk,initiateur_wk,appN);
        }
        
        if (val_modif.slice(0,15) =='AA_TRSRHADM_ABS') {
             //console.log('ok trs dga');
              var initiateur = new WorkflowMailer(initiator,"DEMANDE n\u00b0"+numdmd,
                    `
                       TYPE :  DEMANDE N&deg; ${numdmd} <br/>
                       INFOS : VOTRE DEMANDE A ETE VALIDER PAR LA RH
                    `
                ,appN);
             initiateur.sender();
              valideur(dga_wk,initiateur_wk,appN);

        }

        
        if (val_modif.slice(0,13) =='AZ_CLOSRA_ABS') {
             //console.log('ok trs dg');
              var initiateur = new WorkflowMailer(initiator,"DEMANDE n\u00b0"+numdmd,
                    `
                       TYPE :  DEMANDE N&deg; ${numdmd} <br/>
                       INFOS : VOTRE DEMANDE A ETE VALIDER PAR LE DGA
                    `
                ,appN);
             initiateur.sender();
             valideur(dg_wk,initiateur_wk,appN);

        }

       if (val_modif.slice(0,13) =='AZ_CLOSDG_ABS') {
             //console.log('valider');
             var initiateur = new WorkflowMailer(initiator,"DEMANDE n\u00b0"+numdmd,
                    `
                       TYPE :  DEMANDE N&deg; ${numdmd} <br/>
                       INFOS : VOTRE DEMANDE A ETE VALIDE
                    `
                ,appN);
             initiateur.sender();
 
        } 
    }

    if(etat_type=='MANAGER'){

        if (val_modif.slice(0,19) =='AA_TRSMANAGERRH_ABS') {
            //console.log('ok trs rh');
             var initiateur = new WorkflowMailer(initiator,"DEMANDE n\u00b0"+numdmd,
                    `
                       TYPE :  DEMANDE N&deg; ${numdmd} <br/>
                       INFOS : VOTRE DEMANDE EST CHEZ LA RH POUR VALIDATION
                    `
                ,appN);
             initiateur.sender();
             valideur(rh_wk,initiateur_wk,appN);

        }

          if (val_modif.slice(0,15) =='AA_TRSRHDGA_ABS') {
             //console.log('ok trs dga');
              var initiateur = new WorkflowMailer(initiator,"DEMANDE n\u00b0"+numdmd,
                    `
                       TYPE :  DEMANDE N&deg; ${numdmd} <br/>
                       INFOS : VOTRE DEMANDE A ETE VALIDER PAR LA RH
                    `
                ,appN);
             initiateur.sender();
              valideur(dga_wk,initiateur_wk,appN);

        }

        
        if (val_modif.slice(0,13) =='AA_TRSDGADG_ABS') {
             //console.log('ok trs dg');
              var initiateur = new WorkflowMailer(initiator,"DEMANDE n\u00b0"+numdmd,
                    `
                       TYPE :  DEMANDE N&deg; ${numdmd} <br/>
                       INFOS : VOTRE DEMANDE A ETE VALIDER PAR LE DGA
                    `
                ,appN);
             initiateur.sender();
             valideur(dg_wk,initiateur_wk,appN);

        }

       if (val_modif.slice(0,13) =='AA_CLOSDG_ABS') {
             //console.log('valider');
             var initiateur = new WorkflowMailer(initiator,"DEMANDE n\u00b0"+numdmd,
                    `
                       TYPE :  DEMANDE N&deg; ${numdmd} <br/>
                       INFOS : VOTRE DEMANDE A ETE VALIDE
                    `
                ,appN);
             initiateur.sender();
 
        } 

    }
    

    // REFUS 

        if(
             val_modif.slice(0,14) == 'AZ_REFUSDG_ABS' ||
             val_modif.slice(0,14) == 'AB_REFUSRH_ABS'  ||
             val_modif.slice(0,15) == 'AB_REFUSDGA_ABS' ||
             val_modif.slice(0,14) == 'AB_REFUSDG_ABS' ||
             val_modif.slice(0,15) == 'AB_REFUSMNG_ABS' ||
             val_modif.slice(0,17) == 'AB_REFUSRHEMP_ABS' ||
             val_modif.slice(0,14) == 'AB_REFUSRA_ABS'
            ){
          

            var initiateur = new WorkflowMailer(initiator,"DEMANDE n\u00b0"+numdmd,
                    `
                       TYPE :  DEMANDE N&deg; ${numdmd} <br/>
                       INFOS : VOTRE DEMANDE A ETE REFUSEE
                    `
                ,appN);
             initiateur.sender();
        } 
   
	
});