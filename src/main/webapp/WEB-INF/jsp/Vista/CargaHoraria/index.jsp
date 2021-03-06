<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<div class="panel panel-info">
	<div class="panel-heading">
		<h1 class="panel-title">Cargas Horarias</h1>
	</div>
	<div class="panel-body">
<div class="cargaHorarias index">
	<table class="table">
	<tr>
			<th>Id</th>
			<th>Tipo de Curso</th>
			<th>Descripci&oacute;n</th>
			<th>Horas Semanales</th>
			<th>D&iacute;as por Semana</th>
			<th>Horas de clase</th>
			<th class="actions">Acciones</th>
	</tr>
	<c:forEach items="${cargas_horarias}" var="carga_horaria">
	<tr>
		<td><c:out value="${carga_horaria.id}"/>&nbsp;</td>
		<td>
			<a href="${pageContext.request.contextPath}/tipo_cursos/view/${carga_horaria.tipo_curso.id}">
			<c:out value="${carga_horaria.tipo_curso.descripcion}"/>
			</a>
		</td>
		<td><c:out value="${carga_horaria.descripcion}" />&nbsp;</td>
		<td><c:out value="${carga_horaria.horas_semanales}" />&nbsp;</td>
		<td><c:out value="${carga_horaria.dias_semana}"/>&nbsp;</td>
		<td><c:out value="${carga_horaria.horas_clase}"/>&nbsp;</td>
		<td class="actions">
			<a href="${pageContext.request.contextPath}/cargas_horarias/view/${carga_horaria.id}">Ver</a>
			<a href="${pageContext.request.contextPath}/cargas_horarias/edit/${carga_horaria.id}">Editar</a>
			<a href="${pageContext.request.contextPath}/cargas_horarias/delete/${carga_horaria.id}">Borrar</a>
		</td>
	</tr>
	</c:forEach>
	</table>
</div>
<div class="actions">
	<h3>Acciones&nbsp;</h3>
	<ul>
		<li><a href="${pageContext.request.contextPath}/cargas_horarias/add">Nueva carga horaria</a></li>
		<li><a href="${pageContext.request.contextPath}/tipo_curso/index">Listar tipos de curso</a></li>
	</ul>
</div> 
	</div>
</div>