let appName = $(".appName").val();
/// TRAITEMENT DES DONNEES TABLEAUX

   
let link_url_rows =
    "/" +
    appName +
    "/interface/tpl/" +
    appName +
    "/TMS/requestAjax/rowstimesheet.php";

     
var user_email=$('.createur').val();
//var dateEnreg1=$('.dateenreg').val();   //date de modification 

var dateEnreg1=$('.date_modif').val();

//alert(dateEnreg1);

var date = new Date(dateEnreg1); // Or your date here
var d=date.getDate();
var m=(date.getMonth() + 1);
d1 = d > 9 ? d : '0'+d;
m1 = m > 9 ? m : '0'+m;
var dateEnreg=date.getFullYear()+'-'+m1+'-'+d1;

//alert(dateEnreg);


  
function testdatecheck(dateEnreg,user_email) {
   // var dateclick = $(".datechck").val();
    ///alert(dateclick + " / " + userinfo + " " + link_url_rows);
    $.ajax({
        url: link_url_rows,
        type: "GET",
        data: {
            dateEnreg: dateEnreg,
            user_email: user_email,
            loadcode:$('.loadcode').val()
        },
        success: function(resps) {
            
           $(".tableL").html(resps);
          
            //console.log(resps);
        },
        error: function(err) {
            console.log(err);
        },
    });
}


testdatecheck(dateEnreg,user_email);