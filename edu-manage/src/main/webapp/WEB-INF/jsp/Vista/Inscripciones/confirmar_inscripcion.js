$(document).ready(function()
{
	$.datepicker.setDefaults({
		showOn: "both",
		buttonImage: "${pageContext.request.contextPath}/img/cal.gif",
		buttonText: "Calendario"
	});
	// Agrego Datepickers a las fechas de comienzo y fin de curso.
	$("#InscripcionFechaComienzo").datepicker({ dateFormat: "yy-mm-dd" });
	$("#InscripcionFechaFinalizacion").datepicker({ dateFormat: "yy-mm-dd" });
	$('#CursoTipoCurso').change(
			function()
			{
				accionBuscarCursos();
			}
			);
	$('#PersonaIdiomaEstudiarId').change(
			function()
			{
				accionBuscarCursos();
			}
			);
	$('#PersonaNivelId').change(
			function()
			{
				accionBuscarCursos();
			}
			);
	$('#InscripcionCursoId').change(
			function()
			{
				accionBuscarEstado($('#InscripcionCursoId').val());
			}
			);
	/**
	 * Si alguno de los tres desplegables de tipo de curso, idioma a estudiar o nivel
	 * tiene un valor distinto de cero, que vaya y busque
	 * los cursos que cumplan alguna de las condiciones.
	 * @returns
	 */
	function accionBuscarCursos()
	{
		if($("#CursoTipoCurso").val().length!=0
			|| $("#PersonaIdiomaEstudiarId").val().length!=0
			|| $("#PersonaNivelId").val().length!=0 
		)
		{
			buscarCursos();
		}
	}
	/**
	 * Busca el estado del curso y se fija si el estado es A o S, y si es asi, avisar
	 * que se van a agregar cuotas entre las fechas de inscripcion del alumno y de fin
	 * de curso.
	 * @returns
	 */
	function accionBuscarEstado(codigo_curso)
	{
		var url="<?php echo $this->Html->url(array('controller'=>'cursos','action'=>'mostrar_estado_curso')); ?>"+"/"+codigo_curso;
		$.getJSON(url,function(curso)
		{
			if(curso!==null)
			{
				if(curso["Curso"].abierto=="A" || curso["Curso"].abierto=="S")
					$('#CartelInscripcion').html("<h2>Al confirmar esta inscripci&oacute;n, se agregar&aacute;n cuotas a pagar por el estudiante</h2>");
				else
					$("#CartelInscripcion").html("");
			}
		}
		);
	}
	/**
	 * Busca cursos.
	 * @returns
	 */
	function buscarCursos()
	{
		var url="<c:url value='/inscripciones/listar_cursos_confirmar' />";
		$.getJSON(url,
		{
			tipo_curso_id: $("#CursoTipoCurso").val(),
			idioma_estudiar_id: $("#PersonaIdiomaEstudiarId").val(),
			nivel_id: $("#PersonaNivelId").val()
		},
		function(cursos) 
		{
			if(cursos !== null) 
			{
				populateCursosList(cursos);
			}
		});
	}
	/**
	 * Realiza el trabajo sucio de llenar el options del select.
	 * @param clases Tiene un arreglo de Json con todas las clases que hay.
	 * @returns
	 */
	function populateCursosList(cursos)
	{
		var options="";
		$.each(cursos,function(index,curso)
		{
			options+="<option value="+curso.id+">"+curso.codigo_curso+"</option>";
		});
		$('#InscripcionCursoId').html(options);
	}
});