<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="honorarioProfesores index">
	<h2>Honorarios de Profesor</h2>
	<table>
	<tr>
			<th>Id</th>
			<th>Descripci&oacute;n</th>
			<th>Precio por hora</th>
			<th>Moneda</th>
			<th>Idioma</th>
			<th>Fecha desde</th>
			<td>Cambios</td>
			<th class="actions">Acciones</th>
	</tr>
	<c:forEach items="${honorarios}" var="honorario">
	<tr>
		<td><c:out value="${honorario.id}"/>&nbsp;</td>
		<td><c:out value="${honorario.descripcion}" />&nbsp;</td>
		<td><c:out value="${honorario.precio_por_hora}" />&nbsp;</td>
		<td><c:out value="${honorario.moneda.descripcion}" />&nbsp;</td>
		<td><c:out value="${honorario.idioma_estudiar.descripcion}"/>&nbsp;</td>
		<td><c:out value="${honorario.fecha_desde}"/>&nbsp;</td>
		<td><c:out value="${honorario.cambios}"/>&nbsp;</td>
		<td class="actions">
			<a href="${pageContext.request.contextPath}/honorarios/view/${honorario.id}">Ver</a>
			<a href="${pageContext.request.contextPath}/honorarios/edit/${honorario.id}">Editar</a>
			<a href="${pageContext.request.contextPath}/honorarios/delete/${honorario.id}">Borrar</a>
		</td>
	</tr>
	</c:forEach>
	</table>
</div>
<div class="actions">
	<h3>Acciones</h3>
	<ul>
		<li><a href="${pageContext.request.contextPath}/honorarios/add">Nuevo honorario</a></li>
	</ul>
</div>