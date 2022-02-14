// CHARGEMENT DES FONCTIONS
let appN1 = $(".appName").val();

let linkfonction =
    "/" +
    appN1 +
    "/interface/tpl/" +
    appN1 +
    "/SAN/Fonction/fonction.php";

    $(document).ready(function(){

        $.ajax({
            url: linkfonction,
            type: "GET",
            success: function(data) {
                    
    
                     $(".fonction").append(
                             "<option value=''>Veuillez s&#233;lectionner</option>"
                             );
                  $('.fonction').append(data);
            },
            error: function(error) {
                console.log(error);
            },
        }); 

    }); 

 



