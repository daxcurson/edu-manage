<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<h1><spring:message code="label.inscripcion_en_curso" /></h1>

<p><b><spring:message code="label.pasos_a_seguir" /></b></p>
<p><spring:message code="label.pasos_a_seguir_1" /></p>
<p><spring:message code="label.pasos_a_seguir_2" /></p>
<p><spring:message code="label.pasos_a_seguir_3" /></p>
<p><spring:message code="label.pasos_a_seguir_3_1" /></p>
<p><spring:message code="label.pasos_a_seguir_4" /></p>

<%@include file="/WEB-INF/jsp/Vista/Inscripciones/buscar-cursos2.js" %>
<%@include file="/WEB-INF/jsp/Vista/Inscripciones/buscar_paquetes.js" %>

<form:form method="post" action="inscribir" commandName="modelo_inscripcion"
class="form-horizontal">
	<tiles:insertAttribute name="form_persona"/>
	<tiles:insertAttribute name="form_inscripcion"/>
	<tiles:insertAttribute name="form_inscripcion_individual"/>
	<tiles:insertAttribute name="form_inscripcion_cursos_espanol"/>

<p>
Hacer click aqui para ver los t&eacute;rminos de nuestra pol&iacute;tica de cancelaciones.
</p>
<p>
Hacer click en el cuadrito que aparece abajo para aceptarla.
</p>
<table>
<tr><td>
<form:checkbox path="aceptoTerminos" style="height: 13px;width: 13px" /></td>
<td><div id="LabelAgree">He le&iacute;do, entendido y me guiar&eacute; por los te;rminos y condiciones estipuladas por LV Studio y los t&eacute;rminos de nuestra pol&iacute;tica de cancelaciones</div></td></tr>
<tr><td colspan="2"></td></tr>
</table>
<form:errors path="aceptoTerminos" cssClass="error" element="div" />
	<input type="submit" name="ingresar_inscripcion" value="Ingresar Inscripcion">
</form:form>
