 
 //vu de creation
// $(document).on('click','.btn_reg',function(e){
        

//     if (confirm("Confirmez-vous le traitement de cette action ?" ) ) {
//         alert("VOTRE OPERATION S'EST DEROULEE AVEC SUCCES");
        
//           $(".cform").submit();
//         }else{

//             e.preventDefault();
//           }
// });


//  $('form').submit(function() {

//     var etat_part = $('.vpart').val();
//     if (etat_part == '' || etat_part == undefined) {
//         alert("Veuillez renseigner la situation matrimoniale et le nombre d'enfant du personnel");
//         return false;
//     }
//     alert("VOTRE OPERATION S'EST DEROULEE AVEC SUCCES");
// });

$(document).on('click','.bouton_sub',function(e){
        
    if (confirm("Confirmez-vous le traitement de cette action ?" ) ) {
        alert("VOTRE OPERATION S'EST DEROULEE AVEC SUCCES");
        
          $(".cform").submit();
        }else{

            e.preventDefault();
          }
});