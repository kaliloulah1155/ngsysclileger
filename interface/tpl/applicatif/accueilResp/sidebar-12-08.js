
$(document).ready(function(){

    $('.btnAdmins, .btnRcrs, .btnFncs, .btnMarks, .btnComls, .btnGests, .btnInfors, .btnTelecs').hide();

    var prof_util = $('.prof_util').val();
    switch (prof_util) {
        case "ADMIN":
            $('.btnAdmins, .btnRcrs, .btnFncs, .btnMarks, .btnComls, .btnGests, .btnInfors, .btnTelecs').show();
            break;

        case "DIRECTEUR_GENERAL":
            $('.btnAdmins, .btnRcrs, .btnFncs, .btnMarks, .btnComls, .btnGests, .btnInfors, .btnTelecs').show();
            break;
        
        case "DGA":
            $('.btnAdmins, .btnRcrs, .btnFncs, .btnMarks, .btnComls, .btnGests, .btnInfors, .btnTelecs').show();
            break;
        
        case "AFF_JURIDIQUE":
            $('.btnAdmins, .btnRcrs').show();
            break;

        case "CGEST_TRESOR":
            $('.btnRcrs, .btnFncs').show();
            break;

        case "COMMERCIAL":
            $('.btnRcrs, .btnComls').show();
            break;

        case "COMPTA_FISC":
            $('.btnRcrs, .btnFncs').show();
            break;

        case "EMPLOYE":
            $('.btnRcrs').show();
            $('#ass,#con,#prs,#pay,#fpo,#lic,#pos,#san,#reg').hide();
            break;
            
        case "FINANCE":
            $('.btnRcrs,.btnFncs').show();
            $('#ass,#con,#prs,#pay,#fpo,#lic,#pos,#san,#reg,#hsu,#mis,#dfm,#listRcrs1').hide();
            break;

        case "CONTROLEUR":
            $('.btnRcrs,.btnFncs').show();
            $('#ass,#con,#prs,#pay,#fpo,#lic,#pos,#san,#reg,#hsu,#mis,#dfm,#listRcrs1').hide();
            break;
        
        case "JURIDIQUE":
            $('.btnRcrs,.btnAdmins').show();
            $('.btnRcrs2,.btnRcrs3').hide();
            break;

        case "MANAGER_ADM":
            $('.btnRcrs,.btnAdmins').show();
            $('#ass,#con,#prs,#pay,#fpo,#lic,#pos,#reg,#hsu,#mis,#dfm').hide();
            break;

        case "MANAGER_DCM":
            $('.btnRcrs,.btnComls,.btnMarks').show();
            $('#ass,#con,#prs,#pay,#fpo,#lic,#pos,#reg,#hsu,#mis,#dfm').hide();
            break;
        
        case "MANAGER_DFC":
            $('.btnRcrs,.btnFncs').show();
            $('#ass,#con,#prs,#pay,#fpo,#lic,#pos,#reg,#hsu,#mis,#dfm').hide();
            break;

        case "MANAGER_DTI":
            $('.btnRcrs,.btnInfors').show();
            $('#ass,#con,#prs,#pay,#fpo,#lic,#pos,#reg,#hsu,#mis,#dfm').hide();
            break;
        
        case "MANAGER_DTT":
            $('.btnRcrs,.btnTelecs').show();
            $('#ass,#con,#prs,#pay,#fpo,#lic,#pos,#reg,#hsu,#mis,#dfm').hide();
            break;

        case "MANAGER_PROJET":
            $('.btnRcrs,.btnGests,#san').show();
            $('#ass,#con,#prs,#pay,#fpo,#lic,#pos,#reg,#hsu,#mis,#dfm').hide();
            break;
        
        case "MARKETING":
            $('.btnRcrs,.btnMarks').show();
            break;

        case "MOYENS_GENERAUX":
            $('.btnRcrs,.btnAdmins').show();
            break;
        
        case "PROJET":
            $('.btnRcrs,.btnGests').show();
            break;
        
        case "QHSE":
            $('.btnRcrs,.btnAdmins').show();
            break;
        
        case "RECH_DEV":
            $('.btnRcrs,.btnInfors').show();
            break;
        
        case "RH":
            $('.btnRcrs').show();
            break;
        
        case "SUPP_MAINT":
            $('.btnRcrs,.btnInfors').show();
            break;

        case "SYS_INFO":
            $('.btnRcrs,.btnInfors').show();
            break;

        case "TELECOM":
            $('.btnRcrs,.btnTelecs').show();
            break;
        
        default:
            $('.btnAdmins, .btnRcrs, .btnFncs, .btnMarks, .btnComls, .btnGests, .btnInfors, .btnTelecs').hide();
    }       
});