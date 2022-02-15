
var str = prof_util;
var profil_util = str.substring(0, 7);

var etat_type=$(".etat_type").val();
    $('.managerconnex,.rhconnex,.dgconnex,.dgaconnex').hide();
    $('.rhmngconnex,.dgmngconnex,.dgamngconnex').hide();



 


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




	if( profil_util=="RH" && etat_type=="EMPLOYE" ){
		
			$('.rhconnex').show();	
	   }
    if(  profil_util=="MANAGER" && etat_type=="EMPLOYE" ){
        $('.managerconnex').show();

    }

	if( profil_util=="DGA" && etat_type=="EMPLOYE"  ){
			$('.dgaconnex').show();

		}
		
	if(profil_util=="DIRECTE" && etat_type=="EMPLOYE"  ){
			$('.dgconnex').show();

		}
	if(profil_util=="RH" && etat_type=="MANAGER"  ){
			$('.rhmngconnex').show();

		}
	if(profil_util=="DGA" && etat_type=="MANAGER"  ){
			$('.dgamngconnex').show();

		}
	if(profil_util=="DIRECTE" && etat_type=="MANAGER"  ){
			$('.dgmngconnex').show();

		}



			
		
	if(profil_util=="EMPLOYE"){
		
			$('.emplo').hide();
		}
	if(profil_util=="MANAGER"){
		
			$('.manag').hide();
		}	
		
		if(profil_util=="ADMIN"){
		
			$('.emplo').show();
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

if($.trim($(".e_dg_visa").text())=="OUI"){$(".e_dg_visa").text("VALIDER") ;} 
if($.trim($(".e_dg_visa").text())=="NON"){ $(".e_dg_visa").text("REFUSER"); }




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
