let appName = $(".appName").val();

let link_url =
    "/" +
    appName +
    "/interface/tpl/" +
    appName +
    "/TMS/requestAjax/registered.php";


    var date_modif=new Date();

    var dateEnreg;

$('.btn_reg').on('click',function(e){

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



    
        if($('.date_modif').val()!=''){
            date_modif=new Date($('.date_modif').val());

            var date = date_modif; // Or your date here
           var d=date.getDate();
           var m=(date.getMonth() + 1);
           d1 = d > 9 ? d : '0'+d;
           m1 = m > 9 ? m : '0'+m;
             dateEnreg=date.getFullYear()+'-'+m1+'-'+d1;
        }else{

             var date = date_modif; // Or your date here
           var d=date.getDate();
           var m=(date.getMonth() + 1);
           d1 = d > 9 ? d : '0'+d;
           m1 = m > 9 ? m : '0'+m;
             dateEnreg=date.getFullYear()+'-'+m1+'-'+d1;
      
        }



          console.log(dateEnreg);
      

       var departement ='TECHNIQUE INFORMATIQUE';
       var service ='RECHERCHE INFORMATIQUE';

   // console.log(user_email,activites,taches,heureins,heureouts,durees,taux,resultats,dateEnreg,departement,service);

     ajaxRegister(
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
     

    //e.preventDefault();
});


function ajaxRegister(
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
            url: link_url,
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

