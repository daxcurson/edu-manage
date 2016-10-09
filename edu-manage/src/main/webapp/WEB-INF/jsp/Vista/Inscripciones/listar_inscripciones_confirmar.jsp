<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<h1>Inscripciones realizadas pendientes de confirmar</h1>

<table>
<tr>
<th>Nombre</th>
<th>Apellido</th>
<th>Tipo Inscripci&oacute;n</th>
<th>Estado Estudiante</th>
<th>E-Mail</th>
<th>Comentarios estudiante</th>
<th>C&oacute;digo de curso</th>
<th>Fecha de inscripci&oacute;n</th>
<th>Fecha estimada comienzo</th>
<th>Acciones</th></tr>
<c:forEach items="${inscripciones}" var="inscripcion">
<tr>
<td><c:out value="${inscripcion.persona.nombre}"/></td>
<td><c:out value="${inscripcion.persona.apellido}"/></td>
<td><c:out value="${inscripcion.tipo}"/></td>
<td><c:out value="${inscripcion.persona.estado.descripcion}"/></td>
<td><c:out value="${inscripcion.persona.email}"/></td>
<td></td>
<td><c:out value="${inscripcion.curso.codigo_curso}"/></td>
<td><c:out value="${inscripcion.created}"/></td>
<td><c:out value="${inscripcion.fecha_comienzo}"/></td>
<td><a href="${pageContext.request.contextPath}/inscripciones/confirmar_inscripcion/${inscripcion.id}">Confirmar</a></td>
</tr>
</c:forEach>
</table>