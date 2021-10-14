let up_appName = $(".appName").val();
/// TRAITEMENT DES DONNEES TABLEAUX


let link_url_up_rows =
    "/" +
    up_appName +
    "/interface/tpl/" +
    up_appName +
    "/TMS/requestAjax/updated.php";
 

var user_email=$('.createur').val();
var dateEnreg1=$('.date_modif').val();   //date de modification

var date = new Date(dateEnreg1); // Or your date here
var d=date.getDate();
var m=(date.getMonth() + 1);
d1 = d > 9 ? d : '0'+d;
m1 = m > 9 ? m : '0'+m;
var dateEnreg=date.getFullYear()+'-'+m1+'-'+d1;


 var departement ='TECHNIQUE INFORMATIQUE';
 var service ='RECHERCHE INFORMATIQUE';


 console.log(dateEnreg);

    

$(document).on('click','.bouton_sub',function(e) {


	var val_modif=$('.action_hermes').val();

	var action_modif = val_modif.slice(0, 10);


	if(action_modif=='AA_MOD_TMS'){
		 //alert('vrai');

		 var activites = $("input[name='activite[]']")
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




		// console.log(user_email,activites,taches,heureins,heureouts,durees,taux,resultats,dateEnreg,departement,service);



 
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
		    service
        )
        .then((results) => {
        	 
             $(".resul").html(results);
 
        })
        .catch((err) => console.log(err));


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
    service
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
			    service:service
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
