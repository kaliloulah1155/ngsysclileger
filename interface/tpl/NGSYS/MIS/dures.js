// 

$(document).ready(function(){

	//CALCUL DES DUREES 
   $(document).on('change keyup','.heurein,.heureout',function(){

   		var inphdeb=$('.heurein').val();
		var inphfin=$('.heureout').val();


		var timeStart = new Date("01/01/2010 " + inphdeb);
		var timeEnd = new Date("01/01/2010 " + inphfin);

		if(timeStart <= timeEnd){
				var difference = timeEnd - timeStart;
				var diff_result = new Date(difference);

				var hourDiff = diff_result.getHours();
				var minuteDiff = diff_result.getMinutes();

				hourDiff1 = hourDiff > 9 ? hourDiff : '0'+hourDiff;
				minuteDiff1 = minuteDiff > 9 ? minuteDiff : '0' + minuteDiff;

				var countDuree=(isNaN(hourDiff1) ? '00' : hourDiff1)+':'+(isNaN(minuteDiff1) ? '00' : minuteDiff1) ;

				$('.voyDuree').val(countDuree);
					
		} 
					 
 	});
	   ///////////////////////////
 


});