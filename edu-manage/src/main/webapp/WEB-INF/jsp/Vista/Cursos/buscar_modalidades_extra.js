<script type="text/javascript">
$(document).ready(function()
{
	$.datepicker.setDefaults({
		showOn: "both",
		buttonImage: "<?php echo $this->webroot; ?>img/cal.gif",
		buttonText: "Calendario"
		});
	// Agrego Datepickers a las fechas de comienzo y fin de curso.
	$("#CursoFechaComienzo").datepicker({ dateFormat: "yy-mm-dd" });
	$("#CursoFechaFin").datepicker({ dateFormat: "yy-mm-dd" });

	$("#CursoModalidadCursoId").change(function()
	{
		accionBuscarModalidadesCurso();
	}
	);
	accionBuscarModalidadesCurso();
});
/**
 * Lista las modalidades actualmente cargadas en este curso.
 * @param modalidades
 * @returns
 */
function tabla_modalidades(modalidades)
{
	var options="<table>"+
	"<tr><th>Elegir</th><th>Descripci&oacute;n</th><th>Carga horaria</th><th>Duraci&oacute;n cantidad</th><th>Duraci&oacute;n modo</th><th>Precio</th><th>Moneda</th><th>Modalidad</th></tr>";
	$.each(modalidades,function(index,modalidad)
	{
		// El checkbox, si no esta chequeado, ni siquiera es enviado en el request.
		// Como me quiero asegurar que el dato [Curso][ModalidadCurso][modalidad.....] siempre exista,
		// tengo que crear un campo Hidden, como hace el Cakephp, con valor cero.
		options+="<tr>"+
		'<td><input type="hidden" name="data[Curso][ModalidadCurso]['+modalidad["ModalidadCurso"].id+']" id="CursoModalidadCurso'+modalidad["ModalidadCurso"].id+'_" value="0">'+
		'<input type="checkbox" checked name="data[Curso][ModalidadCurso]['+modalidad["ModalidadCurso"].id+']" id="CursoModalidadCurso'+modalidad["ModalidadCurso"].id+'" value="1"></td>'+
		'<td>'+modalidad["ModalidadCurso"].descripcion+'</td>'+
		'<td>'+modalidad["CargaHoraria"].descripcion+'</td>'+
		'<td>'+modalidad["ModalidadCurso"].duracion_cantidad+'</td>'+
		'<td>'+modalidad["DuracionModo"].descripcion+'</td>'+
		'<td>'+modalidad["ModalidadCurso"].precio_unidad_modalidad+'</td>'+
		'<td>'+modalidad["Moneda"].descripcion+'</td>'+
		'<td>'+modalidad["ModalidadPago"].descripcion+'</td>'+
		'</tr>';
		// Si tengo Modalidad Disponible seteada, necesito cargar un campo oculto
		// para que ese valor vuelva al formulario.
		if(typeof modalidad["ModalidadDisponible"] !== "undefined")
		{
			options+='<input type="hidden" name="data[Curso][ModalidadCursoDisponible]['+modalidad['ModalidadCurso'].id+']" value="'+modalidad['ModalidadDisponible'].id+'">';
		}
	}
	);
	options+="</table>";
	$("#ModalidadesDisponibles").html(options);
}
function accionBuscarModalidadesCurso()
{
	if($("#CursoIdiomaEstudiarId").val().length!=0)
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
	var url="<?php echo $this->Html->url(array('controller'=>'modalidad_cursos','action'=>'listar_modalidades_curso'));?>";
	$.getJSON(url,
	{
		idioma_estudiar_id: $("#CursoIdiomaEstudiarId").val()
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
			modalidad["ModalidadCurso"].id+">"+
			modalidad["ModalidadCurso"].descripcion+"-"+
			modalidad['ModalidadCurso'].duracion_cantidad+" "+
			modalidad['DuracionModo'].descripcion+"</option>";
	});
	$('#CursoModalidadCursoId').html(options);
}
</script>