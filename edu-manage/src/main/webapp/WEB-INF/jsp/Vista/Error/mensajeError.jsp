<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<h1>Error</h1>

<p>Ha ocurrido un error en la aplicaci&oacute;n. Por favor llene el siguiente
formulario para informar al fabricante sobre las actividades realizadas
al momento de producirse.</p>

<h2>Informaci&oacute;n t&eacute;cnica del error</h2>

<table>
<tr><td>Excepci&oacute;n producida</td><td>
<c:if test="${not empty exceptionType}">
${exceptionType}
</c:if>
</td></tr>
<tr><td>Mensaje</td><td>
<c:if test="${not empty exceptionMessage}">
${exceptionMessage}
</c:if>
</td></tr>
<tr><td colspan="2">Stack trace</td></tr>
<tr><td colspan="2">
<c:if test="${not empty stackTrace}">
${stackTrace}
</c:if>
</td></tr>
</table>