/* JQUERY-UI INITIALIZATION ELEMENTS */
$(document).ready(function() {
	
/* BLOCK REFRESH RIGHTCLICK */
	// To disable rightclick
	$(document).bind("contextmenu",function(e){
        e.preventDefault();
    });
	// To disable f5
	$(document).bind("keydown", function(e){
		if ((e.which || e.keyCode) == 116) e.preventDefault();
	});


/* ACCORDIONS */
	$( ".accordion" ).accordion();
	
/* BUTTONS */
	$( ".buttonset" ).buttonset();
	$( "input:button, input:submit, input:reset" ).button();
	$( "button" ).each(function(){
		$(this).button({
			label: $(this).attr("value"),
			icons: {
				primary: $(this).attr("class"),
			},
		});
	});
	// radios
	$( "label.radio" ).button();
	$( "radio" ).each(function(){
		var brothers = $(this).children();
		var maxWidth = 0;
		for(i=0;i<brothers.length;i++){
			if(brothers[i].offsetWidth > maxWidth){
				maxWidth = brothers[i].offsetWidth;
			}
		}
		for(i=0;i<brothers.length;i++){
			brothers[i].style.width = maxWidth+"px";
		}
	});
	$( "label.radio input:radio" ).bind("change", function() {
		$(":radio[name='"+$(this).attr("name")+"']").parent().removeClass("ui-state-hover");
		$(this).parent().addClass("ui-state-hover");
	});
	
/* DATEPICKERS */
	$( ".datepicker" ).datepicker({
		dateFormat: 'dd/mm/yy',
		dayNames: ['Dimanche','Lundi','Mardi','Mercredi','jeudi','Vendredi','Samedi'],
		dayNamesMin: ['Di','Lu','Ma','Me','Je','Ve','Sa','Di'],
		dayNamesShort: ['Dim','Lun','Mar','Mer','jeu','Ven','Sam','Dim'],
		monthNames: ['Janvier','Fevrier','Mars','Avril','Mai','Juin','Juillet','Aout','Septembre','Octobre','Novembre','Decembre'],
		monthNamesShort: ['Jan','Fev','Mar','Avr','Mai','Jun','Jul','Aou','Sep','Oct','Nov','Dec'],
		nextText: 'Próximo',
		prevText: 'Precedent',
		yearRange: '1900:2100',
		changeMonth: true,
		changeYear: true,
		beforeShow: function(input, inst){
			if($(this).hasClass("NonModif") || $(this).hasClass("verrouille")){
				input.datepicker( "destroy" );
			}
		}
	});
	
/* MENUS */
	$( ".menu" ).menu();
	
/* PROGRESSBARS */
	$( ".progressbar" ).progressbar();
	
/* SLIDERS */
	$( ".slider" ).slider();
	
/* SPINNERS */
	$( ".spinner" ).spinner();
	
/* TABS */
	$( ".tabs" ).tabs({
		show: { effect: "fade", duration: 500 },
	});
	
/* TOOLTIPS */
	$( document ).tooltip();
	
/* CONTAINERS */
	$($(".container").get().reverse()).each(function(){
		var childs = $(this).children();
		var maxheight = 0;
		for(i=0;i<childs.length;i++){
			if(childs[i].offsetHeight > maxheight){
				maxheight = childs[i].offsetHeight;
			}
		}
		for(i=0;i<childs.length;i++){
			childs[i].style.height = (maxheight - 20)+"px";
		}
	});

/* REMOVE CORNER STYLES */
	/*
	$( ".ui-corner-tl" ).removeClass( "ui-corner-tl" );
	$( ".ui-corner-tr" ).removeClass( "ui-corner-tr" );
	$( ".ui-corner-bl" ).removeClass( "ui-corner-bl" );
	$( ".ui-corner-br" ).removeClass( "ui-corner-br" );
	$( ".ui-corner-top" ).removeClass( "ui-corner-top" );
	$( ".ui-corner-bottom" ).removeClass( "ui-corner-bottom" );
	$( ".ui-corner-right" ).removeClass( "ui-corner-right" );
	$( ".ui-corner-left" ).removeClass( "ui-corner-left" );
	$( ".ui-corner-all" ).removeClass( "ui-corner-all" );
	*/
});