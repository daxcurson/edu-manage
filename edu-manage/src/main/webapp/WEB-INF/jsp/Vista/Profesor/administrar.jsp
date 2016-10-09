<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<div class="profesores index">
	<h2>Profesores</h2>

	<table cellpadding="0" cellspacing="0">
	<tr>
			<th>Id</th>
			<th>Nombre</th>
			<th>Nacionalidad</th>
			<th>Idioma Nativo</th>
			<th>Idioma</th>
			<th>Celular</th>
			<th>Fecha creaci&oacute;n</th>
			<th>Deshabilitado</th>
			<th class="actions">Acciones</th>
	</tr>
	<c:forEach items="${listaProfesores}" var="profesor">
	<tr>
		<td><c:out value="${profesor.id}"></c:out></td>
		<td><c:out value="${profesor.nombre}"></c:out></td>
		<td><c:out value="${profesor.nacionalidad.descripcion}"></c:out></td>
		<td><c:out value="${profesor.idiomaNativo.descripcion}"></c:out></td>
		<td><c:forEach items="${profesor.idiomasEnsenados}" var="idioma_estudiar">
		<c:out value="${idioma_estudiar.descripcion}"></c:out><br/>
		</c:forEach>
		</td>
		<td><c:out value="${profesor.celular}"></c:out></td>
		<td><c:out value="${profesor.fecha_comienzo}"></c:out></td>
		<td><c:if test="${profesor.deshabilitado==1}">S&iacute;
		
		</c:if>
		<td class="actions">
			<a href="${pageContext.request.contextPath}/profesores/view/${profesor.id}">Ver</a>
			<a href="${pageContext.request.contextPath}/profesores/edit/${profesor.id}">Editar</a>
			<a href="${pageContext.request.contextPath}/profesores/baja/${profesor.id}">Baja</a>
		</td>
	</tr>
	</c:forEach>
	</table>

	<div class="paging">
	<span style="float:left;">
    <c:choose>
        <c:when test="${currentIndex-1==1}">Prev</c:when>
        <c:otherwise><a href="${pageContext.request.contextPath}/profesores/administrar?pagina=${currentIndex-1}">Prev</a></c:otherwise>
    </c:choose>
    </span>
    <span>
    <c:forEach begin="${beginIndex}" end="${endIndex}" varStatus="loop">
    &nbsp;&nbsp;
    <c:choose>
        <c:when test="${loop.index == currentIndex}">${loop.index+1}</c:when>
        <c:otherwise><a href="${pageContext.request.contextPath}/profesores/administrar?pagina=${loop.index}">${loop.index+1}</a></c:otherwise>
    </c:choose>
    &nbsp;&nbsp;
    </c:forEach>
    </span>
    <span>
    <c:choose>
        <c:when test="${currentIndex==totalPageCount}">Next</c:when>
        <c:otherwise><a href="${pageContext.request.contextPath}/profesores/administrar?pagina=${currentIndex+1}">Next</a></c:otherwise>
    </c:choose>
    </span>
   	</div>
</div>
<div class="actions">
	<h3><?php echo 'Acciones'; ?></h3>
	<ul>
		<li><a href="${pageContext.request.contextPath}/profesores/add">Nuevo Profesor</a></li>
	</ul>
</div>