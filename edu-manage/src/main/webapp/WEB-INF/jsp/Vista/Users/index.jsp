<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<h2>Usuarios</h2>

<p>
<a href="${pageContext.request.contextPath}/users/add">Agregar nuevo usuario</a>
</p>

<p>
A continuaci&oacute;n se listan los usuarios del sistema y a qu&eacute; grupo
pertenecen. Para definir los permisos de los grupos, haga click <a href="${pageContext.request.contextPath}/permisos/listar_permisos">aqu&iacute;</a>.
</p>

<table class="table">
<tr>
<th>Id</th>
<th>Nombre</th>
<th>Grupo</th>
<th>Habilitado</th>
<th>Acciones</th>
</tr>
<c:forEach items="${users}" var="user">
<tr>
<td><c:out value="${user.id}"/></td>
<td>${user.username}</td>
<td>${user.group.group_name}</td>
<td>${user.enabled==1 ? "S&iacute;":"No"}</td>
<td><a href="${pageContext.request.contextPath}/users/edit/${user.id}">Editar</a></td>
</tr>
</c:forEach>
</table>