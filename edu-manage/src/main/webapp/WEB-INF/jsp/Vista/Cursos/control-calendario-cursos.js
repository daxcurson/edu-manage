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
	var weekday = new Array(7);
	weekday[0]=  "Sunday";
	weekday[1] = "Monday";
	weekday[2] = "Tuesday";
	weekday[3] = "Wednesday";
	weekday[4] = "Thursday";
	weekday[5] = "Friday";
	weekday[6] = "Saturday";
	var calendario=$('#calendario');

	$('#DialogoCrearClase').dialog({
		position: {my: "top", at: "top", of: calendario},
		autoOpen: false, 
		modal: true,
		buttons: [
		{
			text:"Crear clase",
			click: function()
			{
				calendarioClick();
				$('#DialogoCrearClase').dialog('close');
			}
		},
		{
			text:"Cancelar",
			click: function()
			{
				// Cancelar cierra sin hacer nada.
				$('#DialogoCrearClase').dialog('close');
			}
		}
		]
	});

	$('#DialogoEditarClase').dialog({ 
		position: {my: "top", at: "top", of: calendario},
		autoOpen: false, 
		modal: true,
		buttons: [
		{
			text:"Editar clase",
			click: function() 
			{
				editarClase();
			}
		},
		{
			text:"Borrar clase",
			click:function()
			{
				borrarClase();
			}
		},
		{
			text:"Cancelar",
			click: function()
			{
				// Cancelar cierra sin hacer nada.
				$('#DialogoEditarClase').dialog('close');
			}
		}
		]
	});

	$('#ProfesorPerfilProfesorId').change(
			function()
			{
				accionCambioPerfil();
			}
	);
	accionCambioPerfil();

	$('#ProfesorModificarHorario').change(
			function()
			{
				accionCambioModificarHorario();
			}
	);
	accionCambioModificarHorario();

	$('#calendario').fullCalendar({
		header:false,
		editable: true,
		defaultView: 'agendaWeek',
		minTime:"08:00:00",
		maxTime:"22:00:00",
		hiddenDays:[0],
		aspectRatio:1.5,
		allDaySlot:false,
		renderDates:false,
		// Este evento es capturado si el usuario hace click en un dia del calendario
		// que no tiene ningun compromiso anotado.
		dayClick: function(fechaCompromiso, allDay, jsEvent, view) 
		{
			// Aca le pasamos informacion a los input box del dialogo para que reciban la fecha
			// y hora del evento.
			// En un text muestro el dia de la semana, y en un hidden guardo la fecha exacta,
			// para que despues el php determine que dia de la semana es para guardar
			// en la variable de sesion y crear la clase.
			$('#CrearClaseDiaSemana').val(weekday[fechaCompromiso.format("E")]); // ISO weekday
			$('#CrearClaseFecha').val(fechaCompromiso.format("YYYY-MM-DD"));
			$('#CrearClaseHoraDesde').val(fechaCompromiso.format("HH:mm"));
			
			// Voy a blanquear las horas hasta y minutos hasta, para que no confunda y quede
			// grabado lo de otra vez.
			$('#CrearClaseHoraHasta').val(0);
			// Voy a preguntar si quiere repetir esta clase en otro dia de la semana.
			// Y voy a ocultar el dia actual, no sea que despues haga 2 compromisos encimados,
			// jajaja. Tengo que mostrar todos y despues ocultar el que necesito!!!
			$('.diaSemana').each(
			function()
			{
				$(this).show();
			}
			);
			$('#Fila'+weekday[fechaCompromiso.format("E")]).hide();
			$('#DialogoCrearClase').dialog("open");
		},
		// Si hacen click en un evento, lo mando a editar el evento.
		eventClick: function(calEvent, jsEvent, view)
		{
			// Editar o borrar este evento!!
			// Cargo en el dialogo las variables que necesito.
			$('#EditarClaseDiaSemana').val(weekday[calEvent.start.format("E")]); // ISO weekday
			$('#EditarClaseFecha').val(calEvent.start.format("YYYY-MM-DD"));
			$('#EditarClaseId').val(calEvent.id)
			$('#EditarClaseHoraDesde').val(calEvent.start.format("HH:mm"));
			$('#EditarClaseHoraHasta').val(calEvent.end.format("HH:mm"));
			$('#DialogoEditarClase').dialog('open');
		},
		eventRender: function(event, element) 
		{
			var string=""; // Por ahora el tip va a estar en blanco.
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
        },
		eventDragStart: function(event) 
		{
			$(this).qtip("destroy");
		},
		eventDrop: function(calEvent,delta,revertFunc) 
		{
			// Arrastro el item y lo suelto: uso el evento para buscar 
			// los nuevos dia y hora, y lo paso a la funcion de editar.
			var fecha=calEvent.start.format("YYYY-MM-DD");
			var dia_semana=calEvent.start.format("E");
			var id=calEvent.id;
			var horaIni=calEvent.start.format("HH:mm");
			var horaFin=calEvent.end.format("HH:mm");
			editarClase(id,fecha,dia_semana,horaIni,horaFin);
			$('#calendario').fullCalendar('refetchEvents');
		},
		eventResizeStart: function(event) 
		{
		},
		eventResize: function(calEvent,delta,revertFunc) 
		{
			// Arrastro el item y lo suelto: uso el evento para buscar 
			// los nuevos dia y hora, y lo paso a la funcion de editar.
			var fecha=calEvent.start.format("YYYY-MM-DD");
			var dia_semana=calEvent.start.format("E");
			var id=calEvent.id;
			var horaIni=calEvent.start.format("HH:mm");
			var horaFin=calEvent.end.format("HH:mm");
			editarClase(id,fecha,dia_semana,horaIni,horaFin);
			$('#calendario').fullCalendar('refetchEvents');
		},
    	eventSources: [
    	               {
    	            	   url: '${pageContext.request.contextPath}/configuracion/feriados',
    	            	   color: 'yellow',   // an option!
    	            	   textColor: 'black' // an option!
    	               },
    	               {
    	            	   url: '${pageContext.request.contextPath}/cursos/listar_clases_curso/${curso.id}',
    	            	   color: 'red',   // an option!
    	            	   textColor: 'black' // an option!
    	               }
    	               ]
    });
    $('#DialogoEditarClase').dialog({ 
		position: {my: "top", at: "top", of: calendario},
		autoOpen: false, 
		modal: true,
		buttons: [
		{
			text:"Editar clase",
			click: function() 
			{
				var dia_semana=$('#EditarClaseDiaSemana').val();
				var fecha=$('#EditarClaseFecha').val();
				var id=$('#EditarClaseId').val()
				var horaIni=$('#EditarClaseHoraDesde').val();
				var horaFin=$('#EditarClaseHoraHasta').val();
				editarClase(id,fecha,dia_semana,horaIni,horaFin);
			}
		},
		{
			text:"Borrar clase",
			click:function()
			{
				borrarClase();
			}
		},
		{
			text:"Cancelar",
			click: function()
			{
				// Cancelar cierra sin hacer nada.
				$('#DialogoEditarClase').dialog('close');
			}
		}
		]
	});
    $('#DialogoCrearClase').dialog({
		position: {my: "top", at: "top", of: calendario},
		autoOpen: false, 
		modal: true,
		buttons: [
		{
			text:"Crear clase",
			click: function() 
			{
				calendarioClick();
				$('#DialogoCrearClase').dialog('close');
			}
		},
		{
			text:"Cancelar",
			click: function()
			{
				// Cancelar cierra sin hacer nada.
				$('#DialogoCrearClase').dialog('close');
			}
		}
		]
	});
});
function calendarioClick()
{
	var horaIni=$("#CrearClaseHoraDesde").val();
	var horaFin=$("#CrearClaseHoraHasta").val();
	var fecha=$("#CrearClaseFecha").val();
	var dia_semana=$("#CrearClaseDiaSemana").val();
	// De los dias que se repite el evento, tengo que crear un array.
	var dias_repetir=[];
	var weekday = new Array(7);
	//weekday[0]=  "Sunday";
	weekday[1] = "Monday";
	weekday[2] = "Tuesday";
	weekday[3] = "Wednesday";
	weekday[4] = "Thursday";
	weekday[5] = "Friday";
	weekday[6] = "Saturday";
	for(var i=1;i<weekday.length;i++)
	{
		if($('#AsignacionRepetir'+weekday[i]).is(':checked'))
			dias_repetir.push(weekday[i]);
	}
	crearDia(fecha,dia_semana,horaIni,horaFin,dias_repetir,$('#AsignacionCrearProfesorId').val(),$('#Profesor2Honorario').val(),$('#Profesor2PrecioHoraProfesor').val(),$('#Profesor2MonedaId').val(),$('#CrearClaseSucursal').val());
}
/**
 * A partir de la fecha que se hizo click en el calendario, mandar un post para guardar
 * en variable de sesion y recoger el evento para mandar al calendario.
 * @param dia dia, en el calendario, cuya fecha en realidad se ignora y se queda solamente con
 * el dia de semana que es..
 * @param horaIni hora para crear la clase.
 * @param horaFin
 * @param dias_repetir array que contiene en que dias tengo que repetir el compromiso.
 * @returns
 */
function crearDia(fecha,dia_semana,horaIni,horaFin,dias_repetir,profesor_id,honorario_id,precio_por_hora,moneda_id,sucursal)
{
	// Tengo que validar los datos del dialogo, asegurarme que esten completos,
	// y luego ir a agregar el evento.
	
	// vamos a generar un dialogo donde se pregunta la hora de fin, porque con el click
	// viene la hora de comienzo del compromiso.
	// Y ademas, datos fundamentales!! Tenemos que pasar profesor, precio de la clase, moneda,
	// todo!!!
	var url="${pageContext.request.contextPath}/cursos/agregar_clase_cronograma/${curso.id}";
	$.post(url, {
		"fecha": fecha,
		"dia_semana": dia_semana,
		"hora_inicio": horaIni,
		"hora_fin": horaFin,
		"dias_repetir":dias_repetir,
		"profesor_id":profesor_id,
		"honorario_id":honorario_id,
		"precio_por_hora":precio_por_hora,
		"moneda_id":moneda_id,
		"sucursal":sucursal
	},
	function(data)
	{
		// Decido que al agregar un nuevo evento, lo agrego a una variable de sesion, y hago
		// que el calendario relea los eventos. Al releer, va a ir a su event source, que
		// es una funcion que le devuelve la lista de eventos guardada en esa variable de sesion.
		$('#calendario').fullCalendar('refetchEvents');
		// Data tiene el valor de respuesta. Si comienza con la palabra error,
		// hacer un alert de esto.
		if(data.startsWith("Error"))
			alert(data);
	}); //,"json");
}
/**
 * Edita una clase
 * @returns
 */
function editarClase(id,fecha,dia_semana,horaIni,horaFin)
{
	var url="${pageContext.request.contextPath}/cursos/editar_clase_cronograma/${curso.id}";
	$.post(url, {
		"calendar_id": id,
		"fecha": fecha,
		"dia_semana": dia_semana,
		"hora_ini": horaIni,
		"hora_fin": horaFin,
	},
	function(data)
	{
		// Decido que al agregar un nuevo evento, lo agrego a una variable de sesion, y hago
		// que el calendario relea los eventos. Al releer, va a ir a su event source, que
		// es una funcion que le devuelve la lista de eventos guardada en esa variable de sesion.
		$('#calendario').fullCalendar('refetchEvents');
	},"json");
	$('#DialogoEditarClase').dialog('close');
}
/**
 * Borra una clase
 * @returns
 */
function borrarClase()
{
	var url="${pageContext.request.contextPath}/cursos/borrar_clase_cronograma/${curso.id}";
	var id=$("#EditarClaseId").val();
	$.post(url, {
		"calendar_id":id
	},
	function(data)
	{
		// Decido que al agregar un nuevo evento, lo agrego a una variable de sesion, y hago
		// que el calendario relea los eventos. Al releer, va a ir a su event source, que
		// es una funcion que le devuelve la lista de eventos guardada en esa variable de sesion.
		//$('#HorarioProfesorEmpleado').fullCalendar('renderEvent',data);
		$('#calendario').fullCalendar('refetchEvents');
	},"json");
	$('#DialogoEditarClase').dialog('close');
}
function accionCambioModificarHorario()
{
	if($('#ProfesorModificarHorario').is(":checked"))
	{
		$('#ProfesorFechaCambio').show();
		$('#LabelFechaCambio').show();
	}
	else
	{
		$('#ProfesorFechaCambio').hide();
		$('#LabelFechaCambio').hide();
	}
}
/**
 * Si cambia el perfil, me fijo si es Freelance o fijo. Si es fijo, muestro los campos
 * de salario.
 * @returns
 */
function accionCambioPerfil()
{
	if($('#ProfesorPerfilProfesorId').val()==2)
	{
		mostrarCamposSueldo();
	}
	else
		ocultarCamposSueldo();
}
/**
 * Oculta los campos de sueldo
 */
function ocultarCamposSueldo()
{
	$('#CamposSueldo').hide();
}
/**
 * Muestra los campos de sueldo
 */
function mostrarCamposSueldo()
{
	$('#CamposSueldo').show();
	// Hay que obligar al calendario a mostrarse!
	$('#HorarioProfesorEmpleado').fullCalendar('render');
}
/**
 * Busca en el sistema el precio por hora asignado al profesor.
 * @param formulario indica si es CrearClase o EditarClase.
 * @returns
 */
function buscar_precio(formulario)
{
	// Por ahora no hago nada, faltan funciones.
}
</script>