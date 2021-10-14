let appN = $(".appName").val();


 //DEBUT SCRIPT DE CONVERSION DES MONTANTS EN LETTRE

   function ConvNumberLetter(Nombre) {
    var dblEnt, byDec ; 
    var bNegatif; 
  var strCentimes = new String();
  
    
    if( Nombre < 0 ) {
        bNegatif = true;
        Nombre = Math.abs(Nombre);
    }
    dblEnt = parseInt(Nombre) ;
    byDec = parseInt((Nombre - dblEnt) * 100) ;
  
    if( byDec == 0 ) {
        if (dblEnt > 999999999999999) {
            return "#TropGrand" ;            
        }
  }
    else {
        if (dblEnt > 9999999999999.99) {
            return "#TropGrand" ;            
        }    
  }
  
  if (Nombre ==$('.montant_net').val()  ) {
       $('.montant_letter').val(ConvNumEnt(dblEnt) ) ;
  }

  if (Nombre ==$('.ecole_duree').val()  ) {
       $('.mois_lettre').val(ConvNumEnt(dblEnt) ) ;
  }

  if (Nombre ==$('.pro_duree').val()  ) {
       $('.pro_mois_lettre').val(ConvNumEnt(dblEnt) ) ;
  }
  
}

function ConvNumEnt(Nombre) {
    var byNum, iTmp, dblReste ;
    var StrTmp = new String();
    var NumEnt ;
    iTmp = Nombre - (parseInt(Nombre / 1000) * 1000) ;
    NumEnt = ConvNumCent(parseInt(iTmp)) ;
    dblReste = parseInt(Nombre / 1000) ;
    iTmp = dblReste - (parseInt(dblReste / 1000) * 1000) ;
    StrTmp = ConvNumCent(parseInt(iTmp)) ;
    switch(iTmp) {
        case 0 :
      break;
        case 1 :
            StrTmp = "mille " ; 
      break;
        default : 
            StrTmp = StrTmp + " mille " ;
    }
    NumEnt = StrTmp + NumEnt ;

    dblReste = parseInt(dblReste / 1000) ;
    iTmp = dblReste - (parseInt(dblReste / 1000) * 1000) ;
    StrTmp = ConvNumCent(parseInt(iTmp)) ;
    switch(iTmp) {
        case 0 :
      break;
        case 1 :
            StrTmp = StrTmp + " million " ;
      break;
        default : 
            StrTmp = StrTmp + " millions " ;
    }
    NumEnt = StrTmp + NumEnt ;
    dblReste = parseInt(dblReste / 1000) ;
    iTmp = dblReste - (parseInt(dblReste / 1000) * 1000) ;
    StrTmp = ConvNumCent(parseInt(iTmp)) ;
  switch(iTmp) {
        case 0 :
      break;
        case 1 :
            StrTmp = StrTmp + " milliard " ;
      break;
        default : 
            StrTmp = StrTmp + " milliards " ;
    }
    NumEnt = StrTmp + NumEnt ;
    dblReste = parseInt(dblReste / 1000) ;
    iTmp = dblReste - (parseInt(dblReste / 1000) * 1000) ;
    StrTmp = ConvNumCent(parseInt(iTmp)) ;
    switch(iTmp) {
        case 0 :
      break;
        case 1 :
            StrTmp = StrTmp + " billion " ;
      break;
        default : 
            StrTmp = StrTmp + " billions " ;
    }
    NumEnt = StrTmp + NumEnt ;
  
  return NumEnt;    
}

function ConvNumDizaine(Nombre) {
    var TabUnit, TabDiz ;
    var byUnit, byDiz ;
    var strLiaison = new String() ;
  
    TabUnit = Array("", "un", "deux", "trois", "quatre", "cinq", "six", "sept",
        "huit", "neuf", "dix", "onze", "douze", "treize", "quatorze", "quinze",
        "seize", "dix sept", "dix huit", "dix neuf") ;
    TabDiz = Array("", "", "vingt", "trente", "quarante", "cinquante",
        "soixante", "soixante", "quatre vingt", "quatre vingt") ;
    
    byDiz = parseInt(Nombre / 10) ;
    byUnit = Nombre - (byDiz * 10) ;
    strLiaison = " " ;
    if (byUnit == 1) strLiaison = " et " ;
    switch(byDiz) {
        case 0 :
            strLiaison = "" ;
      break;
        case 1 :
            byUnit = byUnit + 10 ;
            strLiaison = "" ;
      break;
        case 7 :
             byUnit = byUnit + 10 ;
      break;
        case 8 :
             strLiaison = " " ;
      break;
        case 9 :
              byUnit = byUnit + 10 ;
              strLiaison = " " ;
      break;
    }
    var NumDizaine = TabDiz[byDiz] ;
    if (byDiz == 8 && byUnit == 0) NumDizaine = NumDizaine + "s" ;
    if (TabUnit[byUnit] != "") {
        NumDizaine = NumDizaine + strLiaison + TabUnit[byUnit] ;
  }
    else {
        NumDizaine = NumDizaine ;
    } 
  return NumDizaine;
}

function ConvNumCent(Nombre) {
    var TabUnit ;
    var byCent, byReste ;
    var strReste = new String() ;
    var NumCent;
    TabUnit = Array("", "un", "deux", "trois", "quatre", "cinq", "six", "sept","huit", "neuf", "dix") ;
    
    byCent = parseInt(Nombre / 100) ;
    byReste = Nombre - (byCent * 100) ; 
    strReste = ConvNumDizaine(byReste) 
    switch(byCent) {
        case 0 :
            NumCent = strReste ;
      break;
        case 1 :
            if (byReste == 0)
                NumCent = "cent" ;
            else 
                NumCent = "cent " + strReste ;
            break;
        default :
            if (byReste == 0)
                NumCent = TabUnit[byCent] + " cents" ;
            else 
                NumCent = TabUnit[byCent] + " cent " + strReste ;
  }
  return NumCent;
}


$(document).on('change','.montant_net',function(){
     ConvNumberLetter($(this).val());  
});



//FIN SCRIPT DE CONVERSION DES MONTANTS EN LETTRE

function timeConverter(UNIX_timestamp){
  var a = new Date(UNIX_timestamp * 1000);
  var months = ['Janvier','Fevrier','Mars','Avril','Mai','Juin','Juillet','A\u00f4ut','Septembre','Octobre','Novembre','D\u00e9cembre'];
  var year = a.getFullYear();
  //var month = months[a.getMonth()];
  var month = a.getMonth();
  var date = a.getDate();     
  var hour = a.getHours();
  var min = a.getMinutes();
  var sec = a.getSeconds();
  var weekday = ['Dimanche', 'Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi'];
  //var dayGetName=weekday[a.getDay()];
  var dayGetName=a.getDay();
  hour1 = hour > 9 ? hour : '0' + hour;
  min1 = min > 9 ? min : '0' + min;
  sec1 = sec > 9 ? sec : '0' + sec;
  //var time = dayGetName + ' ' +date + ' ' + month + ' ' + year + ' \u00E0 ' + hour1 + ':' + min1 + ':' + sec1 ;

  
   d1 = date > 9 ? date : '0'+date;
   m1 = month > 9 ? month : '0'+month;



  var time =d1 +'/'+ m1+'/'+year ;
  return time;    
}

function addMonths(date, months) {
    var d = date.getDate();
    date.setMonth(date.getMonth() + +months);
    if (date.getDate() != d) {
      date.setDate(0);
    }
    return date;
}


 $(document).ready(function(){ 
             load_diplome();
             load_filiere();
             load_domaine();
             load_categorie();
});