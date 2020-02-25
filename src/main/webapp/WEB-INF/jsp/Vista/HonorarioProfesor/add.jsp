<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<div class="honorarioProfesores form">
	<form:form method="post" action="add" commandName="honorario">
	<fieldset>
		<legend>Agregar Honorario de Profesor</legend>
			<tiles:insertAttribute name="form_honorario_profesor"/>
			<button type="submit" name="agregar_honorario_profesor" value="Agregar Honorario">Agregar Honorario</button>
	</fieldset>
	</form:form>
	
</div>
<div class="actions">
	<h3>Acciones</h3>
	<ul>
		<li><a href="${pageContext.request.contextPath}/honorarios/index">Listar Honorarios de Profesores</a></li>
		<li></li>
		<li></li>
	</ul>
</div>