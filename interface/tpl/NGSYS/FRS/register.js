
var code_key=$('.loadcode').val();

var url_besoins = "/"+
    appName+
    "/interface/tpl/"+
    appName+
    "/FRS/register.php";

const reg_besoins=(code)=>{

    return new Promise((resolve,reject)=>{
          $.ajax({
              url:url_besoins,
              type:"POST",
              data:{
                code:code_key 
              },
              success:function(data){

                resolve(data);

              },
              error:function(error){
                reject(error);
              }
          });
    });

}

$(document).on('click','.btn_enreg',(e)=>{


    var besoins = $("select[name='besoins[]']")
    .map(function() {
        return   $(this).val();
    })
    .get();

    var pu = $("input[name='pu[]']")
    .map(function() {
        return $(this).val();
    })
    .get();


    console.log(besoins,pu,code_key);


    reg_besoins(code_key)
    .then(data=>{
        console.log(data);
    }).catch(err=>console.log(err));

    e.preventDefault();
})