<script type="text/javascript">
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
		aspectRatio:1.8,
		minTime:"08:00:00",
		maxTime:"22:00:00",
		// Este evento es capturado si el usuario hace click en un dia del calendario
		// que no tiene ningun compromiso anotado.
		dayClick: function(fechaCompromiso, allDay, jsEvent, view) 
		{
			/*
			 * Elvira no quiere que se puedan agregar facilmente clases en el cronograma, por
			 * ahora.
			 *
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
					//var startyear = fechaCompromiso.getFullYear();
					//var startday = fechaCompromiso.getDate();
					//var startmonth = fechaCompromiso.getMonth()+1;
					//var starthour = fechaCompromiso.getHours();
					//var startminute = fechaCompromiso.getMinutes();
					//var url = '../../clases/crear_clase/<?php if(isset($curso)) { echo $curso["Curso"]["id"]; } ?>?fecha_clase='+startyear+"-"+startmonth+"-"+startday+"&hora_comienzo="+starthour+":"+startminute+":00";
					var url='../../clases/agregar_clase/<?php if(isset($curso)) { echo $curso["Curso"]["id"]; } ?>';
					window.location.href=url;
					$.post(url, 
						function(data)
						{
							// Ahora recibo el Json y se lo enchufo al calendario como un nuevo evento.
							$('#calendar').fullCalendar('renderEvent',data);
						}, "json");
				}
			}*/
		},
		// Si hacen click en un evento, lo mando a editar el evento.
		eventClick: function(calEvent, jsEvent, view)
		{
			// similar behavior as clicking on a link
			window.location.href = '../../clases/comentarios_clase/'+calEvent.id;
		},
		eventRender: function(event, element) 
		{
			var string;
			var blanco=false;
			// Si la clase esta marcada como no vista por el profesor (event.vista_profesor=0)
			// pintar la clase de blanco.
			if( (typeof event.vista_profesor!=='undefined' && event.vista_profesor==0)
				|| (typeof event.vista_curso!=='undefined' && event.vista_curso==0)
			)
				blanco=true;
			if(event.comentarios==null)
				string=event.codigo_curso+" "+event.inscriptos+" integrantes, "+event.profesor;
			else
				string=event.codigo_curso+" "+event.inscriptos+" integrantes, "+event.profesor+"\n"+event.comentarios;
			// Si la clase es blanco, ponerle un comentario.
			if(blanco && event.vista_profesor==0)
				string=string+"\n"+"El profesor no ve esta clase";
			if(blanco && event.vista_curso==0)
				string=string+"\n"+"Clase fuera del rango de fechas del curso";
        	element.qtip({
        		content: string,
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
    			// Mostrar de blanco si el profesor no ve esta clase.
    			if(blanco)
    			{
    				red=255;
    				green=255;
    				blue=255;
    			}
    			else
    				// Mostrar una clase en gris si esta cancelada.
    				if(event.mostrar_cancelada==1)
    				{
    					red=128;
    					green=128;
    					blue=128;
    				}
    				else
    				{
    					var frequency = .3;
    					red   = Math.sin(frequency*event.curso_id + 0) * 127 + 128;
    					green = Math.sin(frequency*event.curso_id + 2) * 127 + 128;
    					blue  = Math.sin(frequency*event.curso_id + 4) * 127 + 128;
    				} 
    			element.css("background-color",RGB2Color(red,green,blue));
    		}
        },
		eventDragStart: function(event) 
		{
			$(this).qtip("destroy");
		},
		eventDrop: function(event,dayDelta,minuteDelta,allDay,revertFunc) 
		{
			// Si fracasa el movimiento, digamos, si se devuelve un error
			// al editar la clase, hay que llamar a revertFunc.
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
			$.post(url, function(data)
					{
				// No se puede tener una clase posterior a la fecha
				// de fin de curso. Aca se recibe un error y muestro
				// un cartelito.
				if(data!="")
					{
					alert("Error al cambiar fecha: "+data);
					revertFunc();
					}
					});
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
</script>