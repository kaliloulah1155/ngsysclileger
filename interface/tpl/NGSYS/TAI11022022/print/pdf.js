let appNamepdf = $(".appName").val();

let link_urlpdf =
    "/" +
    appNamepdf +
    "/interface/tpl/" +
    appNamepdf +
    "/TAI/print/pdfTAI.php";

    let link_urlexcel =
    "/" +
    appNamepdf +
    "/interface/tpl/" +
    appNamepdf +
    "/TAI/print/download_exc_tai.php";


$(document).on('change','.choice',function(){

    if($(this).val()=='Pdf'){
        $('.btn_format').text('Imprimer');
    }else{
        $('.btn_format').text('Exporter');
    }

});
       

$(document).on('click', '.btn_format', function (e) {

    var choice = $('.choice').val();
    var contrat = $('.interselectcontrat').val(); //type de contrat
    var tab_date = ($('.datefin1').val()).split(' ');
    var mois = tab_date[0];  // mois
    var year = tab_date[1]; // année s

   
    var map_date = new Map();
    map_date.set('Janvier', '01');
    map_date.set('Fevrier', '02');
    map_date.set('Mars', '03');
    map_date.set('Avril', '04');
    map_date.set('Mai', '05');
    map_date.set('Juin', '06');
    map_date.set('Juillet', '07');
    map_date.set('Ao\u00fbt', '08');
    map_date.set('Septembre', '09');
    map_date.set('Octobre', '10');
    map_date.set('Novembre', '11');
    map_date.set('D\u00e9cembre', '12');

    var btnexport = $(this).val();
    


    if (choice !=='') {
        if (choice == 'Pdf') {
           // alert(contrat+' - '+map_date.get(mois)+' - '+ year);
           //for PDF link
            window.open(link_urlpdf + '?contrat=' + contrat + '&mois=' +map_date.get(mois) + '&year=' + year, "_blank ");
        } else {
            window.open(link_urlexcel + '?export=' + btnexport+ '&choice=' + choice+ '&contrat=' + contrat + '&mois=' +map_date.get(mois) + '&year=' + year, "_blank ");
        }
    }

    e.preventDefault();
})