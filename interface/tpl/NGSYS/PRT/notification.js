
$(document).on('click','.bouton_sub',function(e){
        
 // e.preventDefault();
 if ($('.vnbreemprunt').val()==2){
            e.preventDefault();
  }else{

    if (confirm("Confirmez-vous le traitement de cette action ?" ) ) {
            alert("VOTRE OPERATION S'EST DEROULEE AVEC SUCCES");
            $(".cform").submit();
        }else{

            e.preventDefault();
          }

  }  
    
});