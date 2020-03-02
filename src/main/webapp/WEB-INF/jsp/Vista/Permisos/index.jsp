<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<div class="panel panel-info">
	<div class="panel-heading">
		<h1 class="panel-title">Permisos</h1>
	</div>
	<div class="panel-body">
		<div>
			<ul>
			<li><a href="${pageContext.request.contextPath}/permisos/listar">Listar Permisos por grupo</a></li>
			</ul>
		</div>
	</div>
</div>

