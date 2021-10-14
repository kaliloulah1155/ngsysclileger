$(document).ready(function(){

	$(".ip").mask('000.000.000.000');
	
	$(".datepicker").mask("99/99/9999");
	
	$(".phone").mask('(00) 0000-0000');
	
	$(".celphone").mask('(00) 00000-0000');
	
	$(".cep").mask('00000-000');
	
	$(".cpf").mask('000.000.000-00');
	
	$(".integer").mask('00000000000');

	$(".decimal").each(function(){
		$parent = $(this);
		$(this).hide();
		$elem = $("<input>").insertAfter($(this));
		$elem.value = $(this).val();
		$elem.bind("blur", function(){
			$parent.value = $(this).val().replace(".","").replace(",",".");
		});
		$elem.mask('000.000.000.000.000,00', {reverse: true});
	});

	$('.percent').each(function(){
		$parent = $(this);
		$(this).hide();
		$elem = $("<input>").insertAfter($(this));
		$elem.value = $(this).val();
		$elem.bind("blur", function(){
			$parent.value = $(this).val().replace("%","").replace(",",".");
		});
		$elem.mask('##0,00%', {reverse: true});
	});

});