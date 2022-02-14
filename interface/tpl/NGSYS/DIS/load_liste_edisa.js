 let appli = $('.appName').val();

   

///////////CHARGEMENT DE LA LISTE E-DISA
 let link_url =
    "/" +
    appli +
    "/interface/tpl/" +
    appli +
    "/DIS/data_disa.php";






 const loadliste_edisa = () => {
    return new Promise((resolve, reject) => {
        $.ajax({
            url: link_url,
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

loadliste_edisa()
.then(data => {

     let donnees=data.resultats;

     $('.table_1 > tbody').find('tr').remove();
    var t = $('.table_1').DataTable();
    t.clear();


    for (var i = 0; i < donnees.length; i++) {
        t.row.add(
            [
                donnees[i]['cnps'],
                donnees[i]['nom'],
                donnees[i]['prenoms'],  
               /* parseInt(donnees[i]['date_naiss']).formatMoney(0,'.',',')+" F CFA",*/
                donnees[i]['date_naiss'],
                donnees[i]['date_embauche'],
                donnees[i]['date_depart'],
                donnees[i]['mensualite'],
                parseInt(donnees[i]['brute']).formatMoney(0,'.',',')+" F CFA",
            ]
        );
    }
    t.draw();

	//console.log(donnees);
})
.catch(error=>console.log(error));

//////////////////////////////////////////////////


/////////////// BOUTON D'EXPORTATION DE LA LISTE ///////////////////////////
let link_urlexcel =
    "/" +
    appli +
    "/interface/tpl/" +
    appli +
    "/DIS/download_exc_disa.php";


$(document).on('click', '.btn_format', function (e) {

		 
		 window.open(link_urlexcel,"_blank ");

	   e.preventDefault();
});


