/**
 * Si CursoTipoCursoId y CursoIdiomaEstudiarId tienen valor, que vaya a buscar
 * las clases de curso que hay para ese tipo e idioma.
 * @returns
 */
function accionBuscarClasesCurso()
{
	if($("#CursoTipoCurso").val().length!=0)
	{
		if( $("#PersonaIdiomaEstudiarId").val().length!=0  && $('#InscripcionIndividualListaEspera').is(':checked') ) 
		{
			buscarClasesCursoGrupal();
		}
		if($("#InscripcionIndividualIdiomaEstudiarId").val().length!=0)
		{
			buscarClasesCursoIndividual();
		}
	}
}
/**
 * Consigue los Json que hay que mostrar dentro del select de clases de curso.
 * @returns
 */
function buscarClasesCursoGrupal()
{
	var url="<?php echo $this->Html->url(array('controller'=>'cursos','action'=>'listar_clases_curso'));?>";
	$.getJSON(url,
	{
		idioma_estudiar_id: $("#PersonaIdiomaEstudiarId").val(),
		tipo_curso_id: $("#CursoTipoCurso").val()
	},
	function(clases) 
	{
		if(clases !== null) 
		{
			populateClasesList(clases);
		}
	});
}
/**
 * Busca clases de curso para cursos individuales.
 * @returns
 */
function buscarClasesCursoIndividual()
{
	var url="<?php echo $this->Html->url(array('controller'=>'cursos','action'=>'listar_clases_curso'));?>";
	$.getJSON(url,
	{
		idioma_estudiar_id: $("#InscripcionIndividualIdiomaEstudiarId").val(),
		tipo_curso_id: $("#CursoTipoCurso").val()
	},
	function(clases) 
	{
		if(clases !== null) 
		{
			populateClasesList(clases);
		}
	});
}
/**
 * Realiza el trabajo sucio de llenar el options del select.
 * @param clases Tiene un arreglo de Json con todas las clases que hay.
 * @returns
 */
function populateClasesList(clases)
{
	var options="";
	$.each(clases,function(index,clase)
	{
		options+="<option value="+clase["ClaseCurso"].id+">"+clase["ClaseCurso"].descripcion+"</option>";
	});
	$('#InscripcionIndividualClaseCursoId').html(options);
}