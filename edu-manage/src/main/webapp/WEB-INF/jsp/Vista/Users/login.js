$(document).ready(function()
{
	$('#SelectIdioma').chosen();
});
function cambiar_idioma()
{
	// Al cambiar idioma, recargo la pagina con lang= igual al valor del idioma elegido.
	window.location="${pageContext.request.contextPath}/users/login?lang="+$('#SelectIdioma').chosen().val();
}