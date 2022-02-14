//TRAITEMENT VISA de la fiche Demande de Pret

if($.trim($(".rh_visa").text())=="OUI"){$(".rh_visa").text("VALIDER") ;} 
if($.trim($(".rh_visa").text())=="NON"){ $(".rh_visa").text("REFUSER"); }


if($.trim($(".control_visa").text())=="OUI"){$(".control_visa").text("VALIDER") ;} 
if($.trim($(".control_visa").text())=="NON"){ $(".control_visa").text("REFUSER"); }

if($.trim($(".dga_visa").text())=="OUI"){$(".dga_visa").text("VALIDER") ;} 
if($.trim($(".dga_visa").text())=="NON"){ $(".dga_visa").text("REFUSER"); }

if($.trim($(".dg_visa").text())=="OUI"){$(".dg_visa").text("VALIDER") ;} 
if($.trim($(".dg_visa").text())=="NON"){ $(".dg_visa").text("REFUSER"); }

if($.trim($(".finance_visa").text())=="OUI"){$(".finance_visa").text("VALIDER") ;} 
if($.trim($(".finance_visa").text())=="NON"){ $(".finance_visa").text("REFUSER"); }