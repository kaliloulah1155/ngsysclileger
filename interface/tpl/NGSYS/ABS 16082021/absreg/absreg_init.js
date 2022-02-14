 let appName = $(".appName").val();

 let link_url_abs_reg =
     "/" +
     appName +
     "/interface/tpl/" +
     appName +
     "/ABS/absreg/absreg_init.php";

 /******Bouton enregistrer ****/
/* $(document).on('click', '.btn_enreg', function(e) {

     var loadcode = $('.loadcode').val();
     var typeDemande = $('.typeDemande').val();


     var date_creation = $('.date_creation').val();
     var dtcre = (date_creation).split('/');
     var dtcreation = dtcre[2] + '-' + dtcre[1] + '-' + dtcre[0];

     var datedeb = ($('.datedeb').val()).split('/');
     var dtdeb = datedeb[2] + '-' + datedeb[1] + '-' + datedeb[0];

     var datefin = ($('.datefin').val()).split('/');
     var dtfin = datefin[2] + '-' + datefin[1] + '-' + datefin[0];

     var duree = $('.duree').val();

     var email = ($('.createur').val()).toUpperCase();

     var nom = $('.viewnom').val();
     var prenom = $('.viewprenom').val();

     if (typeDemande == 'CONGE ANNUEL') {

         register_abs_reg(loadcode, dtdeb, dtfin, duree, email, nom, prenom);

     }
     e.preventDefault();

 });*/


 function register_abs_reg(loadcode, dtdeb, dtfin, duree, email, nom, prenom) {
     $.ajax({
         url: link_url_abs_reg,
         type: "POST",
         data: {
             loadcode: loadcode,
             dtdeb: dtdeb,
             dtfin: dtfin,
             duree: duree,
             email: email,
             nom: nom,
             prenom: prenom
         },
         success: function(data) {

             console.log(data);

         },
         error: function(error) {
             console.log(error);
         },
     });

 }