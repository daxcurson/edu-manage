<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<p>Buscar Profesores</p>
<form:form method="post" action="search" commandName="profesor">
	<form:input path="nombre"/>
	<button type="submit" name="buscar_profesor">Buscar Profesor</button>
</form:form>