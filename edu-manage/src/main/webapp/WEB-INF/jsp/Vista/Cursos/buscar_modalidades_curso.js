$(document).ready(function()
{
	$.datepicker.setDefaults({
		showOn: "both",
		buttonImage: "${pageContext.request.contextPath}/img/cal.gif",
		buttonText: "Calendario"
		});
	// Agrego Datepickers a las fechas de comienzo y fin de curso.
	$("#CursoFechaComienzo").datepicker({ dateFormat: "yy-mm-dd" });
	$("#CursoFechaFin").datepicker({ dateFormat: "yy-mm-dd" });

	$("#CursoIdiomaEstudiarId").change(function()
	{
		accionBuscarModalidadesCurso();
	}
	);
	$("#CursoTipoCursoId").change(function()
	{
		accionBuscarModalidadesCurso();
	}
	);
	accionBuscarModalidadesCurso();
	$("#CursoSucursalId").change(function()
	{
		accionCambioSucursal();
	}
	);
	accionCambioSucursal();
	$('#BotonAgregarModalidad').click(
			function()
			{
				var url="${pageContext.request.contextPath}/cursos/agregar_modalidad";
				$.getJSON(url,
				{
					modalidad_id_agregar: $("#CursoModalidadCursoId").val()
				},
				function(modalidades)
				{
					if(modalidades!==null)
					{
						tabla_modalidades(modalidades);
					}
				}
				);
			});
	// Apenas llegue, voy a leer las modalidades existentes, si hay.
	buscarModalidadesActuales();
});
/**
 * Busca las modalidades existentes actualmente, si hay, y llena la tabla, igual que como 
 * si fuera a agregar una modalidad nueva.
 * @returns
 */
function buscarModalidadesActuales()
{
	var url="${pageContext.request.contextPath}/cursos/listar_modalidades";
	$.getJSON(url,
	{
	},
	function(modalidades)
	{
		if(modalidades!==null)
		{
			tabla_modalidades(modalidades);
		}
	}
	);
}
/**
 * Lista las modalidades actualmente cargadas en este curso.
 * @param modalidades
 * @returns
 */
function tabla_modalidades(modalidades)
{
	var options='<table class="table">'+
	"<tr><th>Elegir</th><th>Descripci&oacute;n</th><th>Carga horaria</th><th>Duraci&oacute;n cantidad</th><th>Duraci&oacute;n modo</th><th>Precio</th><th>Moneda</th><th>Modalidad</th></tr>";
	$.each(modalidades,function(index,modalidad)
	{
		// El checkbox, si no esta chequeado, ni siquiera es enviado en el request.
		// Como me quiero asegurar que el dato [Curso][ModalidadCurso][modalidad.....] siempre exista,
		// tengo que crear un campo Hidden, como hace el Cakephp, con valor cero.
		options+="<tr>"+
		'<td><input type="hidden" name="data[Curso][ModalidadCurso]['+modalidad.modalidad_curso.id+']" id="CursoModalidadCurso'+modalidad.modalidad_curso.id+'_" value="0">'+
		'<input type="checkbox" checked name="modalidades_elegidas" id="CursoModalidadCurso'+modalidad.modalidad_curso.id+'" value="'+modalidad.modalidad_curso.id+'"></td>'+
		'<td>'+modalidad.modalidad_curso.descripcion+'</td>'+
		'<td>'+modalidad.modalidad_curso.carga_horaria.descripcion+'</td>'+
		'<td>'+modalidad.modalidad_curso.duracion_cantidad+'</td>'+
		'<td>'+modalidad.modalidad_curso.duracion_modo.descripcion+'</td>'+
		'<td>'+modalidad.precio_unidad_modalidad+'</td>'+
		'<td>'+modalidad.moneda.descripcion+'</td>'+
		'<td>'+modalidad.modalidad_curso.modalidad_pago.descripcion+'</td>'+
		'</tr>';
		// Si tengo Modalidad Disponible seteada, necesito cargar un campo oculto
		// para que ese valor vuelva al formulario.
		if(typeof modalidad !== "undefined")
		{
			options+='<input type="hidden" name="data[Curso][ModalidadCursoDisponible]['+modalidad.modalidad_curso.id+']" value="'+modalidad.modalidad_curso.id+'">';
		}
	}
	);
	options+="</table>";
	$("#ModalidadesDisponibles").html(options);
}
function accionBuscarModalidadesCurso()
{
	if($("#CursoIdiomaEstudiarId").val()!=0)
	{
		buscarModalidadesCurso();
	}
}
/**
 * Busca las modalidades de curso que hay, para el idioma seleccionado.
 * @returns
 */
function buscarModalidadesCurso()
{
	var url="${pageContext.request.contextPath}/modalidad_curso/listar_modalidades_curso";
	$.getJSON(url,
	{
		idioma_estudiar_id: $("#CursoIdiomaEstudiarId").val(),
		tipo_curso_id: $("#CursoTipoCursoId").val()
	},
	function(modalidades) 
	{
		if(modalidades !== null) 
		{
			populateModalidadesList(modalidades);
		}
	});
}
/**
 * Llena el select de modalidades con las modalidades traidas segun el idioma
 * que se haya elegido.
 * @param modalidades
 * @returns
 */
function populateModalidadesList(modalidades)
{
	var options="";
	$.each(modalidades,function(index,modalidad)
	{
		options+="<option value="+
			modalidad.id+">"+
			modalidad.descripcion+"-"+
			modalidad.duracion_cantidad+" "+
			modalidad.duracion_modo.descripcion+"</option>";
	});
	$('#CursoModalidadCursoId').html(options);
}
/**
 * Oculta el campo domicilio y lo muestra solamente si la sucursal es domicilio/empresa (id=3).
 * @returns
 */
function accionCambioSucursal()
{
	ocultarCampoDomicilio();
	if($('#CursoSucursalId').val()==3)
	{
		mostrarCampoDomicilio();
	}
}
/**
 * Oculta el campo domicilio
 */
function ocultarCampoDomicilio()
{
	$('#CursoDomicilioClase').hide();
	$('#LabelCursoDomicilioClase').hide();
}
/**
 * Muestra el campo Domicilio.
 */
function mostrarCampoDomicilio()
{
	$('#CursoDomicilioClase').show();
	$('#LabelCursoDomicilioClase').show();
}