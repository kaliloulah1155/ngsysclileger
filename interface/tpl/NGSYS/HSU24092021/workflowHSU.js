//TRAITEMENT VISA de la fiche de d'Heure Supplémentaire



if($.trim($(".rh_visa").text())=="OUI"){$(".rh_visa").text("VALIDER") ;} 
if($.trim($(".rh_visa").text())=="NON"){ $(".rh_visa").text("REFUSER"); }

if($.trim($(".dga_visa").text())=="OUI"){$(".dga_visa").text("VALIDER") ;} 
if($.trim($(".dga_visa").text())=="NON"){ $(".dga_visa").text("REFUSER"); }

if($.trim($(".dg_visa").text())=="OUI"){$(".dg_visa").text("VALIDER") ;} 
if($.trim($(".dg_visa").text())=="NON"){ $(".dg_visa").text("REFUSER"); }

if($.trim($(".manager_visa").text())=="OUI"){$(".manager_visa").text("VALIDER") ;} 
if($.trim($(".manager_visa").text())=="NON"){ $(".manager_visa").text("REFUSER"); }