<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<h2>Persona Manager</h2>

<form:form method="post" action="add" commandName="persona">

	<table>
	<tr>
		<td><form:label path="nombre"><spring:message code="label.nombre"/></form:label></td>
		<td><form:input path="nombre" /></td> 
	</tr>
	<tr>
		<td><form:label path="apellido"><spring:message code="label.apellido"/></form:label></td>
		<td><form:input path="apellido" /></td>
	</tr>
	<tr>
		<td><form:label path="email"><spring:message code="label.email"/></form:label></td>
		<td><form:input path="email" /></td>
	</tr>
	<tr>
		<td><form:label path="telefono"><spring:message code="label.telefono"/></form:label></td>
		<td><form:input path="telefono" /></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="<spring:message code="label.addcontact"/>"/>
		</td>
	</tr>
</table>	
</form:form>