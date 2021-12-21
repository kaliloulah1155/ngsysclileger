
//-------number format 
Number.prototype.formatMoney = function (decPlaces, thouSeparator, decSeparator) {
    var n = this,
        decPlaces = isNaN(decPlaces = Math.abs(decPlaces)) ? 2 : decPlaces,
        decSeparator = decSeparator == undefined ? "." : decSeparator,
        thouSeparator = thouSeparator == undefined ? "." : thouSeparator,
        sign = n < 0 ? "_" : "",
        i = parseInt(n = Math.abs(+n || 0).toFixed(decPlaces)) + "",
        j = (j = i.length) > 3 ? j % 3 : 0;

    return sign + (j ? i.substr(0, j) + thouSeparator : "")
        + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + thouSeparator)
        + (decPlaces ? decSeparator + Math.abs(n - i).toFixed(decPlaces).slice(2) : "");
};
//------ fin number format


appName = $('.appName').val();


let link_urldestp =
    "/" +
    appName +
    "/interface/tpl/" +
    appName +
    "/MIS/api/get_frs_data.php";



const get_estimation = (destination, profil, qte) => {
    return new Promise((resolve, reject) => {
    
        $.ajax({
            url: link_urldestp,
            type: "POST",
            data: {
                destination: destination,
                profil: profil,
                qte: qte
            },
            success: function (data) {
                resolve(data);
            },
            error: function (error) {
                reject(error);
            },
        });


    })
}

function func_estimation(destination, profil, qte) {

    get_estimation(destination, profil, qte)
        .then(result => {
                      
            $('.table_mis').empty();

            const resultats = result;

            let donnees = result.data;

            var html = '';
            for (let index = 0; index < donnees.length; index++) {
                const element = donnees[index];
                html += '<tr>';
                html += '<td style="width: 50px; ">';
                html += '<span>' + element['lib'] + '</span>';
                html += ' </td>';
                html += ' <td style="width: 35px;padding: 0">';
                html += '     <span style="padding: 10px 10px;position: absolute;">' + element['pu'].formatMoney(0, '.', ',') + " F CFA" + '</span>';
                html += ' </td>';
                html += '  <td style="width: 35px;padding: 0">';
                html += '     <span style="padding: 10px 10px;position: absolute;">' + element['qte'] + '</span>';
                html += '  </td>';
                html += '    <td style="width: 35px;padding: 0">';
                html += '       <span style="padding: 10px 10px;position: absolute;">' + element['xof'].formatMoney(0, '.', ',') + " F CFA" + '</span>';
                html += '  </td>';
                html += '</tr>';

            }

            html += '<tr>';
            html += '  <td style="width: 50px;">';
            html += '       <span> <b>Total frais de mission</b></span>	';
            html += '    </td>';
            html += '    <td style="width: 35px;padding: 0;">';
            html += '         <span style="padding: 10px 10px;position: absolute;"> <b> ' + resultats.tot_pu.formatMoney(0, '.', ',') + " F CFA" + ' </b></span>';
            html += '   </td>';
            html += '    <td style="width: 35px;padding: 0">';
            html += '     </td>';
            html += '    <td style="width: 35px;padding: 0">';
            html += '         <span style="padding: 10px 10px;position: absolute;"> <b>' + resultats.tot_xof.formatMoney(0, '.', ',') + " F CFA" + ' </b></span>';
            html += '    </td>';
            html += '</tr>';
            $('.table_mis').append(html);

        }).catch(err => console.log(err));


}

func_estimation($('.interdestination').val(),$('.interprofil').val(), $('.duree').val());

 

$(document).on("keyup change",'.duree , .destination , .profil',function(){

    var qte =parseInt($('.duree').val());
    var profil =parseInt($('.profil').val());
    var destination =parseInt($('.destination').val());

    if(isNaN(destination)){

    }else if(isNaN(profil)){

    }else{
        func_estimation(destination, profil, qte);
    }
    
   // console.log(destination, profil, qte);
    
});



let link_urldest =
    "/"+
    appName+
    "/interface/tpl/"+
    appName+
    "/FRS/Mes_scripts_ihm/destination.php";

let link_urlprof =
    "/"+
    appName+
    "/interface/tpl/"+
    appName+
    "/FRS/Mes_scripts_ihm/profil.php";
//DEBUT DESTINATION
const getdestination =()=>{
    return new Promise((resolve,reject)=>{
          $.ajax({
                  url: link_urldest,
                  type: "POST",
                 
                  success: function(data) {
                      resolve(data);
                  },
                  error: function(error) {
                      reject(error);
                  },
              });
    });
  }

    

  getdestination()
  .then(data=>{
      let donnees_dest=data.destinations;
      var html = '';
               html += '<option value="">Veuillez s&#233;lectionner</option>';
              for (var i = 0; i < data.destinations.length; i++) {
          html += '<option value="' + donnees_dest[i]['id'] + '"  '+(donnees_dest[i]['id']==$('.interdestination').val() ? "selected" : "")+'       >' +donnees_dest[i]['valeur'] + '</option>';
                   }
        $('.destination').append(html);

  }).catch(err=>console.log(err));

  //FIN DESTINATION


//DEBUT PROFIL

const getprofil =()=>{
    return new Promise((resolve,reject)=>{
          $.ajax({
                  url: link_urlprof,
                  type: "POST",
                  success: function(data) {
                      resolve(data);
                  },
                  error: function(error) {
                      reject(error);
                  },
              });
    });
  }

  getprofil()
  .then(data=>{
      let donnees_profil=data.profils;
      var html = '';
               html += '<option value="">Veuillez s&#233;lectionner</option>';
              for (var i = 0; i < data.profils.length; i++) {
          html += '<option value="' + donnees_profil[i]['id'] + '"  '+(donnees_profil[i]['id']==$('.interprofil').val() ? "selected" : "")+'       >' +donnees_profil[i]['valeur'] + '</option>';
                   }
        $('.profil').append(html);
  }).catch(err=>console.log(err));

  //FIN PROFIL