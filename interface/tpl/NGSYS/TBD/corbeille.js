let own_abs_attente = 1;
let nb_abs_attente = 0;
let prof_util = $('.profils').val();


var Bal_ABS_nv = 0; //ADMIN //RH
var BABS_own_encours = 0; //EMPLOYE 
var BABS_own_attente = 0; //ABS EN ATTENTE CHEZ LE MANAGER 

var BDBQ_own_encours = 0; //EMPLOYE 
var BDBQ_RH_attente = 0; //RH 
var BDBQ_DGA_attente = 0; //DGA 
var BDBQ_DG_attente = 0; //DG 


//TABLEAU RH
$('.abs').hide();
$('.att_abs_admin').hide();
$('.att_abs_manager').hide();
$('.encours_abs_entete').hide();

$('.tms').hide();
$('.dfm').hide();
$('.pay').hide();
$('.hsu').hide();
$('.mis').hide();
$('.prt').hide();
$('.cot').hide();
$('.dbq').hide();
$('.encours_dbq_entete').hide();
$('.att_dbq_admin').hide();
$('.att_dbq_rh').hide();
$('.att_dbq_dga').hide();
$('.att_dbq_dg').hide();
$('.san').hide();
$('.dem').hide();
//TABLEAU RH

switch (prof_util) {
    case "ADMIN":

        //TABLEAU RH
        $('.abs').show();
        $('.att_abs_admin').show();
        $('.att_abs_manager').hide();
        $('.encours_abs_entete').show();

        $('.tms').show();
        $('.dfm').show();
        $('.pay').show();
        $('.hsu').show();
        $('.mis').show();
        $('.prt').show();
        $('.cot').show();
        $('.dbq').show();
        $('.encours_dbq_entete').show();
        $('.att_dbq_admin').show();
        $('.att_dbq_rh').hide();
        $('.att_dbq_dga').hide();
        $('.att_dbq_dg').hide();
        $('.san').show();
        $('.dem').show();
        //TABLEAU RH
        Bal_ABS_nv = localStorage.getItem('Bal_ABS_nv');
        document.querySelector('.attente_abs').innerHTML = Bal_ABS_nv;
        //console.log(Bal_ABS_nv);
        BABS_own_encours = localStorage.getItem('BABS_own_encours');
        document.querySelector('.encours_abs').innerHTML = BABS_own_encours;

        BDBQ_own_encours = localStorage.getItem('BDBQ_own_encours');
        document.querySelector('.encours_dbq').innerHTML = BDBQ_own_encours;

        BDBQ_RH_attente = localStorage.getItem('BDBQ_RH_attente');
        document.querySelector('.attente_dbq').innerHTML = BDBQ_RH_attente;

        break;
    case "RH":
        //TABLEAU RH
        $('.abs').show();
        $('.att_abs_admin').show();
        $('.att_abs_manager').hide();
        $('.encours_abs_entete').show();

        $('.tms').show();
        $('.dfm').show();
        $('.pay').show();
        $('.hsu').show();
        $('.mis').show();
        $('.prt').show();
        $('.cot').show();
        $('.dbq').show();
        $('.encours_dbq_entete').show();
        $('.att_dbq_admin').hide();
        $('.att_dbq_rh').show();
        $('.att_dbq_dga').hide();
        $('.att_dbq_dg').hide();
        $('.san').show();
        $('.dem').show();
        //TABLEAU RH

        BDBQ_own_encours = localStorage.getItem('BDBQ_own_encours');
        document.querySelector('.encours_dbq').innerHTML = BDBQ_own_encours;

        BDBQ_RH_attente = localStorage.getItem('BDBQ_RH_attente');
        document.querySelector('.attente_dbq_rh').innerHTML = BDBQ_RH_attente;

        break;
    case "EMPLOYE":
        //TABLEAU RH
        $('.abs').show();
        $('.att_abs_admin').hide();
        $('.att_abs_manager').hide();
        $('.encours_abs_entete').show();

        $('.tms').show();
        $('.dfm').show();
        $('.pay').hide();
        $('.hsu').show();
        $('.mis').hide();
        $('.prt').show();
        $('.cot').show();
        $('.dbq').show();
        $('.encours_dbq_entete').show();
        $('.att_dbq_admin').hide();
        $('.att_dbq_rh').hide();
        $('.att_dbq_dga').hide();
        $('.att_dbq_dg').hide();
        $('.san').show();
        $('.dem').show();
        //TABLEAU RH

        BABS_own_encours = localStorage.getItem('BABS_own_encours');
        document.querySelector('.encours_abs').innerHTML = BABS_own_encours;

        BDBQ_own_encours = localStorage.getItem('BDBQ_own_encours');
        document.querySelector('.encours_dbq').innerHTML = BDBQ_own_encours;
        break;
    case "DGA":
        //TABLEAU RH
        $('.abs').show();
        $('.att_abs_admin').hide();
        $('.att_abs_manager').hide();
        $('.encours_abs_entete').show();

        $('.tms').show();
        $('.dfm').show();
        $('.pay').hide();
        $('.hsu').show();
        $('.mis').hide();
        $('.prt').show();
        $('.cot').show();
        $('.dbq').show();
        $('.encours_dbq_entete').show();
        $('.att_dbq_admin').hide();
        $('.att_dbq_rh').hide();
        $('.att_dbq_dga').show();
        $('.att_dbq_dg').hide();
        $('.san').show();
        $('.dem').show();
        //TABLEAU RH

        BABS_own_encours = localStorage.getItem('BABS_own_encours');
        document.querySelector('.encours_abs').innerHTML = BABS_own_encours;

        BDBQ_own_encours = localStorage.getItem('BDBQ_own_encours');
        document.querySelector('.encours_dbq').innerHTML = BDBQ_own_encours;

        BDBQ_DGA_attente = localStorage.getItem('BDBQ_DGA_attente');
        document.querySelector('.attente_dbq_dga').innerHTML = BDBQ_DGA_attente;
        break;
    case "DIRECTEUR_GENERAL":
        //TABLEAU RH
        $('.abs').show();
        $('.att_abs_admin').hide();
        $('.att_abs_manager').hide();
        $('.encours_abs_entete').show();

        $('.tms').show();
        $('.dfm').show();
        $('.pay').hide();
        $('.hsu').show();
        $('.mis').hide();
        $('.prt').show();
        $('.cot').show();
        $('.dbq').show();
        $('.encours_dbq_entete').show();
        $('.att_dbq_admin').hide();
        $('.att_dbq_rh').hide();
        $('.att_dbq_dga').hide();
        $('.att_dbq_dg').show();
        $('.san').show();
        $('.dem').show();
        //TABLEAU RH

        BABS_own_encours = localStorage.getItem('BABS_own_encours');
        document.querySelector('.encours_abs').innerHTML = BABS_own_encours;

        BDBQ_own_encours = localStorage.getItem('BDBQ_own_encours');
        document.querySelector('.encours_dbq').innerHTML = BDBQ_own_encours;

        BDBQ_DG_attente = localStorage.getItem('BDBQ_DG_attente');
        document.querySelector('.attente_dbq_dg').innerHTML = BDBQ_DG_attente;

        break;
    case "MANAGER_ADM":
        //TABLEAU RH
        $('.abs').show();
        $('.att_abs_admin').show();
        $('.att_abs_manager').show();
        $('.encours_abs_entete').show();

        $('.tms').show();
        $('.dfm').show();
        $('.pay').hide();
        $('.hsu').show();
        $('.mis').hide();
        $('.prt').show();
        $('.cot').show();
        $('.dbq').show();
        $('.encours_dbq_entete').show();
        $('.att_dbq_admin').hide();
        $('.att_dbq_rh').hide();
        $('.att_dbq_dga').hide();
        $('.att_dbq_dg').hide();
        $('.san').show();
        $('.dem').show();
        //TABLEAU RH

        break;
    case "MANAGER_DCM":
        //TABLEAU RH
        $('.abs').show();
        $('.att_abs_admin').hide();
        $('.att_abs_manager').show();
        $('.encours_abs_entete').show();

        $('.tms').show();
        $('.dfm').show();
        $('.pay').hide();
        $('.hsu').show();
        $('.mis').hide();
        $('.prt').show();
        $('.cot').show();
        $('.dbq').show();
        $('.encours_dbq_entete').show();
        $('.att_dbq_admin').hide();
        $('.att_dbq_rh').hide();
        $('.att_dbq_dga').hide();
        $('.att_dbq_dg').hide();
        $('.san').show();
        $('.dem').show();
        //TABLEAU RH

        BABS_own_attente = localStorage.getItem('BABS_own_attente');
        document.querySelector('.attente_abs_mng').innerHTML = BABS_own_attente;

        break;
    case "MANAGER_DFC":
        //TABLEAU RH
        $('.abs').show();
        $('.att_abs_admin').hide();
        $('.att_abs_manager').show();
        $('.encours_abs_entete').show();

        $('.tms').show();
        $('.dfm').show();
        $('.pay').hide();
        $('.hsu').show();
        $('.mis').hide();
        $('.prt').show();
        $('.cot').show();
        $('.dbq').show();
        $('.encours_dbq_entete').show();
        $('.att_dbq_admin').hide();
        $('.att_dbq_rh').hide();
        $('.att_dbq_dga').hide();
        $('.att_dbq_dg').hide();
        $('.san').show();
        $('.dem').show();
        //TABLEAU RH

        BABS_own_attente = localStorage.getItem('BABS_own_attente');
        document.querySelector('.attente_abs_mng').innerHTML = BABS_own_attente;

        break;
    case "MANAGER_DTI":
        //TABLEAU RH
        $('.abs').show();
        $('.att_abs_admin').hide();
        $('.att_abs_manager').show();
        $('.encours_abs_entete').show();

        $('.tms').show();
        $('.dfm').show();
        $('.pay').hide();
        $('.hsu').show();
        $('.mis').hide();
        $('.prt').show();
        $('.cot').show();
        $('.dbq').show();
        $('.encours_dbq_entete').show();
        $('.att_dbq_admin').hide();
        $('.att_dbq_rh').hide();
        $('.att_dbq_dga').hide();
        $('.att_dbq_dg').hide();
        $('.san').show();
        $('.dem').show();
        //TABLEAU RH

        BABS_own_attente = localStorage.getItem('BABS_own_attente');
        document.querySelector('.attente_abs_mng').innerHTML = BABS_own_attente;


        break;
    case "MANAGER_DTT":
        //TABLEAU RH
        $('.abs').show();
        $('.att_abs_admin').hide();
        $('.att_abs_manager').show();
        $('.encours_abs_entete').show();

        $('.tms').show();
        $('.dfm').show();
        $('.pay').hide();
        $('.hsu').show();
        $('.mis').hide();
        $('.prt').show();
        $('.cot').show();
        $('.dbq').show();
        $('.encours_dbq_entete').show();
        $('.att_dbq_admin').hide();
        $('.att_dbq_rh').hide();
        $('.att_dbq_dga').hide();
        $('.att_dbq_dg').hide();
        $('.san').show();
        $('.dem').show();
        //TABLEAU RH

        BABS_own_attente = localStorage.getItem('BABS_own_attente');
        document.querySelector('.attente_abs_mng').innerHTML = BABS_own_attente;

        break;
    case "MANAGER_PROJET":
        //TABLEAU RH
        $('.abs').show();
        $('.att_abs_admin').hide();
        $('.att_abs_manager').show();
        $('.encours_abs_entete').show();

        $('.tms').show();
        $('.dfm').show();
        $('.pay').hide();
        $('.hsu').show();
        $('.mis').hide();
        $('.prt').show();
        $('.cot').show();
        $('.dbq').show();
        $('.encours_dbq_entete').show();
        $('.att_dbq_admin').hide();
        $('.att_dbq_rh').hide();
        $('.att_dbq_dga').hide();
        $('.att_dbq_dg').hide();
        $('.san').show();
        $('.dem').show();
        //TABLEAU RH

        BABS_own_attente = localStorage.getItem('BABS_own_attente');
        document.querySelector('.attente_abs_mng').innerHTML = BABS_own_attente;

        break;

    default:
        // $(".search_prospect").hide();
}