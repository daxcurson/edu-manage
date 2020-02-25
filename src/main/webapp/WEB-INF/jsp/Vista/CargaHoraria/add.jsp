<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<div class="cargaHorarias form">
<form:form method="post" action="add" commandName="carga_horaria">
	<tiles:insertAttribute name="form_carga_horaria"/>
	<input type="submit" name="agregar_carga_horaria" value="Agregar Carga horaria">
</form:form>
</div>
<div class="actions">
	<h3>Acciones</h3>
	<ul>
		<li><a href="${pageContext.request.contextPath}/carga_horaria/index">Listar Cargas horarias</a></li>
		<li><a href="${pageContext.request.contextPath}/tipo_curso/index">Listar tipos de curso</a></li>
	</ul>
</div>