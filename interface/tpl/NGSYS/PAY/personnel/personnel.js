let appN = $(".appName").val();

let type_contrat='';
////LOAD PERSONNNEL
let link1 =
    "/" +
    appN +
    "/interface/tpl/" +
    appN +
    "/PAY/personnel/personnel_load.php";
   
let link2 =
    "/" +
    appN +
    "/interface/tpl/" +
    appN +
    "/PAY/personnel/personnel_data.php";


let avance_slr=0;
let tdeduction_slr=0;

    var init_email=$('#POS_VAL_CTRL_MEL').val();

      $(document).ready(function(){ 
             $.ajax({
                    url: link1,
                    type: "POST",
                     data:{
                        init_email:init_email
                    },
                    success: function(data) {

                         $('.personnel').append(data);
                    },
                    error: function(error) {
                        console.log(error);
                    },
                }); 
             
       });


      $(document).on('change','.personnel',function(){
            monsalaire($(this).val());
        });


      //vue de consultation
if($('.interselectperso').val() !==''){
    salaire_var();
    monsalaire($('.interselectperso').val());

}

function salaire_var(){


    if($('.interselectperso').val() !==''){
          document.querySelector('.slrnet').value =  $('.slrnet').val();
                  document.querySelector('.assurance').value = $('.assurance').val();
                  document.querySelector('.vpret').value = $('.vpret').val();
                  document.querySelector('.avance').value = $('.avance').val(); 
                   document.querySelector('.autre').value = $('.autre').val(); 
                  document.querySelector('.netpaye').value = $('.netpaye').val();
                  document.querySelector('.recharge').value = $('.recharge').val();  
                  document.querySelector('.brute').value = $('.brute').val();  
                  document.querySelector('.chf_fiscale').value = $('.chf_fiscale').val();
                  document.querySelector('.retraite').value = $('.retraite').val();
                   document.querySelector('.at').value = $('.at').val();
                   document.querySelector('.pf').value = $('.pf').val();  
                   document.querySelector('.tot_cnps').value = $('.tot_cnps').val(); 
                   document.querySelector('.tot_charge').value = $('.tot_charge').val();
                   document.querySelector('.marge').value = $('.marge').val();
                   document.querySelector('.mfees').value = $('.mfees').val();
                   document.querySelector('.produit').value = $('.produit').val(); 
                   document.querySelector('.factureHT').value = $('.factureHT').val(); 
                   document.querySelector('.marge_tot').value = $('.marge_tot').val();
                   document.querySelector('.net_a_payer').value = $('.net_a_payer').val(); 
                   document.querySelector('.tdeduction').value = $('.tdeduction').val(); 
                    document.querySelector('.honoraire_net').value = $('.honoraire_net').val();
                     document.querySelector('.honoraire_net_paye').value = $('.honoraire_net_paye').val();
                     document.querySelector('.duree').value = $('.duree').val(); 
                     document.querySelector('.salaire_base').value = $('.salaire_base').val();  
                    document.querySelector('.vsursalaire').value = $('.vsursalaire').val();
                    document.querySelector('.anciennete').value = $('.anciennete').val();
                    document.querySelector('.vastreinte').value = $('.vastreinte').val(); 
                    document.querySelector('.heure_sup').value = $('.heure_sup').val(); 
                    document.querySelector('.vrendement').value = $('.vrendement').val(); 
                    document.querySelector('.trans_impos').value = $('.trans_impos').val();  
                    document.querySelector('.slr_brt_impo').value = $('.slr_brt_impo').val(); 
                    document.querySelector('.vrepresentation').value = $('.vrepresentation').val(); 
                    document.querySelector('.vtransport').value = $('.vtransport').val();
                    document.querySelector('.slr_brt_impo').value = $('.slr_brt_impo').val();
                     document.querySelector('.vastreinte').value = $('.vastreinte').val();   
                    document.querySelector('.vcn').value = $('.vcn').val();
                    document.querySelector('.vigr').value = $('.vigr').val();  
                    document.querySelector('.vis').value = $('.vis').val();
                    document.querySelector('.vcnps').value = $('.vcnps').val(); 
                    document.querySelector('.tol').value = $('.tol').val();
                    document.querySelector('.net').value = $('.net').val();

                    //taxe patronale
                     document.querySelector('.ta').value = $('.ta').val();
                    document.querySelector('.tfpc').value = $('.tfpc').val();
                    document.querySelector('.famille').value = $('.famille').val();
                    document.querySelector('.acc').value = $('.acc').val();
                     document.querySelector('.total_txt').value = $('.total_txt').val();
                    document.querySelector('.total_fisc').value = $('.total_fisc').val(); 
                     document.querySelector('.ratios_empl').value = $('.ratios_empl').val();
    }else{

          document.querySelector('.slrnet').value = 0;
                  document.querySelector('.assurance').value = 0;
                  document.querySelector('.vpret').value = 0;
                  document.querySelector('.avance').value = 0; 
                   document.querySelector('.autre').value = 0; 
                  document.querySelector('.netpaye').value = 0;
                  document.querySelector('.recharge').value = 0;  
                  document.querySelector('.brute').value = 0;  
                  document.querySelector('.chf_fiscale').value = 0;
                  document.querySelector('.retraite').value = 0;
                   document.querySelector('.at').value = 0;
                   document.querySelector('.pf').value = 0;  
                   document.querySelector('.tot_cnps').value = 0; 
                   document.querySelector('.tot_charge').value = 0;
                   document.querySelector('.marge').value = 0;
                   document.querySelector('.mfees').value = 0;
                   document.querySelector('.produit').value = 0; 
                   document.querySelector('.factureHT').value = 0; 
                   document.querySelector('.marge_tot').value = 0;
                   document.querySelector('.net_a_payer').value = 0; 
                   document.querySelector('.tdeduction').value = 0; 
                    document.querySelector('.honoraire_net').value = 0;
                     document.querySelector('.honoraire_net_paye').value = 0;
                     document.querySelector('.duree').value = 0; 
                     document.querySelector('.salaire_base').value = 0;  
                    document.querySelector('.vsursalaire').value = 0;
                    document.querySelector('.anciennete').value = 0;
                    document.querySelector('.vastreinte').value = 0; 
                    document.querySelector('.heure_sup').value = 0; 
                    document.querySelector('.vrendement').value = 0; 
                    document.querySelector('.trans_impos').value = 0;  
                    document.querySelector('.slr_brt_impo').value = 0; 
                    document.querySelector('.vrepresentation').value = 0; 
                    document.querySelector('.vtransport').value = 0;
                    document.querySelector('.slr_brt_impo').value = 0;
                     document.querySelector('.vastreinte').value = 0;   
                    document.querySelector('.vcn').value = 0;
                    document.querySelector('.vigr').value = 0;  
                    document.querySelector('.vis').value = 0;
                    document.querySelector('.vcnps').value = 0; 
                    document.querySelector('.tol').value = 0;
                    document.querySelector('.net').value = 0;

                    //taxe patronale
                     document.querySelector('.ta').value = 0;
                    document.querySelector('.tfpc').value = 0;
                    document.querySelector('.famille').value = 0;
                    document.querySelector('.acc').value = 0;
                     document.querySelector('.total_txt').value = 0;
                    document.querySelector('.total_fisc').value = 0; 
                     document.querySelector('.ratios_empl').value = 0;

    }
}


 //fichier load salaire
 function monsalaire(me_email){

 
            var dt_email= me_email;

            $('.deuxieme_col').hide();
            $('.deuxieme_col,.sursalaire,.transportImpos,.rendement,.representation,.assurances,.avances,.autres,.pret,.level,.entreprise,.is,.cn,.igr,.cnps,.ancinnete,.heureSup,.transport,.salaireBase,.salaireBrute,.salaireNet,.salaireNetPaye,.honoraireNet,.honoraireNetPaye,.transportImpos').css('display','none');


                //call variable
                salaire_var();


           $('.level').val("");
          $('.entreprise').val("");
          $('.assurance').val("");

            $.ajax({
                url:link2,
                type:"POST",
                data:{
                    email:dt_email
                },
                success:function(response){
   
            try {

                        var responseNew = JSON.parse(response);
                         $('.nom').val(responseNew[0][0]);
                         $('.prenoms').val(responseNew[0][1]);
                         $('.matricule').val(responseNew[0][2]); 
                             $('.level').val(responseNew[1][0]);
                             $('.entreprise').val(responseNew[1][1]);
                             $('.assurance').val(responseNew[1][2]);


 
                    type_contrat=responseNew[1][3];

                    $('.typcontrat').val(type_contrat);


                       
                    $('.slrnet').prop('readonly',true);

                    if(
                        type_contrat=="Stage-ecole" ||
                        type_contrat=="Stage professionnel"

                    ){

            
                    $('.deuxieme_col,.avances,.level,.salaireNet,.salaireNetPaye').css('display', 'block');
                    $('.sursalaire,.transportImpos,.rendement,.representation,.assurances,.autres,.pret,.is,.cn,.igr,.cnps,.ancinnete,.heureSup,.transport,.salaireBase,.salaireBrute,.entreprise,.honoraireNet,.honoraireNetPaye,.astreinte').css('display', 'none');

                        //Traitement STAGIAIRE
                           
                         $('.slrnet').prop('readonly',true);
                          load_st_slr(dt_email);
                      
                    }

                    if(
                        type_contrat=="CDD avec essai" ||
                        type_contrat=="CDD lie au projet" ||
                        type_contrat=="CDD standard" ||
                        type_contrat=="CDI avec essai" ||
                        type_contrat=="CDI standard"

                    ){


                        $('.deuxieme_col,.sursalaire,.transportImpos,.rendement,.representation,.assurances,.avances,.autres,.pret,.is,.cn,.igr,.cnps,.ancinnete,.heureSup,.transport,.salaireBase,.salaireBrute,.salaireNet,.salaireNetPaye,.astreinte').css('display', 'block');
                    $('.deuxieme_col,.avances,.level,.entreprise').css('display', 'block');
                         //Traitement SALARIE

                           // $('.entreprise').val('NGSER');

                             fonc_salaire_brute(dt_email,0,0);

                    }

                    if(
                        type_contrat=="Consultant interne" ||
                        type_contrat=="Consultant externe"

                    ){

                        $('.deuxieme_col,.assurances,.avances,.autres,.pret,.entreprise,.honoraireNet,.honoraireNetPaye').css('display', 'block');
                    $('.sursalaire,.transportImpos,.rendement,.representation,.is,.cn,.igr,.cnps,.ancinnete,.heureSup,.transport,.salaireBase,.salaireBrute,.salaireNet,.salaireNetPaye').css('display', 'none');
                        //Traitement CONSULTANT

                       

                         load_consult_slr(dt_email);
                         
                    }

            } catch (error) {
              console.log(error);
              
            }
                   
  
        },
        error:function(error){
            console.log(error);
        }
    });


 }

///FIN
///// ENTREPRISE, LEVEL,ASSURANCE

///ONLOAD FORMULAR /////////



//////////////////////////////


 ////INPUT AVANCE 
$(document).on('keyup','.avance',function(){

    if (isNaN($(this).val()) && $(this).val()=='') {
        avance=0;
    }else{

     try {
             if(
                type_contrat=="Stage-ecole" ||
                type_contrat=="Stage professionnel"

            ){
                        //Traitement STAGIAIRE (SALAIRE NET PAYE)

                    /** Avance stagiaire ****/
                  calcul_avance_st($(this).val());   
                         
            }

                    if(
                        type_contrat=="CDD avec essai" ||
                        type_contrat=="CDD lie au projet" ||
                        type_contrat=="CDD standard" ||
                        type_contrat=="CDI avec essai" ||
                        type_contrat=="CDI standard"

                    ){
                         //Traitement SALARIE

                         avance_slr=$(this).val();

                         fonc_salaire_brute($('.personnel').val(),$(this).val(),0);
                           

                    }

                    if(
                        type_contrat=="Consultant interne" ||
                        type_contrat=="Consultant externe"

                    ){
                        //Traitement CONSULTANT

                        /** Avance consultant ****/
                        
                        calcul_avance_cst($(this).val());
                         
                    }
        }catch (error) {
              console.log(error);
              
      }
  }


});

//fonction calcul avance stagiaire
function calcul_avance_st(avance){
 
    if (isNaN(avance) && avance=='') {
        avance=0;
    }else{
                ///////////Traitement STAGIAIRE (SALAIRE NET PAYE)

    avance_st=parseInt(avance);      
    t_deduction_st = parseInt(assurance_st + pret_st*1 + avance_st + autres_st);
    slr_net_paye = salaire_net_st - t_deduction_st;
    
     //console.log(slr_net_paye*1);

     if(isNaN(slr_net_paye)){
        document.querySelector('.netpaye').value = 0;
     }else{

        $('.netpaye').val(slr_net_paye*1);
        } 

         /////////////////////////////////   
     }                 

}



 ////INPUT AUTRES 
$(document).on('keyup','.autre',function(){

    if (isNaN($(this).val()) && $(this).val()=='') {
        avance=0;
    }else{

     try {
             if(
                type_contrat=="Stage-ecole" ||
                type_contrat=="Stage professionnel"

            ){
                        //Traitement STAGIAIRE (SALAIRE NET PAYE)

                    /** Avance stagiaire ****/
                 // calcul_avance_st($(this).val());   
                         
            }

                    if(
                        type_contrat=="CDD avec essai" ||
                        type_contrat=="CDD lie au projet" ||
                        type_contrat=="CDD standard" ||
                        type_contrat=="CDI avec essai" ||
                        type_contrat=="CDI standard"

                    ){
                         //Traitement SALARIE
                        
                             fonc_salaire_brute($('.personnel').val(),avance_slr,$(this).val());
                    }

                    if(
                        type_contrat=="Consultant interne" ||
                        type_contrat=="Consultant externe"

                    ){
                        //Traitement CONSULTANT

                        /** Autre consultant ****/
                        var ava=0;
                          ava=parseInt(avance_cst);
                        calcul_autres_cst($(this).val(),ava);
                         
                    }
        }catch (error) {
              console.log(error);
              
      }
  }


});



/** Avance consultant ****/
function calcul_avance_cst(avance){
    avance_cst=parseInt(avance);


    if(isNaN(avance_cst)){
        honoraire_apaye_cst =0;
    }else{

        total_cst = parseInt( parseInt(pret_cst) + parseInt(avance_cst) + parseInt(autres_cst) );
        honoraire_apaye_cst = parseInt(parseInt(netApayer_cst) - parseInt(total_cst));
      document.querySelector('.honoraire_net_paye').value = honoraire_apaye_cst;

    }
}

/** Avance consultant ****/
function calcul_autres_cst(autre,avance){

       autres_cst=parseInt(autre);

      // console.log(autres_cst);
    if(isNaN(autres_cst)){
        honoraire_apaye_cst =0;
    }else{
        total_cst = parseInt(parseInt(pret_cst) + parseInt(avance) + parseInt(autres_cst));

        honoraire_apaye_cst = parseInt( parseInt(netApayer_cst) - parseInt(total_cst));
      
        document.querySelector('.honoraire_net_paye').value = honoraire_apaye_cst;
    }
}


$(document).on('keyup','.vsursalaire',function(e){

                         //Traitement SALARIE
        sursalaire=parseInt($(this).val());
        if(isNaN(sursalaire) && sursalaire=='' ){
            sursalaire=0;
        }else{
                calcul_sursalaire_slr(sursalaire);
          }         
            e.preventDefault();
   
});
/** Calcul sursalaire salarie ****/
function calcul_sursalaire_slr(sursa){
      
    if(isNaN(sursa) && sursa=="" ){
            sursa=0;
            sursalaire=0;
            salaire_brt_imp=0;
    }else{
            sursalaire=parseInt(sursa);

           salaire_brt_imp = parseInt(salaire_base) +
            parseInt(sursalaire) + parseInt(anciennete) +
            parseInt(astreinte) + parseInt(heure_sup) + parseInt(rendement) + parseInt(transp_imp);

          salaire_brut = parseInt(salaire_brt_imp) + parseInt(representation) + parseInt(transport);

            document.querySelector('.vsursalaire').value = sursalaire;
            document.querySelector('.slr_brt_impo').value = salaire_brt_imp;
            document.querySelector('.brute').value = salaire_brut;

            //calcul CN

            var tdeduction_r=parseInt($('.assurance').val())+parseInt($('.vpret').val())+parseInt($('.avance').val())+parseInt($('.autre').val());
            calcul_cn(salaire_brt_imp,tdeduction_r);
      
    }
}


$(document).on('keyup','.vastreinte',function(e){
                         //Traitement SALARIE
        astreinte=parseInt($(this).val());
        
        calcul_astreinte_slr(astreinte);
               
            e.preventDefault();
});


/** Calcul astreinte salarie ****/
function calcul_astreinte_slr(astr){
      
    if(isNaN(astr) && astr=="" ){
            astr=0;
            astreinte=0;
            salaire_brt_imp=0;
    }else{
            astreinte=parseInt(astr);

           salaire_brt_imp = parseInt(salaire_base) +
            parseInt(sursalaire) + parseInt(anciennete) +
            parseInt(astreinte) + parseInt(heure_sup) + parseInt(rendement) + parseInt(transp_imp);

          salaire_brut = parseInt(salaire_brt_imp) + parseInt(representation) + parseInt(transport);

          
            document.querySelector('.vastreinte').value = astreinte;
            document.querySelector('.slr_brt_impo').value = salaire_brt_imp;
            document.querySelector('.brute').value = salaire_brut;

            //calcul CN
        var tdeduction_r=parseInt($('.assurance').val())+parseInt($('.vpret').val())+parseInt($('.avance').val())+parseInt($('.autre').val());

            calcul_cn(salaire_brt_imp,tdeduction_r);
      
    }
}

$(document).on('keyup','.trans_impos',function(e){
                         //Traitement SALARIE
        transp_imp=parseInt($(this).val());
        
        calcul_transp_imp_slr(transp_imp);
               
            e.preventDefault();
});


/** Calcul transport imposable salarie ****/
function calcul_transp_imp_slr(trspimpo){
      
    if(isNaN(trspimpo) && trspimpo=="" ){
            trspimpo=0;
            transp_imp=0;
            salaire_brt_imp=0;
    }else{
            transp_imp=parseInt(trspimpo);

           salaire_brt_imp = parseInt(salaire_base) +
            parseInt(sursalaire) + parseInt(anciennete) +
            parseInt(astreinte) + parseInt(heure_sup) + parseInt(rendement) + parseInt(transp_imp);

          salaire_brut = parseInt(salaire_brt_imp) + parseInt(representation) + parseInt(transport);

          
            document.querySelector('.trans_impos').value = transp_imp;
            document.querySelector('.slr_brt_impo').value = salaire_brt_imp;
            document.querySelector('.brute').value = salaire_brut;
           

            //calcul CN
            var tdeduction_r=parseInt($('.assurance').val())+parseInt($('.vpret').val())+parseInt($('.avance').val())+parseInt($('.autre').val());

            calcul_cn(salaire_brt_imp,tdeduction_r);
      
    }
}


$(document).on('keyup','.vtransport',function(e){
                         //Traitement SALARIE
        transport=parseInt($(this).val());
        calcul_transp_slr(transport);
               
            e.preventDefault();
});

/** Calcul transport salarie ****/
function calcul_transp_slr(trsp){
      
    if(isNaN(trsp) && trsp=="" ){
            trsp=0;
            transport=0;
            salaire_brt_imp=0;
    }else{
            transport=parseInt(trsp);

           salaire_brt_imp = parseInt(salaire_base) +
            parseInt(sursalaire) + parseInt(anciennete) +
            parseInt(astreinte) + parseInt(heure_sup) + parseInt(rendement) + parseInt(transp_imp);

          salaire_brut = parseInt(salaire_brt_imp) + parseInt(representation) + parseInt(transport);

          
            document.querySelector('.vtransport').value = transport;
            document.querySelector('.slr_brt_impo').value = salaire_brt_imp;
            document.querySelector('.brute').value = salaire_brut;
      
    }
}