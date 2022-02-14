$(document).ready(function (){

	// Masquer les differents champs au premier vus !!!
	$('#Compagnies,#Num_vol,#classe_autres,#classe_trps,#Num_depart,#Heure_depart,#Heure_arrive,#Duree_vol,#Immatriculation,#Typ_vehicul,#Nm_chauffeur,#Nu_permis').hide();

	// masquer le contenu du champs claase select
	$('#1_clas,#2_clas,#3_clas,#4_clas,#5_clas').hide();

	$("select.selectMoys").change(function(){
		var moyenTransport = $(this).children("option:selected").val();
		// alert(moyenTransport);
		get_input_trs(moyenTransport);

	});	        

	//on init 
	get_input_trs($('.init_transport').val());
});

function get_input_trs(moyenTransport){
	if(moyenTransport == "AVION"){
		$('#Compagnies,#Num_vol,#classe_autres,#Heure_depart,#Heure_arrive,#Duree_vol').show();
		$('#classe_trps,#Num_depart,#Immatriculation,#Typ_vehicul,#Nm_chauffeur,#Nu_permis').hide();
		$('#1_clas,#3_clas,#4_clas,#5_clas').show();
		$("#2_clas").hide();
	}

	if(moyenTransport == "TRANSPORT EN COMMUN"){
		$('#Compagnies,#classe_trps,#Num_depart,#Heure_depart').show();
		$('#Num_vol,#classe_autres,#Heure_arrive,#Duree_vol,#Immatriculation,#Typ_vehicul,#Nm_chauffeur,#Nu_permis').hide();
	}

	if(moyenTransport == "TRAIN"){
		$('#Compagnies,#classe_autres,#Heure_depart,#Heure_arrive,#Duree_vol').show();
		$('#Num_vol,#classe_trps,#Num_depart,#Immatriculation,#Typ_vehicul,#Nm_chauffeur,#Nu_permis').hide();
		$('#1_clas,#2_clas').show();
		$("#3_clas,#4_clas,#5_clas").hide();
	}

	if(moyenTransport == "VEHICULE DE LOCATION"){
		$('#Immatriculation,#Typ_vehicul,#Nm_chauffeur,#Nu_permis').show();
		$('#Compagnies,#Num_vol,#classe_autres,#classe_trps,#Num_depart,#Heure_depart,#Heure_arrive,#Duree_vol').hide();
	}
}