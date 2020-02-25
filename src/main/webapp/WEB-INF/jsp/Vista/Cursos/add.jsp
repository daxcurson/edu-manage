<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<script type="text/javascript">
<%@include file="/WEB-INF/jsp/Vista/Cursos/buscar_modalidades_curso.js" %>
</script>

<div class="panel panel-info">
	<div class="panel-heading">
		<h1 class="panel-title">Agregar Curso</h1>
	</div>
	<div class="panel-body">

		<form:form method="post" action="add" commandName="curso">
			<tiles:insertAttribute name="form_curso"/>
			<input type="submit" name="agregar_curso" value="Agregar Curso">
		</form:form>
	</div>
</div>