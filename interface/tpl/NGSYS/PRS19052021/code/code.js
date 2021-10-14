let appNameC = $(".appName").val();
let order = '3/NGSER/2021';

let link_urlC =
    "/" +
    appNameC +
    "/interface/tpl/" +
    appNameC +
    "/PRS/code/code.php";






    //Debut phase 1-Traitement des departements
ajaxcode()
.then((results) => {

     
   $('.codef').val(order);

order = results[0];
var flag;
let newOrder = '';
let recupNum=order.substr(0,order.indexOf('/'));
let numero = parseInt(recupNum,10);

let recupLastYear=`${order}`.split("/");
let lasty =parseInt(recupLastYear[2] ,10);


const currentTime = new Date();
 let curry = parseInt((currentTime.getFullYear()).toString(),10);
 //let curry =parseInt("2022".trim(),10);

if(lasty==curry){
     flag = 0;
}
if (lasty < curry){
     flag = 1;
}
if(flag==0){
    numero = numero+1;
    newOrder = numero+"/NGSER/"+curry;
    //console.log(newOrder);

    $('.codef').val(newOrder);

}
if(flag==1){
    numero = 1;
    newOrder = numero+"/NGSER/"+curry;
    //console.log(newOrder);
    $('.codef').val(newOrder);
}



 











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