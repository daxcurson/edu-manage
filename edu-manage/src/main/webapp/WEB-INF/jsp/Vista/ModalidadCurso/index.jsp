<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="modalidadCursos index">
	<h2>Modalidades de Curso</h2>
	<table cellpadding="0" cellspacing="0">
	<tr>
			<th>Id</th>
			<th>Carga Horaria</th>
			<th>Descripci&oacute;n</th>
			<th>Modalidad Pago</th>
			<th>Precio</th>
			<th>Moneda</th>
			<th>Duraci&oacute;n cantidad</th>
			<th>Duraci&oacute;n modo</th>
			<th>Es extra?</th>
			<th class="actions">Acciones</th>
	</tr>
	<c:forEach items="${modalidades_curso}" var="modalidad">
	<tr>
		<td><c:out value="${modalidad.id}"/>&nbsp;</td>
		<td>
			<a href="${pageContext.request.contextPath}/carga_horaria/view/${modalidad.carga_horaria.id}">
			<c:out value="${modalidad.carga_horaria.descripcion}"/>
			</a>
		</td>
		<td><c:out value="${modalidad.descripcion}" />&nbsp;</td>
		<td>
			<a href="${pageContext.request.contextPath}/modalidad_pago/view/${modalidad.modalidad_pago.id}">
			<c:out value="${modalidad.modalidad_pago.descripcion}"/>
			</a>
		</td>
		<td><c:out value="${modalidad.precio_unidad_modalidad}" />&nbsp;</td>
		<td><c:out value="${modalidad.moneda.descripcion}" />&nbsp;</td>
		<td><c:out value="${modalidad.duracion_cantidad}"/>&nbsp;</td>
		<td><c:out value="${modalidad.duracion_modo.descripcion}"/>&nbsp;</td>
		<td><c:out value="${modalidad.es_extra}"/>&nbsp;</td>
		<td class="actions">
			<a href="${pageContext.request.contextPath}/modalidad_curso/view/${modalidad.id}">Ver</a>
			<a href="${pageContext.request.contextPath}/modalidad_curso/edit/${modalidad.id}">Editar</a>
			<a href="${pageContext.request.contextPath}/modalidad_curso/delete/${modalidad.id}">Borrar</a>
		</td>
	</tr>
	</c:forEach>
	</table>
</div>
<div class="actions">
	<h3>Acciones</h3>
	<ul>
		<li><a href="${pageContext.request.contextPath}/carga_horaria/add">Nueva carga horaria</a></li>
		<li><a href="${pageContext.request.contextPath}/tipo_curso/index">Listar tipos de curso</a></li>
	</ul>
</div> 