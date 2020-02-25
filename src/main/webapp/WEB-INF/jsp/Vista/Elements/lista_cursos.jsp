<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<table>
<tr>
<th>C&oacute;digo</th>
<th>Tipo</th>
<th>Horario</th>
<th>Profesor titular</th>
<th>Integrantes</th>
<th>Abierto</th>
<th>Acciones</th>
</tr>
<c:forEach items="${cursos}" var="curso">
<tr>
<td><c:out value="${curso.codigo_curso}"/></td>
<td>${curso.descripcion_curso}</td>
<td>${curso.horario_curso}</td>
<td>profesor_titular</td>
<td>${curso.inscriptos}</td>
<td>${curso.abierto}</td>
<td><a href="${pageContext.request.contextPath}/cursos/asignar_profesor/${curso.id}">Asignar Profesor</a></td>
</tr>
</c:forEach>
</table>
