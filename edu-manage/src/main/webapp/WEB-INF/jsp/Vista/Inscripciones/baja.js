<script type="text/javascript">
$(document).ready(function()
{
	$('#PersonaTemporal').change(function()
	{
		accionCambioTemporal();
	});
	accionCambioTemporal();
	$('#PersonaMotivoId').change(function()
	{
		accionCambioMotivo();
	});
	accionCambioMotivo();
});
function accionCambioMotivo()
{
	ocultarCampoOtros();
	if($('#PersonaMotivoId').val()==4)
	{
		mostrarCampoOtros();
	}
}
function ocultarCampoOtros()
{
	$('#LabelMotivoOtro').hide();
	$('#PersonaMotivoOtro').hide();
}
function mostrarCampoOtros()
{
	$('#LabelMotivoOtro').show();
	$('#PersonaMotivoOtro').show();
}
function accionCambioTemporal()
{
	ocultarFechaRegreso();
	if($('#PersonaTemporal').is(':checked'))
	{
		mostrarFechaRegreso();
	}
}
function ocultarFechaRegreso()
{
	$('#LabelFechaRetorno').hide();
	$('#PersonaFechaRetornoYear').hide();
	$('#PersonaFechaRetornoMonth').hide();
	$('#PersonaFechaRetornoDay').hide();
	$('#PersonaCerrarCursos').show();
	$('#LabelCerrarCursos').show();
}
function mostrarFechaRegreso()
{
	$('#LabelFechaRetorno').show();
	$('#PersonaFechaRetornoYear').show();
	$('#PersonaFechaRetornoMonth').show();
	$('#PersonaFechaRetornoDay').show();
	$('#PersonaCerrarCursos').hide();
	$('#LabelCerrarCursos').hide();
}
</script>