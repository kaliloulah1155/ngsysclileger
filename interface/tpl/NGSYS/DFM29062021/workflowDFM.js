//TRAITEMENT VISA de la fiche Demande de formation

if($.trim($(".mng_visa").text())=="OUI"){$(".mng_visa").text("VALIDER") ;} 
if($.trim($(".mng_visa").text())=="NON"){ $(".mng_visa").text("REFUSER"); }


if($.trim($(".rh_visa").text())=="OUI"){$(".rh_visa").text("VALIDER") ;} 
if($.trim($(".rh_visa").text())=="NON"){ $(".rh_visa").text("REFUSER"); }

if($.trim($(".ADM_visa").text())=="OUI"){$(".ADM_visa").text("VALIDER") ;} 
if($.trim($(".ADM_visa").text())=="NON"){ $(".ADM_visa").text("REFUSER"); }

if($.trim($(".dga_visa").text())=="OUI"){$(".dga_visa").text("VALIDER") ;} 
if($.trim($(".dga_visa").text())=="NON"){ $(".dga_visa").text("REFUSER"); }

if($.trim($(".dg_visa").text())=="OUI"){$(".dg_visa").text("VALIDER") ;} 
if($.trim($(".dg_visa").text())=="NON"){ $(".dg_visa").text("REFUSER"); }




//alert($(".m_rh_visa").text());