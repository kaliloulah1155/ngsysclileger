var loadcode_reg=$('.loadcode').val();
var appnam=$('.appName').val();

var numposeidon=$('.numposeidon').val();

 
   
 //vue de consultation
if($('.cbk1').val()=="OUI"){
     $('.cbk1').prop('checked', true);
} 

if($('.cbk2').val()=="OUI"){
     $('.cbk2').prop('checked', true);
}

let linkcbk =
    "/" +
    appName +
    "/interface/tpl/" +
    appName +
    "/DFM/checkbox_dfm/checkboxcbk_dfm.php";
     function load_cbk(numposeidon,statuscbk,rank){
         $.ajax({
                    url: linkcbk,
                    type: "POST",
                     data:{   
                        numposeidon:numposeidon,
                         statuscbk:statuscbk,
                         rank:rank
                    },
                    success: function(data) {
                        
                    },
                    error: function(error) {
                        console.log(error);
                    },
                }); 
     }
 
$(document).on('click','.cbk1',function(){
     if($('.cbk1').is(':checked')==true){
         $('.cbk1').val('OUI');

         load_cbk(numposeidon,'OUI',1);

     }if($('.cbk1').is(':checked')==false){
         $('.cbk1').val('NON');

            load_cbk(numposeidon,'NON',1);
     }
 });

$(document).on('click','.cbk2',function(){
     if($('.cbk2').is(':checked')==true){
         $('.cbk2').val('OUI');
         load_cbk(numposeidon,'OUI',2);
     }if($('.cbk2').is(':checked')==false){
         $('.cbk2').val('NON');
         load_cbk(numposeidon,'NON',2);
     }
});

/*****  load table relation beneficiaire***/
    
let link_rows_beneficiaire =
    "/" +
    appnam +
    "/interface/tpl/" +
    appnam +
    "/DFM/packs_rows/rows_table_beneficiaire.php";  


    function load_table_beneficiaire(loadcode_reg){

	  $.ajax({
	        url: link_rows_beneficiaire,
	        type: "POST",
	        data: {
	            loadcode_reg: loadcode_reg
	        },
	        success: function(resps) {
	            
	            $(".estimation").html(resps);
	            
	           //console.log(resps);
	        },
	        error: function(err) {
	            console.log(err);
	        },
   		 });
    }
    $(".personnel").empty(); 
    load_table_beneficiaire(loadcode_reg);

