 


 function calcul_txe_patronale(salaire_brt_imp){

 	var sbi_t=parseInt(salaire_brt_imp);

 	let is_p = 0;
	let ta_p = 0;
	let tfpc_p = 0;
	let famille_p = 0;
	let acc_p = 0;
	let retraite_p = 0;
	let total_p = 0;
	let total_fisc_p = 0;
	let total_cnps_p = 0;
	let ratios_employeur = 0;

	is_p = parseInt(sbi_t * (1.2 / 100));
	ta_p = parseInt(sbi_t * (0.4 / 100));
	tfpc_p = parseInt(sbi_t * (1.2 / 100));

	if (sbi_t == 0) {
	    famille_p = 0;
	} else {
	    famille_p = parseInt(70000 * (5.75 / 100));
	}

	if (sbi_t == 0) {
	    acc_p = 0;
	} else {
	    acc_p = parseInt(70000 * (3 / 100));
	}

	if (sbi_t < 1647315) {
	    retraite_p = parseInt(sbi_t * (7.7 / 100));
	} else {
	    retraite_p = parseInt(1647315 * (7.7 / 100));
	}

	total_p = parseInt(is_p + ta_p + tfpc_p + famille_p + acc_p + retraite_p);

	total_fisc_p = parseInt(is_p + ta_p + tfpc_p);

	if (sbi_t == 0) {
	    total_cnps_p = 0;
	} else {
	    total_cnps_p = parseInt(famille_p + acc_p + retraite_p);
	}

	if (sbi_t == 0) {
	    ratios_employeur = "";
	} else {
		 var ratios_emp=(parseFloat(parseFloat(total_p / sbi_t).toFixed(3)));
	    ratios_employeur = ratios_emp*100;
	}
     
		document.querySelector('.vis').value = is_p;
        document.querySelector('.ta').value = ta_p;
        document.querySelector('.tfpc').value = tfpc_p;
        document.querySelector('.famille').value = famille_p;
        document.querySelector('.acc').value = acc_p;
        document.querySelector('.retraite').value = retraite_p;
        document.querySelector('.total_txt').value = total_p;
        document.querySelector('.tot_cnps').value = total_cnps_p; 
	    document.querySelector('.total_fisc').value = total_fisc_p; 
	     document.querySelector('.ratios_empl').value = ratios_employeur;

 							 
							   

	//console.log(ratios_employeur);
}