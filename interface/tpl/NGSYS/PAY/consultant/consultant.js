var linkapp=$('.appName').val();

let linkconsult =
    "/" +
    linkapp +
    "/interface/tpl/" +
    linkapp +
    "/PAY/consultant/consultant.php";


let honoraire_net_cst=0; //salaire fich contrat ok 
let recharge_cst =0;  // en provenance des primes -contrats
let brute_cst=0;
let charge_fiscale_cst=0;
let conge_cst=true;
let retraite_cst=0;
let entreprise_cst='HUAWEI';
let at_cst=0;
let pf_cst=0;
let total_cnps_cst=0;
let assurance_cst=0;    //
let tot_charge_cst=0;
let produit_cst=0;
let marge_cst=0;
let mfees_cst=0;
let factureHT_cst=0;
let margeTotale_cst=0;
let netApayer_cst=0;
let pret_cst=0;    //pret fiche pret
let avance_cst=0;
let autres_cst=0;
let total_cst=0;
let honoraire_apaye_cst=0;


if($('.interselectperso').val() !==''){
    /*sursalaire =$('.vsursalaire').val();
    duree = $('.duree').val(); //auto 
     salaire_base = $('.salaire_base').val(); //auto
     anciennete = $('.anciennete').val(); //auto
     astreinte =  $('.vastreinte').val();
     heure_sup = $('.heure_sup').val();
     rendement = $('.vrendement').val();
     transp_imp = $('.trans_impos').val();
     salaire_brt_imp = $('.slr_brt_impo').val();
     representation = $('.vrepresentation').val();
     transport = $('.vtransport').val();
     salaire_brut = $('.brute').val();
     assurance = $('.assurance').val(); // cette valeur provient de la fiche contrat
     igr = $('.vigr').val();
     is = $('.vis').val();
     vcnps=$('.vcnps').val();
     total=$('.tol').val();
     net=$('.net').val();
     cn = $('.vcn').val();
     pret=$('.vpret').val();
     tdeduction=$('.tdeduction').val();*/
      avance_cst=$('.avance').val();
      autres_cst=$('.autre').val();
     

}



function load_consult_slr(dt_email){

	 $.ajax({
            url: linkconsult,
            type: "POST",
             data:{
                st_email:dt_email
            },
            success: function(response) {

            	var responseNew = JSON.parse(response);

            	honoraire_net_cst=parseInt(responseNew[0][0]);
            	conge_cst=responseNew[0][2];
            	entreprise_cst=responseNew[0][3];
            	recharge_cst=parseInt(responseNew[1][0]);

            	pret_cst=parseInt(responseNew[2]);
            	brute_cst=parseInt(honoraire_net_cst/(92.5/100));
            	charge_fiscale_cst=parseInt(brute_cst*0.075);

            	if(conge_cst=='OUI'){
            		conge_cst=true;
            	}else{
            	     conge_cst=false;
            	}

            	if (conge_cst == false) {
				    retraite_cst = 0;
				} else {
				    if (brute_cst < 1647315) {
				        retraite_cst = parseInt(parseInt(brute_cst) * (0.14));
				    } else {
				        retraite_cst = parseInt(1647315 * (0.14));
				    }
				}

				if (entreprise_cst == 'HUAWEI') {
				    at_cst  = parseInt(70000 * 3 / 100);
				    pf_cst  = parseInt(70000 * (5.75 / 100));
				    
				}else{
				    at_cst  = 0;
				    pf_cst  = 0;
				}
				total_cnps_cst = parseInt(parseInt(retraite_cst) + parseInt(at_cst) + parseInt(pf_cst) );

				if (entreprise_cst !== '') {
				    tot_charge_cst = parseInt(parseInt(recharge_cst) + parseInt(brute_cst) + parseInt(total_cnps_cst) + parseInt(assurance_cst));
				    produit_cst = parseInt( parseInt(produit_cst)/ (106 / 100)); //100000 est la valeur du produit pour un consultant
				} else {
				    produit_cst = 0;
				}

				if(document.querySelector('.tot_charge').value !==''){
               		marge_cst = parseInt( parseInt(produit_cst) - parseInt(tot_charge_cst));
               }
               mfees_cst = parseInt(parseInt(produit_cst) * 6 / 100);

               factureHT_cst = parseInt( parseInt(produit_cst) + parseInt(mfees_cst) );
            	
            	margeTotale_cst = parseInt( parseInt(marge_cst) + parseInt(mfees_cst) );

            	netApayer_cst = parseInt( parseInt(brute_cst) + parseInt(charge_fiscale_cst) + parseInt(recharge_cst));

            	total_cst = parseInt( parseInt(pret_cst) + parseInt(avance_cst) + parseInt(autres_cst) );

            	honoraire_apaye_cst = parseInt( parseInt(netApayer_cst) - parseInt(total_cst) );
            	  
               //$('.honoraire_net').val(honoraire_net_cst); 
               $('.produit').val(produit_cst);
               $('.vpret').val(pret_cst);
               $('.avance').val(avance_cst);
               $('.autre').val(autres_cst);
               $('.recharge').val(recharge_cst);
               document.querySelector('.brute').value = brute_cst;
               document.querySelector('.chf_fiscale').value = charge_fiscale_cst;
               document.querySelector('.retraite').value = retraite_cst;
               document.querySelector('.at').value = at_cst;
               document.querySelector('.pf').value = pf_cst;
               document.querySelector('.tot_cnps').value =total_cnps_cst;
               document.querySelector('.tot_charge').value = tot_charge_cst;
               document.querySelector('.marge').value = marge_cst;
               document.querySelector('.mfees').value = mfees_cst; 
               document.querySelector('.factureHT').value = factureHT_cst;
                document.querySelector('.marge_tot').value = margeTotale_cst;
                document.querySelector('.net_a_payer').value = netApayer_cst;
                document.querySelector('.tdeduction').value = total_cst;
                document.querySelector('.honoraire_net').value = honoraire_net_cst; 
                document.querySelector('.honoraire_net_paye').value = honoraire_apaye_cst;
             

            	//console.log(response);

             
            },
            error: function(error) {
                console.log(error);
            },
        }); 
	 
}
