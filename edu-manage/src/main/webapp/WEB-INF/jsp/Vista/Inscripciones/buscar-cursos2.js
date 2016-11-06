<script type="text/javascript">
$(document).ready(function()
{
	$.datepicker.setDefaults({
		showOn: "both",
		buttonImage: "${pageContext.request.contextPath}/img/cal.gif",
		buttonText: "Calendario"
		});
	$("#PersonaFechaNacimiento").datepicker({ dateFormat: "yy-mm-dd" });
	$("#InscripcionFechaComienzo").datepicker({ dateFormat: "yy-mm-dd" });
	$("#InscripcionFechaFinalizacion").datepicker({ dateFormat: "yy-mm-dd" });
	$("#InscripcionFechaComienzo").change(
	function()
	{
		$("#InscripcionIndividualFechaEstimadaComienzo").val($("#InscripcionFechaComienzo").val());
	}
	);

	$('#PersonaFechaNacimiento').change(function()
	{
		cambioEdadPersona();
	});

	/*
	 * Por si viene el valor de la edad de la persona, reaccionar aca ante el cambio.
	 */
	cambioEdadPersona();

	$('#PersonaComoSupoId').change(function()
	{
		cambiarPersonaComoSupoId();
	});
	/*
	 * Por si viene el valor de comoSupoId
	 */
	cambiarPersonaComoSupoId();
	
	/*
	 * Seleccion del tipo de curso. Si es grupal o individual, muestra el cuadro de cursos
	 * y el tilde para lista de espera. Luego se controla los cambios de IdiomaEstudiarId y NivelId
	 * para ir a buscar la lista de cursos.
	 */
	$('#CursoTipoCurso').change(function()
	{
		accionBuscarCursos();
		accionCuadroSeleccionCursos();
		accionMostrarCamposIndividuales();
		accionInscripcionIndividualIdiomaEstudiarId();
		accionInscripcionCursoEspanol();
	});
	accionCuadroSeleccionCursos();
	accionMostrarCamposIndividuales();
	$('#PersonaIdiomaEstudiarId').change(function()
	{
		accionBuscarCursos();
		accionInscripcionCursoEspanol();
		accionInscripcionCursoIngles();
	});
	accionInscripcionCursoIngles();
	$('#PersonaNivelId').change(function()
	{
		accionBuscarCursos();
	}
	);
	accionBuscarCursos();
	$('#InscripcionIndividualOrientacionId').change(function()
	{
		accionOrientacionId();
	});
	accionOrientacionId();
	$('#InscripcionIndividualIdiomaEstudiarId').change(function()
	{
		accionInscripcionIndividualIdiomaEstudiarId();
		accionInscripcionCursoEspanol();
	});
	accionInscripcionIndividualIdiomaEstudiarId();
	accionInscripcionCursoEspanol();
	/*
	 * #79 - Agregar nivel que el estudiante cree que tiene.
	 */
	$('#PersonaHizoTestNivel').change(function()
	{
		accionMostrarCampoNivel();
	});
	accionMostrarCampoNivel();
	/**
	 * Previene inscribir 2 veces el mismo alumno deshabilitando el boton de submit apenas
	 * se recibe el formulario (#241)
	 */
	$(this).submit(function(e)
	{
		$('input[type=submit]', this).attr('disabled', 'true').val("Por favor espere");
	});
});

/**
 * Si la persona selecciono que no hizo el test de nivel, preguntarle el nivel que cree que tiene.
 * @returns
 */
function accionMostrarCampoNivel()
{
	ocultarCampoNivelSupuesto();
	if($('#PersonaHizoTestNivel').val()=="N")
		mostrarCampoNivelSupuesto();
}

/**
 * Oculta el campo de nivel supuesto.
 * @returns
 */
function ocultarCampoNivelSupuesto()
{
	$('#LabelNivelSupuestoEstudianteId').hide();
	$('#PersonaNivelSupuestoEstudianteId').hide();
}

/**
 * Muestra el campo de nivel supuesto.
 * @returns
 */
function mostrarCampoNivelSupuesto()
{
	$('#LabelNivelSupuestoEstudianteId').show();
	$('#PersonaNivelSupuestoEstudianteId').show();
}

/**
 * Si la orientacion es Exam, preguntar que examen. Si la orientacion es otros, preguntar
 * cual orientacion. 
 * @returns
 */
function accionOrientacionId()
{
	ocultarCamposExamen();
	if($('#InscripcionIndividualOrientacionId').val()==3)
	{
		mostrarCamposExamen();
	}
	ocultarCamposOtraOrientacion();
	if($('#InscripcionIndividualOrientacionId').val()==5)
	{
		mostrarCamposOtraOrientacion();
	}
}
/**
 * Oculta los campos de otra orientacion.
 * @returns
 */
function ocultarCamposOtraOrientacion()
{
	$('#LabelOtraOrientacion').hide();
	$('#InscripcionIndividualOtraOrientacion').hide();
}
/**
 * muestra los campos de otra orientacion.
 * @returns
 */
function mostrarCamposOtraOrientacion()
{
	$('#LabelOtraOrientacion').show();
	$('#InscripcionIndividualOtraOrientacion').show();
}
/**
 * Oculta los campos de examen.
 * @returns
 */
function ocultarCamposExamen()
{
	$('#LabelExamen').hide();
	$('#InscripcionIndividualCualExamen').hide();
}
/**
 * Muestra los campos de examen
 * @returns
 */
function mostrarCamposExamen()
{
	$('#LabelExamen').show();
	$('#InscripcionIndividualCualExamen').show();
}
/**
 * Si la persona quiere el idioma ingles, mostrar el link para el test de nivel de ingles.
 * @returns
 */
function accionInscripcionCursoIngles()
{
	ocultarLinkTestNivelIngles();
	if($('#PersonaIdiomaEstudiarId').val()==1) // si quiere estudiar ingles,
	{
		mostrarLinkTestNivelIngles();
	}
}
/**
 * Si el idioma estudiar de la inscripcion individual es Otros, mostrar el campo de materia y nivel.
 * Si no es Otros, y hay algo seleccionado, mostrar el campo Nivel Id. Si quiere estudiar
 * ingles, hay que pedir que variante quiere, y si quiere tomar el test de nivel.
 * @returns
 */
function accionInscripcionIndividualIdiomaEstudiarId()
{
	// Todo este chiste tiene sentido solamente si el campo
	// InscripcionIndividualIdiomaEstudiarId es visible.
	ocultarCamposMateriaNivel();
	ocultarCamposInscripcionIndividualNivelId();
	ocultarCamposVarianteIngles();
	ocultarLinkTestNivelIngles();
	if($('#InscripcionIndividualIdiomaEstudiarId').is(':visible'))
	{
		if($('#InscripcionIndividualIdiomaEstudiarId').val()=="0")
		{
			mostrarCamposMateriaNivel();
		}
		else
			if($('#InscripcionIndividualIdiomaEstudiarId').val().length!=0)
			{
				mostrarCamposInscripcionIndividualNivelId();
			}
		if($('#InscripcionIndividualIdiomaEstudiarId').val()==1) // si quiere estudiar ingles,
		{
			mostrarCamposVarianteIngles();
			mostrarLinkTestNivelIngles();
		}
	}
}

/**
 * Oculta el link de test de nivel de ingles.
 * @returns
 */
function ocultarLinkTestNivelIngles()
{
	$('#LinkTestNivelIngles').hide();
}
function mostrarLinkTestNivelIngles()
{
	$('#LinkTestNivelIngles').show();
}
/**
 * Oculta los campos de inscripcion individual idioma id
 * @returns
 */
function ocultarCamposInscripcionIndividualNivelId()
{
	$('#LabelNivelId').hide();
	$('#InscripcionIndividualNivelId').hide();
}
/**
 * Muestra los campos de inscripcion individual idioma id
 * @returns
 */
function mostrarCamposInscripcionIndividualNivelId()
{
	$('#LabelNivelId').show();
	$('#InscripcionIndividualNivelId').show();
}
/**
 * Oculta los campos para elegir la variante de ingles, y la orientacion
 * (que segun Clo es un campo solamente para ingles)
 * @returns
 */
function ocultarCamposVarianteIngles()
{
	$('#LabelVariante').hide();
	$('#InscripcionIndividualPreferenciaIdioma').hide();
	$('#LabelOrientacionId').hide();
	$('#InscripcionIndividualOrientacionId').hide();
}
/**
 * Muestra los campos para elegir la variante de ingles y la orientacion
 * (que segun Clo es un campo solamente para ingles)
 * @returns
 */
function mostrarCamposVarianteIngles()
{
	$('#LabelVariante').show();
	$('#InscripcionIndividualPreferenciaIdioma').show();
	$('#LabelOrientacionId').show();
	$('#InscripcionIndividualOrientacionId').show();
}
/**
 * Muestra los campos de materia y nivel
 * @returns
 */
function ocultarCamposMateriaNivel()
{
	$('#LabelMateria').hide();
	$('#InscripcionIndividualMateria').hide();
	$('#LabelNivel').hide();
	$('#InscripcionIndividualNivel').hide();
}
/**
 * Oculta los campos de materia y nivel
 * @returns
 */
function mostrarCamposMateriaNivel()
{
	$('#LabelMateria').show();
	$('#InscripcionIndividualMateria').show();
	$('#LabelNivel').show();
	$('#InscripcionIndividualNivel').show();
}
/**
 * Decide si muestra los campos individuales.
 * #113 - tipos de curso para gente en lista de espera. No hay que mostrar todos los campos
 * de curso en lista de espera, solamente algunos. Hay una accion de lista de espera aparte. 
 * @returns
 */
function accionMostrarCamposIndividuales()
{
	ocultarCamposIndividuales();
	var cursoTipoCurso=$('#CursoTipoCurso').val();
	if(cursoTipoCurso==1 || cursoTipoCurso==3)
	{
		mostrarCamposIndividuales();
	}
}
/**
 * Muestra los campos individuales.
 * @returns
 */
function mostrarCamposIndividuales()
{
	$('#LabelClaseCursoId').show();
	$('#InscripcionIndividualClaseCursoId').show();
	$('#LabelSucursalId').show();
	$('#InscripcionIndividualSucursalId').show();
	$('#LabelIdiomaEstudiar').show();
	$('#InscripcionIndividualIdiomaEstudiarId').show();		
	$('#LabelClasesSemanales').show();
	$('#InscripcionIndividualClasesSemanales').show();
	$('#LabelHorasClase').show();
	$('#InscripcionIndividualHorasClase').show();
	$('#LabelFechaEstimadaComienzo').show();
	$('#LabelDiasPreferidos').show();
	$('#InscripcionIndividualFechaEstimadaComienzo').show();
	$('#InscripcionIndividualDiasPreferidos').show();
	$('#LabelHorarioPreferido').show();
	$('#InscripcionIndividualHorarioPreferido').show();
	$('#LabelDiasAlternativos').show();
	$('#InscripcionIndividualDiasAlternativos').show();
	$('#LabelHorarioAlternativo').show();
	$('#InscripcionIndividualHorarioAlternativo').show();
	$('#LabelSexoProfesor').show();
	$('#InscripcionIndividualSexoProfesor').show();
}
/**
 * Oculta los campos individuales.
 * @returns
 */
function ocultarCamposIndividuales()
{
	$('#LabelClaseCursoId').hide();
	$('#InscripcionIndividualClaseCursoId').hide();
	$('#LabelSucursalId').hide();
	$('#InscripcionIndividualSucursalId').hide();
	$('#LabelIdiomaEstudiar').hide();
	$('#InscripcionIndividualIdiomaEstudiarId').hide();		
	$('#LabelClasesSemanales').hide();
	$('#InscripcionIndividualClasesSemanales').hide();
	$('#LabelHorasClase').hide();
	$('#InscripcionIndividualHorasClase').hide();
	$('#LabelFechaEstimadaComienzo').hide();
	$('#LabelDiasPreferidos').hide();
	$('#InscripcionIndividualFechaEstimadaComienzo').hide();
	$('#InscripcionIndividualDiasPreferidos').hide();
	$('#LabelHorarioPreferido').hide();
	$('#InscripcionIndividualHorarioPreferido').hide();
	$('#LabelDiasAlternativos').hide();
	$('#InscripcionIndividualDiasAlternativos').hide();
	$('#LabelHorarioAlternativo').hide();
	$('#InscripcionIndividualHorarioAlternativo').hide();
	$('#LabelSexoProfesor').hide();
	$('#InscripcionIndividualSexoProfesor').hide();
}
/**
 * Decide si hay que ir a buscar los cursos grupales por nivel e idioma
 * @returns
 */
function accionBuscarCursos()
{
	if($('#CursoTipoCurso').val()==2 && $('#PersonaIdiomaEstudiarId').val().length!=0 && $('#PersonaNivelId').val().length!=0)
	{
		buscarCursos();
	}
}
/**
 * Accion de cuadro de seleccion de cursos
 * @returns
 */
function accionCuadroSeleccionCursos()
{
	ocultarCamposIdiomaGrupal();
	ocultarCuadroSeleccionCursos();
	var cursoTipoCurso=$('#CursoTipoCurso').val();
	if(cursoTipoCurso==2)
	{
		mostrarCamposIdiomaGrupal();
		mostrarCuadroSeleccionCursos();
	}
}
/**
 * Muestra el cuadro de seleccion de cursos grupales y el tilde para anotarse en lista de espera.
 * @returns
 */
function mostrarCuadroSeleccionCursos()
{
	$('#ListaCursos').show();
}
/**
 * Oculta el cuadro de seleccion de cursos grupales y el tilde para anotarse en lista de espera.
 * @returns
 */
function ocultarCuadroSeleccionCursos()
{
	$('#ListaCursos').hide();
}
/**
 * Muestra los campos de seleccion de idioma para cursos grupales 
 * @returns
 */
function mostrarCamposIdiomaGrupal()
{
	$('#LabelPersonaIdiomaEstudiarId').show();
	$('#PersonaIdiomaEstudiarId').show();
	$('#LabelPersonaNivelId').show();
	$('#PersonaNivelId').show();
}
/**
 * Oculta los campos de seleccion de idioma para cursos grupales
 * @returns
 */
function ocultarCamposIdiomaGrupal()
{
	$('#LabelPersonaIdiomaEstudiarId').hide();
	$('#PersonaIdiomaEstudiarId').hide();
	$('#LabelPersonaNivelId').hide();
	$('#PersonaNivelId').hide();
}
/**
 * Oculta el campo PersonaComoSupoOtros, y en caso de que
 * PersonaComoSupoId valga 5, lo muestra.
 * @returns
 */
function cambiarPersonaComoSupoId()
{
	$('#PersonaComoSupoOtros').hide();
	$('#LabelComoSupoOtros').hide();
	if($('#PersonaComoSupoId').val()==5)
	{
		$('#PersonaComoSupoOtros').show();
		$('#LabelComoSupoOtros').show();
	}
}
function mostrarCamposTutor()
{
	$('#LabelNombreTutor').show();
	$('#PersonaNombreTutor').show();
	$('#LabelTelefonoTutor').show();
	$('#PersonaTelefonoTutor').show();
	$('#LabelVinculo').show();
	$('#PersonaVinculo').show();
}
function ocultarCamposTutor()
{
	$('#LabelNombreTutor').hide();
	$('#PersonaNombreTutor').hide();
	$('#LabelTelefonoTutor').hide();
	$('#PersonaTelefonoTutor').hide();
	$('#LabelVinculo').hide();
	$('#PersonaVinculo').hide();
}
/**
 * Si en la inscripcion individual eligieron espanol, o en la grupal, 
 * hay que mostrar unos campos adicionales. Ademas hay que ofrecerles Extras en los
 * que quieran anotarse. Esto solamente tiene sentido hacerlo si alguno de los
 * dos campos esta visible.
 * @returns
 */
function accionInscripcionCursoEspanol()
{
	ocultarCamposInscripcionCursoEspanol();
	var idiomaIndividual=($('#InscripcionIndividualIdiomaEstudiarId').is(':visible') &&  $('#InscripcionIndividualIdiomaEstudiarId').val()==2);
	var idiomaGrupal=($('#PersonaIdiomaEstudiarId').is(':visible') && $('#PersonaIdiomaEstudiarId').val()==2);
	if(idiomaIndividual || idiomaGrupal)
	{
		mostrarCamposInscripcionCursoEspanol();
	}
}

/**
 * Oculta los campos de inscripcion en curso de espanol.
 * @returns
 */
function ocultarCamposInscripcionCursoEspanol()
{
	$('#LinkTestNivelEspanol').hide();
}
/**
 * Muestra los campos de inscripcion en curso de espanol
 * @returns
 */
function mostrarCamposInscripcionCursoEspanol()
{
	$('#LinkTestNivelEspanol').show();
}
/**
 * Si la edad de la persona es menor que 18, mostrar los campos de tutor
 * #91 - Si el curso es para ninos, ofrecer 1 o 1.30 horas. Si no, no.
 * @returns
 */
function cambioEdadPersona()
{
	ocultarCamposTutor();
	var ano=$("#PersonaFechaNacimientoYear").val();
	var mes=$("#PersonaFechaNacimientoMonth").val();
	var dia=$("#PersonaFechaNacimientoDay").val();
	if(!calcularFechaNacimiento(ano,mes,dia))
	{
		mostrarCamposTutor();
	}
}

/**
 * Calcula la fecha de nacimiento, y devuelve true si la persona es mayor de 18,
 * false de lo contrario.
 * @param ano ano de nacimiento
 * @param mes mes de nacimiento
 * @param dia dia de nacimiento
 * @returns boolean true si la persona es mayor de 18.
 */
function calcularFechaNacimiento(ano,mes,dia)
{
	var today=new Date();
	var esteAno=today.getFullYear();
	var age = esteAno - ano;
	var nowmonth = today.getMonth();
	var nowday = today.getDate();
	var age_month = nowmonth - mes;
	var age_day = nowday - dia;
	if (age < 18 || (age == 18 && age_month <= 0 && age_day <0))
	{
		return false;
	}
	else
	{
		return true;
	}
}
/**
 * Manda el Json con los parametros necesarios para ir a buscar la lista de cursos.
 * @returns
 */
function buscarCursos()
{
	var url="listar_cursos";
	$.getJSON(url,
			{
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
 * Llena el grupo de radio buttons con los cursos traidos del server. Este cuadro
 * de radio buttons se muestra para que el usuario elija el curso que desea tomar.
 * @param cursos
 * @returns
 */
function populateCursosList(cursos) 
{
	/*
	 * Pedido por Elvira 24/01/2012:
	 * Datos que hace falta mostrar en la tabla del curso para la inscripcion:
	 * 1. Descripci�n
	 * 2. Fecha y hora del curso.
	 * 3. Cantidad de Integrantes, si ya est� abierto.
	 * 4. Ubicaci�n (LV-Flores, LV-Palermo).
	 * 5. Fecha de inicio.
	 */
	var output = '';
	var options = '<table><tr>'
		+'<th>Elija curso</th>'
		+'<th>C&oacute;digo</th>'
		+'<th>Descripci&oacute;n</th>'
		+'<th>Horario</th>'
		+'<th>Duracion</th>'
		+'<th>Integrantes</th>'
		+'<th>Ubicaci&oacute;n</th>'
		+'<th>Comienzo</th>'
		+'<th>Idioma</th>'
		+'<th>Nivel</th>'
		+'<th>Precio</th></tr>';
	$.each(cursos, function(index, curso) 
	{
		var curso_modalidad_elegido="";
		var clase='';
		/*
		 * ModalidadPago como entidad existe y es una sub-entidad de modalidades_disponibles!!
		 * Por cada una de las modalidades disponibles hay que hacer un renglon!
		 */
		$.each(curso.modalidades_disponibles,function(index,modalidad)
		{
			if(modalidad["modalidad_pago"].modo_calculo=="CLASE")
				clase=" (por clase)";
			var curso_modalidad_actual=curso.id + ','+modalidad.id;
			var checked="";
			if(curso_modalidad_actual==curso_modalidad_elegido)
				checked=" checked ";
			options += '<tr><td><input type="radio" name="modalidad_curso_elegido" class="cursos" id="ModalidadCursoElegido" '+checked+' value="' 
			+curso_modalidad_actual+'"></td><td>'
			+curso.codigo_curso+'</td><td>'
			+curso.descripcion_curso+'</td><td>'
			+curso.horario_curso+'</td><td>'
			+modalidad.duracion_cantidad+' '+modalidad['duracion_modo'].descripcion+'</td><td>'
			+curso.inscriptos+'</td><td>'
			+curso["sucursal"].nombre+'</td><td>'
			+curso.fecha_comienzo+'</td><td>'
			+curso["idioma_estudiar"].descripcion+'</td><td>'
			+modalidad["modalidad_pago"].descripcion+'</td><td>'
			+modalidad["moneda"].simbolo+" "+modalidad.precio_unidad_modalidad+clase+'</td></tr>';
		}
		);
	});
	options+='</table>';
	$('#ListaCursos').html(options);
	$('.cursos').on('change',function()
	{
		var curso_modalidad=$(this).val();
		var curso_partes=curso_modalidad.split(',');
		$('#CursoId').val(curso_partes[0]);
		$('#ModalidadId').val(curso_partes[1]);
		//alert("Cambio el valor, ahora es "+curso_partes[0]+", "+curso_partes[1]);
	}
	);
}
</script>