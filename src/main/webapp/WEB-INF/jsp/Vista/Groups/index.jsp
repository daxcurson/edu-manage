<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<h2>Grupos</h2>

<p>
<a href="${pageContext.request.contextPath}/groups/add">Agregar nuevo grupo</a>
</p>

<table class="table">
<tr>
<th>Id</th>
<th>Nombre</th>
<th>Acciones</th>
</tr>
<c:forEach items="${groups}" var="group">
<tr>
<td><c:out value="${group.id}"/></td>
<td>${group.group_name}</td>
<td><a href="${pageContext.request.contextPath}/groups/edit/${group.id}">Editar</a></td>
</tr>
</c:forEach>
</table>