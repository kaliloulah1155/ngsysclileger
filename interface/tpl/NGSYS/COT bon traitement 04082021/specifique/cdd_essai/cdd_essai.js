 // CHARGEMENT DES CATEGORIES
let linkcategorie =
    "/" +
    appN +
    "/interface/tpl/" +
    appN +
    "/COT/specifique/cdd_essai/categorie.php";

     function load_categorie(){
     	 $.ajax({
                    url: linkcategorie,
                    type: "GET",
                    success: function(data) {
                    		 $(".categorie").append(
               						 "<option value='0'>Veuillez s&#233;lectionner</option>"
               						 );
                          $('.categorie_cdd_essai').append(data);
                    },
                    error: function(error) {
                        console.log(error);
                    },
                }); 
     }


