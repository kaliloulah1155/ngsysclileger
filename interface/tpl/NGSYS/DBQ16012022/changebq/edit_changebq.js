$(document).on('click','.cbk1',function(){
     if($('.cbk1').is(':checked')==true){
         $('.cbk1').val('OUI');
     }if($('.cbk1').is(':checked')==false){
         $('.cbk1').val('NON');
     }
 });