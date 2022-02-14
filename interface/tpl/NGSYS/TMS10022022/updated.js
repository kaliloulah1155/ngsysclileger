let up_appName = $(".appName").val();
/// TRAITEMENT DES DONNEES TABLEAUX


let link_url_up_rows =
    "/" +
    up_appName +
    "/interface/tpl/" +
    up_appName +
    "/TMS/requestAjax/updated.php";

//heure supplementaire
let linkedit =
    "/" +
    up_appName +
    "/interface/tpl/" +
    up_appName +
    "/TMS/heuresup/hsupedit.php";

let vlinkedit =
    "/" +
    up_appName +
    "/interface/tpl/" +
    up_appName +
    "/TMS/heuresup/verif_hsu.php";
 
 
     

var user_email=$('.createur').val();
var dateEnreg1=$('.date_modif').val();   //date de modification

var date = new Date(dateEnreg1); // Or your date here
var d=date.getDate();
var m=(date.getMonth() + 1);
d1 = d > 9 ? d : '0'+d;
m1 = m > 9 ? m : '0'+m;
var dateEnreg=date.getFullYear()+'-'+m1+'-'+d1;


 var departement =$(".viewdepartement").val();
 var service =$(".viewservice").val();


 //console.log(dateEnreg);


 //action de modification 

 function action_modification(action_modif){

    if(action_modif=='AA_MOD_TMS'){
         //alert('vrai');

         var activites = $("select[name='activite[]']")
        .map(function() {
            return $(this).val();
        })
        .get();

         var taches = $("textarea[name='tache[]']")
        .map(function() {
            return $(this).val();
        })
        .get();

    var heureins = $("input[name='heurein[]']")
        .map(function() {
            return $(this).val();
        })
        .get();

    var heureouts = $("input[name='heureout[]']")
        .map(function() {
            return $(this).val();
        })
        .get();
   
    var durees = $("input[name='duree[]']")
        .map(function() {
            return $(this).val();
        })
        .get();

    var taux = $("input[name='taux[]']")
        .map(function() {
            return $(this).val();
        })
        .get();
    var resultats = $("input[name='resultat[]']")
        .map(function() {
            return $(this).val();
        })
        .get();

    var hsu = $("table.test input[name='hsu[]']").map(function() {
        return this.checked;
    }).toArray();

    var ferie = $("table.test input[name='ferie[]']").map(function() {
        return this.checked;
    }).toArray();   



    var loadcode = $(".loadcode").val();
    //   console.log(user_email,activites,taches,heureins,heureouts,durees,taux,resultats,dateEnreg,departement,service,hsu,ferie);

         ajaxUpdate(
            activites,
            taches,
            heureins,
            heureouts,
            durees,
            taux,
            resultats,
            dateEnreg,
            user_email,
            departement,
            service,
             hsu,
            ferie,
            loadcode
        )
        .then((results) => {
             
             $(".resul").html(results);
 
        })
        .catch((err) => console.log(err)); 


    }


 }

    

$(document).on('click','.bouton_sub',function(e) {


	var val_modif=$('.action_hermes').val();

	var action_modif = val_modif.slice(0, 10);


     action_modification(action_modif);

	
     /** TRAITEMENT POUR LES HEURES SUPPLEMENTAIRE */
   
    if(action_modif=='AB_TMS_HSU'){

           action_modification('AA_MOD_TMS');
           GetSelected();
    }

     // e.preventDefault();
});




function ajaxUpdate(
    activites,
    taches,
    heureins,
    heureouts,
    durees,
    taux,
    resultats,
    dateEnreg,
    user_email,
    departement,
    service,
    hsu,
    ferie,
    loadcode
) {
    return new Promise((resolve, reject) => {
        $.ajax({
            url: link_url_up_rows,
            type: "GET",
            data: {
                activites:activites,
			    taches:taches,
			    heureins:heureins,
			    heureouts:heureouts,
			    durees:durees,
			    taux:taux,
			    resultats:resultats,
			    dateEnreg:dateEnreg,
			    user_email:user_email,
			    departement:departement,
			    service:service,
                hsu:hsu,
                ferie:ferie,
                loadcode:loadcode
            },
            success: function(data) {
                resolve(data);
            },
            error: function(error) {
                reject(error);
            },
        });
    });
}




///DEBUT  HEURE SUPPLEMENTAIRE DATA ///

var tableau = [];
var tabduree;

var codegenerator=$('.codehsu').val();
var formateDate=$('.date_modif').val();

 
function GetSelected() {



            var message = "";
            var obj = {};
            var montant_hsu =0;


            //Loop through the CheckBoxes.
            var valactivite=[] ;
            var valtache=[] ;
            var valheurein=[] ;
            var valheureout=[] ;
            var valduree=[] ;
            var valtaux=[] ;
            var valresultat=[] ;
            var valhsu=[] ;
            var valferie=[];
            var data=[];

            tabduree=[];

            obj['activite'] = [];
            obj['tache'] =[];
            obj['heurein'] = [];
            obj['heureout'] = [];
            obj['duree'] = [];
            obj['taux'] = [];
            obj['resultat'] = [];
            obj['hsu'] = [];
            obj['ferie'] = [];

            var totalD='';

            tableau.push(obj);

            tr.find('.activite').each(function (i) {
                var $row = $(this).closest("tr");    // Find the row     
                valactivite.push($row.find(this).map(()=>this.value).toArray()[0]);
            }); 
            tr.find('.tache').each(function (i) {
                var $row = $(this).closest("tr");    // Find the row     
                valtache.push($row.find(this).map(()=>this.value).toArray()[0]);
            });
            tr.find('.heurein').each(function (i) {
                var $row = $(this).closest("tr");    // Find the row     
                valheurein.push($row.find(this).map(()=>this.value).toArray()[0]);
            }); 
            tr.find('.heureout').each(function (i) {
                var $row = $(this).closest("tr"); 
                valheureout.push($row.find(this).map(()=>this.value).toArray()[0]);
                
            });

            tr.find('.duree').each(function (i) {
                var $row = $(this).closest("tr"); 
                valduree.push($row.find(this).map(()=>this.value).toArray()[0]);
                
            });
            tr.find('.taux').each(function (i) {
                var $row = $(this).closest("tr"); 
                valtaux.push($row.find(this).map(()=>this.value).toArray()[0]);
                
            });
            tr.find('.resultat').each(function (i) {
                var $row = $(this).closest("tr"); 
                valresultat.push($row.find(this).map(()=>this.value).toArray()[0]);
                
            });

            tr.find('.hsu').each(function (i) {
                var $row = $(this).closest("tr");    // Find the row     

                valhsu.push($row.find(this).map(()=>this.checked).toArray()[0]);
            });
            tr.find('.ferie').each(function (i) {
                var $row = $(this).closest("tr");    // Find the row     
                valferie.push($row.find(this).map(()=>this.checked).toArray()[0]);
            }); 


            obj['activite'] =valactivite;
            obj['tache'] =valtache;
            obj['heurein'] = valheurein;
            obj['heureout'] = valheureout;
            obj['duree'] = valduree;
            obj['taux'] = valtaux;
            obj['resultat'] =valresultat;
            obj['hsu'] = valhsu;
            obj['ferie'] = valferie;



            tableau.push(obj);

            if(tableau.length <0){

            }else{

            data=tableau[tableau.length-1];

            for (var i = 0; i < data.activite.length; i++) {

                if(!data.hsu[i]){
                    
                }else{
                     

                     var salaire_base =parseInt($('.vsalaire_base').val() );
                   
                   montant_hsu =parseInt(fhsup(formateDate,data.heurein[i],data.heureout[i],data.ferie[i],salaire_base));
                   
                      tabduree.push(data.duree[i]);

                      
                     // totalD=findTotalDureeHSU(tabduree);

                  //  console.log('Code '+codegenerator+' / Date = '+formateDate,'activite = '+data.activite[i],' / Tache = '+data.tache[i],' / HD = '+data.heurein[i],' / HF = '+data.heureout[i],' / Durée = '+data.duree[i],' / Taux = '+data.taux[i],' / Resultat = '+data.resultat[i],' / Hsu = '+data.hsu[i],' / Ferie : '+data.ferie[i],' / MTN : '+montant_hsu);

                     
                     //traitement du tableau tab_hsu pour les heures sup via ajax

                      ajaxEditHSU(
                            codegenerator,
                            formateDate,
                            data.heurein[i],
                            data.heureout[i],
                            data.duree[i],
                            data.tache[i],
                            montant_hsu,
                            data.ferie[i]
                        )
                        .then((results) => {
                            console.log(results);
                            // $(".resul").html(results);
                        })
                        .catch((err) => console.log(err));




                }
                
            }

        } 
}


//// DEBUT MONTANT HEURE SUPPLEMENTAIRE /////


function fhsup(datepick,hd,hf,ferie,slb){

    var montanthsu=0;

    var inphdeb=hd;
    var inphfin=hf;
    var inphdate=datepick;
    var elem = inphdate.split('-');

    var date = elem[2] +'-'+elem[1]+'-'+elem[0];
    var weekday1 = ['Dimanche', 'Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi'];

    var day = new Date(date);
    var getNumber= day.getDay(date);
    var getJour = weekday1[getNumber];

    const heureConstMat='07:00';
    const heureConstSoir='21:00';

    var tr_duree='00:00';


    var hourDiff='';

    var init_dateHeureMatin= new Date(date +' '+ heureConstMat); //heure debut 07:00 en date   timeMat (matin)
    var init_dateHeureSoir= new Date(date +' '+ heureConstSoir);  //heure debut 21:00 en date timeSoir (soir)
    var dateHeureStart = new Date(date +' '+ inphdeb);  //heure debut choisie en date timeStart
    var dateHeureEnd = new Date(date +' '+ inphfin);  //heure fin choisie en date timeEnd
    var salaireBrut =parseInt(slb); //recuperation du salaire de base dans afficher_creation.php
    var paieQuod = salaireBrut/173.33;   //2884.67085905
    var montantSunday= paieQuod + (0.75*paieQuod);
    var montantSunday2= paieQuod + (1*paieQuod);
    var montantJour= paieQuod + (0.15*paieQuod);  //3317.37
    var montantJour2= paieQuod + (0.5*paieQuod);  


    //function de comparaison des heures
    function comparHeur(heurdbts,heurfns){
        var statut = false;
        if(heurdbts < heurfns){
            statut = true;
        }
        else{
            
        }
        return statut;
    }
    
    
    function jourferier(choice){
        var mtn=0; 
        if(choice==true){
            //tr.find('.cbk').val(true);
            mtn=parseInt(montantJour2);
        }else{
            mtn=parseInt(montantJour);
         }
        return mtn;
    }

    function jourweekferier(choice){
        var w_mtn=0; 
        if(choice==true){
             w_mtn=parseInt(montantSunday2);
            
        }else{
            w_mtn=parseInt(montantSunday);
             
        }
        return w_mtn;
    }

    function cal_tmontant(tduree, tmontant) {

        let hduree = tduree;
        let hmontant = parseInt(tmontant);
        let delta = 0;
        let montant_totale = 0;

        htime = hduree.split(":");
        delta = parseInt(htime[0]) + parseInt(htime[1]) / 60;
        montant_totale = delta * hmontant;

        return montant_totale;

    }

    
    function comparHeur(heurdbts,heurfns){
        var statut = false;
        if(heurdbts < heurfns){
            statut = true;
        }
        else{
        }
        return statut;
    }
     
    var etat=comparHeur(dateHeureStart,dateHeureEnd);
    if(etat==false){

     }else{
        if(dateHeureEnd<= init_dateHeureSoir){
            // console.log('Hfin <=21h ')  ;
            var differenteTime= init_dateHeureSoir-dateHeureEnd;
            var newdiff= new Date(differenteTime);
            var hourTime= newdiff.getHours();
            var minuteTime = newdiff.getMinutes();

            hourTimeDiff1 = hourTime > 9 ? hourTime : '0'+hourTime;
            minuteTimeDiff1 = minuteTime > 9 ? minuteTime : '0' + minuteTime;
            var countDureeTime=(isNaN(hourTimeDiff1) ? '00' : hourTimeDiff1)+':'+(isNaN(minuteTimeDiff1) ? '00' : minuteTimeDiff1) ;
             
        }else{
           //   console.log('Hfin >=21h ')  ;
        }

        if(dateHeureStart <= dateHeureEnd){
            var difference = dateHeureEnd - dateHeureStart;
            var diff_result = new Date(difference);

            var hourDiff = diff_result.getHours();
            var minuteDiff = diff_result.getMinutes();

            hourDiff1 = hourDiff > 9 ? hourDiff : '0'+hourDiff;

            minuteDiff1 = minuteDiff > 9 ? minuteDiff : '0' + minuteDiff;
            var countDuree=(isNaN(hourDiff1) ? '00' : hourDiff1)+':'+(isNaN(minuteDiff1) ? '00' : minuteDiff1) ;
           
            tr_duree=countDuree;

          
          
        }else{
             
        }

        if(dateHeureStart>=init_dateHeureMatin && dateHeureEnd<=init_dateHeureSoir){
               
            var montant=0;
            if(getJour==weekday1[getNumber]){

            switch (getJour) {
                case 'Lundi':
                     montant= cal_tmontant(tr_duree, jourferier(ferie));
                break;
                case 'Mardi':
                    montant= cal_tmontant(tr_duree, jourferier(ferie));
                break;
                case 'Mercredi':
                    montant= cal_tmontant(tr_duree, jourferier(ferie));
                break;
                case 'Jeudi':
                    montant= cal_tmontant(tr_duree, jourferier(ferie));
                break;
                case 'Vendredi':
                    montant= cal_tmontant(tr_duree, jourferier(ferie));
                break;
                case 'Dimanche':
                   montant= cal_tmontant(tr_duree, jourferier(ferie));
                break;
                case 'Samedi':
                    montant= cal_tmontant(tr_duree, jourferier(ferie));
                    break;
                default:
                    
                }
 
                 montanthsu =parseInt(montant);
            } 
        } 

     }

    return montanthsu;
}


/*insertion en base de l'heure sup*/
function ajaxEditHSU(
    loadcode,
    date_crea,
    hdeb,
    hfin,
    nbrehreal,
    motif,
    montant,
    ferie
) {
    return new Promise((resolve, reject) => {
        $.ajax({
            url: linkedit,
            type: "POST",
            data: {
                loadcode: codegenerator,
                date_crea: date_crea,
                hdeb: hdeb,
                hfin: hfin,
                nbrehreal: nbrehreal,
                motif: motif,
                montant: montant,
                ferie: ferie
            },
            success: function(data) {
                resolve(data);
            },
            error: function(error) {
                reject(error);
            },
        });
    });
}




  //verification de l'heure sup 
   
   verifhsu(codegenerator);
    
  function verifhsu(codegenerator){

     $.ajax({
            url: vlinkedit,
            type: "POST",
            data: {
                codegenerator: codegenerator
            },
            success: function(data) {

                console.log(data);

                if(data==1){
                      $('.etat').val(1);
                }else{
                    $('.etat').val('');
                }
            },
            error: function(error) {
             },
        });
       
  }



///FIN  HEURE SUPPLEMENTAIRE DATA ///
