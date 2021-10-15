var appName =$('.appName').val();
var code_key=$('.loadcode').val();
var url_besoins = "/"+
    appName+
    "/interface/tpl/"+
    appName+
    "/FRS/register.php";


const reg_besoins=(code,besoins,pu)=>{
    return new Promise((resolve,reject)=>{
          $.ajax({
              url:url_besoins,
              type:"POST",
              data:{
                code:code_key ,
                besoins:besoins,
                pu:pu
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

$(document).on('click','.bouton_sub',(e)=>{


  var val_modif=$('.action_hermes').val();

	var action_modif = val_modif.slice(0, 10);


	if(action_modif=='AA_MOD_FRS'){

        
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

          reg_besoins(code_key,besoins,pu)
          .then(data=>{
              
          }).catch(err=>console.log(err));

  }

    //e.preventDefault();
});




