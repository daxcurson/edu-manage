function RGB2Color(r,g,b)
{
  return '#' + byte2Hex(r) + byte2Hex(g) + byte2Hex(b);
}
function byte2Hex(n)
{
  var nybHexString = "0123456789ABCDEF";
  return String(nybHexString.substr((n >> 4) & 0x0F,1)) + nybHexString.substr(n & 0x0F,1);
}
$(document).ready(function() {

    // page is now ready, initialize the calendar...

	$('#calendar').fullCalendar({
		editable: true,
		defaultView: 'agendaWeek',
		minTime:8,
		maxTime:22,
		// Este evento es capturado si el usuario hace click en un dia del calendario
		// que no tiene ningun compromiso anotado.
		dayClick: function(fechaCompromiso, allDay, jsEvent, view) 
		{
			// Si hace click en allDay, la parte de arriba, ignoramos silenciosamente el evento.
			if (allDay) 
			{
				//alert('Clicked on the entire day: ' + date);
			}
			else
			{
				var resp=confirm("Desea agregar una clase?");
				if(resp)
				{
					// En cambio, si hace click aqu�, mandamos un mensaje para crear un nuevo compromiso
					// en el calendario.
					//alert('Clicked on the slot: ' + date);
					var startyear = fechaCompromiso.getFullYear();
					var startday = fechaCompromiso.getDate();
					var startmonth = fechaCompromiso.getMonth()+1;
					var starthour = fechaCompromiso.getHours();
					var startminute = fechaCompromiso.getMinutes();
					var url = '../../clases/crear_clase/<?php if(isset($curso)) { echo $curso["Curso"]["id"]; } ?>?fecha_clase='+startyear+"-"+startmonth+"-"+startday+"&hora_comienzo="+starthour+":"+startminute+":00";
					$.post(url, 
						function(data)
						{
							// Ahora recibo el Json y se lo enchufo al calendario como un nuevo evento.
							$('#calendar').fullCalendar('renderEvent',data);
						}, "json");
				}
			}
			//alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);
			//alert('Current view: ' + view.name);

		},
		// Si hacen click en un evento, lo mando a editar el evento.
		eventClick: function(calEvent, jsEvent, view)
		{
			// similar behavior as clicking on a link
			window.location.href = '../../clases/comentarios_clase/'+calEvent.id;
		},
		eventRender: function(event, element) 
		{
        	element.qtip({
				content: event.codigo_curso+" "+event.comentarios,
				position: { 
					target: 'mouse',
					adjust: {
						x: 10,
						y: -5
					}
				},
				style: {
					name: 'light',
					tip: 'leftTop'
				}
        	});
 		   /*
    		 * Para no hacer mucho lio con este javascript, le voy a introducir este callback
    		 * para cambiarle el color al evento con una cuenta segun el codigo de curso.
    		 */
    		if(!event.allDay)
    		{
    			var frequency = .3;
   		   		red   = Math.sin(frequency*event.curso_id + 0) * 127 + 128;
   		   		green = Math.sin(frequency*event.curso_id + 2) * 127 + 128;
   		   		blue  = Math.sin(frequency*event.curso_id + 4) * 127 + 128;
   		   		var block = $(element).find(".fc-event-skin"); 
   		   		block.css("background-color",RGB2Color(red,green,blue));
    		}
        },
		eventDragStart: function(event) 
		{
			$(this).qtip("destroy");
		},
		eventDrop: function(event) 
		{
			var startdate = new Date(event.start);
			var startyear = startdate.getFullYear();
			var startday = startdate.getDate();
			var startmonth = startdate.getMonth()+1;
			var starthour = startdate.getHours();
			var startminute = startdate.getMinutes();
			var enddate = new Date(event.end);
			var endyear = enddate.getFullYear();
			var endday = enddate.getDate();
			var endmonth = enddate.getMonth()+1;
			var endhour = enddate.getHours();
			var endminute = enddate.getMinutes();
			var url = '../../clases/editar_clase/'+event.id+"?fecha_clase="+startyear+"-"+startmonth+"-"+startday+"&hora_comienzo="+starthour+":"+startminute+":00&hora_fin="+endhour+":"+endminute+":00";
			$.post(url, function(data){});
		},
		eventResizeStart: function(event) {
			$(this).qtip("destroy");
		},
		eventResize: function(event) 
		{
			var startdate = new Date(event.start);
			var startyear = startdate.getFullYear();
			var startday = startdate.getDate();
			var startmonth = startdate.getMonth()+1;
			var starthour = startdate.getHours();
			var startminute = startdate.getMinutes();
			var enddate = new Date(event.end);
			var endyear = enddate.getFullYear();
			var endday = enddate.getDate();
			var endmonth = enddate.getMonth()+1;
			var endhour = enddate.getHours();
			var endminute = enddate.getMinutes();
			var url = '../../clases/editar_clase/'+event.id+"?fecha_clase="+startyear+"-"+startmonth+"-"+startday+"&hora_comienzo="+starthour+":"+startminute+":00&hora_fin="+endhour+":"+endminute+":00";
			$.post(url, function(data){});
		},
    	eventSources: [
    	               {
    	            	   url: '../../configuracion/feriados',
    	            	   color: 'yellow',   // an option!
    	            	   textColor: 'black' // an option!
    	               },
    	               {
    	            	   url: '<?php echo $url_calendario; ?>',
    	            	   color: 'red',   // an option!
    	            	   textColor: 'black' // an option!
    	               }
    	               ]
    })

});