 
let scp_file =
    "/" +
    appli +
    "/interface/tpl/" +
    appli +
    "/COT/liste/importdata/scp_file.php";

liste_loader();

let transfert =
    "/" +
    appli +
    "/interface/tpl/" +
    appli +
    "/COT/liste/importdata/transfert.php";
 

function fileImport() {
  return new Promise(resolve => {
    setTimeout(() => {

      //Chargement du fichier en base - routine bash

      //$('.resultat').text("");
      
      $.ajax({
        url: scp_file,
        type: "POST",
        beforeSend: () => {
          $('.sendfile').val('En cours...');
        },
        complete: () => {
          $('.sendfile').val('Charger le fichier');
          liste_loader();
        },
        success: function (data) {
             //$('.resultat').text(data);
             console.log(data);
        },
        error: function (error) {
          console.log(error);
        },
      });
    }, 1500);
  });
}

async function transFile() {

  //Deplacement du fichier 
  var formData = new FormData();
  formData.append('file', $('#file')[0].files[0]);

  $.ajax({
    url: transfert,
    type: 'POST',
    data: formData,
    processData: false,  // tell jQuery not to process the data
    contentType: false,  // tell jQuery not to set contentType
    success: function (data) {
      console.log(data);

      if(data==1){
        alert("Les donn\u00e9es ont \u00e9t\u00e9 charger avec succ \u00e8s");
      }

      $('.filename').val('');
    },
    error: (error => console.log(error))
  });
  const imp_file = await fileImport();
  // console.log(imp_file);
  // expected output: "resolved"
}


$(document).on('click', '.sendfile', function (e) {
  e.preventDefault();

  if ($('.filename').val() != '') {
    transFile();
  } else {
    alert(`Veuillez selectionner un fichier svp !`);
  }


}); 