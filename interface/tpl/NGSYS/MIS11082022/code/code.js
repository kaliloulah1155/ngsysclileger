let appNameC = $(".appName").val();
let order = '1/NGSER/DG/2021';

let link_urlC =
    "/" +   
    appNameC +
    "/interface/tpl/" +
    appNameC +
    "/MIS/code/code.php";


    //Debut phase 1-Traitement des departements
ajaxcode()
.then((results) => {
    
   
        $('.numero').val(order);

       order = results[0];
            var flag;
            let newOrder = '';
            let recupNum=order.substr(0,order.indexOf('/'));
            let numero = parseInt(recupNum,10);

            let recupLastYear=`${order}`.split("/");
            let lasty =parseInt(recupLastYear[3] ,10);


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
                newOrder = numero+"/NGSER/DG/"+curry;
                //console.log(newOrder);

                $('.numero').val(newOrder);

            }
            if(flag==1){
                numero = 1;
                newOrder = numero+"/NGSER/DG/"+curry;
                //console.log(newOrder);
                $('.numero').val(newOrder);
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