

function calcul_cn(salaire_brt_imp,tdeduction){
    
    // DEBUT :: CN
    var salaire_bi = parseInt(salaire_brt_imp);
    var base_impo = parseInt((salaire_bi * 80) / 100);
     
    let h1 = 0;
    if (salaire_bi == 0) {
        h1 = 0;
    } else {

        if (50000 < base_impo && base_impo < 130000) {
            h1 = parseInt((base_impo - 50000) * (1.50 / 100));
        } else {
            h1 = parseInt(80000 * (1.50 / 100));
        }
    }
     let h2 = 0;
    if (h1 < 1200) {
        h2 = 0;
    } else {
        if (salaire_bi == 0) {
            h2 = 0;
        } else {
            if (130000 < base_impo && base_impo < 200000) {
                h2 = parseInt((base_impo - 130000) * (5 / 100));
            } else {
                h2 = parseInt(70000 * (5 / 100));
            }
        }
    }
    
    let h3 = 0;
    if (base_impo > 200000) {
        h3 = parseInt((base_impo - 200000) * (10 / 100));
    } else {
        h3 = 0;
    }
    cn =parseInt(h1) + parseInt(h2) + parseInt(h3);

    // FIN :: CN
    document.querySelector('.vcn').value = cn;

       // console.log('cn : ',tdeduction)

     //APPEL DE LA FONCTION IGR
    var email_ig= $('.personnel').val();
     calcul_igr(salaire_bi,base_impo,cn,email_ig,tdeduction) ;


     //Calcul taxe patronale

     calcul_txe_patronale(salaire_brt_imp);


}