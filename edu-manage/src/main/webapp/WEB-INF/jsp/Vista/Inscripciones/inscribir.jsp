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

<form:form method="post" action="inscribir" commandName="modelo_inscripcion"
class="form-horizontal">
	<tiles:insertAttribute name="form_persona"/>
	<tiles:insertAttribute name="form_inscripcion"/>
	<tiles:insertAttribute name="form_inscripcion_individual"/>

<input type="submit" name="ingresar_inscripcion" value="Ingresar Inscripcion">
</form:form>
