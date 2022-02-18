let appNameC = $(".appName").val();
let order = 1;

let link_urlC =
    "/" +
    appNameC +
    "/interface/tpl/" +
    appNameC +
    "/PRT/code/code.php";


//Debut phase 1-Traitement des departements
ajaxcode()
.then((results) => {
    

   $('.numero').val(order);
   if(isNaN(results[0]) || results[0] =='' ) {
         order = 0 ;
   }else{
      order = results[0];
   }

   

   
	let newOrder = ++order;
   // console.log("test = "+newOrder) ;
	$('.numero').val(newOrder);
    $('.tnum').text(newOrder);
    
})

.catch((err) => console.log(err));

function ajaxcode() {
    return new Promise((resolve, reject) => {
        $.ajax({
            url: link_urlC,
            type: "POST",
            dataType: "json",
            // data: {
            //     key: "value",
            // },
            success: function(data) {
                resolve(data);
            },
            error: function(error) {
                reject(error);
            },
        });
    });
}
