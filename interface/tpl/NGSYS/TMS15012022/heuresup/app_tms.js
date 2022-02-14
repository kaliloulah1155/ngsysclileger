
 
     var etat='';
        
    var $dataRows =$('.tableL');
    var tr=$dataRows.parent().parent();
    tr.find('.ferie').each(function (i) {
            $(this).hide(); 
    });

    
    var som=0;

  $(document).on('click',".hsu",function(event) {
        var row = $(event.target).closest('tr');
        var valhsutab=[];
        var valhsuduree=[] ;
        if($(this).is(':checked')){
            //som =parseInt(som)+1;
            row.find('.ferie').show();
        }else{
            //som =parseInt(som)-1;
            row.find('.ferie').hide();
        } 


            tr.find('.hsu').each(function (i) {
                var $row = $(this).closest("tr");    // Find the row     
                    valduree=[];

                     if($row.find(this).map(()=>this.checked).toArray()[0]==true){
                          
                          valhsutab.push(true);

                          valhsuduree.push($row.find('.duree').val());


                          $('.totalduree').val(findTotalDureeHSU(valhsuduree));
                           
                     }else{
                          valhsutab.push(false);
                     };
            });



            if(valhsutab.indexOf(true) !== -1)  
            {  
                    $('.etat').val(1);
            }   
            else  
            {  
                    $('.etat').val('');  
            }  

                   
  });



  //Date de creation du timesheet
  var date_modif = $('.date_modif').val();
  var datechoice=new Date(date_modif);
  var formateDate=(datechoice.toLocaleDateString()).split('/').join('-');

  $('.datepick').val(formateDate);




function findTotalDureeHSU(tduree){

    var tot=0;
    var $dataRows =$('.tableL');
    var tr=$dataRows.parent().parent();
    var t_duree='00:00';
           //console.log('dans func ',tduree);
           tduree.forEach(element =>{
                time = element.split(":");
                if(time.length !==1){
                    var minutes =  parseInt((time[0])*60,10) + parseInt((time[1]),10) ;
                    tot += parseInt(minutes);
                }
           });
        var hours = Math.floor(tot / 60);          
        var minutes = tot % 60;
                
        heures1 = hours > 9 ? hours : '0'+hours;
        minutes1 = minutes > 9 ? minutes : '0' + minutes;

        t_duree=heures1+':'+minutes1;
    return t_duree;
}





  