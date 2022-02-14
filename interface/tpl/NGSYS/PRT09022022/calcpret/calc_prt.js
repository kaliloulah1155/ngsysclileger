if($('.etat_fiche').val() !='CLOS'){

	$('.botton_pris').hide();
}else{
  $('.botton_pris').show();
}

	  //DEBUT SCRIPT DE CONVERSION DES MONTANTS EN LETTRE




 function ConvNumberLetter(Nombre) {
     var dblEnt, byDec;
     var bNegatif;
     var strCentimes = new String();

     if (Nombre < 0) {
         bNegatif = true;
         Nombre = Math.abs(Nombre);
     }
     dblEnt = parseInt(Nombre);
     byDec = parseInt((Nombre - dblEnt) * 100);

     if (byDec == 0) {
         if (dblEnt > 999999999999999) {
             return "#TropGrand";
         }
     } else {
         if (dblEnt > 9999999999999.99) {
             return "#TropGrand";
         }
     }
     if (Nombre == $('.vprelevmens_actuel').val()) {
         $('.prelev_mens_lettre').val(ConvNumEnt(dblEnt));
     }

      if (Nombre == $('.sommeEmprunt').val()) {
          $('.emprunt_lettre').val(ConvNumEnt(dblEnt));
      }
     if (Nombre == $('.mois').val()) {
          $('.mois_lettre').val(ConvNumEnt(dblEnt));
      }
 }

 function ConvNumEnt(Nombre) {
     var byNum, iTmp, dblReste;
     var StrTmp = new String();
     var NumEnt;
     iTmp = Nombre - (parseInt(Nombre / 1000) * 1000);
     NumEnt = ConvNumCent(parseInt(iTmp));
     dblReste = parseInt(Nombre / 1000);
     iTmp = dblReste - (parseInt(dblReste / 1000) * 1000);
     StrTmp = ConvNumCent(parseInt(iTmp));
     switch (iTmp) {
         case 0:
             break;
         case 1:
             StrTmp = "mille ";
             break;
         default:
             StrTmp = StrTmp + " mille ";
     }
     NumEnt = StrTmp + NumEnt;

     dblReste = parseInt(dblReste / 1000);
     iTmp = dblReste - (parseInt(dblReste / 1000) * 1000);
     StrTmp = ConvNumCent(parseInt(iTmp));
     switch (iTmp) {
         case 0:
             break;
         case 1:
             StrTmp = StrTmp + " million ";
             break;
         default:
             StrTmp = StrTmp + " millions ";
     }
     NumEnt = StrTmp + NumEnt;
     dblReste = parseInt(dblReste / 1000);
     iTmp = dblReste - (parseInt(dblReste / 1000) * 1000);
     StrTmp = ConvNumCent(parseInt(iTmp));
     switch (iTmp) {
         case 0:
             break;
         case 1:
             StrTmp = StrTmp + " milliard ";
             break;
         default:
             StrTmp = StrTmp + " milliards ";
     }
     NumEnt = StrTmp + NumEnt;
     dblReste = parseInt(dblReste / 1000);
     iTmp = dblReste - (parseInt(dblReste / 1000) * 1000);
     StrTmp = ConvNumCent(parseInt(iTmp));
     switch (iTmp) {
         case 0:
             break;
         case 1:
             StrTmp = StrTmp + " billion ";
             break;
         default:
             StrTmp = StrTmp + " billions ";
     }
     NumEnt = StrTmp + NumEnt;

     return NumEnt;
 }

 function ConvNumDizaine(Nombre) {
     var TabUnit, TabDiz;
     var byUnit, byDiz;
     var strLiaison = new String();

     TabUnit = Array("", "un", "deux", "trois", "quatre", "cinq", "six", "sept",
         "huit", "neuf", "dix", "onze", "douze", "treize", "quatorze", "quinze",
         "seize", "dix sept", "dix huit", "dix neuf");
     TabDiz = Array("", "", "vingt", "trente", "quarante", "cinquante",
         "soixante", "soixante", "quatre vingt", "quatre vingt");

     byDiz = parseInt(Nombre / 10);
     byUnit = Nombre - (byDiz * 10);
     strLiaison = " ";
     if (byUnit == 1) strLiaison = " et ";
     switch (byDiz) {
         case 0:
             strLiaison = "";
             break;
         case 1:
             byUnit = byUnit + 10;
             strLiaison = "";
             break;
         case 7:
             byUnit = byUnit + 10;
             break;
         case 8:
             strLiaison = " ";
             break;
         case 9:
             byUnit = byUnit + 10;
             strLiaison = " ";
             break;
     }
     var NumDizaine = TabDiz[byDiz];
     if (byDiz == 8 && byUnit == 0) NumDizaine = NumDizaine + "s";
     if (TabUnit[byUnit] != "") {
         NumDizaine = NumDizaine + strLiaison + TabUnit[byUnit];
     } else {
         NumDizaine = NumDizaine;
     }
     return NumDizaine;
 }

 function ConvNumCent(Nombre) {
     var TabUnit;
     var byCent, byReste;
     var strReste = new String();
     var NumCent;
     TabUnit = Array("", "un", "deux", "trois", "quatre", "cinq", "six", "sept", "huit", "neuf", "dix");

     byCent = parseInt(Nombre / 100);
     byReste = Nombre - (byCent * 100);
     strReste = ConvNumDizaine(byReste)
     switch (byCent) {
         case 0:
             NumCent = strReste;
             break;
         case 1:
             if (byReste == 0)
                 NumCent = "cent";
             else
                 NumCent = "cent " + strReste;
             break;
         default:
             if (byReste == 0)
                 NumCent = TabUnit[byCent] + " cents";
             else
                 NumCent = TabUnit[byCent] + " cent " + strReste;
     }
     return NumCent;
 }
 //FIN SCRIPT DE CONVERSION DES MONTANTS EN LETTRE
 



 Number.prototype.formatMoney = function(decPlaces, thouSeparator, decSeparator) {
		var n = this,
			decPlaces = isNaN(decPlaces = Math.abs(decPlaces)) ? 2 : decPlaces,
			decSeparator = decSeparator == undefined ? "." : decSeparator,
			thouSeparator = thouSeparator == undefined ? "," : thouSeparator,
			sign = n < 0 ? "-" : "",
			i = parseInt(n = Math.abs(+n || 0).toFixed(decPlaces)) + "",
			j = (j = i.length) > 3 ? j % 3 : 0;
		return sign + (j ? i.substr(0, j) + thouSeparator : "") + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + thouSeparator) + (decPlaces ? decSeparator + Math.abs(n - i).toFixed(decPlaces).slice(2) : "");
	};







var appN=$('.appName').val();

let link_url =
    "/" +
    appN +
    "/interface/tpl/" +
    appN +
    "/PRT/calcpret/calc_prt.php";



	 

const demandeur =()=>{
     
      return new Promise((resolve, reject) => {
        $.ajax({
            url: link_url,
            data:{
                  createur:$('.createur').val().toLowerCase(),
            },
            type: "POST",
            success: function (data) {
                resolve(data);
            },
            error: function (error) {
                reject(error);
            },
        });
    });   

}


 let mois=1;
let sommeEmprunt=0
let montantmensuel=0;

demandeur()
.then(data => {

	let results=data.data[0]; 

	   $('.vnbreemprunt').val( results['nbre_emprunte'] ) ;
	   $('.vqutotite').val( results['quotite_cessible'] ) ;
	   $('.vmtnemprunt').val( results['montant_emprunte'] ) ;
	   $('.vdatefinprelev').val( results['date_fin_preleve'] ) ;
	    $('.vprelevmens').val( results['prelev_mens'] ) ;

	   

	   $('.viewnombreEmp').text(results['nbre_emprunte']);
	   $('.viewmontantEmp').text( ( parseInt( results['montant_emprunte'] ) ).formatMoney(0,'.','.')  );
	   $('.viewquotite').text( ( parseInt( results['quotite_cessible'] ) ).formatMoney(0,'.','.')  );
	   $('.viewdatefin').text(results['date_fin_preleve'] ); 
	    $('.viewmtnpreleve').text( ( parseInt( results['prelev_mens'] ) ).formatMoney(0,'.','.')  );
	   

	   var mtnprelev= parseInt(results['prelev_mens']);
	   var quotite = parseInt(results['quotite_cessible']) ;

		$('.vprelevmens').val(results['prelev_mens'] ) ; 

	  //Calcul quotité cessible prelevable
	  if(mtnprelev==0){
		  var a=quotite;
		   $('.vqutotiteprelev').val( isNaN(a) ?  0 : a.formatMoney(0,'','.') ) ;
		  $('.viewquotiteprelev').text((a).formatMoney(0,'.','.')  );
	  }else{
           var b=(quotite*1)-(mtnprelev*1);
		    $('.vqutotiteprelev').val( isNaN(b) ?  0 : b ) ;
			$('.viewquotiteprelev').text((b).formatMoney(0,'.','.')  );
	  }
	 
})
.catch(error=>console.log(error));



$('.mois, .sommeEmprunt').on('input',function(){


		   mois=parseInt($('.mois').val())*1;
	       sommeEmprunt=parseInt($('.sommeEmprunt').val())*1;

	       var montantmensuel=0;

		   ConvNumberLetter($('.sommeEmprunt').val());
		   ConvNumberLetter($('.mois').val());

			if(mois==0 || mois=='' ){
				ConvNumberLetter($('.vprelevmens').val());
				
			}else{

				montantmensuel= sommeEmprunt/mois; 

				 
				if(montantmensuel>parseInt( $('.vqutotite').val() ) ){
 						  $('.flashalert').show();
 						  montantmensuel=0 ;
						  ConvNumberLetter($('.sommeEmprunt').val(0));
				 }else{
                           $('.flashalert').hide();
				 }
				 $('.vprelevmens_actuel').val(montantmensuel);
				 ConvNumberLetter($('.vprelevmens_actuel').val());
			}

});


