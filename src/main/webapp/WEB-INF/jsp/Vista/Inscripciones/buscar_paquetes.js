/**
 * Manda el Json con los parametros necesarios para ir a buscar la lista de cursos.
 * @returns
 */
function buscarPaquetes()
{
	var url="<?php echo $this->Html->url(array('controller'=>'inscripciones','action'=>'listar_paquetes')); ?>";
	$.getJSON(url,
			{
		idioma_estudiar_id: $("#PersonaIdiomaEstudiarId").val()
			},
			function(paquetes) 
			{
				if(paquetes !== null) 
				{
					populatePaquetesList(paquetes);
				}
			});

}
/**
 * Llena el grupo de radio buttons con los cursos traidos del server. Este cuadro
 * de radio buttons se muestra para que el usuario elija el curso que desea tomar.
 * @param cursos
 * @returns
 */
function populatePaquetesList(paquetes) 
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
		+'<th>Choose a package</th>'
		+'<th>Description</th>'
		+'<th>Duration</th>'
		+'<th>Course load</th>'
		+'<th>Included</th>'
		+'<th>Precio</th></tr>';
	$.each(paquetes, function(index, paquete) 
		{
		options += '<tr><td><input type="checkbox" name="data[Inscripcion][Paquete][' 
			+paquete["Curso"].id + ']"></td><td>' 
			+paquete["Curso"].descripcion_curso+'</td><td>'
			+paquete["Curso"].duracion_paquete+'</td><td>'
			+paquete["Curso"].carga_horaria+'</td><td>'
			+paquete["Curso"].incluye+'</td><td>'
			+paquete["Moneda"]["simbolo"]+" "+paquete["Curso"].monto_unidad_modalidad+'</td></tr>';
		});
	options+='</table>';
	$('#ListaPaquetes').html(options);
}