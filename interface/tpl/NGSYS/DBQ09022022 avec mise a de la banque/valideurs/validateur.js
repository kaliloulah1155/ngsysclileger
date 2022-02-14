 //alert($('.etat_type').val());
 let appN = $(".appName").val();
///////////CHARGEMENT DES VALIDATEURS ///////////////////
 let link_url =
    "/" +
    appN +
    "/interface/tpl/" +
    appN +
    "/DBQ/valideurs/validateur.php";


 let link_url_bqe =
    "/" +
    appN +
    "/interface/tpl/" +
    appN +
    "/DBQ/valideurs/majdbq.php";

    
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




 const infos_demandeur = (demandeur,banque,rib) => {
    return new Promise((resolve, reject) => {
        $.ajax({
            url: link_url_bqe,
            data:{
                  demandeur:demandeur,
                  banque:banque,
                  rib:rib
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
var dga_wk =$('.dga_wk').val().toLowerCase();
var dg_wk =$('.dg_wk').val().toLowerCase();


loadvalideurs()
.then(data => {


	let results=data.data[0]; 
	 
	 rh_wk=results['rh']['email'].toLowerCase();
	 dga_wk =results['dga']['email'].toLowerCase();
	 dg_wk=results['dg']['email'].toLowerCase();
     $('.rh_wk').val(rh_wk);
     $('.dga_wk').val(dga_wk);
     $('.dg_wk').val(dg_wk);
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
		    "/DBQ/pos_mail/pos_mailer.php";

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
    var initiator="ibrahim.konate@ngser.com";
    //var initiator =$('.createur').val().toLowerCase();
   // var rh_wk =$('.rh_wk').val().toLowerCase();
   var rh_wk="ibrahim.konate@ngser.com";
   // var dga_wk =$('.dga_wk').val().toLowerCase();
    var dga_wk="ibrahim.konate@ngser.com";
    //var dg_wk =$('.dg_wk').val().toLowerCase();
    var dg_wk="ibrahim.konate@ngser.com";

    var numdmd = $('#numposeidon').val();


         //Message vers les valideurs
        var valideur =(validator,initiateur_wk,app)=> { 
             const valid= new WorkflowMailer(validator,"DOCUMENT n\u00b0"+numdmd,
                 `
                       TYPE : DEMANDE DE DOMICILIATION BANCAIRE <br/>
                       INFOS : VOUS AVEZ RECU UNE DEMANDE DE DOMICILIATION BANCAIRE POUR VALIDATION <br/>
                       DEMANDEUR :  ${initiateur_wk}
                    `
                 ,appN);
             return  valid.sender();
        }

        if (val_modif.slice(0,18) =='AA_TRSEMPLOYRH_DBQ') {
            //console.log('ok trs rh');
             var initiateur = new WorkflowMailer(initiator,"DOCUMENT n\u00b0"+numdmd,
                    `
                       TYPE : DEMANDE DE DOMICILIATION BANCAIRE N&deg; ${numdmd} <br/>
                       INFOS : VOTRE DEMANDE EST CHEZ LA RH POUR VALIDATION
                    `
                ,appN);
             initiateur.sender();
             valideur(rh_wk,initiateur_wk,appN);

        }

      
        if (val_modif.slice(0,15) =='AA_TRSRHDGA_DBQ') {
             //console.log('ok trs dga');
             var initiateur = new WorkflowMailer(initiator,"DOCUMENT n\u00b0"+numdmd,
                    `
                       TYPE : DEMANDE DE DOMICILIATION BANCAIRE N&deg; ${numdmd} <br/>
                       INFOS : VOTRE DEMANDE A ETE VALIDEE PAR LA RH
                    `
                ,appN);
             initiateur.sender();
               valideur(dga_wk,initiateur_wk,appN);
        }

       
        if (val_modif.slice(0,15) =='AA_TRSDGADG_DBQ') {
             //console.log('ok trs dg');
             var initiateur = new WorkflowMailer(initiator,"DOCUMENT n\u00b0"+numdmd,
                    `
                       TYPE : DEMANDE DE DOMICILIATION BANCAIRE N&deg; ${numdmd} <br/>
                       INFOS : VOTRE DEMANDE A ETE VALIDEE PAR LE DGA
                    `
                ,appN);
             initiateur.sender();
               valideur(dg_wk,initiateur_wk,appN);
        }
  
       if (val_modif.slice(0,13) =='AA_CLOSDG_DBQ') {
             //console.log('valider');
             var initiateur = new WorkflowMailer(initiator,"DOCUMENT n\u00b0"+numdmd,
                    `
                       TYPE : DEMANDE DE DOMICILIATION BANCAIRE N&deg; ${numdmd} <br/>
                       INFOS : VOTRE DEMANDE A ETE VALIDEE 
                    `
                ,appN);
             initiateur.sender();

             // MAJ DE LA BANQUE DE L'EMPLOYE
             infos_demandeur($('.createur').val().toLowerCase(),'BICICI','0009');
    
        } 
  
    // REFUS 

	
});
   
 
   