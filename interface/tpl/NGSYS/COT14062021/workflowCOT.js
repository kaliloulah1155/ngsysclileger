//TRAITEMENT VISA de la fiche Contrat

if($.trim($(".empl_visa").text())=="OUI"){$(".empl_visa").text("VALIDER") ;} 
if($.trim($(".empl_visa").text())=="NON"){ $(".empl_visa").text("REFUSER"); }


if($.trim($(".mng_visa").text())=="OUI"){$(".mng_visa").text("VALIDER") ;} 
if($.trim($(".mng_visa").text())=="NON"){ $(".mng_visa").text("REFUSER"); }

if($.trim($(".dga_visa").text())=="OUI"){$(".dga_visa").text("VALIDER") ;} 
if($.trim($(".dga_visa").text())=="NON"){ $(".dga_visa").text("REFUSER"); }

if($.trim($(".dg_visa").text())=="OUI"){$(".dg_visa").text("VALIDER") ;} 
if($.trim($(".dg_visa").text())=="NON"){ $(".dg_visa").text("REFUSER"); }