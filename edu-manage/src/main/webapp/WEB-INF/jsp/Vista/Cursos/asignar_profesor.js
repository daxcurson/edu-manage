<script type="text/javascript">
$(document).ready(function() 
{
	// Si el cuadro de dialogo para crear o editar horario esta visible,
	// hay que ir a buscar los honorarios del profesor.
	var profesorSeleccionado=$('#CrearClaseProfesor').val();
	if(profesorSeleccionado!=0)
	{
		buscarHonorariosAsignados(profesorSeleccionado);
	}
});
/**
 * Busca la lista de honorarios asignados a este profesor mediante una llamada Ajax.
 * @param profesorSeleccionado
 * @returns
 */
function buscarHonorariosAsignados(profesorSeleccionado)
{
	var url="${pageContext.request.contextPath}/honorarios/buscar_honorarios_asignados/"+profesorSeleccionado;
	$.getJSON(url,
	{
	},
	function(honorarios)
	{
		if(honorarios!==null)
		{
			populateHonorariosList(honorarios);
		}
	}
	);
}
/**
 * Llena las opciones de honorarios para el profesor.
 * @param honorarios
 * @returns
 */
function populateHonorariosList(honorarios)
{
	var options="";
	$.each(honorarios,function(index,honorario)
	{
		options+="<option value="+honorario.id+">"+honorario.descripcion+"</option>\n";
	}
	);
	$('#CrearClaseHonorario').html(options);
}
</script>