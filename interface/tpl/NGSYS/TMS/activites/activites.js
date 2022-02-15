


let link_urlact =
    "/" +
    appName +
    "/interface/tpl/" +
    appName +
    "/TMS/activites/activites.php";


let link_urlcode =
    "/" +
    appName +
    "/interface/tpl/" +
    appName +
    "/TMS/activites/getcode.php";



const getActivities=poste=>{

	return new Promise((resolve,reject)=>{

         $.ajax({
            url: link_urlact,
            type: "POST",
            data: {
                poste: poste,
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


function mesActivites(poste){
		getActivities(poste)
		.then(data=>{
		      
		         let donnees=data.activites;

		       ///tableau
		       	/*   with select 2 */

		       	var html = '';
					    html += '<tr>';
					    html += '<td style="width: 200px;border:none;">';
					    html += '<select name="activite[]"    class="form-control select2 activite narrow wrap" style="width: 100%;">';
					    html += '<option value="0">Veuillez s&#233;lectionner</option>';
						    for (var i = 0; i < data.activites.length; i++) {
					        html += '<option value="' + donnees[i]['id'] + '">' +donnees[i]['valeur'] + '</option>';
					    }
					    html += '</select>';

					    html += '</td>' +
					            '<td style="width: 500px;border:none;">'+
										'<textarea type="text" name="tache[]" style="width: 100%; resize: none" rows="1" class="form-control tache" required="true"></textarea>'+
								'</td>'+
								'<td style="width: 100px;border:none;">'+
										'<input type="time" name="heurein[]" style="width: 100%;height: 35px;" class="form-control heurein" required="true">'+
								'</td>'+
								'<td style="width: 100px;border:none;">'+
										'<input type="time"  name="heureout[]" style="width: 100%;height: 35px;" class="form-control heureout" required="true">'+
								'</td>'+
								'<td style="width: 100px;border:none;">'+
										'<input type="text" onkeypress="return testNum(event, this,2);" name="duree[]" style="width: 100%;height: 35px;" class="form-control duree" required="true">'+
								'</td>'+
								'<td style="width: 100px;border:none;">'+
										'<input type="text" onkeypress="return testNum(event, this,2);" onkeydown="limit(this);" onkeyup="limit(this);"  name="taux[]" step="1" min="1" max="100" style="width: 100%;height: 35px;" class="form-control taux"  id="resultat">'+
								'</td>'+
								'<td style="width: 200px;border:none;">'+
										'<input type="text" name="resultat[]" style="width: 100%;height: 35px;" class="form-control resultat"  id="resultat">'+
								'</td>'+
					    '</tr>';

					    $('.tableL').append(html);

					     select2();
		      	    //fin tableau
			 
		})
		.catch((err)=>console.log(err));
}


mesActivites($('.viewfonction').val());



$(document).on('click','.addRow',function() {
				    
				 var $dataRows =$('.tableL');
				 var tr=$dataRows.parent().parent();

				 if(
				 	  tr.find('.activite:last').val()=="" ||
				 	  tr.find('.tache:last').val()=="" ||
				 	  tr.find('.heurein:last').val()=="" ||
				 	  tr.find('.heureout:last').val()=="" ||
				 	  tr.find('.duree:last').val()=="" ||
				 	  tr.find('.taux:last').val()=="" ||
				 	  tr.find('.resultat:last').val()==""
				 	
				 ){
					  alert("Veuillez bien renseigner les informations") ;
				  }else{

					mesActivites($('.viewfonction').val());
					 $(".Suprim").show(); // affichage du bouton de suppression
				  } 



 });




//load code poste 
function codeposte (fonc) {
	 $.ajax({
	    url: link_urlcode,
	    type: "POST",
	    data: {
	        fonction:fonc ,
	     },    
	    success: function(data) {
 
	        $('.loadcode').val(data);

	    },
	    error: function(error) {
	        console.log(error);
	    },
	});
}

codeposte($('.viewfonction').val()) ;



  

			











