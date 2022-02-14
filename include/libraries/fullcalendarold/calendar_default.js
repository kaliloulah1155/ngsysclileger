function getXmlHttpRequestObject() 
{
  if (window.XMLHttpRequest)
  {
    return new XMLHttpRequest();
  } 
  else if (window.ActiveXObject) 
  {
   return new ActiveXObject("Microsoft.XMLHTTP");
  }
  else {
   alert("Seu navegador n�o oferece suporte a elementos XMLHTTPRequest...");
   return;
  }
}
   


/*
/--- enregistrement d'un �v�nement ---/
   nb d'arguments variables:
      1er arg, event.id = N� Doc Poseidon, � la cr�ation = 0
      2�me arg, type doc poseidon
      ensuite s�rie de { code rubrique, valeur rubrique }
      par ex, enregEvent($iNumDoc, 'TYP', 'RUB1', 'val1', 'RUB2', 'val2')
*/
function enregEvent()
{
  var actionReqObject = getXmlHttpRequestObject();
  
  var argv = enregEvent.arguments;
  var argc = argv.length;

  if (actionReqObject.readyState == 4 || actionReqObject.readyState == 0)
  {    
    var szRequete = "../calendar/enreg_event.php?";
    // les 2 premiers arguments sont l'id et le typedoc
    szRequete += "id=" + escape(argv[0]);
    szRequete += "&POS_TYPEDOC=" + escape(argv[1]);
    
    // les autres arguments sont CodeRubrique, ValeurRubrique
    for (var i = 2; i < argc; i++) 
    {
      szRequete += "&POS_VAL_RUB_" + escape(argv[i]);
      i++;
      szRequete += "=";
      szRequete += escape(argv[i]); 
    }    
   // alert(szRequete);
      
      actionReqObject.open("GET", szRequete, false); //ex�cuter la requ�te
      actionReqObject.send(null); // ?
      
    if (actionReqObject.readyState == 4 || actionReqObject.readyState == 0)
    {
    // alert(actionReqObject.responseText);
      
     	var objAction = eval('(' + actionReqObject.responseText + ')');
     	if (objAction.code_retour == 1)
     	{
			alert("Seu evento foi criado com sucesso!");
			return(objAction.iNumDoc);
    	}
     	else if (objAction.code_retour == 2)
     	{
			alert("A modifica��o foi realizada com sucesso!");  
			return(objAction.iNumDoc);      
    	}    	
    	else
    	{
			alert(objAction.msg_erreur);
			return("0"); 
		}
    }
  }
}


/*
/--- suppression d'un �v�nement ---/
   arguments variables:
      eventId = n� doc poseidon
*/
function deleteEvent(eventId) 
{
  if (confirm("Deseja excluir o evento?")) 
  {
    var actionReqObject = getXmlHttpRequestObject();
   
    if (actionReqObject.readyState == 4 || actionReqObject.readyState == 0)
    {    
      var szRequete = "../calendar/delete_event.php?";
      szRequete += "id=" + escape(eventId);
   
      actionReqObject.open("GET", szRequete, false);
      actionReqObject.send(null);
      if (actionReqObject.readyState == 4 || actionReqObject.readyState == 0)
      {
		//alert(actionReqObject.responseText);
       	var objAction = eval('(' + actionReqObject.responseText + ')');
       	if (objAction.code_retour == 1)
       	{
       	  $('#MyCalendar').fullCalendar('removeEvents', eventId);
          alert("O evento foi exclu�do com sucesso!");
      	}
      	else
      	{
         	alert(objAction.msg_erreur);
        }
      }
    }
  }  
}
 
 
 
/*----------------CALENDAR INITIALIZATION----------------*/

$(document).ready(function(){

$('#dialog_events').hide();

// File load events
EventSource = '../calendar/charger_events.php';

	var  MyCalendar = $('#MyCalendar').fullCalendar({
	  //theme: true, //jquery ui theme
	  header: {
         left: 'prev,next today',
         center: 'title',
         right: 'month,agendaWeek,agendaDay'
      },
      firstHour: 0,  // 8h00
      //minTime: '08:00', // d�but d'affichage
      //maxTime: '19:00', // fin d'affichage
	  minTime: '00:00', // d�but d'affichage
      maxTime: '24:00', // fin d'affichage
      defaultEventMinutes : 30, // dafault duration (when not specified end date/hour)
      defaultView : 'agendaWeek',
      ignoreTimezone: false,
      lazyFetching : false,
      selectable: true,
      selectHelper: true,
	  disableResizing: false,
      disableDragging: false,
	  
      events: // load events
      {
        url: EventSource,
		type: "GET",
		dataType: "json",
        cache: false,
        error: function()
        {
            alert('Erro ao recuperar os eventos no banco de dados!');
        },
        success: function(output)
		{ 
			//alert(output);
        }
      },
      
      
	  /* en cliquer sur un jour ou glissant sur une dur�e */
      select: function(start, end, allDay)
      {
         //limpar campos
		 $('#form_events').get(0).reset();
		 
		 /* recup�re d�but et fin de l'�v�nement */
         var DateStart = $.fullCalendar.formatDate(start, "dd/MM/yyyy");
         var DateEnd = $.fullCalendar.formatDate(end, "dd/MM/yyyy");
         var HourStart = $.fullCalendar.formatDate(start, "HH");
         var HourEnd = $.fullCalendar.formatDate(end, "HH");
		 var MinuteStart = $.fullCalendar.formatDate(start, "mm");
         var MinuteEnd = $.fullCalendar.formatDate(end, "mm");
         
         /* faire afficher pour les champs de la fen�tre popup */
         $("#POS_VAL_RUB_DIN_events").val(DateStart);
         $("#POS_VAL_RUB_DFI_events").val(DateEnd);
         $("#POS_VAL_RUB_HIN_events").val(HourStart);
         $("#POS_VAL_RUB_HFI_events").val(HourEnd);
         $("#POS_VAL_RUB_MIN_events").val(MinuteStart);
         $("#POS_VAL_RUB_MFI_events").val(MinuteEnd);
		 //jj/mm/yyyy hh:mm
         
         /* un eventtype fen�tre popup avec id = '#dialog_events' */
         $('#dialog_events').dialog(
         {
            modal: true,
			autoOpen: true,
			title: "Novo Evento",
			close: function()
            {
               $(this).dialog("destroy");
               $(this).hide();
            },
            buttons: 
            {
               "Criar" : function()
               {
                  /* reprendre les valeurs saisies dans fen�tre popup */
                  DateStart = $("#POS_VAL_RUB_DIN_events").val();
                  DateEnd = $("#POS_VAL_RUB_DFI_events").val();
                  HourStart = $("#POS_VAL_RUB_HIN_events").val();
                  HourEnd = $("#POS_VAL_RUB_HFI_events").val();
				  MinuteStart = $("#POS_VAL_RUB_MIN_events").val();
                  MinuteEnd = $("#POS_VAL_RUB_MFI_events").val();
				  var Title = $("#POS_VAL_RUB_NEV_events").val().toUpperCase();
				  var Color = $("#POS_VAL_RUB_COR_events").val();
				  var TxtColor = $("#POS_VAL_RUB_CTX_events").val();
				  var PUP = $("#POS_VAL_RUB_PUP_events").val();
				  var TIV = $("#POS_VAL_RUB_TIV_events").val();

                  var iRetour = enregEvent('0', 'EVT', 'DIN',DateStart, 'DFI',DateEnd, 'HIN',HourStart, 'MIN',MinuteStart, 'MFI', MinuteEnd, 'HFI',HourEnd, 'NEV',Title, 'COR',Color, 'CTX',TxtColor, 'PUP',PUP, 'TIV',TIV);
				
				  // new Date(year, month, day, hour, minute); les parametres sont les num�ros
				  var DatePart = DateStart.split('/');
                  var newstart = new Date(parseInt(DatePart[2],10), parseInt(DatePart[1],10)-1, parseInt(DatePart[0],10), HourStart, MinuteStart).toUTCString();
                  
                  DatePart = DateEnd.split('/');
                  var newend = new Date(parseInt(DatePart[2],10), parseInt(DatePart[1],10)-1, parseInt(DatePart[0],10), HourEnd, MinuteEnd).toUTCString();
				  
				  // atualizar o calend�rio com o novo evento
				  $(".fc-button-next").click();
				  $(".fc-button-prev").click();
                  MyCalendar.fullCalendar('unselect');
                  $(this).dialog("close");
			   },
			   "Cancelar" : function()
               {
				  $(this).dialog("close");
			   }
            }
         });
      },


      eventMouseover: function(event, jsEvent, view)
      {
		/* affichage du contenu d'un �v�nement */
		$('#info_events').empty();
		$('#info_events').fadeIn('500');
		$("#info_events").append("<h3>" + event.title + "</h3>");
		$("#info_events").append("<b>In�cio: </b>" + $.fullCalendar.formatDate(event.start, "dd/MM/yyyy HH:mm") + "<br>");
		$("#info_events").append("<b>T�rmino: </b>" + $.fullCalendar.formatDate(event.end, "dd/MM/yyyy HH:mm") + "<br>");
		$("#info_events").append("<b>Tipo: </b>" + event.TIV + "<br>");
		$("#info_events").append("<b>Status: </b>" + event.STV);
		
		var target = $(this);
		$("#info_events").position({
		   my: 'right',
		   at: 'left',
		   of: target
		});		
	  },

	  eventMouseout: function(event, jsEvent, view)
      {
		$('#info_events').fadeOut('500');
	  },

	  eventClick: function(calEvent, element, view) 
      {
		if (!calEvent.editable) 
		{
		   window.open("../consultation/consulter_index.php?MODE=CONSULTATION&POS_NUM_DOC="+calEvent.id+"&bBlocModif=1,'Evento', 'height=610,width=850,scrollbars=yes,resizable=yes'");
		   return;
		}
		
		var DateStart = $.fullCalendar.formatDate(calEvent.start, "dd/MM/yyyy");
		var DateEnd = $.fullCalendar.formatDate(calEvent.end, "dd/MM/yyyy");
		var HourStart = $.fullCalendar.formatDate(calEvent.start, "HH");
		var HourEnd = $.fullCalendar.formatDate(calEvent.end, "HH");
		var MinuteStart = $.fullCalendar.formatDate(calEvent.start, "mm");
		var MinuteEnd = $.fullCalendar.formatDate(calEvent.end, "mm");
		var Title = calEvent.title;
		var Color = calEvent.color.substr(1);
		var TxtColor = calEvent.textColor.substr(1);
		
		var TIV = calEvent.TIV;
		var PUP = calEvent.PUP;
			if (PUP == 1) $("#PUP_PRIVADO").click();
			if (PUP == 0) $("#PUP_PUBLICO").click();

		//limpar campos
		 $('#form_events').get(0).reset();
		
		$("#POS_VAL_RUB_DIN_events").val(DateStart);
		$("#POS_VAL_RUB_DFI_events").val(DateEnd);
		$("#POS_VAL_RUB_HIN_events").val(HourStart);
		$("#POS_VAL_RUB_HFI_events").val(HourEnd);     
		$("#POS_VAL_RUB_MIN_events").val(MinuteStart);
		$("#POS_VAL_RUB_MFI_events").val(MinuteEnd);
		$("#POS_VAL_RUB_NEV_events").val(Title);
		$("#POS_VAL_RUB_COR_events").val(Color);
		$("#POS_VAL_RUB_CTX_events").val(TxtColor);

		$("#POS_VAL_RUB_TIV_events").val(TIV);
		$("#POS_VAL_RUB_PUP_events").val(PUP);
		
		$('#dialog_events').dialog(
		{
		   modal: true,
		   title: "Modificar Evento",

		   close: function() 
		   {
			  $(this).dialog("destroy");
			  $(this).hide();
		   },
		   buttons: 
		   {
			  "Consultar" : function(){
				 window.open("../consultation/consulter_index.php?MODE=CONSULTATION&POS_NUM_DOC="+calEvent.id+"&bBlocModif=1,'Evento', 'height=610,width=850,scrollbars=yes,resizable=yes'");
			  },

			  "Salvar" : function()
			  {
				 DateStart = $("#POS_VAL_RUB_DIN_events").val();
				 DateEnd = $("#POS_VAL_RUB_DFI_events").val();
				 HourStart = $("#POS_VAL_RUB_HIN_events").val();
				 HourEnd = $("#POS_VAL_RUB_HFI_events").val();
				 MinuteStart = $("#POS_VAL_RUB_MIN_events").val();
				 MinuteEnd = $("#POS_VAL_RUB_MFI_events").val();
				 Title = $("#POS_VAL_RUB_NEV_events").val();
				 Color = $("#POS_VAL_RUB_COR_events").val();
				 TxtColor = $("#POS_VAL_RUB_CTX_events").val();
				 
				 TIV = $("#POS_VAL_RUB_TIV_events").val();
				 PUP = $("#POS_VAL_RUB_PUP_events").val();
				 
				 
				 var DatePart = DateStart.split('/');
				 start = new Date(parseInt(DatePart[2],10), parseInt(DatePart[1],10)-1, parseInt(DatePart[0],10), HourStart, MinuteStart);
				 
				 DatePart = DateEnd.split('/');
				 end = new Date(parseInt(DatePart[2],10), parseInt(DatePart[1],10)-1, parseInt(DatePart[0],10), HourEnd, MinuteEnd);
				/*                                           
				 calEvent.start = $.fullCalendar.parseDate(start.toUTCString());
				 calEvent.end = $.fullCalendar.parseDate(end.toUTCString());
				*/
				calEvent.start = $.fullCalendar.parseDate(start);
				calEvent.end = $.fullCalendar.parseDate(end);
				calEvent.title=Title;
				calEvent.color=Color;
				calEvent.color=TxtColor;
				calEvent.TIV=TIV;
				calEvent.PUP=PUP;
				
				 
				 /* mise � jour les dates et les contenus alors de la modification */
				 var iRetour = enregEvent(calEvent.id, 'EVT', 'DIN',DateStart, 'DFI',DateEnd, 'HIN',HourStart, 'HFI',HourEnd, 'MIN',MinuteStart, 'MFI',MinuteEnd, 'NEV',Title, 'COR',Color, 'CTX',TxtColor, 'TIV',TIV, 'PUP',PUP);
				 
				 if (iRetour != 0)    
				 {
					MyCalendar.fullCalendar('updateEvent', calEvent);                 
				 } 
				 
				 $(this).dialog("close");
			  },
			  
			  "Excluir" : function()
			  {
				 deleteEvent(calEvent.id);
				 $(this).dialog("close");
			  },
			  
			  "Cancelar" : function()
               {
				  $(this).dialog("close");
			   }
		   }
		});        
      },
      
      /* ajuster la dur�e d'un �v�nement existant */
      eventResize: function(event, dayDelta, minuteDelta, revertFunc)
      { 
         if (!event.editable) 
         {
           revertFunc();
           return;
         }
         
         if (dayDelta || minuteDelta)
         {
            if (!confirm("Confirmar a mudan�a na dura��o do evento?"))
            {
               revertFunc();
            }
            else
            {
               DateStart = $.fullCalendar.formatDate(event.start, "dd/MM/yyyy");
               DateEnd = $.fullCalendar.formatDate(event.end, "dd/MM/yyyy");
               HourStart = $.fullCalendar.formatDate(event.start, "HH");
               HourEnd = $.fullCalendar.formatDate(event.end, "HH");
			   MinuteStart = $.fullCalendar.formatDate(event.start, "mm");
               MinuteEnd = $.fullCalendar.formatDate(event.end, "mm");

               /* mise � jour seulement les dates */
               iRetour = enregEvent(event.id, 'EVT', 'DIN',DateStart, 'DFI',DateEnd, 'HIN',HourStart, 'HFI',HourEnd, 'MIN',MinuteStart, 'MFI',MinuteEnd);
               
               if (iRetour != 0)
               {
                  MyCalendar.fullCalendar('updateEvent', event);
               }
               else
               {
                  revertFunc();
               }
            }
         }  
      },


	  eventDrop: function(event,dayDelta,minuteDelta,allDay,revertFunc) {

        if (!confirm("Confirma as modifica��es do evento?")) {
            revertFunc();
        }
		else {
			DateStart = $.fullCalendar.formatDate(event.start, "dd/MM/yyyy");
            DateEnd = $.fullCalendar.formatDate(event.end, "dd/MM/yyyy");
            HourStart = $.fullCalendar.formatDate(event.start, "HH");
            HourEnd = $.fullCalendar.formatDate(event.end, "HH");
			MinuteStart = $.fullCalendar.formatDate(event.start, "mm");
            MinuteEnd = $.fullCalendar.formatDate(event.end, "mm");
               
            /* mise � jour seulement les dates */
            iRetour = enregEvent(event.id, 'EVT', 'DIN',DateStart, 'DFI',DateEnd, 'HIN',HourStart, 'HFI',HourEnd, 'MIN',MinuteStart, 'MFI',MinuteEnd);
               
			if (iRetour != 0)     
            {
                MyCalendar.fullCalendar('updateEvent', event);
            }
            else
            {
                revertFunc();
            }
		}
      },
	
	
	  loading: function(bool)
      {
         if (bool) 
            $('#loading_events').show();
		 else 
			$('#loading_events').hide();
	  }
	});
   
});