




function calcul_igr(salaire_bi,base_impo,cn,prs_email,tdeduction){

	//console.log(salaire_bi,base_impo,cn,prs_email);

	 /*
		 <option value="1">Célibataire</option>
		 <option value="2">Marié</option>
		 <option value="3">Divorcé</option>
		 <option value="4">Veuf</option>
	 */
	let appNIGR = $(".appName").val();

	let linkigr =
    "/" +
    appNIGR +
    "/interface/tpl/" +
    appNIGR +
    "/PAY/salarie/partigr.php";

	//GET SIT MAT and number of children

	 let sit_mat = 1;
 	 let nbres_enfant = 1;

 	 $.ajax({
            url: linkigr,
            type: "POST",
             data:{
                st_email_igr:prs_email
            },
            success: function(response) {

            	 var responseNew = JSON.parse(response);
                  
                  nbres_enfant=parseInt(responseNew[0][0]);
                
                
                if(responseNew[0][1] =="CELIBATAIRE" ){
                		sit_mat=1;
                }
                else if(responseNew[0][1] =="MARIE" || responseNew[0][1] =="MARIEE" ){
                		sit_mat=2;
                }
                else if(responseNew[0][1] =="DIVORCE" || responseNew[0][1] =="DIVORCEE" ){
                		sit_mat=3;
                }
                else if(responseNew[0][1] =="VEUF" || responseNew[0][1] =="VEUVE" ){
                		sit_mat=4;
                }
                
                 cal_igr_part(salaire_bi,base_impo,cn,sit_mat,nbres_enfant,tdeduction);
                // console.log('sit mat',sit_mat,'enfant = ',nbres_enfant);
            },
            error: function(error) {
                console.log(error);
            },
        }); 
  
}

function cal_igr_part(salaire_bi,base_impo,cn,sit_mat,nbres_enfant,tdeduction){

	//console.log(salaire_bi,base_impo,cn,sit_mat,nbres_enfant);

if (nbres_enfant === "" ) {
     //console.log("Veuillez renseigner tout les champs !");
 } else {
     if (nbres_enfant == 0 && sit_mat == 1 || nbres_enfant == 0 && sit_mat == 3 || nbres_enfant == 0 && sit_mat == 4) {
         // console.log("la part = 1");
         var part = 1;

     }
     if (nbres_enfant == 1 && sit_mat == 1 || nbres_enfant == 0 && sit_mat == 2 || nbres_enfant == 1 && sit_mat == 3) {
         //  console.log("la part = 2");
         var part = 2;

     }
     if (nbres_enfant == 2 && sit_mat == 1 || nbres_enfant == 1 && sit_mat == 2 || nbres_enfant == 2 && sit_mat == 3 || nbres_enfant == 1 && sit_mat == 4) {
         // console.log("la part = 2.5");
         var part = 2.5;


     }
     if (nbres_enfant == 3 && sit_mat == 1 || nbres_enfant == 2 && sit_mat == 2 || nbres_enfant == 3 && sit_mat == 3 || nbres_enfant == 2 && sit_mat == 4) {
         // console.log("la part = 3");
         var part = 3;

     }
     if (nbres_enfant == 4 && sit_mat == 1 || nbres_enfant == 3 && sit_mat == 2 || nbres_enfant == 4 && sit_mat == 3 || nbres_enfant == 3 && sit_mat == 4) {
         // console.log("la part = 3.5");
         var part = 3.5;

     }
     if (nbres_enfant == 5 && sit_mat == 1 || nbres_enfant == 4 && sit_mat == 2 || nbres_enfant == 5 && sit_mat == 3 || nbres_enfant == 4 && sit_mat == 4) {
         // console.log("la part = 4");
         var part = 4;

     }
     if (nbres_enfant == 6 && sit_mat == 1 || nbres_enfant == 5 && sit_mat == 2 || nbres_enfant == 6 && sit_mat == 3 || nbres_enfant == 5 && sit_mat == 4) {
         // console.log("la part = 4.5");
         var part = 4.5;

     }
     if (nbres_enfant >= 7 && sit_mat == 1 || nbres_enfant >= 6 && sit_mat == 2 || nbres_enfant >= 7 && sit_mat == 3 || nbres_enfant >= 6 && sit_mat == 4) {
         // console.log("la part = 5");
         var part = 5;

     }
 }

 // FIN PART IGR


   //DEBUT BASE IGR
  //IS
 let base_igr = 0;
   is = parseInt((salaire_bi*1.2)/100);

    document.querySelector('.vis').value = is;

 base_igr = parseInt(85 * (base_impo - is - cn) / 100);
 //FIN BASE IGR



 //DEBUT Coefficient (Q)
 let coefQ = 0;
 if (part != 0) {
     coefQ = parseInt(base_igr / parseInt(part));
 }
 //FIN Coefficient (Q)

 //DEBUT Coefficient (Q1)
 let q1 = 0;

 if ((salaire_bi) == 0 || coefQ < 25000) {
     q1 = 0;
 } else {
     if (coefQ < 45583) {
         q1 = parseInt((base_igr * 10 / 110) - 2273 * part);
     } else {
         q1 = 0;
     }
 }

 //FIN Coefficient (Q1)

 //=SI(E4=0;0;SI(ET(45584<J4;J4<81583);(I4*15/115)-4076*H4;0))


 //DEBUT Coefficient (Q2)
 let q2 = 0;
 if (salaire_bi == 0) {
     q2 = 0;
 } else {
     if (coefQ > 45584 && coefQ < 81583) {
         q2 = parseInt((base_igr * 15 / 115) - 4076 * part);
     } else {
         q2 = 0;
     }
 }
 //FIN Coefficient (q2)



 //DEBUT Coefficient (Q3)

 //console.log(valres[0].base_impo);

 let q3 = 0;
 if (salaire_bi == 0) {
     q3 = 0;
 } else {
     if (coefQ > 81584 && coefQ < 126583) {
         q3 = parseInt((base_igr * 20 / 120) - 7031 * part);
     } else {
         q3 = 0;
     }
 }
 //FIN Coefficient (Q3) =SI(E4=0;0;SI(ET(126584<J4;J4<220333);(I4*25/125)-11250*H4;0))


 //E4:valres[0].sbi
 //J4 :coefQ
 //I4: base_igr
 //H4 : part

 //DEBUT Coefficient (Q4)
 let q4 = 0;
 if (salaire_bi == 0) {
     q4 = 0;
 } else {
     if (coefQ > 126584 && coefQ < 220333) {

         q4 = parseInt((base_igr * 25 / 125) - 11250 * part);
     } else {
         q4 = 0;
     }
 }
 //FIN Coefficient (Q4)

 //DEBUT Coefficient (Q5)
 let q5 = 0;
 if (salaire_bi == 0) {
     q5 = 0;
 } else {
     if (coefQ > 220334 && coefQ < 389083) {

         q5 = parseInt((base_igr * 35 / 135) - 24306 * part);
     } else {
         q5 = 0;
     }
 }
 //FIN Coefficient (Q5)

 //DEBUT Coefficient (Q6)
 let q6 = 0;
 if (salaire_bi == 0) {
     q6 = 0;
 } else {
     if (coefQ > 389084 && coefQ < 842166) {

         q6 = parseInt((base_igr * 45 / 145) - 44181 * part);
     } else {
         q6 = 0;
     }
 }
 //FIN Coefficient (Q6)

 //DEBUT Coefficient (Q7)   
 let q7 = 0;
 if (salaire_bi == 0) {
     q7 = 0;
 } else {
     if (coefQ > 842167) {
         q7 = parseInt((base_igr * 60 / 160) - 98633 * part);
     } else {
         q7 = 0;
     }
 }
 //FIN Coefficient (Q7)


 igr = parseInt(q1 + q2 + q3 + q4 + q5 + q6 + q7);
 document.querySelector('.vigr').value = igr;

  document.querySelector('.vpart').value = part;



 // =SI(salaire_bi<1647315;salaire_bi*(6.3/100);1647315*(6.3/100))

 if(salaire_bi<1647315){
 	vcnps=parseInt( salaire_bi*(6.3/100) );
 }else{
 	vcnps=parseInt( 1647315*(6.3/100) );
 }

 	document.querySelector('.vcnps').value = vcnps;
  
   // =+SOMME(H4:K4)

   total=parseInt(is)+parseInt(cn)+parseInt(igr)+parseInt(vcnps);

   document.querySelector('.tol').value = total;
   

   net = (parseInt(representation)+parseInt(transport)+parseInt(salaire_bi))-(total);
 
   document.querySelector('.slrnet').value = net; //remplacer .net par slrnet

    
    
   document.querySelector('.netpaye').value = parseInt(net)-parseInt(tdeduction);
    

   //calcul salaire net payé

   ///////////////////////////

        
}