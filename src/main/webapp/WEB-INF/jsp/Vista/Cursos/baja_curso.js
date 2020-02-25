$(document).ready(function()
{
	$("#CursoBaja").change(function()
	{
		accionBaja();
	});
	accionBaja();
});
/**
 * Si no esta seleccionado el checkbox, no mostrar la fecha de baja. Veamos si asi no se graba.
 * @returns
 */
function accionBaja()
{
	ocultarCampoFechaBaja();
	if($('#CursoBaja').is(':checked'))
	{
		mostrarCampoFechaBaja();
	}
}
/**
 * Oculta el campo de fecha de baja
 * @returns
 */
function ocultarCampoFechaBaja()
{
	$('#CursoFechaBajaYear').hide();
	$('#CursoFechaBajaMonth').hide();
	$('#CursoFechaBajaDay').hide();
}
/**
 * Muestra el campo de fecha de baja
 * @returns
 */
function mostrarCampoFechaBaja()
{
	$('#CursoFechaBajaYear').show();
	$('#CursoFechaBajaMonth').show();
	$('#CursoFechaBajaDay').show();	
}