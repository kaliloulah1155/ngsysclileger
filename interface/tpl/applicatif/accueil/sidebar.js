
$(document).ready(function(){

    $('.btnAdmins, .btnRcrs, .btnFncs, .btnMarks, .btnComls, .btnGests, .btnInfors, .btnTelecs, .navbarlog_1, .navbarlog_4, .p2_gestion1, .p2_gestion2, .p1_admin').hide();

    var prof_util = $('.prof_util').val();
    switch (prof_util) {
        case "ADMIN":
            $('.btnAdmins, .btnRcrs, .btnFncs, .btnMarks, .btnComls, .btnGests, .btnInfors, .btnTelecs, .navbarlog_1, .navbarlog_4, .p2_gestion1, .p2_gestion2, .p1_admin').show();
            break;

        case "DIRECTEUR_GENERAL":
            $('.btnAdmins, .btnRcrs, .btnFncs, .btnMarks, .btnComls, .btnGests, .btnInfors, .btnTelecs').show();
            $('#listRcrs0').hide();
            break;
        
        case "DGA":
            $('.btnAdmins, .btnRcrs, .btnFncs, .btnMarks, .btnComls, .btnGests, .btnInfors, .btnTelecs').show();
            $('#listRcrs0').hide();
            break;
        
        case "AFF_JURIDIQUE":
            $('.btnAdmins, .btnRcrs').show();
            $('#ass,#con,#prs,#pay,#fpo,#lic,#pos,#reg,#hsu,#mis,#listRcrs0,#listRcrs3').hide();
            break;

        case "CGEST_TRESOR":
            $('.btnRcrs, .btnFncs').show();
            $('#ass,#con,#prs,#pay,#fpo,#lic,#pos,#reg,#hsu,#mis,#listRcrs0,#listRcrs3').hide();
            break;

        case "COMMERCIAL":
            $('.btnRcrs, .btnComls').show();
            $('#ass,#con,#prs,#pay,#fpo,#lic,#pos,#reg,#hsu,#mis,#listRcrs0,#listRcrs3').hide();
            break;

        case "COMPTA_FISC":
            $('.btnRcrs, .btnFncs').show();
            $('#ass,#con,#prs,#pay,#fpo,#lic,#pos,#reg,#hsu,#mis,#listRcrs0,#listRcrs3').hide();
            break;

        case "EMPLOYE":
            $('.btnRcrs').show();
            $('#listRcrs1,#listRcrs2,#listRcrs3').hide();
            break;
            
        case "FINANCE":
            $('.btnRcrs,.btnFncs').show();
            $('#ass,#con,#prs,#pay,#fpo,#lic,#pos,#reg,#hsu,#mis,#listRcrs0,#listRcrs3').hide();
            break;

        case "CONTROLEUR":
            $('.btnRcrs,.btnFncs').show();
            $('#ass,#con,#prs,#pay,#fpo,#lic,#pos,#reg,#hsu,#mis,#listRcrs0,#listRcrs3').hide();
            break;
        
        case "JURIDIQUE":
            $('.btnRcrs,.btnAdmins').show();
            $('#ass,#con,#prs,#pay,#fpo,#lic,#pos,#reg,#hsu,#mis,#listRcrs0,#listRcrs3').hide();
            break;

        case "MANAGER_ADM":
            $('.btnRcrs,.btnAdmins,#dfm').show();
            $('#ass,#con,#prs,#pay,#fpo,#lic,#pos,#reg,#hsu,#mis,#listRcrs0,#listRcrs3').hide();
            break;

        case "MANAGER_DCM":
            $('.btnRcrs,.btnComls,.btnMarks,#dfm').show();
            $('#ass,#con,#prs,#pay,#fpo,#lic,#pos,#reg,#hsu,#mis,#listRcrs0,#listRcrs3').hide();
            break;
        
        case "MANAGER_DFC":
            $('.btnRcrs,.btnFncs,#dfm').show();
            $('#ass,#con,#prs,#pay,#fpo,#lic,#pos,#reg,#hsu,#mis,#listRcrs0,#listRcrs3').hide();
            break;

        case "MANAGER_DTI":
            $('.btnRcrs,.btnInfors,#dfm').show();
            $('#ass,#con,#prs,#pay,#fpo,#lic,#pos,#reg,#hsu,#mis,#listRcrs0,#listRcrs3').hide();
            break;
        
        case "MANAGER_DTT":
            $('.btnRcrs,.btnTelecs,#dfm').show();
            $('#ass,#con,#prs,#pay,#fpo,#lic,#pos,#reg,#hsu,#mis,#listRcrs0,#listRcrs3').hide();
            break;

        case "MANAGER_PROJET":
            $('.btnRcrs,.btnGests,#san,#dfm').show();
            $('#ass,#con,#prs,#pay,#fpo,#lic,#pos,#reg,#hsu,#mis,#listRcrs0,#listRcrs3').hide();
            break;
        
        case "MARKETING":
            $('.btnRcrs,.btnMarks').show();
            $('#ass,#con,#prs,#pay,#fpo,#lic,#pos,#reg,#hsu,#mis,#listRcrs0,#listRcrs3').hide();
            break;

        case "MOYENS_GENERAUX":
            $('.btnRcrs,.btnAdmins').show();
            $('#ass,#con,#prs,#pay,#fpo,#lic,#pos,#reg,#hsu,#mis,#listRcrs0,#listRcrs3').hide();
            break;
        
        case "PROJET":
            $('.btnRcrs,.btnGests').show();
            $('#ass,#con,#prs,#pay,#fpo,#lic,#pos,#reg,#hsu,#mis,#listRcrs0,#listRcrs3').hide();
            break;
        
        case "QHSE":
            $('.btnRcrs,.btnAdmins').show();
            $('#ass,#con,#prs,#pay,#fpo,#lic,#pos,#reg,#hsu,#mis,#listRcrs0,#listRcrs3').hide();
            break;
        
        case "RECH_DEV":
            $('.btnRcrs,.btnInfors').show();
            $('#ass,#con,#prs,#pay,#fpo,#lic,#pos,#reg,#hsu,#mis,#listRcrs0,#listRcrs3').hide();
            break;
        
        case "RH":
            $('.btnRcrs').show();
            $('#listRcrs0').hide();
            break;
        
        case "SUPP_MAINT":
            $('.btnRcrs,.btnInfors').show();
            $('#ass,#con,#prs,#pay,#fpo,#lic,#pos,#reg,#hsu,#mis,#listRcrs0,#listRcrs3').hide();
            break;

        case "SYS_INFO":
            $('.btnRcrs,.btnInfors').show();
            $('#ass,#con,#prs,#pay,#fpo,#lic,#pos,#reg,#hsu,#mis,#listRcrs0,#listRcrs3').hide();
            break;

        case "TELECOM":
            $('.btnRcrs,.btnTelecs').show();
            $('#ass,#con,#prs,#pay,#fpo,#lic,#pos,#reg,#hsu,#mis,#listRcrs0,#listRcrs3').hide();
            break;
        
        default:
            $('.btnAdmins, .btnRcrs, .btnFncs, .btnMarks, .btnComls, .btnGests, .btnInfors, .btnTelecs').hide();
    }       
// });

// $(document).ready(function(){ 
            
        //script d'admin etb deconnexion !!!!!
        $('.text_white').on('click', function(){
            $('.user_name').toggleClass('open');
        });
        
        //ADMINISTRATION
        $('.btnAdmins').click(function() {
           $('.toggleAdmins').toggleClass("slow");
           $('#nav-listAdmins').toggle("slow"-5000);
           $('#nav-listRcrs').hide();
           $('#nav-listFncs').hide();
           $('#nav-listMarks').hide();
           $('#nav-listComls').hide();
           $('#nav-listGests').hide();
           $('#nav-listInfors').hide();
           $('#nav-listTelecs').hide();
         });    
        $('.toggleAdmins1').click(function() {
           $('.toggleAdmins1').toggleClass("slow");
           $('#nav-linkAdmins1').toggle("slow" -5000);
           $('#nav-linkAdmins2').hide();
           $('#nav-linkAdmins3').hide();
         });
         $('.toggleAdmins2').click(function() {
           $('.toggleAdmins2').toggleClass("slow");
           $('#nav-linkAdmins2').toggle("slow" -5000);
           $('#nav-linkAdmins1').hide();
           $('#nav-linkAdmins3').hide();
         });
          $('.toggleAdmins3').click(function() {
           $('.toggleAdmins3').toggleClass("slow");
           $('#nav-linkAdmins3').toggle("slow" -5000);
           $('#nav-linkAdmins1').hide();
           $('#nav-linkAdmins2').hide();
         });
        
        //RESSOURCES HUMAINES
        $('.btnRcrs').click(function() {
           $('.toggleRcrs').toggleClass("slow");
           $('#nav-listRcrs').toggle("slow" -5000);
           $('#nav-listAdmins').hide();
           $('#nav-listFncs').hide();
           $('#nav-listMarks').hide();
           $('#nav-listComls').hide();
           $('#nav-listGests').hide();
           $('#nav-listInfors').hide();
           $('#nav-listTelecs').hide();
         }); 
         $('.toggleRcrs0').click(function() {
            $('.toggleRcrs0').toggleClass("slow");
            $('#nav-linkRcrs0').toggle("slow" -5000);
            $('#nav-linkRcrs1').hide();
            $('#nav-linkRcrs2').hide();
            $('#nav-linkRcrs3').hide();
         });   
        $('.toggleRcrs1').click(function() {
            $('.toggleRcrs1').toggleClass("slow");
            $('#nav-linkRcrs1').toggle("slow" -5000);
            $('#nav-linkRcrs0').hide();
            $('#nav-linkRcrs2').hide();
            $('#nav-linkRcrs3').hide();
         });
         $('.toggleRcrs2').click(function() {
            $('.toggle2').toggleClass("slow");
            $('#nav-linkRcrs2').toggle("slow" -5000);
            $('#nav-linkRcrs0').hide();
            $('#nav-linkRcrs1').hide();
            $('#nav-linkRcrs3').hide();
         });
          $('.toggleRcrs3').click(function() {
           $('.toggleRcrs3').toggleClass("slow");
           $('#nav-linkRcrs3').toggle("slow" -5000);
           $('#nav-linkRcrs0').hide();
           $('#nav-linkRcrs1').hide();
           $('#nav-linkRcrs2').hide();
         });

        //FINANC & COMPTABILITE
        $('.btnFncs').click(function() {
           $('.toggleFncs').toggleClass("slide");
           $('#nav-listFncs').toggle("slide", -5000);
           $('#nav-listAdmins').hide();
           $('#nav-listRcrs').hide();
           $('#nav-listMarks').hide();
           $('#nav-listComls').hide();
           $('#nav-listGests').hide();
           $('#nav-listInfors').hide();
           $('#nav-listTelecs').hide();
         });    
        $('.toggleFncs1').click(function() {
           $('.toggleFncs1').toggleClass("slow");
           $('#nav-linkFncs1').toggle("slow" -5000);
           $('#nav-linkFncs2').hide();
           $('#nav-linkFncs3').hide();
         });
         $('.toggleFncs2').click(function() {
           $('.toggleFncs2').toggleClass("slow");
           $('#nav-linkFncs2').toggle("slow" -5000);
           $('#nav-linkFncs1').hide();
           $('#nav-linkFncs3').hide()
         });
          $('.toggleFncs3').click(function() {
            $('.toggleFncs3').toggleClass("slow");
           $('#nav-linkFncs3').toggle("slow" -5000);
           $('#nav-linkFncs1').hide();
           $('#nav-linkFncs2').hide()
         });

          //MARKETING
        $('.btnMarks').click(function() {
            $('.toggleMarks').toggleClass("slow");
           $('#nav-listMarks').toggle("slow" -5000);
           $('#nav-listAdmins').hide();
           $('#nav-listRcrs').hide();
           $('#nav-listFncs').hide();
           $('#nav-listComls').hide();
           $('#nav-listGests').hide();
           $('#nav-listInfors').hide();
           $('#nav-listTelecs').hide();
         });    
       $('.toggleMarks1').click(function() {
            $('.toggleMarks1').toggleClass("slow");
           $('#nav-linkMarks1').toggle("slow" -5000);
           $('#nav-linkMarks2').hide();
           $('#nav-linkMarks3').hide();
         });
         $('.toggleMarks2').click(function() {
            $('.toggleMarks2').toggleClass("slow");
           $('#nav-linkMarks2').toggle("slow" -5000);
           $('#nav-linkMarks1').hide();
           $('#nav-linkMarks3').hide();
         });
          $('.toggleMarks3').click(function() {
            $('.toggleMarks3').toggleClass("slow");
           $('#nav-linkMarks3').toggle("slow" -5000);
           $('#nav-linkMarks1').hide();
           $('#nav-linkMarks2').hide();
         });

           //COMMERCIAL
        $('.btnComls').click(function() {
            $('.toggleComls').toggleClass("slow");
           $('#nav-listComls').toggle("slow" -5000);
           $('#nav-listAdmins').hide();
           $('#nav-listRcrs').hide();
           $('#nav-listFncs').hide();
           $('#nav-listMarks').hide();
           $('#nav-listGests').hide();
           $('#nav-listInfors').hide();
           $('#nav-listTelecs').hide();
         });    
        $('.toggleComls1').click(function() {
            $('.toggleComls1').toggleClass("slow");
           $('#nav-linkComls1').toggle("slow" -5000);
           $('#nav-linkComls2').hide();
           $('#nav-linkComls3').hide();
         });
         $('.toggleComls2').click(function() {
            $('.toggleComls2').toggleClass("slow");
           $('#nav-linkComls2').toggle("slow" -5000);
           $('#nav-linkComls1').hide();
           $('#nav-linkComls3').hide();
         });
          $('.toggleComls3').click(function() {
            $('.toggleComls3').toggleClass("slow");
           $('#nav-linkComls3').toggle("slow" -5000);
           $('#nav-linkComls1').hide();
           $('#nav-linkComls2').hide();
         });

        //GESTION DE PROJETS
        $('.btnGests').click(function() {
            $('.toggleGests').toggleClass("slow");
           $('#nav-listGests').toggle("slow" -5000);
           $('#nav-listAdmins').hide();
           $('#nav-listRcrs').hide();
           $('#nav-listFncs').hide();
           $('#nav-listMarks').hide();
           $('#nav-listComls').hide();
           $('#nav-listInfors').hide();
           $('#nav-listTelecs').hide();
         });    
        $('.toggleGests1').click(function() {
            $('.toggleGests1').toggleClass("slow");
           $('#nav-linkGests1').toggle("slow" -5000);
           $('#nav-linkGests2').hide();
           $('#nav-linkGests3').hide();
         });
         $('.toggleGests2').click(function() {
            $('.toggleGests2').toggleClass("slow");
           $('#nav-linkGests2').toggle("slow" -5000);
           $('#nav-linkGests1').hide();
           $('#nav-linkGests3').hide();
         });
          $('.toggleGests3').click(function() {
            $('.toggleGests3').toggleClass("slow");
           $('#nav-linkGests3').toggle("slow" -5000);
           $('#nav-linkGests1').hide();
           $('#nav-linkGests2').hide();
         });

         //TECHNIQUE INFORMATIQUE
        $('.btnInfors').click(function() {
            $('.toggleInfors').toggleClass("slow");
           $('#nav-listInfors').toggle("slow" -5000);
           $('#nav-listAdmins').hide();
           $('#nav-listRcrs').hide();
           $('#nav-listFncs').hide();
           $('#nav-listMarks').hide();
           $('#nav-listComls').hide();
           $('#nav-listGests').hide();
           $('#nav-listTelecs').hide();
         });    
        $('.toggleInfors1').click(function() {
            $('.toggleInfors1').toggleClass("slow");
           $('#nav-linkInfors1').toggle("slow" -5000);
           $('#nav-linkInfors2').hide();
            $('#nav-linkInfors3').hide();
         });
         $('.toggleInfors2').click(function() {
            $('.toggleInfors2').toggleClass("slow");
           $('#nav-linkInfors2').toggle("slow" -5000);
           $('#nav-linkInfors1').hide();
            $('#nav-linkInfors3').hide();
         });
          $('.toggleInfors3').click(function() {
            $('.toggleInfors3').toggleClass("slow");
           $('#nav-linkInfors3').toggle("slow" -5000);
           $('#nav-linkInfors1').hide();
            $('#nav-linkInfors2').hide();
         });

         //TECHNIQUE TELECOM
        $('.btnTelecs').click(function() {
            $('.toggleTelecs').toggleClass("slow");
           $('#nav-listTelecs').toggle("slow" -5000);
           $('#nav-listAdmins').hide();
           $('#nav-listRcrs').hide();
           $('#nav-listFncs').hide();
           $('#nav-listMarks').hide();
           $('#nav-listComls').hide();
           $('#nav-listGests').hide();
           $('#nav-listInfors').hide();
         });       
        $('.toggleTelecs1').click(function() {
            $('.toggleTelecs1').toggleClass("slow");
           $('#nav-linkTelecs1').toggle("slow" -5000);
           $('#nav-linkTelecs2').hide();
           $('#nav-linkTelecs3').hide();
         });
         $('.toggleTelecs2').click(function() {
            $('.toggleTelecs2').toggleClass("slow");
           $('#nav-linkTelecs2').toggle("slow" -5000);
           $('#nav-linkTelecs1').hide();
           $('#nav-linkTelecs3').hide();
         });
          $('.toggleTelecs3').click(function() {
            $('.toggleTelecs3').toggleClass("slow");
           $('#nav-linkTelecs3').toggle("slow" -5000);
           $('#nav-linkTelecs1').hide();
           $('#nav-linkTelecs2').hide();
         });
    });