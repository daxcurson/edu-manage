<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<div class="panel panel-info">
	<div class="panel-heading">
		<h1 class="panel-title">Inscripciones</h1>
	</div>
	<div class="panel-body">
		<div class="profesores form">
			<form:form method="post" action="add" commandName="profesor">
				<fieldset>
					<legend>Agregar Profesor</legend>
				</fieldset>
				<tiles:insertAttribute name="form_profesor"/>
				<button type="submit" name="agregar_profesor">Agregar profesor</button>
			</form:form>
		</div>
	<div class="actions">
		<h3>Acciones</h3>
		<ul>
			<li><a href="${pageContext.request.contextPath}/profesores/index">Listar Profesores</a></li>
		</ul>
		</div>
	</div>
</div>