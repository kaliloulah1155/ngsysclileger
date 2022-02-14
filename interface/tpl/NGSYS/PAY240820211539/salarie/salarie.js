var linkapp=$('.appName').val();


//DEBUT salaire net  : variable

	//fichier salaire brute
	let duree = 0; //auto 
	let salaire_base = 0; //auto
	let sursalaire =0;
	let anciennete = 0; //auto
	let astreinte = 0;
	let heure_sup = 0;
	let rendement = 0;
	let transp_imp = 0;
	let salaire_brt_imp = 0;
	let representation = 0;
	let transport = 0;
	let salaire_brut = 0;
	let assurance = 0; // cette valeur provient de la fiche contrat
	let igr = 0;
	let is = 0;
	let vcnps=0;
	let total=0;
	let net=0;

	let linkslr_brute =
    "/" +
    linkapp +
    "/interface/tpl/" +
    linkapp +
    "/PAY/salarie/salaire_brute.php";
	//fin fichier salaire brute

    //fichier CN
     let cn = 0;
     //Fin fichier CN
//FIN salaire net  : variable
let pret=0;
let avance=0;
let autre=0;
let tdeduction=0;


 //vue de consultation
if($('.interselectperso').val() !==''){
    sursalaire =$('.vsursalaire').val();
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
	 avance=$('.avance').val();
	 autre=$('.autre').val();
	 tdeduction=$('.tdeduction').val();

}


//DEBUT salaire net  : fonction
      
      //debut salaire brute

         function fonc_salaire_brute(dt_email,avance,autre){
			$.ajax({
	            url: linkslr_brute,
	            type: "POST",
	             data:{
	                st_email:dt_email
	            },
	            success: function(response) {

	            	var responseNew = JSON.parse(response);

            			duree=parseInt(responseNew[0]);
            			salaire_base=parseInt(responseNew[1]);
            			anciennete=parseInt(responseNew[2]);
            			rendement=parseInt(responseNew[3]);
            			assurance=parseInt(responseNew[4]);
            			representation=parseInt(responseNew[5]);
            			pret=parseInt(responseNew[6]);


            			salaire_brt_imp = parseInt(salaire_base) +
        parseInt(sursalaire) + parseInt(anciennete) +
        parseInt(astreinte) + parseInt(heure_sup) + parseInt(rendement) + parseInt(transp_imp);

         salaire_brut = parseInt(salaire_brt_imp) + parseInt(representation) + parseInt(transport);

            
            			// console.log('avance : ',parseInt(avance) );
            			// console.log('autre : ',parseInt(autre) );

            	tdeduction=parseInt(assurance)+parseInt(pret)+parseInt(avance)+parseInt(autre);


            			 
            			//$('.vastreinte').val(astreinte);
            			document.querySelector('.duree').value = duree;
            			document.querySelector('.salaire_base').value = salaire_base;
            			document.querySelector('.vsursalaire').value = sursalaire;
            			document.querySelector('.anciennete').value = anciennete;
            			document.querySelector('.vastreinte').value = astreinte;
            			 document.querySelector('.heure_sup').value = heure_sup;
            			 document.querySelector('.vrendement').value = rendement;
            			 document.querySelector('.trans_impos').value = transp_imp;
            			 document.querySelector('.slr_brt_impo').value = salaire_brt_imp;
            			 document.querySelector('.vrepresentation').value = representation;
            			 document.querySelector('.assurance').value = assurance;
            			 document.querySelector('.vtransport').value = transport;
            			  document.querySelector('.brute').value = salaire_brut; 
            			  document.querySelector('.vpret').value = pret; 
            			  document.querySelector('.avance').value = $('.avance').val();
            			  document.querySelector('.autre').value = $('.autre').val();
            			  document.querySelector('.tdeduction').value = tdeduction;
            			  

	         			 

	         			 //calcul CN
	         			 calcul_cn(salaire_brt_imp,tdeduction);
		        },
		         error: function(error) {
		                console.log(error);
		            },
       		 }); 
         }

      //fin salaire brute




//FIN salaire net  : fonction