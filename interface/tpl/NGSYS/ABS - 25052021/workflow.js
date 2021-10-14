
var str = prof_util;
var profil_util = str.substring(0, 7);

var etat_type=$(".etat_type").val();

 


if(etat_type=="EMPLOYE"){
    $('.work_manager').hide();
    $('.work_employe').show();
}
if( etat_type=="MANAGER"){
    $('.work_manager').show();
    $('.work_employe').hide();
}

if(etat_type=="EMPLOYE" && profil_util=="MANAGER" ){
    $('.work_manager').hide();
    $('.work_employe').show();
}


if(profil_util=="ADMIN" || profil_util=="RH" ){
    if(etat_type=="EMPLOYE"){
        $('.work_manager').hide();
        $('.work_employe').show();
    }
    if(etat_type=="MANAGER"){
        $('.work_manager').show();
        $('.work_employe').hide();
    }
}
/*
switch (profil_util) {
    case "RH" :

          
          $('.work_manager').show();
          $('.work_employe').show();
           break;
    case "ADMIN" :
            $('.work_manager').show();
            $('.work_employe').show();
             break;
   
}
*/

//TRAITEMENT VISA EMPLOYE

//e_mng_visa

//e_rh_visa

//e_adm_visa

if($.trim($(".e_mng_visa").text())=="OUI"){$(".e_mng_visa").text("VALIDER") ;} 
if($.trim($(".e_mng_visa").text())=="NON"){ $(".e_mng_visa").text("REFUSER"); }

if($.trim($(".e_rh_visa").text())=="OUI"){$(".e_rh_visa").text("VALIDER") ;} 
if($.trim($(".e_rh_visa").text())=="NON"){ $(".e_rh_visa").text("REFUSER"); }

if($.trim($(".e_adm_visa").text())=="OUI"){$(".e_adm_visa").text("VALIDER") ;} 
if($.trim($(".e_adm_visa").text())=="NON"){ $(".e_adm_visa").text("REFUSER"); }


//TRAITEMENT VISA MANAGER

//m_rh_visa

//m_dga_visa

//m_dg_visa

if($.trim($(".m_rh_visa").text())=="OUI"){$(".m_rh_visa").text("VALIDER") ;} 
if($.trim($(".m_rh_visa").text())=="NON"){ $(".m_rh_visa").text("REFUSER"); }

if($.trim($(".m_dga_visa").text())=="OUI"){$(".m_dga_visa").text("VALIDER") ;} 
if($.trim($(".m_dga_visa").text())=="NON"){ $(".m_dga_visa").text("REFUSER"); }

if($.trim($(".m_dg_visa").text())=="OUI"){$(".m_dg_visa").text("VALIDER") ;} 
if($.trim($(".m_dg_visa").text())=="NON"){ $(".m_dg_visa").text("REFUSER"); }


//alert($(".m_rh_visa").text());
